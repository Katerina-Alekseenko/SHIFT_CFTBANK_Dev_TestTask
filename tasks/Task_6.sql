-- Сформируйте выборку, в который попадут клиенты, у которых были операции по счетам 
-- за прошедший месяц от текущей даты. Выведите клиента и сумму операций за день в разрезе даты.

SELECT 
    c.NAME AS client_name,
    r.OPER_DATE AS operation_date,
    SUM(r.SUM) AS total_operations_amount
FROM RECORDS r
JOIN ACCOUNTS a ON r.ACC_REF = a.ID
JOIN CLIENTS c ON a.CLIENT_REF = c.ID
WHERE r.OPER_DATE >= CURRENT_DATE - INTERVAL '1 month'
GROUP BY c.NAME, r.OPER_DATE
ORDER BY c.NAME, r.OPER_DATE;