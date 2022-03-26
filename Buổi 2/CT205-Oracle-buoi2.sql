--############################### Buoi 2    #################################
--------------------------------- Bai tap 5 ---------------------------------
create user b1510210_test1 identified by "THOracle@2021@test1" ;--quota 10M on DATA;
grant create session to b1510210_test1;
-- Now this test1 user only can login and change his own password
/* test1 worksheet
-- ORA-28221: REPLACE not specified occurs if there's no REPLACE
ALTER USER b1510210_test1 IDENTIFIED BY "THOracle@2021@test1@pass1" REPLACE "THOracle@2021@test1";
*/
GRANT CREATE TABLE, CREATE USER, CREATE SESSION TO b1510210_test1 WITH ADMIN OPTION;
ALTER USER b1510210_test1 default tablespace DATA quota 2M on DATA;
/* test1 worksheet
CREATE TABLE Students
( 
    SID char(7) PRIMARY KEY, 
    SName Varchar2(30)
);
-- error report when INSERT: ORA-01950: no privileges on tablespace 'DATA'
-- Run "ALTER USER b1510210_test1 default tablespace DATA quota 2M on DATA;" on B1510210 user (who created this test1 user)
INSERT INTO Students VALUES('1940000','Phung Phung Phi');
INSERT INTO Students VALUES('1940001','Tao Tung Thieu');
select * from Students;
*/

--------------------------------- Bai tap 6 ---------------------------------
/* test1 worksheet
CREATE USER b1510210_test2 IDENTIFIED BY "THOracle@2021@test2@pass1"
DEFAULT TABLESPACE DATA QUOTA 2M ON DATA;
GRANT CREATE TABLE, CREATE SESSION TO b1510210_test2 WITH ADMIN OPTION;
*/
/* test2 worksheet
CREATE TABLE Products
( 
    PID char(3) PRIMARY KEY,
    PName Varchar2(30)
);
INSERT INTO Products VALUES('P01','Kem Danh Rang P/S');
INSERT INTO Products VALUES('P02','Khan Giay Puppy');
SELECT * FROM PRODUCTS;
*/
REVOKE CREATE TABLE FROM b1510210_test1;
/* test1 worksheet
-- test
CREATE TABLE test_table
( 
    SID char(7) PRIMARY KEY, 
    SName Varchar2(30)
);
-- ORA-01031: insufficient privileges
*/
/* test 2 worksheet
-- test
CREATE TABLE test_table
( 
    SID char(7) PRIMARY KEY, 
    SName Varchar2(30)
);
-- table created (Despite the fact that, Test2 is created and GRANT privileges by Test1. 
-- Test2 is not being REVOKED privileges after Test1 is REVOKED privileges) (BECAUSE TEST1 GRANT PRIVILEGES WITH ADMIN OPTION)
*/
create user b1510210_test3 identified by "THOracle@2021@test3@pass1" quota 2M on DATA;
GRANT CREATE TABLE, CREATE SESSION TO b1510210_test3 WITH ADMIN OPTION;
--------------------------------- Bai tap 7 ---------------------------------
/* test 2 worksheet
SELECT * FROM b1510210_test1.Students;
-- ORA-00942: table or view does not exist .. occurs because of privileges stuff, ask test1 to GRANT SELECT, UPDATE ON Students
*/
/* test 1 worksheet
GRANT SELECT, UPDATE ON Students TO b1510210_test2 WITH GRANT OPTION;
*/
/* test 2 worksheet
SELECT * FROM b1510210_test1.Students;
DELETE FROM b1510210_test1.Students;
-- ORA-01031: insufficient privileges .. Test1 just give select and update privileges, not delete
*/
/* test 1 worksheet
GRANT SELECT, UPDATE ON Students TO b1510210_test2 WITH GRANT OPTION;
*/
/* test 2 worksheet
GRANT SELECT, UPDATE ON b1510210_test1.students TO b1510210_test3;
*/
/* test 3 worksheet
UPDATE b1510210_test1.Students SET sname='bla bla bla'
WHERE SID='1940001';
SELECT * FROM b1510210_test1.Students;
*/
/* test 2 worksheet
-- ORA-01031: insufficient privileges .. Test1 just give select and update privileges, not delete, let alone grant to others
GRANT DELETE ON b1510210_test1.students TO Test3;
*/
/* test 1 worksheet
REVOKE SELECT, UPDATE ON Students FROM b1510210_test2;
*/
/* test 2 worksheet
-- ORA-00942: table or view does not exist (AFTER BEING REVOKED BY TEST1)
SELECT * FROM b1510210_test1.Students;
*/
/* test 3 worksheet
-- ORA-00942: table or view does not exist (Because, Test3 is GRANTed privileges by Test2. 
-- Test3 is REVOKED privileges after Test2 is REVOKED privileges by Test1 (owner of Students)) (BECAUSE TEST1 GRANT PRIVILEGES WITH GRANT OPTION)
SELECT * FROM b1510210_test1.Students;
*/
--------------------------------- Bai tap 8 ---------------------------------
CREATE USER b1510210_user1 IDENTIFIED BY "THOracle@2021@user1@pass1"
DEFAULT TABLESPACE DATA QUOTA 1M ON DATA;
CREATE USER b1510210_user2 IDENTIFIED BY "THOracle@2021@user2@pass1"
DEFAULT TABLESPACE DATA QUOTA 1M ON DATA;

CREATE ROLE B1510210_TTOracle;

GRANT CREATE SESSION, CREATE TABLE, CREATE PROCEDURE, CREATE TRIGGER TO B1510210_TTOracle;

GRANT B1510210_TTOracle TO b1510210_user1, b1510210_user2;
/* user 1 worksheet
-- test
CREATE TABLE test_table
( 
    SID char(7) PRIMARY KEY, 
    SName Varchar2(30)
);
*/
/* user 2 worksheet
-- test
CREATE TABLE test_table
( 
    SID char(7) PRIMARY KEY, 
    SName Varchar2(30)
);
*/
REVOKE B1510210_TTOracle FROM b1510210_user1;
/* user 1 worksheet
-- test after REVOKED
CREATE TABLE test_table_2
( 
    SID char(7) PRIMARY KEY, 
    SName Varchar2(30)
);
-- Still able to create table

-- Let's check all user privileges
SELECT * FROM USER_SYS_PRIVS; 
SELECT * FROM USER_TAB_PRIVS;
SELECT * FROM USER_ROLE_PRIVS;
-- We can see that in USER_ROLE_PRIVS, user1 no longer belongs to B1510210_TTOracle Role, 
-- but let's take a look at USER_TAB_PRIVS, it has INHERIT PRIVILEGES
*/
