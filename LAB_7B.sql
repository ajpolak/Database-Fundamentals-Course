/*
Austin Polak
CNIT 27200 Fall 2020
Lab Time: Wednnesday 7pm
Duration: 3hour (03/31 10:45pm)
*/
-- ********Question 1*****
DROP TABLE S21FURNITURE;

CREATE TABLE S21FURNITURE(
FurnitureCode char(8) CONSTRAINT S21FURNITURE_PK PRIMARY KEY,
Description varchar2(30) NOT NULL,
Type varchar2(10),
Weight number(4,2) NOT NULL);

DESC S21FURNITURE;

/*  RESULTS:
A)
Error starting at line : 8 in command -
DROP TABLE S21FURNITURE
Error report -
ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:
B)
Table S21FURNITURE created.
C)
Name          Null?    Type         
------------- -------- ------------ 
FURNITURECODE NOT NULL CHAR(8)      
DESCRIPTION   NOT NULL VARCHAR2(30) 
TYPE                   VARCHAR2(10) 
WEIGHT        NOT NULL NUMBER(4,2)  
*/
--*****QUESTION 2*****
DROP TABLE S21INVENTORY;

CREATE TABLE S21INVENTORY(
InventoryID char(10) CONSTRAINT S21INVENTORY_PK PRIMARY KEY,
InventoryDate date NOT NULL,
RoomNum char(4) NOT NULL,
StaffID char(9),
RoomCondition varchar(2),
Temperature number(3,1),
CONSTRAINT S21ROOM_FK FOREIGN KEY(RoomNum) REFERENCES S21ROOM);

DESC S21INVENTORY;

ALTER TABLE S21INVENTORY
MODIFY RoomCondition varchar2(50);

ALTER TABLE S21INVENTORY
DROP COLUMN Temperature
;
DESC S21INVENTORY;
/* RESULTS:
A)
Error starting at line : 38 in command -
DROP TABLE S21INVENTROY
Error report -
ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:
Table S21INVENTORY dropped.
Table S21INVENTORY created.
B)
Name          Null?    Type        
------------- -------- ----------- 
INVENTORYID   NOT NULL CHAR(10)    
INVENTORYDATE NOT NULL DATE        
ROOMNUM       NOT NULL CHAR(4)     
STAFFID                CHAR(9)     
ROOMCONDITION          VARCHAR2(2) 
TEMPERATURE            NUMBER(3,1) 
C)
Table S21INVENTORY altered.
D)
Table S21INVENTORY altered.
E)
Name          Null?    Type         
------------- -------- ------------ 
INVENTORYID   NOT NULL CHAR(10)     
INVENTORYDATE NOT NULL DATE         
ROOMNUM       NOT NULL CHAR(4)      
STAFFID                CHAR(9)      
ROOMCONDITION          VARCHAR2(50) 
*/
--*****QUESTION 3******
DROP TABLE S21INVENTORYDETAIL;

CREATE TABLE S21INVENTORYDETAIL(
InventoryID char(10),
FurnitureCode char(8),
Quantity number(2),
Condition varchar2(30),
Location varchar2(30) NOT NULL,
Comments varchar2(30),
CONSTRAINT S21INVENTORYDETAIL_PK PRIMARY KEY(InventoryID, FurnitureCode),
CONSTRAINT S21INVENT_FK FOREIGN KEY(InventoryID) REFERENCES S21INVENTORY,
CONSTRAINT S21FURN_FK FOREIGN KEY(FurnitureCode) REFERENCES S21FURNITURE,
CHECK (FurnitureCODE IN ('Poor', 'Fair', 'Good', 'Excellent', 'New')));

DESC S21INVENTORYDETAIL;
/* RESULTS:
DROP TABLE S21INVENTORYDETAIL
Error report -
ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Table S21INVENTORYDETAIL created.

Name          Null?    Type         
------------- -------- ------------ 
INVENTORYID   NOT NULL CHAR(10)     
FURNITURECODE NOT NULL CHAR(8)      
QUANTITY               NUMBER(2)    
CONDITION              VARCHAR2(30) 
LOCATION      NOT NULL VARCHAR2(30) 
COMMENTS               VARCHAR2(30) 
*/

--**********QUESTION 4**********
CREATE TABLE S21STAFF(
StaffID char(9) CONSTRAINT S21STAFF_PK PRIMARY KEY,
LName varchar2(30),
FName varchar2(30),
Email varchar2(30) CONSTRAINT S21STAFF_UC UNIQUE,
HireDate date);

DESC S21STAFF;

ALTER TABLE S21STAFF
ADD CONSTRAINT S21INVENT_STAFFID_FK FOREIGN KEY(StaffID) REFERENCES S21INVENTORY;
/* RESULTS:
Table S21STAFF created.

Name     Null?    Type         
-------- -------- ------------ 
STAFFID  NOT NULL CHAR(9)      
LNAME             VARCHAR2(30) 
FNAME             VARCHAR2(30) 
EMAIL             VARCHAR2(30) 
HIREDATE          DATE         

Table S21STAFF altered.

Name     Null?    Type         
-------- -------- ------------ 
STAFFID  NOT NULL CHAR(9)      
LNAME             VARCHAR2(30) 
FNAME             VARCHAR2(30) 
EMAIL             VARCHAR2(30) 
HIREDATE          DATE         
*/

