-- Tworzymy typ tablicy dla ID produktów
CREATE OR REPLACE TYPE product_id_nt AS TABLE OF VARCHAR2(5);
/

-- Tworzymy typ tablicy dla nowych cen
CREATE OR REPLACE TYPE price_nt AS TABLE OF NUMBER;
/

CREATE OR REPLACE PROCEDURE update_product_price (p_product_ids IN product_id_nt, p_new_prices IN price_nt)

IS
v_count NUMBER;
v_missing_ids VARCHAR2(1000);
v_product_id_str VARCHAR2(20);

er_err_size_array EXCEPTION;
er_err_is_minus_price EXCEPTION;
er_err_first_char_zero EXCEPTION;
PRAGMA EXCEPTION_INIT(er_err_size_array, -20001);
PRAGMA EXCEPTION_INIT(er_err_is_minus_price, -20002);
PRAGMA EXCEPTION_INIT(er_err_first_char_zero, -20003);


BEGIN
    -- Walidacje
    -- Krok 1: Sprawdzanie czy czy product_id nie zaczyna się od '0'
    FOR i IN p_product_ids.FIRST .. p_product_ids.LAST LOOP
        IF SUBSTR(p_product_ids(i), 1, 1) = '0' THEN
            RAISE er_err_first_char_zero;
        END IF;
    END LOOP;

    -- Krok 2: Sprawdzanie czy tablice maja ten sam rozmiar
     IF p_product_ids.COUNT!=p_new_prices.COUNT THEN
        RAISE er_err_size_array;
     END IF;
     
     -- Krok 3: Sprawdzanie ceny 
    FOR i IN p_product_ids.FIRST .. p_product_ids.LAST LOOP
        IF p_new_prices(i) < 0 THEN
            -- Jeśli cena jest ujemna, logujemy błąd
            RAISE er_err_is_minus_price;
        END IF;
    END LOOP;

    -- Krok 4: Sprawdzanie w petli, czy produkty przekazane do tablicy istnieja
    FOR i IN p_product_ids.FIRST .. p_product_ids.LAST LOOP
        SELECT 
            CASE WHEN EXISTS(SELECT 1 FROM products WHERE product_id = p_product_ids(i))
            THEN 1 
            ELSE 0 
            END
        INTO v_count
        FROM dual;
        
    --  Sprawdzenie i przypisanie brakuajcych produktów 
        IF v_count = 0 THEN
            v_missing_ids := v_missing_ids || p_product_ids(i) || ', ';    
        END IF;
        
    END LOOP;
    
    -- Krok 5: logowanie do tabelI.
    IF v_missing_ids IS NOT NULL THEN
        v_missing_ids := RTRIM(v_missing_ids, ', ');
        log_event(p_log_type=>'ERROR', p_log_details=> 'Aktualizacja cen nie zostala wykonana dla brakujacych ID: '||v_missing_ids||' | '||sqlerrm); 
    END IF;

    -- Krok 6: Aktualizacja masowa cen istniejacych produktow
    FORALL i IN p_product_ids.FIRST .. p_product_ids.LAST SAVE EXCEPTIONS
    UPDATE products
    SET price = p_new_prices(i)  -- Użycie ceny z tablicy
    WHERE product_id = p_product_ids(i);
    
EXCEPTION
    WHEN er_err_size_array THEN
        log_event(p_log_type=>'ERROR', p_log_details=> 'Procedura nieprzetworzona, rozmiary tablic nie sa takie same. | '||sqlerrm);   
        RAISE_APPLICATION_ERROR(-20002, 'Liczba produktów/cen nie jest taka sama.');
        
    WHEN er_err_is_minus_price THEN
        log_event(p_log_type=>'ERROR', p_log_details=> 'Procedura nieprzetworzona, przekazano cene na minusie. | '||sqlerrm);   
        RAISE_APPLICATION_ERROR(-20002, 'Uwaga! Przekazujesz cenę, która jest mniejsza od zera. Popraw i powtórz.');
        
    WHEN er_err_first_char_zero THEN
        log_event(p_log_type=>'ERROR', p_log_details=> 'Procedura nieprzetworzona, product_id nie moze zaczynac się od 0. | '||sqlerrm);   
        RAISE_APPLICATION_ERROR(-20002, 'Uwaga! Przekazujesz ID produktu zaczynajace się od 0');
        
    WHEN OTHERS THEN
            -- Logowanie błędów z SQL%BULK_EXCEPTIONS 
            FOR i IN 1 .. SQL%BULK_EXCEPTIONS.COUNT LOOP
            -- Logowanie każdego błędu z kolekcji do tabeli logów
            log_event(p_log_type=>'ERROR', p_log_details=> 'Błąd podczas aktualizacji ceny dla ID: ' ||p_product_ids(SQL%BULK_EXCEPTIONS(i).ERROR_INDEX)||
                                                     '| Treść bledu: '||SQLERRM(SQL%BULK_EXCEPTIONS(i).ERROR_CODE));
            END LOOP;
                         
        RAISE_APPLICATION_ERROR(-20001, 'Niektóre produkty nie zostały zaktualizowane. Szczególy w tablicy logów.');
END update_product_price;
/

/*
 --wywolanie
DECLARE
    -- Używamy konstruktora typu do inicjalizacji tablic
    v_product_ids product_id_nt := product_id_nt('941', '1000');  -- Przykładowe ID produktów
    v_new_prices price_nt := price_nt(60, 90);   -- Przykładowe ceny

BEGIN
    -- Wywołanie procedury z tablicami
    update_product_price(v_product_ids, v_new_prices);
END;
*/

