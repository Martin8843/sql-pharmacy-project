
CREATE OR REPLACE PACKAGE invoices_pkg
IS
	  PROCEDURE p_create_number_invoice (p_out_new_id OUT VARCHAR2;
	  
END invoices_pkg;
/


CREATE OR REPLACE PACKAGE BODY invoices_pkg
IS

    PROCEDURE p_create_number_invoice (p_out_new_id OUT VARCHAR2)
    IS
        v_number_invoice    VARCHAR2(20);
    BEGIN
        SELECT 'FV'||('/')||invoices_seq.nextval||('/')|| + to_char(sysdate,'MM/YYYY')
        INTO v_number_invoice
        FROM DUAL;

        INSERT INTO invoices (invoice_id) VALUES (v_number_invoice)
        RETURNING invoice_id
        INTO p_out_new_id;
END p_create_number_invoice;

END invoices_pkg;