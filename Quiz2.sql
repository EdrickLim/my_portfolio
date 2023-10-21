--1
CREATE VIEW ProductView
AS
SELECT	ProductID,
		ProductName,
		ProductPrice
FROM MsProduct
WHERE ProductPrice BETWEEN 100000  AND 120000

--2
SELECT	CustomerName,
		CustomerGender,
		CustomerPhone
FROM MsCustomer
WHERE CustomerID IN(
	SELECT CustomerID
	FROM TransactionHeader
	WHERE DATENAME(MONTH,TransactionDate) = 'July'
)

--3
SELECT	mc.CustomerID,
		CustomerName,
		CustomerGender,
		[PurchaseYear] = YEAR(TransactionDate),
		[PurchaseCount] = COUNT(TransactionID)
FROM MsCustomer mc JOIN TransactionHeader th ON mc.CustomerID = th.CustomerID
WHERE mc.CustomerID LIKE 'CU001'
GROUP BY mc.CustomerID, CustomerName, CustomerGender, TransactionDate
UNION
SELECT	mc.CustomerID,
		CustomerName,
		CustomerGender,
		[PurchaseYear] = YEAR(TransactionDate),
		[PurchaseCount] = COUNT(TransactionID)
FROM MsCustomer mc JOIN TransactionHeader th ON mc.CustomerID = th.CustomerID
WHERE mc.CustomerID LIKE 'CU002'
GROUP BY mc.CustomerID, CustomerName, CustomerGender, TransactionDate

--4
SELECT	StaffName,
		StaffGender,
		[TransactionDate] = CONVERT(VARCHAR, TransactionDate, 103),
		[Total Product Sold] = SUM(Quantity)
FROM MsStaff ms JOIN TransactionHeader th  ON ms.StaffID = th.StaffID
JOIN TransactionDetail td ON td.TransactionID = th.TransactionID
WHERE StaffGender = 'Female' AND DATENAME(WEEKDAY, TransactionDate) = 'Tuesday'
GROUP BY StaffName, StaffGender, TransactionDate

--5
SELECT DISTINCT	[ProductID] = 'VOkin' + RIGHT(mp.ProductID, 3),
				ProductName,
				ProductPrice,
				VariantName
FROM MsProduct mp JOIN TransactionDetail td ON mp.ProductID = td.ProductID
JOIN MsVariant mv ON mp.VariantID = mp.VariantID,
	( SELECT AVG(ProductPrice) AS Average
	 FROM MsProduct
	 ) AS X
	WHERE mp.ProductPrice < x.Average AND VariantName LIKE 'Calming'


