-- Сформируйте выборку, который содержит средние движения по счетам в рамках 
-- одного произвольного дня, в разрезе типа продукта.

SELECT 
    pt.NAME AS product_type,
    ROUND(AVG(r.SUM), 2) AS average_movement
FROM RECORDS r
JOIN ACCOUNTS a ON r.ACC_REF = a.ID
JOIN PRODUCTS p ON a.PRODUCT_REF = p.ID
JOIN PRODUCT_TYPE pt ON p.PRODUCT_TYPE_ID = pt.ID
WHERE r.OPER_DATE = TO_DATE('01.10.2020', 'DD.MM.YYYY')
GROUP BY pt.NAME;