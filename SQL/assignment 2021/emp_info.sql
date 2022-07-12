
create database Test;

use Test;

		--- ASSIGNMENT 3 ---


create table emp_info
( EMP_ID char(5),
NAME Varchar(30),
ADDR VARCHAR(30),
CITY VARCHAR(30),
PHN_NUM CHAR(10),
EMAIL varchar(30),
DOB DATE);

INSERT INTO emp_info(EMP_ID,NAME,ADDR,CITY,PHN_NUM,EMAIL,DOB)
values('E0001','KAPIL YADAV','GANDHI NAGAR','NOIDA','9811145231','kapilyadav@gmail.com','19-JAN-1987');

INSERT INTO emp_info(EMP_ID,NAME,ADDR,CITY,PHN_NUM,EMAIL,DOB)
values('E0002','KUMAR GUPTA','No.13 SASNATH NAGAR ','DELHI','9966145266','gupta45@yahoo.co.in','10-DEC-1986');

INSERt into emp_info
values('E0003','VINAY SHARMA','HNO-24 SECTOR 1','FARIDABAD','9541189023','vinaysharma@gmail.com','28-FEB-1985');

INSERt into emp_info
values('E0004','GOKUL KUMAR','HNO-19 VIDYA COLONY','GURUGRAM','9542268023','gokulkumar25@gmail.com','13-AUG-1987');

INSERt into emp_info
values('E0005','sanjay DUTTA','16 BLOCK B','NOIDA','6379919022','sanjaydutta33@gmail.com','08-JUL-1983');

insert into emp_info
values('E0006','Bala kumar','sector 22','DELHI','9213399012', 'balakumar@yahoo.co.in','01-SEP-1990'); 

INSERT INTO emp_info(EMP_ID,NAME,ADDR,CITY,PHN_NUM,EMAIL,DOB)
values('E0007','vinay singh','190 sector 8','faridabad','9512245837','vinaysingh@gmail.com','10-AUG-1989');


insert into emp_info
values('E0008','Venkat Reddy','sector 173','NOIDA','9444399011', 'vkreddy@yahoo.co.in','20-MAR-1994');

insert into emp_info
values('E0009','REEGEN KOSHY','BLOCK 22','DELHI','6331355014', 'KOSHYREEG@GMAIL.COM','11-DEC-1989');


insert into emp_info
values('E0010','HARI PRASAD','HNO 138-B','GURUGRAM','9811563027', 'HARIPRASAD22@GMAIL.COM','29-NOV-1978');   


insert into emp_info
values('E0011','ANJANI DEVI','HNO 11','FARIDABAD','9992214235', 'ANJANI19@yahoo.co.in','14-SEP-1990'); 


insert into emp_info
values('E0012','BHASKAR REDDY','BLOCK C','NOIDA','9702521189', 'Bkreddy32@gmail.com','17-jan-1988'); 




Select * from emp_info


--MAKING EMP_ID AS PRIMARY KEY--

ALTER Table emp_info
ALTER COLUMN EMP_ID CHAR(5) NOT NULL;

ALTER TABLE emp_info
Add constraint  PKID primary key (EMP_ID);

-- MAKING NAME AS NOT NULL--

ALTER TABLE emp_info
ALTER COLUMN NAME VARCHAR(30) NOT NULL;


-- CREATING ADDR NOT FROM UTTAMNAGAR-- 
ALTER  TABLE emp_info
ADD CONSTRAINT CKAD CHECK (ADDR not like '% UTTAM NAGAR %'); 

-- DROPING CONSTRAINTS

ALTER TABLE emp_info
Drop constraint CKAD; 

-- CHECK CITY FROM PARTICULAR --

ALTER TABLE emp_info
ADD CONSTRAINT CKCY CHECK (CITY in ('DELHI', 'NOIDA', 'FARIDABAD' , 'GURUGRAM'));

ALTER TABLE emp_info
ADD CONSTRAINT UKPN UNIQUE (PHN_NUM);


