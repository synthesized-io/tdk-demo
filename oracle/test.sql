DECLARE
   ex_custom       EXCEPTION;
   payments_count NUMBER;
BEGIN
  SELECT COUNT(*) INTO payments_count FROM test.payment;
  IF payments_count != 16049 THEN 
    raise_application_error( -20001, 'Tables are empty' );
  END IF;
END;
/
