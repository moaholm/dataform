SELECT
    products.stockItemID AS productID,

WITH Step1 AS(
    SELECT
    products.stockItemID AS productID,
    category.stockGroupID AS categoryID,
    category.stockGroupName AS categoryName
    
FROM `data-evolution-moa.raw_wwi.stockGroups` AS category
INNER JOIN `data-evolution-moa.raw_wwi.stockItemStockGroup` AS products 
ON category.stockGroupID = products.stockGroupID
)
    SELECT
    s1.stockItemID AS productID,
    productInformation.stockItemName,
    productInformation.unitPrice,
    productInformation.recommendedRetailPrice,
    s1.stockGroupID AS categoryID,
    s1.stockGroupName AS categoryName
FROM `data-evolution-moa.raw_wwi.stockItem` AS productInformation
INNER JOIN Step1 AS s1
ON s1.productID = productInformation.stockItemID