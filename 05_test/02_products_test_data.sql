INSERT INTO products (product_name, product_desc, exp_date, price, prescription_req, prod_cat_id)
VALUES ('Aspirin', 'Produkt na bóle gowy', sysdate + 365, 19.99, 0, 100);

INSERT INTO products (product_name, product_desc, exp_date, price, prescription_req, prod_cat_id)
VALUES ('Gripex ', 'Lek na przeziębienie i grypę', sysdate + 360, 24.99, 0, 100);

INSERT INTO products (product_name, product_desc, exp_date, price, prescription_req, prod_cat_id)
VALUES ('Stoperan ', 'Lek na biegunkę', sysdate + 265, 10.99, 0, 100);

INSERT INTO products (product_name, product_desc, exp_date, price, prescription_req, prod_cat_id)
VALUES ('Paracetamol ', 'Lek przeciwbólowy i przeciwgorączkowy', sysdate + 365, 9.99, 0, 100);

INSERT INTO products (product_name, product_desc, exp_date, price, avail_status, prescription_req, prod_cat_id)
VALUES ('Septolete ', 'Pastylki na gardło', sysdate + 465, 11.99, 'Out of Stock', 0, 100);