alter table emp_info
add constraint CKEM check (EMAIL like ('%@gmail.com') or EMAIL like ('%@yahoo.com')or EMAil like ('%@yahoo.co.in'));

--ALTER TABLE emp_info
--ADD CONSTRAINT CKEM CHECK (EMAIL like ('% @gmail.com'));

ALter table emp_info
drop constraint CKEM;

--ALTER TABLE emp_info
--ADd constraint CKED check (EMAIL like '% @yahoo.com');

--ALTER TABLE emp_info
--ADd constraint CKEL check (EMAIL like '% @yahoo.co.in');

delete emp_info;

Alter table emp_info
ADD constraint CKDB CHECK (DOB <='01-JAN-1990');

use Test;

create TABLE emp_sal
(EMP_ID CHAR(5), 
DEPT VARCHAR(10),
DESIG VARCHAR(10),
BASIC INT,
DOJ DATE);

alter table emp_sal
add constraint FKEI foreign key (EMP_ID) references emp_info (EMP_ID);

alter table emp_sal
drop constraint FKEI;

alter table emp_sal
ADD CONSTRAINT CKDT CHECK (DEPT IN ('HR','MIS','OPS','IT','ADMIN','TEMP'));


insert into emp_sal(EMP_ID,DEPT,DESIG,BASIC,DOJ)
values('E0001','HR', 'VP',480000,'19 JAN 1998');

insert into emp_sal(EMP_ID,DESIG,BASIC,DOJ)
values('E0002','ASSO',180000,'19 JUL 2001');


ALTER TABLE emp_sal
add CONSTRAINT DTDT DEFAULT 'TEMP' FOR DEPT;

ALTER TABLE   emp_sal
ADD CONSTRAINT CKDN CHECK (DESIG IN ('ASSO','VP','MGR','DIR'));

ALTER TABLE emp_sal
ADD CONSTRAINT CKBC CHECK (BASIC >= 20000);

insert into emp_sal(EMP_ID,DEPT,DESIG,BASIC,DOJ)
values('E0003','IT', 'DIR',780000,'21 OCT 1988');

insert into emp_sal
values('E0004','OPS', 'MGR',545000,'15 MAY 1991');

insert into emp_sal(EMP_ID,DESIG,BASIC,DOJ)
values('E0005', 'ASSO',115000,'22 FEB 1999');

insert into emp_sal
values('E0006','HR','ASSO',118000,'11-FEB-1993');

insert into emp_sal
values('E0007','IT','MGR',425000,'01-MAY-1982');

insert into emp_sal
values('E0008','OPS','VP',628000,'29-JUL-1975');

insert into emp_sal(EMP_ID,DESIG,BASIC,DOJ)
values('E0009','ASSO',123000,'10-JUN-1991');

insert into emp_sal
values('E0010','OPS','DIR',848000,'05-FEB-1980');

INSERT INTO EMP_SAL(EMP_ID,DEPT, DESIG,DOJ)
VALUES('E0010', 'IT','MGR','10-MAR-1987');

select * from emp_info;
select * from emp_sal;

-- delete emp_sal;

select emp_info.EMP_ID,NAME,CITY,DEPT,DESIG
FROM emp_info
INNER JOIN emp_sal
ON emp_info.EMP_ID = emp_sal.EMP_ID


						---ASSIGNMENT 4 -------

--CITY WISE COUNT OF EMP ARRANGED IN DESCENDING ORDER --

SELECT  city,COUNT('CITY') as 'NUM' FROM emp_info
GROUP BY CITY
order by  NUM desc


SELECT * FROM emp_info
ORDER BY CITy desc;

-- DETAILS OF EMP WHO DOES NOT HAVE ACCOUNT OF YAHOO DOMAIN-- 

SELECT * FROM emp_info
WHERE EMAIL NOT LIKE '%YAHOO%';


SELECT * FROM emp_info

--  DESIGNATION WISE TOTAL COST and NO.of EMP arranged in Descending order --

select DESIG, sum(basic) as 'Total cost', count(desig) as 'Num_of_emp' from emp_sal
group by DESIG
order by Num_of_emp desc;