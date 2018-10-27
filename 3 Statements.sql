SELECT * FROM Product;


SELECT ID,  Description, ListPrice
FROM Product
WHERE id = 7;


SELECT Description, ListPrice
FROM Product
WHERE ListPrice < 55
ORDER BY Description;

SELECT Description, ListPrice, code
FROM Product
ORDER BY code;

SELECT Description, ListPrice
FROM Product
ORDER BY ListPrice;

