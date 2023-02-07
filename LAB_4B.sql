/*
Austin Polak
CNIT 27200 Fall 2020
Lab Time: Wednesday 8:05pm
Duration: hours (03/10 n/a~)
*/
-- ********Question 1*****

SET LINESIZE 200;

select SYSDATE, CEIL(4956.5795) AS CeilingValue, FLOOR(4956.5795) AS FloorValue, 
ROUND(4956.5795,2) AS RoundValue, TRUNC(4956.5795,1) AS TruncValue
FROM DUAL;

/* 
SYSDATE   CEILINGVALUE FLOORVALUE ROUNDVALUE TRUNCVALUE
--------- ------------ ---------- ---------- ----------
10-MAR-21         4957       4956    4956.58     4956.5
*/
--*****QUESTION 2******
SELECT CUSTOMERID, CUSTFIRSTNAME || ' ' || CUSTLASTNAME AS Contact, NVL(EMAILADDR, '*Email Missing*') AS EMAIL_ADDRESS
FROM CUSTOMER
WHERE STATE = 'IL';
/* RESULTS:
CUSTOMERID CONTACT                              EMAIL_ADDRESS                                     
---------- ------------------------------------ --------------------------------------------------
C-200026   Jim Lichty                           bankrupt@live.com                                 
C-200075   Aricka Bross                         placetolive@aptref.com                            
I-200006   Eric Fannon                          ef@yahoo.com                                      
I-200038   David Smith                          dsmith443@outlook.com                             
I-200094   Jay Hanau                            *Email Missing*   
*/
--*****QUESTION 3******

SELECT CATEGORYID, MIN(Weight) AS Min_Weight, MAX(WEIGHT) AS Max_Weight,
ROUND(AVG(WEIGHT),2) AS Avg_Weight, COUNT(CATEGORYID) AS CategoryItems
FROM INVENTORYPART
WHERE STOCKLEVEL > 15 AND CATEGORYID IS NOT NULL
GROUP BY CATEGORYID;


/* RESULTS:
 CATEGORYID MIN_WEIGHT MAX_WEIGHT AVG_WEIGHT CATEGORYITEMS
---------- ---------- ---------- ---------- -------------
BASE             .188       5.75       2.23            17
STOR               .5          3       1.59            11
PROC             .063         .5        .22            13
SFTW             .188      1.438        .69             8
CBL              .125      1.563        .48            32
KEY                 2          2          2             3

6 rows selected.   
*/

--**********QUESTION 4**********
SELECT CATEGORYID, MIN(Weight) AS Min_Weight, MAX(WEIGHT) AS Max_Weight,
ROUND(AVG(WEIGHT),2) AS Avg_Weight, COUNT(PARTNUMBER) AS Parts
FROM INVENTORYPART
WHERE stocklevel > 15 
AND CATEGORYID IS NOT NULL 
GROUP BY CATEGORYID
HAVING COUNT(PARTNUMBER) > 12;
/* RESULTS:

CATEGORYID MIN_WEIGHT MAX_WEIGHT AVG_WEIGHT      PARTS
---------- ---------- ---------- ---------- ----------
BASE             .188       5.75       2.23         17
PROC             .063         .5        .22         13
CBL              .125      1.563        .48         32
*/

--**********QUESTION 5**********
SELECT ORDERID, UNITPRICE, ORDERQUANTITY, LPAD( STATUS, 15, '#')
FROM CUSTORDERLINE
WHERE ORDERQUANTITY BETWEEN 25 AND 35 
AND UNITPRICE < (SELECT AVG(UNITPRICE) FROM CUSTORDERLINE);

