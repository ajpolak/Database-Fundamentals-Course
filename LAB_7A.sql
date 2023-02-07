/*
Austin Polak
CNIT 27200 Fall 2020
Lab Time: Sunday 1:26pm
Duration: 6 HOURS (03/28 7:26pm)
*/
-- ********Question 1*****
CREATE TABLE S21EQUIPMENT
    (EquipmentID    CHAR(7) CONSTRAINT EquipmentID PRIMARY KEY,
    Name            varchar(25),
    Condition       varchar(40),
    Manufacturer    varchar(15),
    PurchaseDate    date);

ALTER TABLE S21EQUIPMENT
    ADD Model varchar(20);
    
desc S21EQUIPMENT;
DROP TABLE S21EQUIPMENT;    
/*  RESULTS:
A)Table S21EQUIPMENT created.
B)Table S21EQUIPMENT altered.
C)Name         Null?    Type         
------------ -------- ------------ 
EQUIPMENTID  NOT NULL CHAR(7)      
NAME                  VARCHAR2(25) 
CONDITION             VARCHAR2(40) 
MANUFACTURER          VARCHAR2(15) 
PURCHASEDATE          DATE         
MODEL                 VARCHAR2(20) 
D)Table S21EQUIPMENT dropped.
E)
ERROR:
ORA-04043: object S21EQUIPMENT does not exist
*/

--*****QUESTION 2******
CREATE TABLE S21ZIPCODE AS
SELECT PostalCode as ZipCode, City, State FROM Supplier
 UNION 
SELECT PostalCode as ZipCode, City, State FROM Employee
 UNION
SELECT PostalCode as ZipCode, City, State FROM Customer
 UNION
SELECT ShipPostalCode as ZipCode, ShipCity, ShipState FROM Shipment;

DESC S21ZIPCODE;

SELECT COUNT(*)
FROM S21ZIPCODE;

SELECT Zipcode, City, State
FROM S21ZIPCODE
WHERE State LIKE '%CA%';
/* RESULTS:
A)
Table S21ZIPCODE created.
Name    Null? Type         
------- ----- ------------ 
ZIPCODE       CHAR(10)     
CITY          VARCHAR2(20) 
STATE         CHAR(2)   
B)  
COUNT(*)
----------
       301
C)
ZIPCODE    CITY                 ST
---------- -------------------- --
90001      Los Angeles          CA
92592      Temecula             CA
93311      Bakersfield          CA
94107      San Francisco        CA
94111      San Francisco        CA
94232      Sacramento           CA
94583      San Ramon            CA
95354      Modesto              CA
95534      Eureka               CA
96003      Redding              CA

10 rows selected. 

*/

-- ********Question 3*****
CREATE TABLE S21ROOM(
    RoomNum char(4) CONSTRAINT S21ROOM_PK PRIMARY KEY,
    Condition varchar2(30),
    MaxOccupany integer,
    SquareFootage Number(4,2) NOT NULL,
    RoomType varchar2(20),
    Safety varchar2(20),
    Floor integer,
    EthernetPort char(6) CONSTRAINT S21ROOM_UC UNIQUE);
    
DESC S21ROOM;

COL CONSTRAINT_NAME format a11
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, STATUS, SEARCH_CONDITION
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'S21ROOM';

/*  RESULTS:
A)
Table S21ROOM created.
B)
Name          Null?    Type         
------------- -------- ------------ 
ROOMNUM       NOT NULL CHAR(4)      
CONDITION              VARCHAR2(30) 
MAXOCCUPANY            NUMBER(38)   
SQUAREFOOTAGE NOT NULL NUMBER(4,2)  
ROOMTYPE               VARCHAR2(20) 
SAFETY                 VARCHAR2(20) 
FLOOR                  NUMBER(38)   
ETHERNETPORT           CHAR(6)      

C)
CONSTRAINT_ CONSTRAINT_ STATUS      SEARCH_COND
----------- ----------- ----------- -----------
SYS_C003544 C           ENABLED     "SQUAREFOOT
6                                   AGE" IS NOT
                                     NULL      

S21ROOM_PK  P           ENABLED                
S21ROOM_UC  U           ENABLED                
*/

