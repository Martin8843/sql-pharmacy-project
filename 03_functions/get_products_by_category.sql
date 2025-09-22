CREATE OR REPLACE TYPE prod_info_rec AS OBJECT (
    prod_name   VARCHAR2(100),
    exp_d       DATE,
    prod_price  NUMBER,
    stoc_qnty   NUMBER
);
/
-- definicja tabeli rekordów
CREATE OR REPLACE TYPE prod_info_nt AS TABLE OF prod_info_rec;


CREATE OR REPLACE FUNCTION get_products_by_category (p_category_id IN NUMBER) RETURN  prod_info_nt 
PIPELINED
IS    
BEGIN
  -- pobieranie danych
  FOR rec IN (
        SELECT p.product_name, p.exp_date, p.price, s.quantity
        FROM products p
        INNER JOIN stock s ON p.product_id = s.product_id
        WHERE p.prod_cat_id = p_category_id
    ) 
  LOOP
  -- tworzenie obiektu dla kazdego rekordu z petli i przeslanie dynamiczne za pomoca PIPE
        PIPE ROW (prod_info_rec(rec.product_name, rec.exp_date, rec.price, rec.quantity));
  END LOOP;
  -- return zwraca dane do wywolujacego programu
  RETURN;
  
END get_products_by_category;
/

  -- wywolanie
SELECT *
FROM get_products_by_category(p_category_id => 180);

