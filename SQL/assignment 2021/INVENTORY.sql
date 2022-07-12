CREATE DATABASE INVENTORY;

use INVENTORY;

CREATE TABLE PRODUCT(
PID CHAR(5),
PDESC VARCHAR(100),
PRICE INT,
CATEGORY VARCHAR(20),
SID CHAR(5));

ALTER TABLE PRODUCT
ALTER COLUMN PID CHAR(5) NOT NULL;

ALTER TABLE PRODUCT
ADD CONSTRAINT PKPD PRIMARY KEY (PID);

ALTER TABLE PRODUCT
ALTER COLUMN PDESC VARCHAR(100) NOT NULL;

ALTER TABLE PRODUCT
ADD CONSTRAINT CKPE CHECK (PRICE > 0);

ALTER TABLE PRODUCT
ADD CONSTRAINT CKCY CHECK (CATEGORY IN ('IT','HA','HC'));

ALTER TABLE PRODUCT
ADD CONSTRAINT FKSID FOREIGN KEY (SID) REFERENCES SUPPLIER(SID);


CREATE TABLE SUPPLIER(
SID CHAR(5),
SNAME VARCHAR(50),
SADD VARCHAR(100),
SCITY VARCHAR(20),
SPHONE char(10),
EMAIL VARCHAR(30));  

ALTER TABLE SUPPLIER
ALTER COLUMN SID CHAR(5) NOT NULL;

ALTER TABLE SUPPLIER
ADD CONSTRAINT PKSD PRIMARY KEY (SID);

ALTER TABLE SUPPLIER
ALTER COLUMN SNAME VARCHAR(50) NOT NULL;

ALTER TABLE SUPPLIER
ALTER COLUMN SADD VARCHAR(100) NOT NULL;


ALTER TABLE SUPPLIER
ADD CONSTRAINT DTCY DEFAULT 'DELHI' FOR SCITY ;

ALTER TABLE SUPPLIER
ADD CONSTRAINT UQPN UNIQUE (SPHONE);

CREATE TABLE CUST(
CID CHAR(5),
CNAME VARCHAR(30),
ADDRESS VARCHAR(50),
CITY VARCHAR(20),
PHONE CHAR(10),
EMAIL VARCHAR(30),
DOB DATE);

ALTER TABLE CUST
ALTER COLUMN CID CHAR(5) NOT NULL;

ALTER TABLE CUST
ADD CONSTRAINT PKCD PRIMARY KEY (CID);

ALTER TABLE CUST
ALTER COLUMN CNAME VARCHAR(30) NOT NULL;

ALTER TABLE CUST
ALTER COLUMN ADDRESS VARCHAR(50) NOT NULL;

ALTER TABLE CUST
ALTER COLUMN PHONE CHAR(10) NOT NULL;

ALTER TABLE CUST
ALTER COLUMN EMAIL VARCHAR(30) NOT NULL;

ALTER TABLE CUST
ALTER COLUMN CITY VARCHAR(20) NOT NULL;

ALTER TABLE CUST
ADD CONSTRAINT CHDOB CHECK (DOB < '1-JAN-2000');

CREATE TABLE ORDERS(
OID CHAR(5),
ODATE DATE,
CID CHAR(5),
PID CHAR(5),
ODQTY INT);

ALTER TABLE ORDERS
ALTER COLUMN OID CHAR(5) NOT NULL;

ALTER TABLE ORDERS
ADD CONSTRAINT PKOD PRIMARY KEY (OID);

ALTER TABLE ORDERS
ADD CONSTRAINT FKCD FOREIGN KEY (CID) REFERENCES CUST(CID);

ALTER TABLE ORDERS
ADD CONSTRAINT FKPD FOREIGN KEY (PID) REFERENCES PRODUCT(PID);

ALTER TABLE ORDERS
ADD CONSTRAINT CKOT CHECK (ODQTY >=1);


CREATE TABLE STOCK(
PID CHAR(5),
STQTY INT,
REOD_QTY INT,
MIN_ODQTY INT);

ALTER TABLE STOCK
ADD CONSTRAINT FKPI FOREIGN KEY (PID) REFERENCES PRODUCT (PID);

ALTER TABLE STOCK
ADD CONSTRAINT CKSY CHECK (STQTY>=0);

ALTER TABLE STOCK
ADD CONSTRAINT CKRY CHECK (REOD_QTY>0);

ALTER TABLE STOCK
ADD CONSTRAINT CKMY CHECK (MIN_ODQTY >=5);

SELECT *  FROM STOCK;

SELECT *  FROM ORDERS;

SELECT * FROM PRODUCT;

SELECT * FROM CUST;

SELECT * FROM SUPPLIER;