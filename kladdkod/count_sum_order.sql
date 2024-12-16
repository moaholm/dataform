SELECT invoiceID, 
SUM ( CAST(quantity AS decimal) * CAST(unitPrice AS decimal)) AS total_sum
FROM `data-evolution-moa.raw_wwi.invoiceLines` 
GROUP BY invoiceID
LIMIT 50

/* 
Ger en tabell med invoiceIDs och dess totala beställningssumma
*/

WITH orderSum AS (
    SELECT invoiceID, 
    SUM ( CAST(quantity AS decimal) * CAST(unitPrice AS decimal)) AS total_sum
    FROM `data-evolution-moa.raw_wwi.invoiceLines` 
    GROUP BY invoiceID
),

/*
Vi behöver göra en join här någon stans...
*/
SELECT
    invoiceID,
    customerID,
    invoiceDate,
    orderSum.total_sum