/* RESULTS:
ORDERID     UNITPRICE ORDERQUANTITY LPAD(STATUS,15,
---------- ---------- ------------- ---------------
3000000024       7.99            30 ########SHIPPED
3000000024      12.99            25 ########SHIPPED
3000000041       9.99            25 ########SHIPPED
3000000054       5.99            30 ########SHIPPED
3000000129       6.99            30 ########SHIPPED
3000000482       5.99            26 ########SHIPPED
3001000519      59.95            25 ########SHIPPED
3001000524      39.99            25 ########SHIPPED
3001000626      14.99            25 ########SHIPPED
3001000641       5.99            27 ########SHIPPED
3001000676       29.5            27 ########SHIPPED

ORDERID     UNITPRICE ORDERQUANTITY LPAD(STATUS,15,
---------- ---------- ------------- ---------------
3001000705       9.99            28 ########SHIPPED
3001000767       7.99            35 ########SHIPPED
3001000782      14.95            30 ########SHIPPED
3001000794       7.99            28 ########SHIPPED
3001000797      14.99            29 #########PACKED
3001000805      68.95            30 ########PENDING
3000000379      31.95            30 ########SHIPPED
3000000412      24.95            25 ########SHIPPED

19 rows selected. 
*/

--**********QUESTION 6**********
SELECT INSERVICEDATE, ADD_MONTHS(INSERVICEDATE,6), 
CONCAT(MANUFACTURERNAME || ' ' || MAKE, ' ' || MODEL) AS MACHINE_INFO
FROM MACHINE;
/* RESULTS:

INSERVICE ADD_MONTH MACHINE_INFO                                                                 
--------- --------- -----------------------------------------------------------------------------
13-JAN-13 13-JUL-13 ATD INKJET SYSTEMS BARCODE SYSTEM IP9000                                     
20-MAY-17 20-NOV-17 CONVEYORS UNLIMITED LINESHAFT CONVEYOR STAINLESS STEEL                       
24-MAR-12 24-SEP-12 SERGE #99234 NEW JERSEY 304R-851                                             
26-NOV-15 26-MAY-16 SERGE #98577 DEWEL PACK DPTB200                                              
10-JUN-14 10-DEC-14 ADEPT ADEPT ONE XL                                                           
10-FEB-13 10-AUG-13 ADEPT ADEPT ONE XL                                                           
23-FEB-15 23-AUG-15 SERGE #98766 PACKAGE UE6A                                                    
24-MAR-11 24-SEP-11 ZT410 RFID PRINTER RFID SYSTEM ZT410                                         

8 rows selected. 
*/

--**********QUESTION 7**********
SELECT SUBSTR(HOMEPHONE, 1, 3) AS ARC, 
SUBSTR(HOMEPHONE, 1, 3) AS PRE, 
SUBSTR(HOMEPHONE, 1, 3) AS SUFF
FROM EMPLOYEE
/* RESULTS:

*/

--**********QUESTION 8**********
SELECT STATUS,COUNT(*), ORDER
/* RESULTS:

*/

--**********QUESTION 9**********
SELECT EMPLOYEEID, SUPPLIERID, PAIDINFULL, DATEORDERED, MAX(DATEDELIVERED) AS DATEDELIVERED
FROM PURCHASEORDER;
/* RESULTS:


*/

/*
******Question 10: ******

/*
Question 11: What is the difference between a row function and a column function?
Single row function takes single row as an input and gives single row output for every input row I.e 10 input row will get 10 output rows.
Multi row function takes single or multiple row as an input group them and gives a single record as output.

Question 12: Explain how nested subqueries work, using the MIN and MAX column
functions with dates (oldest vs most recent) as an example

Question 13: Explain the difference between WHERE and HAVING clauses
The WHERE clause is used to filter rows before the grouping is performed. 
The HAVING clause is used to filterrows after the grouping is performed. 

Question 14: Explain how the row function SUBSTR works
The substr function extracts a substring from a string at any starting position.
The parenthesis contain 3 parameters, srting, start point, and length/ending point. 

Question 15: Explain aggregate (column) functions with the use of GROUP BY
(explain when you need to include a group by clause, and why)
Group by clause allows you to collapse a field into its distinct values. 
Using group by and aggregates to collect multiple types of information.
GROUP BY statement groups rows that have the same values into summary rows, like "find the number of customers in each country".
The group by statement is often used with aggregate functions (COUNT(), MAX(), MIN(), SUM(), AVG()) to group the result-set by one or more columns.
*/