--*****QUESTION 4******
ALTER TABLE S21ROOM
ADD ClosetSize varchar2(10);

DESC S21ROOM;
/* RESULTS:
A)
Table S21ROOM altered.
B)
Name          Null?    Type         
------------- -------- ------------ 
ROOMNUM       NOT NULL CHAR(4)      
CONDITION              VARCHAR2(30) 
MAXOCCUPANY            NUMBER(38)   
SQUAREFOOTAGE NOT NULL NUMBER(4,2)  
ROOMTYPE               VARCHAR2(20) 
SAFETY                 VARCHAR2(20) 
FLOOR                  NUMBER(38)   
ETHERNETPORT           CHAR(6)      
CLOSETSIZE             VARCHAR2(10) 
*/
-- ********Question 5*****
CREATE TABLE S21VENDOR(
VendorID char(6) CONSTRAINT S21VENDOR_PK PRIMARY KEY,
CompanyName varchar2(50),
Email varchar(25) NOT NULL, 
CONSTRAINT S21VENDOR_UC UNIQUE(EMAIL),
ContractDate date);

DESC S21VENDOR;

/*  RESULTS:
A)
Table S21VENDOR created.
B)
Name         Null?    Type         
------------ -------- ------------ 
VENDORID     NOT NULL CHAR(6)      
COMPANYNAME           VARCHAR2(50) 
EMAIL        NOT NULL VARCHAR2(25) 
CONTRACTDATE          DATE     
*/

--*****QUESTION 6******
CREATE TABLE S21MAINTENANCE(
VendorID char(8),
RoomNum char(6),
MaintenanceDate date,
MaintenanceFee number(4,2),
NumberOfHours int,
IssueDescription varchar2(50),
CONSTRAINT S21MNTCE_PK PRIMARY KEY(VendorID, RoomNum, MaintenanceDate)
);

ALTER TABLE S21MAINTENANCE
ADD CONSTRAINT S21VEND_FK FOREIGN KEY(VendorID) REFERENCES S21VENDOR;

ALTER TABLE S21MAINTENANCE
ADD CONSTRAINT S21ROOM_FK FOREIGN KEY(RoomNum) REFERENCES S21ROOM;

desc S21MAINTENANCE;

/* RESULTS:
A)
Table S21MAINTENANCE created.
B)
Table S21MAINTENANCE altered.
C)
Table S21MAINTENANCE altered.
D)
Name             Null?    Type         
---------------- -------- ------------ 
VENDORID         NOT NULL CHAR(8)      
ROOMNUM          NOT NULL CHAR(6)      
MAINTENANCEDATE  NOT NULL DATE         
MAINTENANCEFEE            NUMBER(4,2)  
NUMBEROFHOURS             NUMBER(38)   
ISSUEDESCRIPTION          VARCHAR2(50) 

*/
-- ********Question 7*****
CREATE TABLE S21MAINTYPE(
TypeCode char(5) CONSTRAINT S21TYPE_PK PRIMARY KEY,
TypeDescription varchar2(50)
);
desc S21MAINTYPE;

ALTER TABLE S21MAINTENANCE
ADD TypeCode char(5);

ALTER TABLE S21MAINTENANCE
ADD CONSTRAINT S21TYPE_FK FOREIGN KEY(TypeCode) REFERENCES S21MAINTYPE;

DESC S21MAINTENANCE;

/*  RESULTS:
A)
Table S21MAINTYPE created.
B)
Name            Null?    Type         
--------------- -------- ------------ 
TYPECODE        NOT NULL CHAR(5)      
TYPEDESCRIPTION          VARCHAR2(50) 
C)
Table S21MAINTENANCE altered.
Table S21MAINTENANCE altered.
D)
Name             Null?    Type         
---------------- -------- ------------ 
VENDORID         NOT NULL CHAR(8)      
ROOMNUM          NOT NULL CHAR(6)      
MAINTENANCEDATE  NOT NULL DATE         
MAINTENANCEFEE            NUMBER(4,2)  
NUMBEROFHOURS             NUMBER(38)   
ISSUEDESCRIPTION          VARCHAR2(50) 
TYPECODE                  CHAR(5)      
*/
--*****QUESTION 8******
ALTER TABLE S21MAINTENANCE
ADD CONSTRAINT MNTCE_CK CHECK(MaintenanceFee > 0);

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, STATUS, SEARCH_CONDITION
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'S21MAINTENANCE';
/* RESULTS:
Table S21MAINTENANCE altered.
CONSTRAINT_NAME  C STATUS   SEARCH_CONDITION                                                                
---------------- - -------- ------------------
S21VEND_FK       R ENABLED                                                                                  
S21ROOM_FK       R ENABLED                                                                                  
S21TYPE_FK       R ENABLED                                                                                  
MNTCE_CK         C ENABLED  MaintenanceFee > 0                                                              
S21MNTCE_PK      P ENABLED                                                                                  
*/

