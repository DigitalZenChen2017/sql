-- create and select database
DROP DATABASE IF EXISTS prs;
CREATE DATABASE prs;
USE prs;

-- create user table 
CREATE TABLE user (
ID								INT 						NOT NULL			PRIMARY KEY	AUTO_INCREMENT,
UserName					VARCHAR(20)	NOT NULL			UNIQUE,
Password					VARCHAR(10)	NOT NULL,			
FirstName					VARCHAR(20)	NOT NULL,
LastName					VARCHAR(20)	NOT NULL,
PhoneNumber				VARCHAR(12)	NOT NULL,
Email							VARCHAR(75)	NOT NULL,
IsReviewer					TINYINT(1)			NOT NULL,
IsAdmin						TINYINT(1)			NOT NULL,
IsActive						TINYINT(1)			NOT NULL default 1,
DateCreated				DATETIME			NOT NULL default current_timestamp,
DateUpdated				DATETIME			NOT NULL default current_timestamp on update current_timestamp,
UpdatedByUser			INT						NOT NULL default 1
);

-- create vendor table
CREATE TABLE vendor (
ID								INT						NOT NULL 			PRIMARY KEY	AUTO_INCREMENT,
Code							VARCHAR(10)	NOT NULL,			
Name							VARCHAR(255)	NOT NULL			UNIQUE,
Address						VARCHAR(255)	NOT NULL,
City								VARCHAR(255)	NOT NULL,
State							VARCHAR(2)		NOT NULL,
Zip								VARCHAR(5)		NOT NULL,
PhoneNumber				VARCHAR(12)	NOT NULL,
Email							VARCHAR(50)	NOT NULL,
IsPreApproved			TINYINT(1)			NOT NULL,
IsActive						TINYINT(1)			NOT NULL default 1,
DateCreated				DATETIME			NOT NULL default current_timestamp,
DateUpdated				DATETIME			NOT NULL default current_timestamp on update current_timestamp,
UpdatedByUser			INT						NOT NULL default 1
);

-- create purchaserequest table
CREATE TABLE purchaserequest (
ID								INT 						NOT NULL			PRIMARY KEY	AUTO_INCREMENT,
UserID							INT						NOT NULL,
Description					VARCHAR(100)	NOT NULL,
Justification					VARCHAR(255)	NOT NULL,
DateNeeded				DATE					NOT NULL,
DeliveryMode				VARCHAR(25)	NOT NULL,
Status							VARCHAR(20)	NOT NULL default 'New',
Total							DECIMAL(10,2)	NOT NULL,
SubmittedDate			DATETIME,			
ReasonForRejection	VARCHAR(100),
IsActive						TINYINT(1)			NOT NULL default 1,
DateCreated				DATETIME			NOT NULL default current_timestamp,
DateUpdated				DATETIME			NOT NULL default current_timestamp on update current_timestamp,
UpdatedByUser			INT						NOT NULL default 1,
FOREIGN KEY (UserID) REFERENCES user(ID)			
);

-- create product table
CREATE TABLE product (
ID								INT 						NOT NULL			PRIMARY KEY	AUTO_INCREMENT,
VendorID						INT						NOT NULL,
PartNumber					VARCHAR(50)	NOT NULL,
Name							VARCHAR(150)	NOT NULL,
Price							INT						NOT NULL,
Unit								DECIMAL(10,2),
PhotoPath					VARCHAR(255),
IsActive						TINYINT(1)			NOT NULL default 1,
DateCreated				DATETIME			NOT NULL default current_timestamp,
DateUpdated				DATETIME			NOT NULL default current_timestamp on update current_timestamp,
UpdatedByUser			INT						NOT NULL default 1,
FOREIGN KEY (VendorID) REFERENCES vendor(ID),
CONSTRAINT vendor_part UNIQUE (VendorID, PartNumber)
);

-- create purchaserequestlineitem table
CREATE TABLE purchaserequestlineitem (
ID								INT 						NOT NULL			PRIMARY KEY	AUTO_INCREMENT,
PurchaseRequestID	INT						NOT NULL,
ProductID					INT						NOT NULL,
Quantity					 VARCHAR(255)		NOT NULL,
IsActive						TINYINT(1)			NOT NULL default 1,
DateCreated				DATETIME			NOT NULL default current_timestamp,
DateUpdated				DATETIME			NOT NULL default current_timestamp on update current_timestamp,
UpdatedByUser			INT						NOT NULL default 1,
FOREIGN KEY (PurchaseRequestID) REFERENCES purchaserequest(ID),
FOREIGN KEY (ProductID) REFERENCES product(ID),	
CONSTRAINT req_pdt UNIQUE (PurchaseRequestID, ProductID)	
);

