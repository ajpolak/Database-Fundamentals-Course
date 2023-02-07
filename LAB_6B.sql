/*
Austin Polak
CNIT 27200 Fall 2020
Lab Time: Wednnesday 7pm
Duration: 3hour (03/24 pm)
*/
-- ********Question 1*****
SELECT E.EMPLOYEEID, LASTNAME, MAX(PS.SHIPPEDDATE) AS SHIPPEDDATE
FROM EMPLOYEE E LEFT JOIN PACKINGSLIP PS
ON E.EMPLOYEEID = PS.EMPLOYEEID
WHERE TYPE = 'Permanent'
GROUP BY E.EMPLOYEEID, LASTNAME
ORDER BY MAX(PS.SHIPPEDDATE);

/*  RESULTS:
EMPLOYEEID LASTNAME             SHIPPEDDA
---------- -------------------- ---------
250120     Nairn                07-JUL-19
250989     Deagen               03-MAR-20
250892     Platt                25-MAR-20
250550     Roland               28-MAR-20
251154     Hettinger            29-MAR-20
250101     Rosner               31-MAR-20
251097     Trale                31-MAR-20
251088     Underwood            31-MAR-20
250399     Day                  31-MAR-20
250204     Gomez                31-MAR-20
251089     Alvarez                       

EMPLOYEEID LASTNAME             SHIPPEDDA
---------- -------------------- ---------
250112     Hickman                       
250209     Reyes                         
250330     Gustavel                      
250365     Cheswick                      
250001     Thompson                      
250475     Hess                          
250488     Osman                         
250104     Blair                         
250559     Romilda                       
250600     Zollman                       
250650     Lilley                        

EMPLOYEEID LASTNAME             SHIPPEDDA
---------- -------------------- ---------
250700     Jones                         
250880     Goldwear                      
250103     Jones                         
250944     Thompson                      
251175     Darby                         
251007     Krastner                      
251030     Moore                         
251066     Rodgers                       
251135     Gostler                       
250200     Hernandez                     
250127     Watson                        

EMPLOYEEID LASTNAME             SHIPPEDDA
---------- -------------------- ---------
250125     Stevens                       
250106     Loreto                        
250206     Guiomar                       

36 rows selected. 
*/
--*****QUESTION 2******

SELECT IP.PARTNUMBER, C.CATEGORYID, C.CATEGORYNAME, IP.STOCKPRICE, IP.STOCKLEVEL
FROM CATEGORY C RIGHT JOIN INVENTORYPART IP
ON C.CATEGORYID = IP.CATEGORYID
WHERE IP.STOCKPRICE BETWEEN 50 AND 150 
AND IP.STOCKLEVEL > (SELECT AVG(STOCKLEVEL)
FROM INVENTORYPART);

