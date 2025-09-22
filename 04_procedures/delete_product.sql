CREATE OR REPLACE PROCEDURE delete_product (p_product_id IN products.product_id%TYPE)

IS

    v_prod_exists NUMBER;
    v_is_in_order NUMBER;
    v_is_in_stock NUMBER;
    ex_err_prod_is_in_order EXCEPTION;
    ex_err_prod_is_in_stock EXCEPTION;

    PRAGMA EXCEPTION_INIT(ex_err_prod_is_in_order, -20002);
    PRAGMA EXCEPTION_INIT(ex_err_prod_is_in_stock, -20003);
BEGIN

    -- walidacja danych, czy product istnieje jeśli nie, rzuca wyjatek NO_DATA_FOUND
    SELECT 1 
    INTO v_prod_exists
    FROM products
    WHERE product_id = p_product_id;
    
    -- walidacja danych w przyapdku jeśli produkt jest w zamówieniu
    SELECT 
        CASE WHEN EXISTS(SELECT 1 FROM order_details WHERE product_id = p_product_id AND ROWNUM = 1)
        THEN 1 
        ELSE 0 
        END
    INTO v_is_in_order
    FROM dual;
    
    -- walidacja danych w przypadku, gdy produkt znajduje się na stanie magazynowym, jeśli zero produktów wtedy kasowanie kaskadowe
    SELECT 
        CASE WHEN EXISTS(SELECT 1 FROM stock WHERE product_id = p_product_id AND quantity>0)
        THEN 1 
        ELSE 0 
        END
    INTO v_is_in_stock
    FROM dual;
    
    IF v_is_in_order=1 THEN
        RAISE ex_err_prod_is_in_order;
    END IF;
    
    IF v_is_in_stock=1 THEN
        RAISE ex_err_prod_is_in_stock;
    END IF;
    
    DELETE FROM products
    WHERE product_id = p_product_id;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        log_event(p_log_type=>'ERROR', p_log_details=> 'Próba usunięcia ID produktu, który nie istnieje; '||sqlerrm);
        RAISE_APPLICATION_ERROR(-20001, 'Podane id produktu nie istnieje.'); 
    WHEN ex_err_prod_is_in_order THEN 
        log_event(p_log_type=>'ERROR', p_log_details=> 'Próba usunięcia produktu o id:'||p_product_id||' który jest w jednym (lub więcej) zamówieniach, '||sqlerrm);
         
         RAISE_APPLICATION_ERROR(-20002, 'Nie możesz usunać produktu o ID: '||p_product_id|| ' który jest w jednym (lub więcej) zamówieniach');
    WHEN ex_err_prod_is_in_stock THEN 
        log_event(p_log_type=>'ERROR', p_log_details=> 'Próba usunięcia produktu o id:'||p_product_id||' który jest na magazynie w ilości > 0, '||sqlerrm);
         
         RAISE_APPLICATION_ERROR(-20003, 'Nie możesz usunać produktu o ID:'||p_product_id|| ' który jest na stanie magazynowym');
    WHEN OTHERS THEN 
        -- Zwrócenie ogólnego komunikatu o błędzie
         log_event(p_log_type=>'ERROR', p_log_details=> 'Inny blad, '||sqlerrm);
         
         RAISE_APPLICATION_ERROR(-20008, 'Wystąpił błąd podczas usuwania produktu, ' ||sqlerrm);

END delete_product;


BEGIN
delete_product(1);
END;


UPDATE STOCK 
SET quantity =0
where product_id=1;
