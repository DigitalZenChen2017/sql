-- create and select the database
DROP DATABASE IF EXISTS bank_db;
CREATE DATABASE bank_db;
USE bank_db;

-- create the Accounts table
CREATE TABLE accounts (
ID					INT 						NOT NULL			PRIMARY KEY	AUTO_INCREMENT,
AccountHolder VARCHAR(30)    NOT NULL			UNIQUE,
Balance 			DECIMAL(10, 2)  NOT NULL,
Fees				DECIMAL(10, 2)  NOT NULL
);

-- create Transactions table
CREATE TABLE transactions (
ID				INT	 						NOT NULL			PRIMARY KEY  AUTO_INCREMENT,
Amount		INT							NOT NULL,
Txn_Type	VARCHAR(10)		NOT NULL,
Account_ID	INT							NOT NULL,
FOREIGN KEY (Account_ID) 	REFERENCES accounts (ID)
);

-- insert some rows into the Accounts table
INSERT INTO accounts VALUES
(1, 'Gary Henderson', '8888.00', '250.00'),
(2, 'Meagean Hansen', '5444.00', '175.00'),
(3, 'Nick Law', '3333.00', '88.00'),
(4, 'Yelena Lapina', '3322.00', '88.00');

-- insert some test data for invoice and line item, based on products above
INSERT INTO transactions VALUES
(1, '500.00','Deposit', 3),
(2,'-200.00' ,'Withdrawal', 4),
(3, '200.00','Deposit', 4),
(4, '248.00','Deposit', 1);