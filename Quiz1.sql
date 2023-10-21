--1
BEGIN TRAN
CREATE TABLE MsBranch (
BranchID CHAR (5) PRIMARY KEY CHECK (BranchID LIKE 'BR[0-9][0-9][0-9]') NOT NULL,
BranchName VARCHAR (100) NOT NULL,
BranchAddress VARCHAR (100) CHECK (BranchAddress LIKE '%Street%') NOT NULL,
)
COMMIT
--2
BEGIN TRAN
SELECT * FROM MsCustomer
ALTER TABLE MsCustomer
ADD CustomerEmail VARCHAR (50)

ALTER TABLE MsCustomer
ADD CONSTRAINT PK_MsCustom CHECK (CustomerEmail LIKE '%@gmail.com%' or Customeremail LIKE '%@yahoo.com%')
COMMIT

--3
BEGIN TRAN
SELECT * FROM MsStaff
INSERT INTO MsStaff
VALUES ('ST011', 'Felix', '1999-8-18', '+6282283788387', 'Male', '10000000')
COMMIT

--4
SELECT [ProductName] = UPPER(ProductName), ProductPrice FROM MsProduct
WHERE ProductPrice > 150000

--5
BEGIN TRAN
SELECT * FROM MsProduct
DELETE [MsProduct]
FROM MsProduct JOIN MsVariant
ON MsProduct.VariantID = MsVariant.VariantID
WHERE VariantName LIKE 'hydrating'


