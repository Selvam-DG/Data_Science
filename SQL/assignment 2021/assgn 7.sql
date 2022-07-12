use test;


				---ASSIGN 1 ---

--CREATE A FUNCTION CALC TO PERFORM THE SPECIFIED OPERATION ON THE GIVEN TWO NUMBERS .--

create function calc (@a as int, @b as int, @c as varchar(1))
returns int
as 
begin
	declare @r as int;

	if @c = '+'
		set @r = @a + @b;
	if @c = '-'
		set @r = @a - @b;
	if @c = '*'
		set @r = @a * @b;
	if @c = '/'
		set @r = @a / @b;
	if @c = '%'
		set @r = @a % @b;
	


	return @r
end;

select dbo.calc(12,3,'/');

drop function calc;

select * from emp_info;
select * from emp_sal;


				---ASSIGN 2 ---



select name,left(name,CHARINDEX(' ',name)) as 'FN'from emp_info;


SELECT LEFT(NAME,1) FROM emp_info;


SELECT SUBSTRING(NAME,(CHARINDEX(' ',NAME)+1),1) FROM emp_info;

SELECT * FROM emp_info

CREATE FUNCTION CORP_MAIL(@X AS VARCHAR(50),@Y AS VARCHAR(5))
RETURNS VARCHAR(50)
AS
BEGIN

	DECLARE @A AS INT
	DECLARE @B AS VARCHAR(2)
	DECLARE @C AS VARCHAR(50)
	 
	SET @A = CHARINDEX(' ',@X);

	SET @B = SUBSTRING(@X,@A+1,1);

	SET @C = CONCAT(LEFT(@X,1),@B ,RIGHT(@Y,3),'@GMAIL.COM');
	

	RETURN @C;
END;

DROP FUNCTION CORP_MAIL;

SELECT DBO.CORP_MAIL('RAVI SHARMA','EOOO1');	

SELECT NAME,EMP_ID,DBO.CORP_MAIL(NAME,EMP_ID) AS 'CORP_MAIL' FROM emp_info;
	 
				---ASSIGN 3 ---
-- : FUNCTION TO RETURN EID, NAME, DESI, DEPT ,SALARY OF THE EMPLOYEES OF A SPECIFIED DEPARTMENT.


CREATE FUNCTION EMIN(@X AS VARCHAR(20))
RETURNS TABLE
AS
	return( SELECT emp_info.EMP_ID,NAME,DESIG,DEPT,BASIC AS SALARY
	FROM emp_info
	INNER JOIN emp_sal
	ON emp_info.EMP_ID = emp_sal.EMP_ID
	WHERE DEPT = @X);



select * from dbo.EMIN('IT');


				---ASSIGN 4 ---
-- : FUNCTION TO DISPLAY THE NAME , DEPT . DESI , CITY OF THE EMPLOYEES WHO HAVE THE BIRTHDAY IN THE CURRENT MONTH.--

CREATE FUNCTION EM_BD(@X AS DATE)
RETURNS TABLE
AS
	RETURN( SELECT emp_info.NAME,DEPT,DESIG,CITY
					FROM emp_info
					INNER JOIN emp_sal
					ON emp_info.EMP_ID = emp_sal.EMP_ID
					WHERE MONTH(DOB)=MONTH(@X));

DROP FUNCTION EM_BD 

SELECT * FROM DBO.EM_BD('12-02-2002');

select * from emp_info

select* from emp_info where DOB in  (month('2000-02-01'));



				---ASSIGN 5 ---
-- FUNCTION TO DISPLAY THE NAME, DEPT & DOJ OF EMPLOYEES WHO HAVE COMPLETED 5 YEARS IN THE COMPANY

SELECT * FROM emp_sal;

CREATE FUNCTION EM_TR()
RETURNS TABLE
AS

	RETURN(SELECT emp_info.EMP_ID,NAME,DEPT,DOJ
	FROM emp_info
	INNER JOIN emp_sal
	ON emp_info.EMP_ID = emp_sal.EMP_ID
	WHERE (YEAR(GETDATE())- YEAR(DOJ))>5);

SELECT * FROM DBO.EM_TR();

SELECT * FROM emp_sal
DROP FUNCTION EM_TR