/* We added 2 Combined Unique Constraints for product (VendorID, PartNumber) named vendor_part and 
for purchaserequestlineitem named rep_pdt(PurchaseRequestID, ProductID) */

/*INSERT INTO tbl_name
    (a,b,c)
VALUES
    (1,2,3),
    (4,5,6),
    (7,8,9);
*/

-- insert Rows into user table
INSERT INTO user 
	(ID, UserName, Password, FirstName, LastName, PhoneNumber, Email, IsReviewer, IsAdmin, UpdatedByUser)
VALUES
(1, 'SYSTEM', 'admin', 'System', 'System', 'XXX-XXX-XXXX', 'system@test.com', 0, 0, 0),
(2, 'bchen', 'dba', 'Boris', 'Chen', '513-290-9828', 'bchen@test.com', 1, 1, 1),
(3, 'asmith', 'adminasst', 'Amanda', 'Smith', '123-456-7890', 'amandasmith@test.com', 0, 0, 1),
(4, 'jsokol', 'compliance', 'Jennifer', 'Sokol', '987-654-3210', 'jsokol@test.com', 0, 0, 1),
(5, 'isaacwinklevoss', 'fsdevplr', 'Isaac', 'Winklevoss', 'XXX-XXX-XXXX', 'isaacwinklevoss@test.com', 0, 0, 1);

-- insert Rows into vendor table
INSERT INTO vendor 
	(ID, Code, Name, Address, City, State, Zip, PhoneNumber, Email, IsPreApproved)
VALUES
(1, 'DE-0001', 'Dell', 'One Dell Way', 'Round Rock', 'TX', '78682', '888-560-8324', 'Tracey_selberg@dell.com', 0),
(2, 'NI-0001', 'Nike', '1Bowerman Dr.', 'Beaverton', 'OR', '97005', '503-671-6453', 'NA.VENDORREGISTRATION@NIKE.COM', 0),
(3, 'ST-0001', 'Staples', '9550 Mason Montgomery Rd', 'Mason', 'OH', '45040', '513-754-0235', 'support@orders.staples.com', 1),
(4, 'MI-0001', 'Microsoft', 'One Microsoft Way', 'Redmond', 'WA', '98052','800-426-9400', 'contact@microsoft.com', 1),
(5, 'AS-0001', 'ASUS', '800 Corporate Way', 'Fremont', 'CA', '94539', '510-739-3777', 'support@asus.com', 0);   

-- insert some rows into the Product table
INSERT INTO product 
	(ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath)
VALUES
(1,1,'A6201395','Dell Latitude 3490 Laptop', 449.00,NULL,NULL),
(2,1,'A6969561','Logitech M510', 29.99, NULL,NULL),
(3,2,'NI233290','Nike Mens Dark Grey Tech Sport Dri-FIT S/S Polo', 39.99,NULL,NULL),
(4,2,'ME280LL','iPad Mini 2', 296.99,NULL,NULL),
(5,3,'ST349013','Staples One-Touch™ Plus Desktop Flat Stack Full Strip Stapler, 30-Sheet Capacity, Black', 16.19,NULL,NULL),
(6,3,'ST609710','Zebra Pen Z-Grip Retractable Ballpoint Pen, 1.0mm Medium Point, Black 24pk', 13.29,NULL,NULL),
(7,4,'MI699676','Surface Pro 6 - 128GB / Intel Core i5 / 8GB RAM (Platinum)', 899.99,NULL,NULL),
(8,5,'PA111204','ASUS ProArt PA27AC HDR Professional Monitor', 649.99,NULL,NULL);

-- create User email
ALTER TABLE user
ADD UNIQUE (Email);

-- create a user and grant privileges to that user
/* GRANT SELECT, INSERT, DELETE, UPDATE
ON prs.*
TO prs_user@localhost
IDENTIFIED BY 'sesame';
*/

CREATE USER prs_user@localhost IDENTIFIED BY 'default123';
GRANT SELECT, INSERT, DELETE, UPDATE ON prs.* TO prs_user@localhost;