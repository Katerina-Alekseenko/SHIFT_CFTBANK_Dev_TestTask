-- Сформируйте отчет, который содержит все счета, относящиеся к продуктам типа ДЕПОЗИТ,
-- принадлежащих клиентам, у которых нет открытых продуктов типа КРЕДИТ.

SELECT 
    A.id,
    c.NAME AS Client_Name,
    A.name,
    A.saldo,
    A.open_date,
    A.acc_num
FROM ACCOUNTS AS A
JOIN PRODUCTS AS P ON A.PRODUCT_REF = P.ID
JOIN PRODUCT_TYPE AS PT ON P.PRODUCT_TYPE_ID = PT.ID
JOIN CLIENTS c ON p.CLIENT_REF = c.ID
WHERE PT.NAME = 'ДЕПОЗИТ'
AND A.CLIENT_REF NOT IN (
    SELECT CLIENT_REF
    FROM PRODUCTS AS P2
    JOIN PRODUCT_TYPE PT2 ON P2.PRODUCT_TYPE_ID = PT2.ID
    WHERE PT2.NAME = 'КРЕДИТ'
);
