
 
-- TABLE STOCK

-- validate SKU code for defined format model:
ALTER TABLE stock ADD CONSTRAINT fmat_sku_stock_chck CHECK (regexp_like(sku,'^\D{2,3}-\D{1,2}-\d{1,3}|(\.\d{1,4})-\d{3}$')); 
ALTER TABLE stock ADD CONSTRAINT up_sku_stock_chck CHECK (sku = UPPER(sku));

-- checking column short_product_name for accepted model: AMLOZEK 10_10
ALTER TABLE stock ADD CONSTRAINT name_stock_chck CHECK (regexp_like(short_product_name,'^[[:alnum:]]{5,35}| |[[:digit:]]{3}\.|_[[:digit:]]{5}$' ));


-- TABLE ORDERS

ALTER TABLE orders ADD CONSTRAINT up_status_ord_chck CHECK (status_order = UPPER(status_order));


-- TABLE PRODUCTS

-- EAN13 code must have 14 characters
ALTER TABLE products ADD CONSTRAINT lth_ean13_prod_chck CHECK (regexp_like (ean13,'^\d{13}$')); 

-- contraint for market prefix in code EAN13, which is given by Brand Owner.           
ALTER TABLE products ADD CONSTRAINT px_ean13_prod_chck CHECK (ean13 LIKE '590%');   

-- constraint for allowed form products
ALTER TABLE products ADD CONSTRAINT form_prod_chck CHECK (form IN ('Tabletka', 'Roztwór', 'Krople', 'Syrop', 'Pomadka', 'Zawiesina','Płyn', 'Maść', 'Krem', 'Pasta', 'Proszek', 'Kapsułka' ));

ALTER TABLE products ADD CONSTRAINT itcap_form_prod_chck CHECK (form = INITCAP(form));
   
-- constraint for strength. Checking unit mass on the end string for inserting strength.   															 
ALTER TABLE products ADD CONSTRAINT strength_chck CHECK (regexp_like(strength,'^\d{1,4}|(\.\d{1,4})(%|mg)|(?/\d{1,4}[mg]?/\d{1,4}[mg])$' ));
																							   

-- validate for allowed status availability
ALTER TABLE products ADD CONSTRAINT status_prod_chck CHECK (availability IN ('Na wyczerpaniu', 'Średnia ilość', 'Dostępny na zamówienie', 'Duża ilość'));


-- TABLE USERS

-- first name should be starts from capital letter
ALTER TABLE users ADD CONSTRAINT itcap_fname_chck CHECK (first_name = INITCAP(first_name));

-- last name should be starts from capital letter
ALTER TABLE users ADD CONSTRAINT itcap_lname_chck CHECK (last_name = INITCAP(last_name));

-- login should be have definite format
ALTER TABLE users ADD CONSTRAINT fmt_login_chck CHECK (regexp_like (login,'^[[:alpha:]]{3,6}[[:digit:]]{2}$'));

-- address_email should be have definite format
ALTER TABLE users ADD CONSTRAINT fmt_email_chck CHECK (regexp_like(address_email,'^([[:alnum:]]|\.|_|-){7,10}?@[[:alpha:]]{3,10}\.[[:alpha:]]{2,5}$'));

-- format phone number should be same like calling intercountry 
ALTER TABLE users ADD CONSTRAINT fmt_phone_no_chck CHECK (regexp_like(phone_number,'^[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9]$'));

--
ALTER TABLE users ADD CONSTRAINT fmt_recipe_code_chck check (regexp_like(recipe_code, '^[[:digit:]]{4}$')) ;
--
ALTER TABLE users ADD CONSTRAINT itcap_company_chck CHECK (company_name = INITCAP(company_name));

--
ALTER TABLE users ADD CONSTRAINT pfix_taxid_chck CHECK (tax_id LIKE 'PL%' );
ALTER TABLE users ADD CONSTRAINT fmt_taxid_chck CHECK (regexp_like(tax_id,'^[[:alnum:]]{12}$' ) ) ;


-- TABLE PAYMENTS
ALTER TABLE payments ADD CONSTRAINT form_paymt_chck CHECK (form_payment IN ('Karta kredytowa', 'Blik', 'Przelew bankowy'));



-- TABLE PRODUCTS_CATAGORY
ALTER TABLE products_category ADD CONSTRAINT prod_ctg_vat_chck CHECK ( vat_rate IN ('0', '5', '8', '23'));

									   
-- TABLE RESERVATION
ALTER TABLE reservations ADD CONSTRAINT status_reservt_chck CHECK (status_reservation IN 
('NEW','ANULOWANIE', 'ZREALIZOWANA', 'DO ODBIORU W APTECE',
'NA ZAMÓWIENIE', 'OCZEKUJE NA ZATWIERDZENIE UŻYTKOWNIKA', 'ZATWIERDZONE PRZEZ UŻYTKOWNIKA'));

-- Table DELIVERIES
ALTER TABLE deliveries ADD CONSTRAINT form_delivery_chck
CHECK (form_delivery IN ('Kurier DPD', 'DPD Pick up', 'Paczkomat Inpost', 'Odbiór własny'));

--TABLE OPERATIONS_MAGAZINE

ALTER TABLE operations_magazine ADD CONSTRAINT fmt_op_mag_chck CHECK (regexp_like (operation_id,'^[[:alpha:]]{3}[[:digit:]]{2}$'));
