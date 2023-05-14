

CREATE TABLE deliveries (
    delivery_id    NUMBER NOT NULL
    , form_delivery  VARCHAR2(30) NOT NULL
    , price_delivery NUMBER(5, 2) NOT NULL
);

ALTER TABLE deliveries ADD CONSTRAINT deliveries_pk PRIMARY KEY ( delivery_id );

ALTER TABLE deliveries ADD CONSTRAINT deliveries_un UNIQUE ( form_delivery,
                                                             price_delivery );
															 
															 
ALTER TABLE deliveries ADD CONSTRAINT form_delivery_chck
CHECK (form_delivery IN ('Kurier DPD', 'DPD Pick up', 'Paczkomat Inpost', 'Odbiór własny'));

CREATE TABLE invoices (
    invoice_id     VARCHAR(20)NOT NULL
    , date_invoice   DATE DEFAULT SYSDATE
    , qnty_items     NUMBER(10)  
    , unit           VARCHAR2(5) DEFAULT 'szt.'          
	, net_price      NUMBER(6, 2)  
    , total_due      NUMBER(6, 2)
    , transaction_id NUMBER  
	, vat_amount     NUMBER(6, 2)
);

ALTER TABLE invoices ADD CONSTRAINT invoices_pk PRIMARY KEY ( invoice_id );

CREATE SEQUENCE invoices_seq  
START WITH     1  
INCREMENT BY   1  
MAXVALUE       9999  
NOCACHE  
NOCYCLE;

CREATE TABLE items_invoice (
    invoice_item_id     NUMBER NOT NULL
    , invoice_id        VARCHAR(20)  NOT NULL
    , EAN13             NUMBER(13)   NOT NULL
    , gross_value       NUMBER(6, 2) NOT NULL
    , long_product_name VARCHAR2(100)NOT NULL
    , quantity          NUMBER(3)    NOT NULL
    , unit              VARCHAR2(5)  DEFAULT 'szt.' NOT NULL
    , net_value         NUMBER(6, 2) NOT NULL
    , vat_rate          NUMBER(2) NOT NULL
);


ALTER TABLE items_invoice ADD CONSTRAINT items_invoice_pk PRIMARY KEY ( invoice_item_id,
                                                                        invoice_id );
																																				
CREATE TABLE "ITEMS_ORDER.MAGAZINE" (
    m_order_item_id   NUMBER NOT NULL
    , order_id        NUMBER NOT NULL
    , EAN13           NUMBER (13,0) NOT NULL
    , net_price       NUMBER(6, 2) NOT NULL
    , quantity        NUMBER(6) NOT NULL
    , unit            VARCHAR2(5) DEFAULT 'szt.' NOT NULL
    , partner_id      NUMBER NOT NULL
    operation_id      VARCHAR2(7) NOT NULL
);

ALTER TABLE "ITEMS_ORDER.MAGAZINE" ADD CONSTRAINT "ITEMS_ORDER.MAGAZINE_PK" PRIMARY KEY ( m_order_item_id,
                                                                                         order_id );

CREATE TABLE "ITEMS_ORDER.STORE" (
    s_order_item_id   NUMBER NOT NULL
    , order_id        NUMBER NOT NULL
    , EAN13           NUMBER(13) NOT NULL
    , net_price       NUMBER(6, 2) NOT NULL
    , quantity        NUMBER(4) NOT NULL
    , unit            VARCHAR2(5) DEFAULT 'szt.' NOT NULL
    , user_id         NUMBER NOT NULL
);

ALTER TABLE "ITEMS_ORDER.STORE" ADD CONSTRAINT "ITEMS_ORDER.STORE_PK" PRIMARY KEY ( s_order_item_id,
                                                                                   order_id );
 
CREATE TABLE items_reservation (
    reserved_item_id   NUMBER NOT NULL
    , reservation_id   NUMBER (8) NOT NULL
    , user_id          NUMBER NOT NULL
    , EAN13            NUMBER(13) NOT NULl
    , qnty_reserved    NUMBER NOT NULL
    , unit             VARCHAR2(10) DEFAULT 'szt.'
);

ALTER TABLE items_reservation ADD CONSTRAINT items_reservation_pk PRIMARY KEY ( reserved_item_id,
                                                                                reservation_id );