SELECT IP.PARTNUMBER, C.CATEGORYID, C.CATEGORYNAME, IP.STOCKPRICE, 
ROUND(AVG(STOCKLEVEL), 2) AS STOCKLEVEL
FROM CATEGORY C RIGHT JOIN INVENTORYPART IP
ON C.CATEGORYID = IP.CATEGORYID
WHERE STOCKPRICE BETWEEN 50 AND 150 
GROUP BY PARTNUMBER, C.CATEGORYID, CATEGORYNAME, STOCKPRICE;
/* RESULTS:
A)

PARTNUMBER CATEGORYID CATEGORYNAME                   STOCKPRICE STOCKLEVEL
---------- ---------- ------------------------------ ---------- ----------
C-001      BASE       Basics                              70.97         23
MOM-001    BASE       Basics                              59.93         45
MOM-002    BASE       Basics                              95.99         55
MOM-003    BASE       Basics                              83.99         30
ADT-002    CBL        Cables                              63.99         30
ADT-007    CBL        Cables                              74.99         45
BRK-004    CBL        Cables                              62.79         55
DVD-002    STOR       Storage                             95.99         27
MEM-007    STOR       Storage                             63.99         27
MEM-012    STOR       Storage                             99.99         36
CRD-001                                                   89.99         60

PARTNUMBER CATEGORYID CATEGORYNAME                   STOCKPRICE STOCKLEVEL
---------- ---------- ------------------------------ ---------- ----------
CRD-003                                                   59.99         60

12 rows selected. 

B)
PARTNUMBER CATEGORYID CATEGORYNAME                   STOCKPRICE STOCKLEVEL
---------- ---------- ------------------------------ ---------- ----------
PRT-005    ACS        Accessories                          89.4          9
PRT-006    ACS        Accessories                          59.4         10
SCN-001    ACS        Accessories                          77.4          9
SCN-002    ACS        Accessories                         149.4         11
C-001      BASE       Basics                              70.97         23
MOM-001    BASE       Basics                              59.93         45
MOM-002    BASE       Basics                              95.99         55
MOM-003    BASE       Basics                              83.99         30
MOM-004    BASE       Basics                              65.99         12
MON-001    BASE       Basics                               99.4         10
MON-002    BASE       Basics                              139.4         10

PARTNUMBER CATEGORYID CATEGORYNAME                   STOCKPRICE STOCKLEVEL
---------- ---------- ------------------------------ ---------- ----------
MON-003    BASE       Basics                               79.4         10
MON-005    BASE       Basics                             149.99         10
MON-006    BASE       Basics                              95.99         10
MON-007    BASE       Basics                             107.99         10
MON-008    BASE       Basics                              83.99         10
ADT-002    CBL        Cables                              63.99         30
ADT-007    CBL        Cables                              74.99         45
BRK-004    CBL        Cables                              62.79         55
MOD-002    NET        Networking                          53.99          8
MOD-003    NET        Networking                         121.99          2
MOD-005    NET        Networking                          53.99         15

PARTNUMBER CATEGORYID CATEGORYNAME                   STOCKPRICE STOCKLEVEL
---------- ---------- ------------------------------ ---------- ----------
PS-001     POW        Power                               59.97          5
PS-003     POW        Power                               71.77         10
P-008      PROC       Processors                         119.99         22
ADT-001    STOR       Storage                             55.99         15
DVD-001    STOR       Storage                            119.99         15
DVD-002    STOR       Storage                             95.99         27
MEM-006    STOR       Storage                             95.99         15
MEM-007    STOR       Storage                             63.99         27
MEM-008    STOR       Storage                             77.99         15
MEM-009    STOR       Storage                             51.99         12
MEM-012    STOR       Storage                             99.99         36

PARTNUMBER CATEGORYID CATEGORYNAME                   STOCKPRICE STOCKLEVEL
---------- ---------- ------------------------------ ---------- ----------
CS-001     HOME       Monitoring                          50.97          4
CRD-001                                                   89.99         60
CRD-003                                                   59.99         60
CRD-009                                                  119.99          5
PS-002                                                    53.97         15

38 rows selected. 
*/
--*****QUESTION 3******
SELECT S.SHIPPERID, SHIPPERNAME
FROM SHIPPER S LEFT JOIN SHIPMENT SH
ON S.SHIPPERID = SH.SHIPPERID
WHERE SH.SHIPPERID IS null;

/* RESULTS:
 SHIPPERID SHIPPERNAME              
---------- -------------------------
         9 Bike Courier             
        10 Mobile Runner            
        11 California Air Express   
        12 Global Carrier    
*/

--**********QUESTION 4**********
SELECT CUSTOMERID
FROM CUSTOMER
MINUS
SELECT CUSTOMERID
FROM CUSTORDER;

/* RESULTS:
CUSTOMERID
----------
C-200055
C-200075
C-200077
C-200078
C-200080
I-200028
I-200055
I-200057
I-200077
I-200107
I-200113

CUSTOMERID
----------
I-200136
I-200158
I-200159
I-200160

15 rows selected. 
*/

--**********QUESTION 5**********
SELECT SUBSTR(PHONE, 1, 3) AS AREACODE
FROM SUPPLIER
INTERSECT
SELECT SUBSTR(PHONE, 1, 3)
FROM CUSTOMER
INTERSECT
SELECT SUBSTR(PHONE, 1, 3)
FROM SHIPPER;
/* RESULTS:
ARE
---
305
503
517
919
972
*/

--**********QUESTION 6**********
SELECT FIRSTNAME, LASTNAME, HIREDATE, BIRTHDATE, TO_CHAR(HIREDATE, 'MON') AS MONTH
FROM EMPLOYEE
INTERSECT
SELECT FIRSTNAME, LASTNAME, HIREDATE, BIRTHDATE, TO_CHAR(BIRTHDATE, 'MON')
FROM EMPLOYEE;
/* RESULTS:
FIRSTNAME       LASTNAME             HIREDATE  BIRTHDATE MON
--------------- -------------------- --------- --------- ---
Allison         Roland               04-APR-14 08-APR-88 APR
David           Gostler              06-JUN-14 04-JUN-84 JUN
Gregory         Hettinger            25-JAN-02 20-JAN-84 JAN
Malik           Krastner             06-JUN-08 08-JUN-85 JUN
Maria           Guiomar              01-DEC-11 01-DEC-79 DEC
Melissa         Alvarez              23-JUL-05 17-JUL-85 JUL
Ryan            Thompson             20-JUN-05 20-JUN-86 JUN
Shannon         Darby                14-APR-19 14-APR-93 APR
Steve           Cochran              17-JUN-13 03-JUN-90 JUN
Todd            Vigus                11-NOV-05 20-NOV-90 NOV

10 rows selected. 
*/

