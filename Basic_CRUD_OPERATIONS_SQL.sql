-- SQL All Practice
-- CREATE TABLE NAMED "EMPLOYEES"
-- INSERT VALUES INTO "EMPLOYEES" TABLE
-- UPDATING VALUES INTO "EMPLOYEES" TABLE
-- DELETING VALUES FROM "EMPLOYEES" TABLE
-- ADDING COLUMNS USING "ALTER" COMMAND
-- DROP COLUMNS USING "ALTER" COMMAND
-- RENAMING COLUMNS USING "ALTER" COMMAND
-- DATE FUNCTIONS
-- TRUNCATE TABLE
-- CREATING "NEW USER" AND GRANTING AND REVOKING PERMISSIONS TO USERS


CREATE TABLE EMPLOYEES (EMPID NUMBER PRIMARY KEY, ENAME VARCHAR2(100) NOT NULL,SALARY NUMBER(10),ADDRESS VARCHAR2(255),MOBILE NUMBER(10));

DESC EMPLOYEES;

-- DROP TABLE EMPLOYEES;


INSERT INTO EMPLOYEES (EMPID,ENAME,SALARY,ADDRESS,MOBILE) 
VALUES (101,'MADATHA GANESH ',25000,'  SHIVANAGAR',9034238454);

INSERT INTO EMPLOYEES VALUES(102,' ARUN',24000,' KARIMNAGAR ',8935332341);

INSERT INTO EMPLOYEES (EMPID,ENAME,SALARY,ADDRESS,MOBILE) 
VALUES (103,'VINOD',25000,'  MAHABUBAD',7934539232);

INSERT INTO EMPLOYEES (EMPID,ENAME,SALARY,ADDRESS,MOBILE)
VALUES (104,'SAI KUMAR',24000,'HYDERABAD  ',9452384553);

INSERT INTO EMPLOYEES VALUES(105,'  RAVI KRISHNA  ', 25000 ,' KAKINADA ',9452355345);

INSERT INTO EMPLOYEES VALUES(106,'  HARI RAM  ', 23000 ,' SHIVANAGAR  ',9784533425);

-- Update Comand
UPDATE EMPLOYEES SET SALARY=30000 WHERE EMPID=105;

SELECT * FROM EMPLOYEES;


INSERT INTO EMPLOYEES VALUES(109,'  SHIVA RAM  ', 25000 ,' RAMNAGAR  ',924233425);

DELETE FROM EMPLOYEES WHERE EMPID=109;

-- ALTER COMMANDS
ALTER TABLE EMPLOYEES ADD PINCODE NUMBER(6);   -- Adding a NEW Column

ALTER TABLE EMPLOYEES DROP COLUMN PINCODE;     -- Removing a COLUMN using DROP

ALTER TABLE EMPLOYEES RENAME COLUMN ENAME TO EMP_NAME;  -- RENAMING A COLUMN "ENAME" TO "EMP_NAME"


-- DATE functions.

SELECT SYSDATE FROM DUAL;

SELECT EXTRACT(YEAR FROM SYSDATE) AS YEAR FROM DUAL;

SELECT EXTRACT(DAY FROM SYSDATE) AS "ONLY DATE" FROM DUAL;    -- 21 = date

SELECT EXTRACT(MONTH FROM SYSDATE) AS "ONLY MONTH" FROM DUAL;  -- 12 Month

SELECT TO_CHAR(SYSDATE,'MM') AS "MONTH_NUMBER" FROM DUAL;   --12 MONTH

SELECT TO_CHAR(SYSDATE,'DAY') AS "DAY_NUMBER" FROM DUAL;  -- SATURDAY

SELECT TO_CHAR(SYSDATE,'MONTH') AS "MONTH_IN_WORDS" FROM DUAL;  -- DECEMBER



-- After using "TRUNCATE", the data inside the table will be deleted and only structure will be there.
CREATE TABLE TRUNCATE_DEMO_EMPLOYEES (EMPID NUMBER PRIMARY KEY, ENAME VARCHAR2(100) NOT NULL,SALARY NUMBER(10),ADDRESS VARCHAR2(255),MOBILE NUMBER(10));

INSERT INTO TRUNCATE_DEMO_EMPLOYEES (EMPID,ENAME,SALARY,ADDRESS,MOBILE) 
VALUES (101,'MADATHA GANESH ',25000,'  SHIVANAGAR',9034238454);

INSERT INTO TRUNCATE_DEMO_EMPLOYEES VALUES(102,' ARUN',24000,' KARIMNAGAR ',8935332341);

INSERT INTO TRUNCATE_DEMO_EMPLOYEES (EMPID,ENAME,SALARY,ADDRESS,MOBILE) 
VALUES (103,'VINOD',25000,'  MAHABUBAD',7934539232);

SELECT * FROM TRUNCATE_DEMO_EMPLOYEES;

TRUNCATE TABLE TRUNCATE_DEMO_EMPLOYEES;

SELECT * FROM TRUNCATE_DEMO_EMPLOYEES;


-- Command to check In which Database we are working
SELECT SYS_CONTEXT('USERENV','DB_NAME') AS CURRENT_DATABASE FROM DUAL;  -- XE (Xpress Edition)

-- Command to check In which container we are working
SELECT SYS_CONTEXT('USERENV','CON_NAME') AS CURRENT_WORKING_CONTAINER_NAME FROM DUAL;

-- DCL Commands 
-- GRANT AND REVOKE


-- Creating a New User "GANESH".
CREATE USER GANESH_DB IDENTIFIED BY GANESH_PASSWORD;


-- Giving permissions like "SELECT" AND "INSERT" to person named "SYSTEM" on "EMPLOYEES" Table.
-- We can write any USERNAME / ROLE instead of "SYSTEM" , which is existed.
GRANT SELECT, INSERT ON EMPLOYEES TO "SYSTEM";   -- : GRANT Succeeded

SELECT * FROM DBA_TAB_PRIVS WHERE GRANTEE='SYSTEM' AND TABLE_NAME='EMPLOYEES';


REVOKE SELECT,INSERT ON EMPLOYEES FROM "SYSTEM";  -- Revoking Permissions from "SYSTEM".