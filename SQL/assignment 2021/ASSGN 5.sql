USE TEST;

SELECT * FROM emp_info;
SELECT * FROM emp_sal;

--EID NAME CITY DOJ DEPT DESI SALARY OF THE DELHI EMPLOYEES--

SELECT emp_info.EMP_ID,NAME, CITY,DOJ,DEPT,DESIG,BASIC 
FROM emp_info
INNER JOIN emp_sal
ON emp_info.EMP_ID = emp_sal.EMP_ID
WHERE CITY = 'DELHI'

SELECT * FROM emp_info;
SELECT * FROM emp_sal;

SELECT EMP_INFO.EMP_ID,NAME,ADDR,CITY,PHN_NUM,EMAIL,DOB,DEPT,DESIG,DOJ
FROM emp_info
INNER JOIN emp_sal
ON emp_info.EMP_ID = emp_sal.EMP_ID
WHERE BASIC IS NULL


use INVENTORY;

select * from PRODUCT;

select * from CUST;
select * from ORDERS;

select ORDERS.OID,ODATE,CNAME,ADDRESS AS CUST_ADD, CITY AS CUST_CITY,PHONE AS CUST_PHONE,PDESC,PRICE,ODQTY,PRICE*ODQTY AS AMOUNT
FROM ORDERS
INNER JOIN CUST 
ON ORDERS.CID = CUST.CID 
INNER JOIN PRODUCT
ON PRODUCT.PID = ORDERS.PID

SELECT PRODUCT.PDESC,PRICE,ODQTY,PRICE*ODQTY AS AMOUNT
FROM ORDERS
INNER JOIN PRODUCT
ON PRODUCT.PID = ORDERS.PID;

