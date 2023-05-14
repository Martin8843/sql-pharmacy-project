CREATE OR REPLACE PACKAGE stock_pkg
IS
    PROCEDURE p_add_new_sku_list ( in_sku 				 IN stock.sku%type  
                                  ,in_short_product_name IN stock.short_product_name%type 
                                  ,in_quantity 			 IN stock.quantity%type);

END stock_pkg;


CREATE OR REPLACE PACKAGE BODY stock_pkg
IS
    PROCEDURE p_add_new_sku_list ( in_sku                IN stock.sku%type
                                  ,in_short_product_name IN stock.short_product_name%type
                                  ,in_quantity           IN stock.quantity%type)
    IS
    BEGIN
       INSERT INTO stock (sku, short_product_name, quantity)
        VALUES
        ( in_sku
        , in_short_product_name
        , in_quantity
        );
    END p_add_new_sku_list;

END stock_pkg;