--*****QUESTION 7******
SELECT COMPANYNAME, ADDRESS
FROM SUPPLIER
WHERE CITY = 'Denver'
UNION
SELECT CUSTFIRSTNAME || ' ' || CUSTLASTNAME, ADDRESS
FROM CUSTOMER
WHERE CITY = 'Denver';
/* RESULTS:
COMPANYNAME                          ADDRESS                                 
------------------------------------ ----------------------------------------
Brad Arquette                        2599 Ben Hill Rd.                       
Carey Dailey                         234 Sheridan Dr.                        
Electronics Cafe                     1099 N. 10th St.                        
Security Associates                  2500 Locust Blvd.              
*/

--**********QUESTION 8**********
SELECT FIRSTNAME || ' ' || LASTNAME AS NAME
FROM EMPLOYEE
MINUS
SELECT SHIPNAME
FROM SHIPMENT;

SELECT FIRSTNAME || ' ' || LASTNAME AS NAME
FROM EMPLOYEE
INTERSECT
SELECT SHIPNAME
FROM SHIPMENT;

/* RESULTS:
NAME                                
------------------------------------
Calie Zollman
Carmen Romilda
David Gostler
Devin Natlen
Edna Lilley
Gary Goldwear
Gina Cheswick
Grayson Nairn
Gregory Hettinger
Harold Sidney
Harper Loreto

NAME                                
------------------------------------
Hunter Hickman
Jack Trale
Jamie Osman
Jaylen Moore
Joanne Rosner
Joseph Platt
Kasey Stevens
Kayla Underwood
Kristen Gustavel
Laura Rodgers
Lauren Hernandez

NAME                                
------------------------------------
Madison Meyer
Malik Krastner
Maria Guiomar
Marilyn Thompson
Melissa Alvarez
Michael Blair
Rita Jones
Ronald Day
Rosario Gomez
Ryan Thompson
Sandra Daniels

NAME                                
------------------------------------
Shannon Darby
Shelby Watson
Steve Cochran
Steve Hess
Todd Vigus
Trinidad Reyes
Xavier Deagen

40 rows selected. 


NAME                                
------------------------------------
Allison Roland
Charles Jones
*/

--**********QUESTION 9**********
SELECT CITY
FROM CUSTOMER
INTERSECT
SELECT CITY
FROM SUPPLIER;
/* RESULTS:
CITY                
--------------------
Albany
Auburn
Bonifay
Carson City
Charleston
Denver
Portland
San Francisco
Springfield
Whales
Winston

11 rows selected. 
*/

--**********QUESTION 10**********
SELECT PARTNUMBER, STOCKPRICE, STOCKLEVEL
FROM INVENTORYPART
WHERE STOCKPRICE IN 
(SELECT MIN(STOCKPRICE) 
FROM INVENTORYPART 
UNION
SELECT MAX(STOCKPRICE)
FROM INVENTORYPART);

/* RESULTS:
PARTNUMBER STOCKPRICE STOCKLEVEL
---------- ---------- ----------
BB-002        1717.99         15
POW-002          1.19          8
POW-003          1.19         30
*/

/*
Question 11. What is the difference between inner joins and outer joins?
Inner joins return rows that are a match in both tables. Outer joins either return the full left or 
right table, including the mathcing of both tables.

Question 12. What is the difference between a left join and a right join?

Left join returns the parent table.
Right join returns the child table. 
Both return the matching of both tables.

Question 13. Explain what happens when you add more attributes to both SELECT
clauses in an intersect between two queries. How does it impact how an
Intersect operation works?

    By adding more attributes, the query will then have to 
search through the new attribute's data for similarities.
This can cause for no similarities for the tables.

Question 14. Explain the use of the UNION operator. Is it constrained by the same
rules of joins? Explain your response.

    No, UNION is constrained by having every select statement must have the same number of columns,
columns must have similar data types, and 
the columns in every select statement must be in the same order.
Union and inner join produce the same outcome. Unions need the columns to be in order unlike 
inner joins. 

Question 15. Explain how the MINUS operation works. Does it matter which query is
first? Explain your response.
    
    The Minus operator returns all rows form the first select/table that do not match with
    any form the second select/table. Yes, it matters which query is first, this will
    change the result. 

*/