CREATE TABLE items_stock (
    item_stock_id   NUMBER NOT NULL
    , sku           VARCHAR2(30) NOT NULL
    , partner_id    NUMBER NOT NULL
    , ref_number    NUMBER(5) NOT NULL

ALTER TABLE items_stock ADD CONSTRAINT items_stock_pk  PRIMARY KEY (item_stock_id);                                                                sku );
																	
CREATE SEQUENCE items_stock_seq  
START WITH     1  
INCREMENT BY   1  
MAXVALUE       9999  
NOCACHE  
NOCYCLE;

CREATE TABLE operations_magazine (
    operation_id      VARCHAR2(7) NOT NULL
	, type_document   VARCHAR2(10) NOT NULL	
    , date_operation  DATE NOT NULL
    , quantity        NUMBER(5) NOT NULL
    , unit            VARCHAR2(5) DEFAULT 'szt.' NOT NULL
    , unit_price      NUMBER(6, 2) NOT NULL
    , sku             VARCHAR2(30) NOT NULL
);

ALTER TABLE operations_magazine ADD CONSTRAINT operations_magazine_pk PRIMARY KEY ( operation_id );

ALTER TABLE operations_magazine ADD CONSTRAINT fmt_op_mag_chck CHECK (regexp_like (operation_id,'^[[:alpha:]]{3}[[:digit:]]{2}$'));


CREATE TABLE orders (
    order_id         NUMBER NOT NULL
    , date_order     DATE DEFAULT SYSDATE NOT NULL
    , qnty_order     NUMBER(5)  NULL
    , cost_order     NUMBER(6, 2)  NULL
    , status_order   VARCHAR2(40) DEFAULT 'NEW' NULL
    , delivery_id    NUMBER  NULL
    , transaction_id NUMBER  NULL
);

ALTER TABLE orders ADD CONSTRAINT orders_pk PRIMARY KEY ( order_id );


CREATE SEQUENCE order_id_seq  
START WITH     12000000  
INCREMENT BY   10  
MAXVALUE       99999999  
NOCACHE  
NOCYCLE;                              

ALTER TABLE orders ADD CONSTRAINT up_status_ord_chck CHECK (status_order = UPPER(status_order));

CREATE TABLE partners (
    partner_id     NUMBER NOT NULL
    , partner_name VARCHAR2(50) NOT NULL
);

CREATE SEQUENCE partners_seq  
 START WITH     1  
 INCREMENT BY   1  
 MAXVALUE       9  
 NOCACHE  
 NOCYCLE;
 
ALTER TABLE partners ADD CONSTRAINT partners_pk PRIMARY KEY ( partner_id );

ALTER TABLE partners ADD CONSTRAINT partners_un UNIQUE ( partner_name );

CREATE TABLE payments (
    transaction_id   NUMBER NOT NULL
    , form_payment   VARCHAR2(30) NOT NULL
);

ALTER TABLE payments ADD CONSTRAINT payments_pk PRIMARY KEY ( transaction_id );

ALTER TABLE payments ADD CONSTRAINT payments_un UNIQUE ( form_payment );

CREATE TABLE products (
    EAN13        NUMBER(13) NOT NULL
    , long_product_name VARCHAR2(150) NOT NULL
    , gross_price  NUMBER(6, 2) DEFAULT 0 NOT NULL
	, net_price    NUMBER(6, 2) DEFAULT 0 NOT NULL
	, form         VARCHAR2(20) NOT NULL
    , presentation NUMBER (5,2) NOT NULL
	, molecule     VARCHAR2(60)DEFAULT 'XXX' NOT NULL 
    , strength     VARCHAR2(30)DEFAULT 'XXX' NOT NULL
	, level_refund VARCHAR2(3) DEFAULT '0' NOT NULL
	, limit_funding NUMBER(4,2) DEFAULT 0 NOT NULL
	, exp_date     DATE NOT NULL
    , availability VARCHAR2(30)DEFAULT 'BEZ STATUSU' NOT NULL
    , description  VARCHAR2(300)DEFAULT 'Miejsce na informacje z ulotki' NOT NULL
    , sku          VARCHAR2(30) NOT NULL
    , category_id  NUMBER NOT NULL
);

ALTER TABLE products ADD CONSTRAINT products_pk PRIMARY KEY ( ean13 );

ALTER TABLE products ADD CONSTRAINT products_un UNIQUE ( sku );

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
  
CREATE TABLE products_category (
    category_id          NUMBER NOT NULL
    , category_name      VARCHAR2(50) NOT NULL
    , vat_rate           NUMBER(2) NOT NULL
);

