
CREATE OR REPLACE PROCEDURE add_product (       p_name         IN products.product_name%TYPE,
                                                p_description  IN products.product_desc%TYPE DEFAULT 'Brak opisu',
                                                p_exp_date     IN products.exp_date%TYPE DEFAULT NULL,
                                                p_price        IN products.price%TYPE,
                                                p_status       IN products.avail_status%TYPE DEFAULT 'Available',
                                                p_presc        IN products.prescription_req%TYPE DEFAULT 0,
                                                p_category_id  IN product_categories.prod_cat_id%TYPE
                                                ) 
IS
   v_catg_exists NUMBER;
   v_is_medical_equip NUMBER;
   ex_err_medical_equip  EXCEPTION;
   ex_err_is_not_req_exp_date EXCEPTION;
   ex_err_is_prescription EXCEPTION;
   ex_err_is_minus_price EXCEPTION;
   ex_err_is_not_prescription EXCEPTION;

   PRAGMA EXCEPTION_INIT(ex_err_medical_equip, -20002);
   PRAGMA EXCEPTION_INIT(ex_err_is_not_req_exp_date, -20003);
   PRAGMA EXCEPTION_INIT(ex_err_is_prescription, -20004);
   PRAGMA EXCEPTION_INIT(ex_err_is_minus_price, -20005);
   PRAGMA EXCEPTION_INIT(ex_err_is_not_prescription, -20006);

BEGIN
    -- walidacja danych, czy kategoria istnieje jeśli nie, rzuca wyjatek NO_DATA_FOUND
    SELECT 1 
    INTO v_catg_exists
    FROM product_categories
    WHERE prod_cat_id = p_category_id;
        
    -- walidacja danych, czy kategoria należy do sprzętu medycznego (id=2100)
    SELECT 
        CASE WHEN EXISTS(SELECT 1 FROM product_categories WHERE prod_cat_id = p_category_id AND prod_cat_id = 2100)
        THEN 1 
        ELSE 0 
        END
    INTO v_is_medical_equip
    FROM dual;
          
    -- walidacja danych, jeśli id produktu nie należy do sprz.med i data waż. nie jest wprowadzona rzuć wyjatek
    IF v_is_medical_equip = 0 AND p_exp_date is NULL THEN 
        RAISE ex_err_medical_equip;   
    ELSIF v_is_medical_equip = 1 AND p_exp_date IS NOT NULL THEN
        RAISE ex_err_is_not_req_exp_date;
    END IF;
    
    --walidacja danych czy kategoria wymaga recepty
    IF p_category_id = 1700 AND p_presc = 0 THEN
        RAISE ex_err_is_prescription; 
    ELSIF p_category_id <> 1700 AND p_presc = 1 THEN
        RAISE ex_err_is_not_prescription; 
    END IF;
    
    -- walidacja danych, czy cena jest dodatnia
    IF p_price <=0 THEN
        RAISE ex_err_is_minus_price;
    END IF;
        
    -- dodanie produktu do tabeli
    INSERT INTO products (product_name, product_desc, exp_date, price, avail_status, prescription_req, prod_cat_id)
    VALUES (p_name, p_description, p_exp_date, p_price, p_status, p_presc, p_category_id);
    

EXCEPTION
    WHEN NO_DATA_FOUND THEN
         log_event(p_log_type=>'ERROR', p_log_details=>'Podano nieznana kategorię produktu-id: ' ||p_category_id||': '||sqlerrm);
         
         RAISE_APPLICATION_ERROR(-20001, 'Podana kategoria produktu nie istnieje.'); 
         
    WHEN ex_err_medical_equip THEN 
         log_event(p_log_type=>'ERROR', p_log_details=> 'Nie podano wymaganej daty waznosci, '||sqlerrm);
         
         RAISE_APPLICATION_ERROR(-20002, 'Dla produktu o kategorii: '||p_category_id|| ' wymagana jest data ważności');
         
    WHEN ex_err_is_not_req_exp_date THEN 
         log_event(p_log_type=>'ERROR', p_log_details=> 'Wprowadzono datę ważności, która nie jest wymagana dla kategorii id: ' ||p_category_id||': '||sqlerrm);
         
         RAISE_APPLICATION_ERROR(-20003, 'Wprowadzasz kategorię, która nie wymaga daty ważności');
         
    WHEN ex_err_is_prescription THEN
         log_event(p_log_type=>'ERROR', p_log_details=> 'Nie wprowadzono recepty dla kategorii id:' ||p_category_id||': '||sqlerrm);
         
         RAISE_APPLICATION_ERROR(-20004, 'Wprowadzasz kategorię, która wymaga recepty (status=1');
         
    WHEN ex_err_is_minus_price THEN
         log_event(p_log_type=>'ERROR', p_log_details=> 'Podano nieprawidowa cenę, '||sqlerrm);
         
         RAISE_APPLICATION_ERROR(-20005, 'Cena produktu musi być dodatnia!');
         
    WHEN ex_err_is_not_prescription THEN
         log_event(p_log_type=>'ERROR', p_log_details=> 'Podano nie wymagana recepte'||sqlerrm);
         
         RAISE_APPLICATION_ERROR(-20006, 'Recepta nie jest wymagana dla podanej kategorii, popraw status!');
         
    WHEN DUP_VAL_ON_INDEX  THEN
         log_event(p_log_type=>'ERROR', p_log_details=> 'Próba dodania nazwy produktu, która już istnieje; '||sqlerrm);
         
         RAISE_APPLICATION_ERROR(-20007, 'Nazwa produktu już istnieje');

    WHEN OTHERS THEN 
        -- Zwrócenie ogólnego komunikatu o błędzie
         log_event(p_log_type=>'ERROR', p_log_details=> 'Inny blad, '||sqlerrm);
         
         RAISE_APPLICATION_ERROR(-20008, 'Wystąpił błąd podczas dodawania produktu, ' ||sqlerrm);

END add_product;
/




/*
BEGIN
add_product ( 
        p_name          => 'Paracetamol_020',
        --p_description => 'Dobra na wszystko',
        --p_exp_date      => TO_DATE('2026-02-22','RRRR-MM-DD'),
        --p_exp_date    => null,
        p_price         => 444.44,
        p_status        => 'Available',
        p_presc         => 0,
        p_category_id   => 2100
);
--
END;
/
*/





  
      
