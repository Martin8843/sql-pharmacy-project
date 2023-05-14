--DROP SEQUENCE reservation_id_seq; 
CREATE SEQUENCE reservation_id_seq  
START WITH     10000000  
INCREMENT BY   10  
MAXVALUE       99999999  
NOCACHE          ----bez buforowania danych 
NOCYCLE;


CREATE SEQUENCE payment_id_seq  
START WITH     1 
INCREMENT BY   1  
MAXVALUE       99999  
NOCACHE  
NOCYCLE;


CREATE SEQUENCE partners_seq  
START WITH     1  
INCREMENT BY   1  
MAXVALUE       9  
NOCACHE           ----bez buforowania danych 
NOCYCLE;
 
 
CREATE SEQUENCE order_id_seq  
START WITH     12000000  
INCREMENT BY   10  
MAXVALUE       99999999  
NOCACHE  --bez buforowania danych 
NOCYCLE;       


CREATE SEQUENCE items_stock_seq  
START WITH     1  
INCREMENT BY   1  
MAXVALUE       9999  
NOCACHE  
NOCYCLE;


CREATE SEQUENCE invoices_seq  
START WITH     1  
INCREMENT BY   1  
MAXVALUE       9999  
NOCACHE  
NOCYCLE;

