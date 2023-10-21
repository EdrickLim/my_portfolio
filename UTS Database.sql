-- Safe Path
BEGIN TRAN
COMMIT
ROLLBACK

--Member
CREATE TABLE PerpusCustomer(
MemberID CHAR(5) PRIMARY KEY CHECK (MemberID LIKE 'ME[0-9][0-9][0-9]') NOT NULL,
Customername VARCHAR(64) CHECK (LEN(Customername) >3) NOT NULL,
CustomerAddress VARCHAR(200) CHECK (CustomerAddress LIKE '%Jalan%') NOT NULL,
CustomerDOB DATE CHECK (YEAR(CustomerDOB) < 2007) NOT NULL,
CustomerEmail VARCHAR(64)  CHECK (CustomerEmail LIKE '%@gmail.com%')NOT NULL,
CustomerNumber VARCHAR(64) CHECK (CustomerNumber LIKE '+62%') NOT NULL
  )

-- Book
CREATE TABLE Book(
Bookcode CHAR(5) PRIMARY KEY(Bookcode) CHECK (BookCode LIKE '%[0-9][0-9][0-9]'),
Booktitle VARCHAR(64) CHECK (LEN(Booktitle) > 6) NOT NULL,
   )

-- TransactionHeader 
 CREATE TABLE TabelHeader (
TransactionID CHAR(5) Primary key CHECK (TransactionID LIKE 'TR[0-9][0-9][0-9][0-9]') NOT NULL,
Borroweddate DATE CHECK (DATENAME(WEEKDAY, Borroweddate) NOT LIKE 'Sunday') NOT NULL,
Borrowedduration INT CHECK (Borrowedduration >= 3) NOT NULL,
Returndate DATE CHECK(DATENAME(WEEKDAY, Returndate) NOT LIKE 'Sunday') NOT NULL,
Quantity INT CHECK (Quantity >3) NOT NULL,
MemberID CHAR(5) CHECK (MemberID LIKE 'ME[0-9][0-9][0-9]') NOT NULL , 
Foreign key(MemberID) REFERENCES PerpusCustomer(MemberID)
  )

--TransactionDetail
 CREATE TABLE Detail(
TransactionID CHAR(5) PRIMARY KEY check (TransactionID LIKE 'TR[0-9][0-9][0-9][0-9]') NOT NULL,
BookCode CHAR(5) CHECK(BookCode LIKE '%[0-9][0-9][0-9]') NOT NULL,
FOREIGN KEY(BookCode) REFERENCES Book(Bookcode),   
)
--a
INSERT INTO Perpuscustomer
VALUES ('ME001', 'Alexandra Westin', 'Tangerang Jalan 123', '2002-02-21', 'edricklim6@gmail.com', '+62866666')
--b
UPDATE Perpuscustomer 
SET CustomerName = 'Alexandra Westina'
WHERE CustomerName LIKE 'Alexandra Westin'
--c  
SELECT * FROM PerpusCustomer WHERE CustomerName LIKE 'A%'