DROP TRIGGER u_qnty_stock_trg;
CREATE OR REPLACE TRIGGER u_qnty_stock_trg
AFTER UPDATE OF quantity ON stock 
FOR EACH ROW
DECLARE
BEGIN
    UPDATE products 
    SET availability = 
       CASE 
         WHEN :NEW.quantity=0 THEN 'Dostępny na zamówienie'
         WHEN :NEW.quantity<=100 THEN 'Na wyczerpaniu'
         WHEN :NEW.quantity BETWEEN 100 AND 300 THEN 'Średnia ilość'
         WHEN :NEW.quantity>= 300 THEN 'Duża ilość'
       END
    WHERE sku =:NEW.sku; -- określa które wiesze w tabeli zostaną zmienieone.
END u_qnty_stock_trg;
/