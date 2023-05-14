
DROP TRIGGER  create_new_lp_reservation_trg;
CREATE OR REPLACE TRIGGER create_new_lp_reservation_trg
BEFORE INSERT OR UPDATE ON items_reservation
FOR EACH ROW
DECLARE
    v_new_lp  NUMBER;
BEGIN
     SELECT NVL((MAX(reserved_item_id)+1),1) 
     INTO  v_new_lp
     FROM items_reservation
     WHERE  reservation_id = :NEW.reservation_id;
     
     :NEW.reserved_item_id := v_new_lp;
     
 END create_new_lp_reservation_trg;








   

    