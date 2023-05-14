CREATE OR REPLACE PACKAGE product_manager_pkg
IS
    TYPE t_product_list IS TABLE OF VARCHAR2 (150);
    v_products  t_product_list;
	
    PROCEDURE p_get_list_product_refund;
    PROCEDURE p_update_new_gross_price(in_ean13 IN products.ean13%TYPE, in_new_net_price IN products.net_price%TYPE);
END product_manager_pkg;
/

CREATE OR REPLACE PACKAGE BODY product_manager_pkg
IS

 -- 2 paramtery na wejściu do procedury kod produktu i nowa cena netto
    PROCEDURE p_update_new_gross_price(in_ean13			 IN products.ean13%TYPE
                                       ,in_new_net_price IN products.net_price%TYPE)
    IS
    v_vat_rate      NUMBER;         -- zmienna przechowująca wysokość stawki VAT
    v_after_refund  NUMBER(6,2);    -- przechowuje nowa cenę po refundacji(bez podatku) i oblicza ze wzoru:
                                    -- bez ryczałtu -> v_after_refund = limit_finansowania*(poziom refundacji/100) + (nowa_cena_netto - limit_finansowania) 
                                    -- z ryczałtem  -> v_after_refund = (nowa_cena_netto-limit_finansowania) + ryczałt 
    v_amount_vat    NUMBER(6,2);    -- przechowuje samą wartość podatku dla nowego produktu
    v_calc_gross    NUMBER(6,2);    -- wyliczona cena brutto
    v_gross_price   NUMBER;
    v_ean13         NUMBER;
    v_level_refund  VARCHAR(3);
    v_limit_funding NUMBER (2);     
    v_correct_lmt   NUMBER;          
    v_flat_rate     CONSTANT NUMBER(2,1) := 3.2;
    
BEGIN  
-- wybieranie stawki vat dla podanego produktu i wstawianie do zmiennej
-- gdy w bazie nie ma danych dla podanego kodu wykonanie przekazane do obsługi błedów
    SELECT pc.vat_rate, p.ean13, p.gross_price, p.level_refund,  p.limit_funding   
    INTO v_vat_rate, v_ean13, v_gross_price, v_level_refund, v_limit_funding  
    FROM products_category pc
    INNER JOIN products p 
    ON pc.category_id=p.category_id
    WHERE p.ean13=in_ean13
    ; 
-- propaguj wyjątek jeśli podana cena jest niższa niż limit dla tego produktu, zwróć wartość limitu
        IF  in_ean13=v_ean13 AND v_limit_funding > in_new_net_price THEN
        v_correct_lmt := v_limit_funding;
        RAISE error_pkg.ex_err_net_price;
-- jesli jest ok, oblicz cenę brutto gdy poziom refundacji dla tego leku jest inny niż ryczałt (3.20)
            ELSIF in_ean13=v_ean13 AND v_level_refund <> 'R' THEN
            v_after_refund := v_level_refund *(v_level_refund/100)+(in_new_net_price-v_limit_funding);
            v_amount_vat   := v_after_refund*(v_vat_rate/100);
            v_calc_gross   := v_after_refund + round(v_amount_vat, 2);
-- jesli ryczałt, oblicz oblicza z ryczałtem
            ELSIF in_ean13 = v_ean13 AND v_level_refund = 'R' THEN
            v_after_refund := (in_new_net_price-v_limit_funding) + v_flat_rate;
            v_amount_vat   := v_after_refund*(v_vat_rate/100);
            v_calc_gross   := v_after_refund + round(v_amount_vat, 2);
        END IF;     
    -- zaktualizuj wartości dla podanego produktu
       UPDATE products
       SET net_price=in_new_net_price, gross_price = v_calc_gross                      
       WHERE ean13=in_ean13;    
   DBMS_OUTPUT.PUT_LINE('Po aktualizacji ceny netto, cena brutto wynosi: ' ||v_calc_gross);
   
   EXCEPTION
   WHEN NO_DATA_FOUND  THEN
   DBMS_OUTPUT.PUT_LINE('Wystąpił błąd: ' ||sqlcode|| ', komunikat: ' ||sqlerrm);
   DBMS_OUTPUT.PUT_LINE('Nie ma takiego produktu na liście lub niewłaściwa długość kodu ean');
       WHEN error_pkg.ex_err_net_price THEN
        RAISE_APPLICATION_ERROR(-20001, 'Drogi użytkowniku  cena netto ktora podajesz jest MNIEJSZA nie limit finasnsowania leku, ktory  wynosi: '||v_correct_lmt);
	END p_update_new_gross_price;

	PROCEDURE p_get_list_product_refund 
	IS
			v_result     product_manager_pkg.t_product_list := product_manager_pkg.t_product_list();
			
			FUNCTION  get_products RETURN product_manager_pkg.v_products%TYPE
			IS
			v_t_product_list    product_manager_pkg.t_product_list  := product_manager_pkg.t_product_list();
			BEGIN
			DBMS_OUTPUT.PUT_LINE('Oto lista aktualnych leków refundowanych');
						 SELECT availability ||' === '|| long_product_name     
						 BULK COLLECT INTO v_t_product_list
						 FROM products
						 WHERE level_refund  IN ('0')
						 ORDER BY gross_price DESC;
				RETURN v_t_product_list;
			EXCEPTION
			WHEN OTHERS THEN
				RAISE_APPLICATION_ERROR(-20001, 'wystąpił błąd o kodzie: '||sqlcode||', komunikat: '||sqlerrm);
			END get_products;
	BEGIN
		v_result := get_products();
		FOR i IN v_result.FIRST..v_result.LAST
		LOOP
			DBMS_OUTPUT.PUT_LINE(v_result(i));
		END LOOP;
	END p_get_list_product_refund;

END product_manager_pkg;










