
CREATE OR REPLACE PACKAGE error_pkg
IS
    ex_too_much_items EXCEPTION;
    ex_identic_items  EXCEPTION;
    ex_wrong_date     EXCEPTION;
    ex_err_net_price  EXCEPTION;
    PRAGMA EXCEPTION_INIT(ex_too_much_items,-20001);
    PRAGMA EXCEPTION_INIT(ex_identic_items, -20002);
    PRAGMA EXCEPTION_INIT(ex_wrong_date,-20006);
    PRAGMA EXCEPTION_INIT(ex_err_net_price, -20005);
END error_pkg;
/