--**********QUESTION 5**********
COL CONSTRAINT_NAME format a11
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, STATUS, SEARCH_CONDITION
FROM USER_CONSTRAINTS
WHERE TABLE_NAME IN ('S21ROOM', 'S21FURNITURE', 'S21INVENTORY', 'S21INVENTORYDETAIL', 'S21STAFF');
/* RESULTS:

CONSTRAINT_ C STATUS   SEARCH_CONDITION                                                                
----------- - -------- --------------------------------------------------------------------------------
S21ROOM_FK  R ENABLED                                                                                  
S21INVENT_S R ENABLED                                                                                  
TAFFID_FK                                                                                              

S21INVENT_F R ENABLED                                                                                  
K                                                                                                      

S21FURN_FK  R ENABLED                                                                                  
SYS_C003544 C ENABLED  "SQUAREFOOTAGE" IS NOT NULL                                                     
6                                                                                                      


CONSTRAINT_ C STATUS   SEARCH_CONDITION                                                                
----------- - -------- --------------------------------------------------------------------------------
SYS_C004177 C ENABLED  "ROOMNUM" IS NOT NULL                                                           
6                                                                                                      

SYS_C004175 C ENABLED  "DESCRIPTION" IS NOT NULL                                                       
2                                                                                                      

SYS_C004175 C ENABLED  "WEIGHT" IS NOT NULL                                                            
3                                                                                                      

SYS_C004177 C ENABLED  "INVENTORYDATE" IS NOT NULL                                                     
5                                                                                                      


CONSTRAINT_ C STATUS   SEARCH_CONDITION                                                                
----------- - -------- --------------------------------------------------------------------------------
SYS_C004220 C ENABLED  "LOCATION" IS NOT NULL                                                          
8                                                                                                      

SYS_C004220 C ENABLED  FurnitureCODE IN ('Poor', 'Fair', 'Good', 'Excellent', 'New')                   
9                                                                                                      

S21ROOM_PK  P ENABLED                                                                                  
S21ROOM_UC  U ENABLED                                                                                  
S21INVENTOR P ENABLED                                                                                  
Y_PK                                                                                                   


CONSTRAINT_ C STATUS   SEARCH_CONDITION                                                                
----------- - -------- --------------------------------------------------------------------------------
S21FURNITUR P ENABLED                                                                                  
E_PK                                                                                                   

S21STAFF_PK P ENABLED                                                                                  
S21STAFF_UC U ENABLED                                                                                  
S21INVENTOR P ENABLED                                                                                  
YDETAIL_PK                                                                                             


18 rows selected. 
*/

--**********QUESTION 6**********
DROP TABLE S21ROOM CASCADE CONSTRAINTS;
DROP TABLE S21FURNITURE CASCADE CONSTRAINTS;
DROP TABLE S21INVENTORY CASCADE CONSTRAINTS;
DROP TABLE S21INVENTORYDETAIL CASCADE CONSTRAINTS;
DROP TABLE S21STAFF CASCADE CONSTRAINTS;
/* RESULTS:
Table S21ROOM dropped.
Table S21FURNITURE dropped.
Table S21INVENTORY dropped.
Table S21INVENTORYDETAIL dropped.
Table S21STAFF dropped.
*/
--*****QUESTION 7******
CREATE TABLE G28PRODUCT(
ProductID char(6) CONSTRAINT G28PRODUCT_PK PRIMARY KEY,
Description varchar2(40),
Price number(4,2),
Stocklevel number(2));

CREATE TABLE G28PRICECHANGE(
ProductID char(6),
Amount number(4,2),
CONSTRAINT G28PRICECHANGE_PK PRIMARY KEY(ProductID, Amount),
CONSTRAINT G28PRICECHANGE_FK FOREIGN KEY(ProductID) REFERENCES G28PRODUCT);

DESC G28PRODUCT;
DESC G28PRICECHANGE;

DROP TABLE G28PRODUCT;
DROP TABLE G28PRICECHANGE;
/* RESULTS:
Table G28PRODUCT created.
Table G28PRICECHANGE created.

Name        Null?    Type         
----------- -------- ------------ 
PRODUCTID   NOT NULL CHAR(6)      
DESCRIPTION          VARCHAR2(40) 
PRICE                NUMBER(4,2)  
STOCKLEVEL           NUMBER(2)    

Name      Null?    Type        
--------- -------- ----------- 
PRODUCTID NOT NULL CHAR(6)     
AMOUNT    NOT NULL NUMBER(4,2) 
 
The two tables Producr and PriceChange. I selected them because they display an identifying relationship.
The Product table documents product information. PriceChange updates the products price. 
They are related because PriceChange depends on Product by needing ProductID as a 
partial PrimaryKey. Making Product the parent and PriceChange the child. 
It is an identifying relationship due to the ProductID is a composite key.
*/

/*
Question 8. What are the different ways to set up a Primary Key? How do you 
determine the method to use?
On the column that will be the primary key. This method is used when there is only one attribute primary key.
When creating a table you can use a table-level constraint. This lets you specify a composite key and can be used for a single attribute.
The third way is to use ALTER TABLE by adding a PRIMARY KEY to a table.

Question 9. What does the DESCRIBE command tell you about a newly created 
table?
It will display the table of the name of columns, if it is required(NOT NULL), and the data type for each column.

Question 10. Why is it important to use a standard naming convention for constraint 
names?
Using standard naming conventions will prevent redunancey and it helps keep track of which table is belongs too.

Question 11. Explain how to drop a table. Why is this command usually added to the 
beginning of a script for creating tables
Drop table will delete the table from your database.
DROP TABLE before CREATE TABLE is to make sure to delete the old table before making a new one.
Trying to make a table before dropping the old table will cause for sql developer to put out an error message.

*/