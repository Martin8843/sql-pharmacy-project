--DROP VIEW v_rx_products;
CREATE OR REPLACE VIEW v_rx_products 
AS
    SELECT EAN13, long_product_name
    FROM products
    WHERE level_refund IS NOT NULL;


--DROP VIEW v_qty_exhted_products;
CREATE OR REPLACE VIEW   v_qty_exhted_products  
AS
    SELECT 
         distinct p.category_id
        , pc.category_name
        , COUNT(*) OVER (PARTITION BY p.category_id) AS sum_products
    FROM products p
    INNER JOIN products_category pc
    ON p.category_id=pc.category_id
    WHERE p.availability = 'Na wyczerpaniu'
    ORDER BY p.category_id;  
    
   
   
--DROP VIEW v_expiry_products;
CREATE OR REPLACE VIEW v_expiry_products 
AS
    SELECT EAN13, long_product_name
    FROM products
    WHERE exp_date < sysdate  OR exp_date <= sysdate + to_yminterval('00-06');
	