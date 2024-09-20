-- В результате сбоя в базе данных разъехалась информация между остатками и операциями по счетам.
-- Напишите нормализацию (процедуру выравнивающую данные), которая найдет такие счета и восстановит остатки по счету.

CREATE OR REPLACE FUNCTION normalize_accounts() RETURNS VOID AS $$
DECLARE
    account_record RECORD;
    new_saldo DECIMAL(15, 2);
BEGIN
    FOR account_record IN SELECT * FROM ACCOUNTS LOOP
        SELECT COALESCE(SUM(CASE WHEN r.DT THEN r.SUM ELSE -r.SUM END), 0)
        INTO new_saldo
        FROM RECORDS r
        WHERE r.ACC_REF = account_record.ID;
    
        UPDATE ACCOUNTS
        SET SALDO = new_saldo
        WHERE ID = account_record.ID;
    END LOOP;
END;
$$ LANGUAGE plpgsql;