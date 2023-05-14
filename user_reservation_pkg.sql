
CREATE OR REPLACE PACKAGE user_reservation_pkg
IS
    PROCEDURE p_create_reservation (p_out_new_id OUT NUMBER);
    PROCEDURE p_add_item_reservation (in_id_reservation   reservations.reservation_id%TYPE
                                      , in_user_id        users.user_id%TYPE
                                      , in_ean13          products.ean13%TYPE
                                      , in_qnty           items_reservation.qnty_reserved%TYPE);
    PROCEDURE p_get_list_reservations_interval(in_start_date IN   DATE
                                              , in_end_date   IN   DATE); 

END user_reservation_pkg;
/

CREATE OR REPLACE PACKAGE BODY user_reservation_pkg
IS

    PROCEDURE p_create_reservation (p_out_new_id OUT NUMBER)
    IS
    BEGIN
        INSERT INTO reservations (reservation_id) VALUES (reservation_id_seq.nextval)
        RETURNING reservation_id
        INTO p_out_new_id;
    END p_create_reservation;
	/
 
    PROCEDURE p_add_item_reservation ( in_id_reservation   reservations.reservation_id%TYPE
                                      , in_user_id          users.user_id%TYPE
                                      , in_ean13            products.ean13%TYPE
                                      , in_qnty             items_reservation.qnty_reserved%TYPE)
    IS
    TYPE rt_items_reservation IS RECORD (products               items_reservation.ean13%TYPE 
                                        , quantity_per_product  items_reservation.qnty_reserved%TYPE);
        v_prod_qnty       rt_items_reservation;
        v_total_qnty      NUMBER; 
        v_exist_id        NUMBER;
        v_ean13           NUMBER;  
        v_max_identic     CONSTANT NUMBER := 5; 
        v_max_qnty        CONSTANT NUMBER := 10;
    BEGIN
        -- wybiera i wstawia do zmiennej podany numer rezerwacji
        -- jeżeli numer rezerwacji nie byl wygenerowany wówczas działanie programu jest przekazane do sekcji obsługi błedów
                BEGIN
                    SELECT reservation_id
                    INTO v_exist_id
                    FROM reservations
                    WHERE reservation_id = in_id_reservation;
                EXCEPTION
                WHEN NO_DATA_FOUND THEN
                RAISE_APPLICATION_ERROR(-20999, 'Nie istnieje rezerwacja o numerze: '||in_id_reservation); 
                END;          
        -- jeśli reerwacja była wówczas dodaje numer rezerwacji do kolejnej pozycji która jest generowana przez
        -- utworzony trigger 
        INSERT INTO items_reservation (reservation_id, user_id, ean13, qnty_reserved)VALUES (in_id_reservation ,in_user_id, in_ean13, in_qnty);  
        --do zmiennej wstawiamy kod produktu jesli spełania warunki w przeciwnym razie pojawia sie komunikat
        SELECT distinct p.ean13
        INTO v_ean13
        FROM products p
        JOIN items_reservation ir
        ON ir.ean13=p.ean13
        WHERE p.level_refund NOT IN ('0')
        AND ir.reservation_id = in_id_reservation
        AND p.ean13 = in_ean13;
        -- pobieramy do zmiennej rekordowej produkt i sume tego samego produktu w rezerwacji 
        SELECT 
            DISTINCT  ir.ean13  products
          , SUM(ir.qnty_reserved) OVER (PARTITION BY ir.ean13)  quantity_per_product -- agraguj wartości po dodanych ean13
        INTO v_prod_qnty
        FROM items_reservation ir
        INNER JOIN reservations r
        ON ir.reservation_id=r.reservation_id
        WHERE r.reservation_id = in_id_reservation
        AND ir.ean13 = in_ean13;
        --pobieramy do zmiennej całkowitą liczbę dodanych porduktów do zamówienia 
        SELECT
            SUM (ir.qnty_reserved)  total_quantity
        INTO v_total_qnty
        FROM items_reservation ir
        INNER JOIN reservations r
        ON ir.reservation_id=r.reservation_id
        WHERE r.reservation_id = in_id_reservation;  
        -- sprawdzamy: jeśli suma wszystkich produktów przekroczyła limit wówczas propaguj komunikat    
        IF (v_total_qnty > v_max_qnty) THEN
        -- wycofaj dodane produkty
        ROLLBACK;
                    RAISE error_pkg.ex_too_much_items;
        -- jeśli ilosć tych samych produktów dodanych do zamówienia jest wieksza niż dopuszcz, limit propaguj komuniakt 
        ELSIF (v_prod_qnty.quantity_per_product > v_max_identic) THEN 
        ROLLBACK;
                    RAISE error_pkg.ex_identic_items;
        END IF; 
        
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20999, 'Wybrany produkt nie jest refundownay'); 
        WHEN error_pkg.ex_too_much_items THEN
        RAISE_APPLICATION_ERROR(-20001,'Drogi użytkowniku możesz dodać tylko 10 produktów do rezerwacji: '||in_id_reservation);
        WHEN error_pkg.ex_identic_items THEN
        RAISE_APPLICATION_ERROR(-20002,'Drogi użytkowniku nie możesz dodać więcej niż 5 takich samych produktów do rezerwacji'); 
    END p_add_item_reservation;
	
    PROCEDURE p_get_list_reservations_interval(in_start_date  IN   DATE
                                            , in_end_date     IN   DATE) 
    IS
            CURSOR c_list_reservations
                    IS
                            SELECT 
                            DISTINCT r.reservation_id
                            , r.status_reservation
                            , u.login
                            FROM reservations r
                            JOIN items_reservation ir
                            ON r.reservation_id=ir.reservation_id
                            JOIN users u
                            ON u.user_id=ir.user_id
                            WHERE r.booking_start  BETWEEN in_start_date AND in_end_date 
                            ORDER BY r.reservation_id;                    
    v_list_rec     c_list_reservations%ROWTYPE;
    v_rowcount      NUMBER;
    BEGIN
            OPEN c_list_reservations;
            IF in_start_date>in_end_date OR in_end_date<in_start_date THEN
                RAISE error_pkg.ex_wrong_date;
            ELSE
                LOOP
                    FETCH c_list_reservations INTO v_list_rec;
                    EXIT WHEN c_list_reservations%NOTFOUND;
                    DBMS_OUTPUT.PUT_LINE('Numer rezerwacji:' ||v_list_rec.reservation_id||chr(10)||
                                         'Status: '||v_list_rec.status_reservation||chr(10)||
                                         'Login: '||v_list_rec.login||chr(10));
                END LOOP;
            v_rowcount := c_list_reservations%rowcount;
            DBMS_OUTPUT.PUT_LINE('Od dnia '||in_start_date||' wykonano rezerwacji: '||v_rowcount);
            CLOSE c_list_reservations;
            END IF;        
    EXCEPTION
    --komunikat dla osoby nietechnicznej
    WHEN error_pkg.ex_wrong_date THEN
    RAISE_APPLICATION_ERROR(-20006 ,'Drogi użytkowniku podane daty muszą w poprawnej kolejności (początkowa > końcowa)'); 
    END p_get_list_reservations_interval;
	
END user_reservation_pkg;
/