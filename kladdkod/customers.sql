SELECT 
  customerID, 
  customerName, 
  phoneNumber, 
  deliveryAddressLine1, 
  deliveryAddressLine2, 
  deliveryPostalCode, 
REGEXP_EXTRACT(customerName, r'\(([^)]+)\)') AS city
FROM `data-evolution-moa.raw_wwi.customers` 
WHERE CAST(customerID AS INT64) > 500
LIMIT 50