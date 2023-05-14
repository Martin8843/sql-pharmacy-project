DROP TRIGGER ai_item_reservation_status_trg;
CREATE OR REPLACE TRIGGER ai_item_reservation_status_trg
FOR INSERT ON items_reservation
COMPOUND TRIGGER
	v_status                NUMBER; 
	v_max_lp_reservation    items_reservation.reservation_id%TYPE;
	v_add_ean13             products.ean13%TYPE;
	v_qnty_available        stock.quantity%TYPE;
	v_add_qnty              stock.quantity%TYPE;
--po insercie do tabeli wykonaj polecenie raz dla kazego rekodru którego dotyczy insert
AFTER EACH ROW 
IS
BEGIN
        v_max_lp_reservation :=:NEW.reservation_id;
        v_add_ean13 := :NEW.ean13;
        v_add_qnty := :NEW.qnty_reserved;
END AFTER EACH ROW;

--po insercie do tabeli wykonaj poniższe instrukcje DML raz dla danej operacji
AFTER STATEMENT  
IS
BEGIN
--wybierz do zmiennej stany dla dodawanego produktu
        SELECT s.quantity
        INTO v_qnty_available
        FROM stock s
        JOIN products p
        ON s.sku=p.sku
        WHERE p.ean13 = v_add_ean13;
 --wybierz do zmiennej ilośc produktu w podanym statusie 
        SELECT COUNT(p.availability)
        INTO v_status
        FROM items_reservation ir
        JOIN products p
        ON ir.ean13=p.ean13
        WHERE ir.reservation_id = v_max_lp_reservation
        AND p.availability = 'Dostępny na zamówienie';
  -- sprawdzaj jesli status 'Dostępny na zamówienie' w zestawie pozycji       
    IF  (v_status>=1 AND  v_qnty_available=0) THEN
        UPDATE reservations 
        SET status_reservation = 'Tylko na zamówienie'
        WHERE reservation_id = v_max_lp_reservation;
        RAISE_APPLICATION_ERROR(-20998, 'Brak towaru');
		
     -- sprawdzaj jesli status Każdy inny dostępny w zestawie pozycji i ilość produktu mniejsza lub równa  
	-- stanom mag	
    ELSIF  (v_status=0 AND v_add_qnty <=v_qnty_available) THEN
        UPDATE reservations 
        SET status_reservation = 'Do odebrania w aptece'
        WHERE reservation_id = v_max_lp_reservation;
     -- w przeciwnym razie wybij alart dla uzytkownika   
    ELSIF v_add_qnty >v_qnty_available THEN
        RAISE_APPLICATION_ERROR(-20999, 'Brak wystarczającej ilości do rezerwacji. Aktualna dostępna ilość wynosi: '||v_qnty_available);
    END IF; 
END AFTER STATEMENT;
END ai_item_reservation_status_trg;