-- ********Question 9*****
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, STATUS, SEARCH_CONDITION
FROM USER_CONSTRAINTS
WHERE CONSTRAINT_TYPE = 'P';

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, STATUS, SEARCH_CONDITION
FROM USER_CONSTRAINTS
WHERE CONSTRAINT_TYPE = 'R';
/*  RESULTS:
A)
BIN$vp/n2Z61QP3gUy0ELoDHrQ==$0                                                                                                   P ENABLED                                                                                  
S21ROOM_PK                                                                                                                       P ENABLED                                                                                  

CONSTRAINT_NAME                                                                                                                  C STATUS   SEARCH_CONDITION                                                                
-------------------------------------------------------------------------------------------------------------------------------- - -------- --------------------------------------------------------------------------------
BIN$vp/n2Z67QP3gUy0ELoDHrQ==$0                                                                                                   P ENABLED                                                                                  
S21VENDOR_PK                                                                                                                     P ENABLED                                                                                  
BIN$vqCrp7qdRxLgUy0ELoDQow==$0                                                                                                   P ENABLED                                                                                  
S21MNTCE_PK                                                                                                                      P ENABLED                                                                                  
S21TYPE_PK                                                                                                                       P ENABLED                                                                                  

38 rows selected. 

B)
CONSTRAINT_NAME                                                                                                                  C STATUS   SEARCH_CONDITION                                                                
-------------------------------------------------------------------------------------------------------------------------------- - -------- --------------------------------------------------------------------------------
OPERATION_PROCESS_FK                                                                                                             R ENABLED                                                                                  
PROCESS_PROCESSROUTING_FK                                                                                                        R ENABLED                                                                                  
MACHINEPROCESS_MACHINE_2FK                                                                                                       R ENABLED                                                                                  
SHIPPEDITEM_CUSTORDERLINE_FK                                                                                                     R ENABLED                                                                                  
SHIPPEDITEM_PACKINGSLIP_FK                                                                                                       R ENABLED                                                                                  
BILLOFMATLS_INVENTORYPART_FK                                                                                                     R ENABLED                                                                                  
BOM_SUBINVENTORYPART_FK                                                                                                          R ENABLED                                                                                  
PROCESSROUT_INVENTORYPART_FK                                                                                                     R ENABLED                                                                                  
TIMECARDLINE_MACHINEPROCESS_FK                                                                                                   R ENABLED                                                                                  
S21VEND_FK                                                                                                                       R ENABLED                                                                                  
S21ROOM_FK                                                                                                                       R ENABLED                                                                                  

CONSTRAINT_NAME                                                                                                                  C STATUS   SEARCH_CONDITION                                                                
-------------------------------------------------------------------------------------------------------------------------------- - -------- --------------------------------------------------------------------------------
S21TYPE_FK                                                                                                                       R ENABLED                                                                                  

34 rows selected. 

*/
--*****QUESTION 10******
DROP TABLE S21ZIPCODE CASCADE CONSTRAINTS;
DROP TABLE S21MAINTYPE CASCADE CONSTRAINTS;
DROP TABLE S21VENDOR CASCADE CONSTRAINTS;
DROP TABLE S21MAINTENANCE CASCADE CONSTRAINTS;
/* RESULTS:

Table S21ZIPCODE dropped.


Table S21MAINTYPE dropped.


Table S21VENDOR dropped.


Table S21MAINTENANCE dropped.

*/