ALTER TABLE products_category ADD CONSTRAINT product_category_pk PRIMARY KEY ( category_id );

ALTER TABLE products_category ADD CONSTRAINT product_category_un UNIQUE ( category_name );

ALTER TABLE products_category ADD CONSTRAINT prod_ctg_vat_chck CHECK ( vat_rate IN ('0', '5', '8', '23'));

CREATE TABLE reservations (
    reservation_id       NUMBER (8) NOT NULL
    , booking_start      DATE  DEFAULT SYSDATE NOT NULL
    , booking_end        DATE  DEFAULT SYSDATE + 7 NOT NULL
    , status_reservation VARCHAR2(80) DEFAULT 'NEW' NOT NULL
);

ALTER TABLE reservations ADD CONSTRAINT reservations_pk PRIMARY KEY ( reservation_id );

ALTER TABLE reservations ADD CONSTRAINT status_reservt_chck CHECK (status_reservation IN 
('NEW','ANULOWANIE', 'ZREALIZOWANA', 'DO ODBIORU W APTECE',
'NA ZAMÓWIENIE', 'OCZEKUJE NA ZATWIERDZENIE UŻYTKOWNIKA', 'ZATWIERDZONE PRZEZ UŻYTKOWNIKA'));

--DROP SEQUENCE reservation_id_seq; 
CREATE SEQUENCE reservation_id_seq  
START WITH     10000000  
INCREMENT BY   10  
MAXVALUE       99999999  
NOCACHE  
NOCYCLE;

CREATE TABLE stock (
    sku                  VARCHAR2(30) NOT NULL
    , short_product_name VARCHAR2(40) NOT NULL
    , net_value     	 NUMBER(8, 2) DEFAULT 0 NULL
    , net_price_purchase NUMBER(6, 2) DEFAULT 0 NULL
    , quantity           NUMBER(5) NOT NULL
    , unit               VARCHAR2(5) DEFAULT 'szt.'  NOT NULL
);

ALTER TABLE stock ADD CONSTRAINT stock_pk PRIMARY KEY ( sku );

-- validate SKU code for defined format model:
ALTER TABLE stock ADD CONSTRAINT fmat_sku_stock_chck CHECK (regexp_like(sku,'^\D{2,3}-\D{1,2}-\d{1,3}|(\.\d{1,4})-\d{3}$')); 
ALTER TABLE stock ADD CONSTRAINT up_sku_stock_chck CHECK (sku = UPPER(sku));
-- checking column short_product_name for accepted model: AMLOZEK 10_10
ALTER TABLE stock ADD CONSTRAINT name_stock_chck CHECK (regexp_like(short_product_name,'^[[:alnum:]]{5,35}| |[[:digit:]]{3}\.|_[[:digit:]]{5}$' ));

CREATE TABLE users (
    user_id       NUMBER NOT NULL
    , first_name    VARCHAR2(20) NOT NULL
    , last_name     VARCHAR2(20) NOT NULL
    , login         VARCHAR2(20) NOT NULL
    , address_email VARCHAR2(25) NOT NULL
    , phone_number  VARCHAR2(12) NOT NULL
    , company_name  VARCHAR2(20)
    , tax_id        VARCHAR2(20)
    , recipe_code   NUMBER(4)
);

ALTER TABLE users
    ADD CONSTRAINT users__un UNIQUE ( tax_id,
									  login, 
                                      address_email,
                                      phone_number,
                                      recipe_code );
									  
ALTER TABLE users ADD CONSTRAINT users_pk PRIMARY KEY ( user_id );

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
									  
CREATE TABLE order_payments(
payment_id         NUMBER 
,  transaction_id  NUMBER
,  order_id        NUMBER
,  payment_date    DATE 
,  status_payments VARCHAR2(20)
) ;

ALTER TABLE order_payments ADD CONSTRAINT order_pay_pk PRIMARY KEY (payment_id);

CREATE SEQUENCE payment_id_seq  
START WITH     1 
INCREMENT BY   1  
MAXVALUE       99999  
NOCACHE  
NOCYCLE;

ALTER TABLE invoices
    ADD CONSTRAINT invoices_payments_fk FOREIGN KEY ( transaction_id )
        REFERENCES payments ( transaction_id );

ALTER TABLE items_invoice
    ADD CONSTRAINT items_invoice_invoices_fk FOREIGN KEY ( invoice_id )
        REFERENCES invoices ( invoice_id )
            ON DELETE CASCADE;

