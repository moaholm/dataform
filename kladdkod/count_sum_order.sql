SELECT
    invoices.customerID,
    invoices.invoiceID,
    SUM(CAST(invoiceLines.quantity AS FLOAT64) * CAST(invoiceLines.unitPrice AS FLOAT64)) AS total_sum,
    invoices.invoiceDate,
  FROM `data-evolution-moa.raw_wwi.invoices` AS invoices
  INNER JOIN `data-evolution-moa.raw_wwi.invoiceLines` AS invoiceLines ON invoices.invoiceID = invoiceLines.invoiceID
  GROUP BY 1, 2, 4
  LIMIT 100;