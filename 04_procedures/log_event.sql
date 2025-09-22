CREATE OR REPLACE PROCEDURE log_event
                            (
                            p_log_type    IN system_logs.log_type%TYPE,
                            p_log_details IN system_logs.log_details%TYPE,
                            p_user_id     IN system_logs.user_id%TYPE DEFAULT NULL,
                            p_product_id  IN system_logs.product_id%TYPE DEFAULT NULL,
                            p_order_id    IN system_logs.order_id%TYPE DEFAULT NULL
                            )
AS
   PRAGMA AUTONOMOUS_TRANSACTION; -- Ustawienie procedury jako autonomicznej

BEGIN

    INSERT INTO system_logs (log_type, log_details, user_id, product_id, order_id) 
    VALUES (p_log_type, p_log_details, p_user_id, p_product_id, p_order_id);
    COMMIT;
    
EXCEPTION
    WHEN OTHERS THEN
        RAISE; 
END log_event;
/
        
/*
 -- środowisko wywołujące                  
BEGIN
log_event
            (
            p_log_type      => 'ERROR',
            p_log_details   => 'Podana nieprawidlowa cena produktu',
            --p_user_id       =>
            p_product_id    => 521
            --p_order_id      =>
            );

END;
/*

