--kompilacja programów z pakietu
DECLARE
   v_id_res 	NUMBER;
   v_id_inv 	VARCHAR2(20);
BEGIN
   -- user_reservation_pkg.p_create_reservation (v_id_res);
    user_reservation_pkg.p_add_item_reservation ( in_id_reservation => 'wpisz numer rezerwacji typu number'
                                                , in_user_id => 'wpisz id użyt typu number'      
                                                , in_ean13 => 'wpisz kod produktu typu number'        
                                                , in_qnty => 'wpisz ilość zarezerwowanego produktu typu number');  
                                                
    user_reservation_pkg.p_get_list_reservations_interval(in_start_date => to_date('wpisz date','DD.MM.YYYY')
                                                        ,in_end_date =>  to_date('wpisz date','DD.MM.YYYY'));     
	stock_pkg.p_add_new_sku_list (in_sku   =>'Wpisz nr SKU'
                                  ,in_short_product_name =?'Wpisz skróconą nazwę_towaru'
                                  ,in_quantity =>'Wpisz_ilości');	
								  
	invoices_pkg.p_create_number_invoice (v_id_inv);
	product_manager_pkg.p_get_list_product_refund;
END;