ALTER TABLE items_invoice
    ADD CONSTRAINT items_invoice_products_fk FOREIGN KEY ( ean13 )
        REFERENCES products ( ean13 )
            ON DELETE CASCADE;
			
ALTER TABLE "ITEMS_ORDER.MAGAZINE"
    ADD CONSTRAINT "ITEMS_ORDER.M_OPERATIONS_M_FK" FOREIGN KEY ( operation_id )
        REFERENCES operations_magazine ( operation_id )
            ON DELETE CASCADE;

ALTER TABLE "ITEMS_ORDER.MAGAZINE"
    ADD CONSTRAINT "ITEMS_ORDER.M_ORDERS_FK" FOREIGN KEY ( order_id )
        REFERENCES orders ( order_id )
            ON DELETE CASCADE;

ALTER TABLE "ITEMS_ORDER.MAGAZINE"
    ADD CONSTRAINT "ITEMS_ORDER.M_PARTNERS_FK" FOREIGN KEY ( partner_id )
        REFERENCES partners ( partner_id )
            ON DELETE CASCADE;

ALTER TABLE "ITEMS_ORDER.MAGAZINE"
ADD CONSTRAINT "ITEMS_ORDER.M_PRODUCTS_FK" FOREIGN KEY ( EAN13 )
REFERENCES products ( EAN13 )
ON DELETE CASCADE;

ALTER TABLE "ITEMS_ORDER.STORE"
    ADD CONSTRAINT "ITEMS_ORDER.S_ORDERS_FK" FOREIGN KEY ( order_id )
        REFERENCES orders ( order_id )
            ON DELETE CASCADE;

ALTER TABLE "ITEMS_ORDER.STORE"
    ADD CONSTRAINT "ITEMS_ORDER.S_PRODUCTS_FK" FOREIGN KEY ( ean13 )
        REFERENCES products ( ean13 );

ALTER TABLE "ITEMS_ORDER.STORE"
    ADD CONSTRAINT "ITEMS_ORDER.S_USERS_FK" FOREIGN KEY ( user_id )
        REFERENCES users ( user_id )
            ON DELETE CASCADE;

ALTER TABLE items_reservation
    ADD CONSTRAINT items_reservation_products_fk FOREIGN KEY ( ean13 )
        REFERENCES products ( ean13 )
            ON DELETE CASCADE;

ALTER TABLE items_reservation
    ADD CONSTRAINT items_reservation_reservations_fk FOREIGN KEY ( reservation_id )
        REFERENCES reservations ( reservation_id )
            ON DELETE CASCADE;

ALTER TABLE items_reservation
    ADD CONSTRAINT items_reservation_users_fk FOREIGN KEY ( user_id )
        REFERENCES users ( user_id )
            ON DELETE CASCADE;

ALTER TABLE items_stock
    ADD CONSTRAINT items_stock_partners_fk FOREIGN KEY ( partner_id )
        REFERENCES partners ( partner_id )
            ON DELETE CASCADE;

ALTER TABLE items_stock
    ADD CONSTRAINT items_stock_stock_fk FOREIGN KEY ( sku )
        REFERENCES stock ( sku );

ALTER TABLE operations_magazine
    ADD CONSTRAINT operations_magazine_stock_fk FOREIGN KEY ( sku )
        REFERENCES stock ( sku )
            ON DELETE CASCADE;

ALTER TABLE orders
    ADD CONSTRAINT orders_deliveries_fk FOREIGN KEY ( delivery_id )
        REFERENCES deliveries ( delivery_id );

ALTER TABLE orders
    ADD CONSTRAINT orders_payments_fk FOREIGN KEY ( transaction_id )
        REFERENCES payments ( transaction_id );

ALTER TABLE products
    ADD CONSTRAINT products_product_category_fk FOREIGN KEY ( category_id )
        REFERENCES products_category ( category_id );

ALTER TABLE products
    ADD CONSTRAINT products_stock_fk FOREIGN KEY ( sku )
        REFERENCES stock ( sku );        

ALTER TABLE order_payments
    ADD CONSTRAINT order_payments_payments_fk FOREIGN KEY ( transaction_id )
        REFERENCES payments ( transaction_id )
            ON DELETE CASCADE;
            
ALTER TABLE order_payments
    ADD CONSTRAINT order_payments_orders_fk FOREIGN KEY (order_id)
        REFERENCES orders ( order_id )
            ON DELETE CASCADE;






