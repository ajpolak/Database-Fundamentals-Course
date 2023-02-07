/*
Austin Polak
CNIT 27200 Fall 2020
Lab Time: Wednnesday 11:06Am
Duration: 7hour (04/7 6:36Pm)
*/
-- ********Question 1*****
SELECT * FROM SUPPLIER WHERE CONTACTNAME = 'Johanna Tighe';
SELECT * FROM SUPPLIER WHERE CONTACTNAME = 'Johanna Martinez';
UPDATE SUPPLIER
SET CONTACTNAME='Johanna Martinez', ADDRESS='489 Gregory Drive', 
CITY='Grand Junction', STATE='CO', POSTALCODE='81504'
WHERE SUPPLIERID='PA-399';

COMMIT;
/*  RESULTS:
SUPPLIERID COMPANYNAME                    CONTACTNAME          CONTA ADDRESS                                  CITY                 ST POSTALCODE PHONE        CELLPHONE    EMAILADDR                                         
---------- ------------------------------ -------------------- ----- ---------------------------------------- -------------------- -- ---------- ------------ ------------ --------------------------------------------------
PA-399     Secure Solutions               Johanna Tighe        Mrs.  7473 McCarthy Ave.                       Albany               NY 12211      315-654-8845 315-654-9976 jtighe@securesol.com                              

1 row updated.
no rows selected

SUPPLIERID COMPANYNAME                    CONTACTNAME          CONTA ADDRESS                                  CITY                 ST POSTALCODE PHONE        CELLPHONE    EMAILADDR                                         
---------- ------------------------------ -------------------- ----- ---------------------------------------- -------------------- -- ---------- ------------ ------------ --------------------------------------------------
PA-399     Secure Solutions               Johanna Martinez     Mrs.  489 Gregory Drive                        Grand Junction       CO 81504      315-654-8845 315-654-9976 jtighe@securesol.com                              

Commit complete.
*/
--*****QUESTION 2*****
SET LINESPACE 200
SELECT SHIPPERID, SHIPPERNAME, CONTACTNAME, PHONE
FROM SHIPPER;

INSERT INTO SHIPPER(SHIPPERID, SHIPPERNAME, CONTACTNAME, PHONE)
VALUES('13', 'Leasing ROlls', 'Austin Polak', '219-867-5309');

INSERT INTO SHIPPER(SHIPPERID, SHIPPERNAME, CONTACTNAME, PHONE)
VALUES('14', 'Granny Mail', 'Torrey Polak', '329-865-2209');

COMMIT;
/* RESULTS:

 SHIPPERID SHIPPERNAME               CONTACTNAME          PHONE       
---------- ------------------------- -------------------- ------------
         1 Argen Shipping            Tim Mantel           503-696-9000
         2 Channel Express           Gloria Trackner      303-434-8000
         3 Federal Express           Michael Emilson      517-486-4643
         4 U.S. Postal Service       Suzanne Carroll      919-486-4745
         5 Shipping Experts          Greg Hemmel          972-848-8396
         6 Next Day Air              Lana Brown           972-747-0747
         7 United Parcel Service     Julia Rosewill       471-774-2527
         8 Mail Hub                  Christine Roush      305-267-9966
         9 Bike Courier              Trevor Burke         972-534-9433
        10 Mobile Runner             Robert Andrews       972-434-2640
        11 California Air Express    Tyler Stevens        415-763-8694

 SHIPPERID SHIPPERNAME               CONTACTNAME          PHONE       
---------- ------------------------- -------------------- ------------
        12 Global Carrier            Rita Hyatt           503-309-6547

12 rows selected. 
1 row inserted.
1 row inserted.

 SHIPPERID SHIPPERNAME               CONTACTNAME          PHONE       
---------- ------------------------- -------------------- ------------
         1 Argen Shipping            Tim Mantel           503-696-9000
         2 Channel Express           Gloria Trackner      303-434-8000
         3 Federal Express           Michael Emilson      517-486-4643
         4 U.S. Postal Service       Suzanne Carroll      919-486-4745
         5 Shipping Experts          Greg Hemmel          972-848-8396
         6 Next Day Air              Lana Brown           972-747-0747
         7 United Parcel Service     Julia Rosewill       471-774-2527
         8 Mail Hub                  Christine Roush      305-267-9966
         9 Bike Courier              Trevor Burke         972-534-9433
        10 Mobile Runner             Robert Andrews       972-434-2640
        11 California Air Express    Tyler Stevens        415-763-8694

 SHIPPERID SHIPPERNAME               CONTACTNAME          PHONE       
---------- ------------------------- -------------------- ------------
        12 Global Carrier            Rita Hyatt           503-309-6547
        13 Leasing ROlls             Austin Polak         219-867-5309
        14 Granny Mail               Torrey Polak         329-865-2209

14 rows selected. 

Commit complete.

*/
--*****QUESTION 3******
SELECT COUNT(PARTNUMBER)
FROM INVENTORYPART
WHERE CATEGORYID='CBL';

UPDATE INVENTORYPART
SET CATEGORYID = NULL
WHERE PARTNUMBER
IN(SELECT PARTNUMBER
FROM INVENTORYPART
WHERE CATEGORYID='CBL');

SELECT COUNT(PARTNUMBER)
FROM INVENTORYPART
WHERE CATEGORYID IS NULL;

ROLLBACK;

UPDATE INVENTORYPART
SET CATEGORYID = NULL
WHERE PARTNUMBER
IN(SELECT PARTNUMBER
FROM INVENTORYPART
WHERE CATEGORYID='CBL');

COMMIT;

DELETE FROM CATEGORY
WHERE CATEGORYID = 'CBL';
COMMIT;

SELECT *
FROM CATEGORY;
/* RESULTS:
COUNT(PARTNUMBER)
-----------------
               36
36 rows updated.

COUNT(PARTNUMBER)
-----------------
                0
COUNT(PARTNUMBER)
-----------------
               68
Rollback complete.
36 rows updated.
Commit complete.
1 row deleted.
Commit complete.
CATEGORYID CATEGORYNAME                   DESCRIPTION                                                                                         
---------- ------------------------------ ----------------------------------------------------------------------------------------------------
ACS        Accessories                    Scanners, Printers, Cameras                                                                         
BASE       Basics                         Casing, Barebone, Monitors, Mice                                                                    
KEY        Keyboards                      Ergonomic, QWERTY, Wireless                                                                         
BAT        Batteries                      Laptop Battery, Battery Charger                                                                     
BLU        Bluetooth                      Speakers                                                                                            
COMP       Computers                      Assembled Computers                                                                                 
FIT        Fitness                        Fitness Trackers, Health Monitoring                                                                 
NET        Networking                     Switches, Wireless, Routers                                                                         
PORT       Ports                          USB, Adapter, DisplayPort                                                                           
POW        Power                          Power Supplies                                                                                      
PROC       Processors                     Ryzen, Athlon, Pentium, Core, Xeon, Fans                                                            

CATEGORYID CATEGORYNAME                   DESCRIPTION                                                                                         
---------- ------------------------------ ----------------------------------------------------------------------------------------------------
SFTW       Software                       Games, Productivity, Accounting, Maps                                                               
STOR       Storage                        DVD, Hard Drives, Memory                                                                            
TAB        Tablets                        Mobile Computers                                                                                    
HOME       Monitoring                     Home Security Systems                                                                               

15 rows selected. 
*/

--**********QUESTION 4**********
INSERT INTO EMPLOYEE
VALUES('251180', 'Polak', 'Austin', 'Greeter', '155 Holley Road', 'Lafayette', 'IN', '47909',
'219-456-5555', 'Y', '03-JAN-13', '09-OCT-17', 'Temporary', 'Kelly Grp', '359', '30-OCT-96',
'143', '250330', 'austpolo1@pencomp.com', '25.00');

INSERT INTO PACKINGSLIP
VALUES('M160', '1', '251180', '05-JAN-20');
INSERT INTO PACKINGSLIP
VALUES('M161', '2', '251180', '15-MAY-20');

SELECT E.EMPLOYEEID, LASTNAME, PACKAGENUMBER, SHIPPEDDATE, S.SHIPMENTID, ORDERID
FROM SHIPMENT S INNER JOIN PACKINGSLIP PS
ON S.SHIPMENTID = PS.SHIPMENTID
INNER JOIN EMPLOYEE E
ON E.EMPLOYEEID = PS.EMPLOYEEID
WHERE E.EMPLOYEEID = '251180';

COMMIT;
/* RESULTS:
1 row inserted.
1 row inserted.
1 row inserted.

EMPLOYEEID LASTNAME             PACKAGENUMBER SHIPPEDDA SHIPMENTID ORDERID   
---------- -------------------- ------------- --------- ---------- ----------
251180     Polak                            1 05-JAN-20 M160       3001000799
251180     Polak                            2 15-MAY-20 M161       3001000803
Commit complete.
*/

--**********QUESTION 5**********
SELECT COUNT(*)
FROM TIMECARDLINE;

SELECT EMPLOYEEID, SALARYWAGE
FROM EMPLOYEE
WHERE JOBTITLE = 'Engineer';

INSERT INTO TIMECARDLINE(EMPLOYEEID, DATETIMESTART)
SELECT EMPLOYEEID, TRUNC(ADD_MONTHS(SYSDATE,-2), 'MM')
FROM EMPLOYEE
WHERE JOBTITLE = 'Engineer' ;

SELECT EMPLOYEEID, to_char(DATETIMESTART, 'fmMonth ddth, yyyy'), SYSDATE
FROM TIMECARDLINE;

ROLLBACK;

INSERT INTO TIMECARDLINE(EMPLOYEEID, DATETIMESTART)
VALUES(251135, TO_DATE('01-31-2021', 'MM-DD-YYYY'));
INSERT INTO TIMECARDLINE(EMPLOYEEID, DATETIMESTART)
VALUES(251154, TO_DATE('01-31-2021', 'MM-DD-YYYY'));
INSERT INTO TIMECARDLINE(EMPLOYEEID, DATETIMESTART)
VALUES(251167, TO_DATE('01-31-2021', 'MM-DD-YYYY'));
/* RESULTS:

  COUNT(*)
----------
         0

EMPLOYEEID SALARYWAGE
---------- ----------
250104          88500
250200          76100
250209          82200
250559          80100
250944          98600

EMPLOYEEID TO_CHAR(DATETIMESTAR SYSDATE  
---------- -------------------- ---------
250104     February 1st, 2021   07-APR-21
250200     February 1st, 2021   07-APR-21
250209     February 1st, 2021   07-APR-21
250559     February 1st, 2021   07-APR-21
250944     February 1st, 2021   07-APR-21

Rollback complete.
  COUNT(*)
----------
         0
         
1 row inserted.
1 row inserted.
1 row inserted.
EMPLOYEEID TO_CHAR(DATETIMESTAR SYSDATE  
---------- -------------------- ---------
251135     January 31st, 2021   07-APR-21
251154     January 31st, 2021   07-APR-21
251167     January 31st, 2021   07-APR-21
*/

--**********QUESTION 6**********
SELECT SHIPPERID, SHIPPERNAME, MAXPACKAGEWEIGHT
FROM SHIPPER;

UPDATE SHIPPER
SET MAXPACKAGEWEIGHT = (maxpackageweight + 45)
WHERE MAXPACKAGEWEIGHT > (SELECT AVG(MAXPACKAGEWEIGHT)
FROM SHIPPER);

COMMIT;
/* RESULTS:
 SHIPPERID SHIPPERNAME               MAXPACKAGEWEIGHT
---------- ------------------------- ----------------
         1 Argen Shipping                         100
         2 Channel Express                        100
         3 Federal Express                        150
         4 U.S. Postal Service                     85
         5 Shipping Experts                       200
         6 Next Day Air                           250
         7 United Parcel Service                  175
         8 Mail Hub                               200
         9 Bike Courier                            25
        10 Mobile Runner                           75
        11 California Air Express                 200

 SHIPPERID SHIPPERNAME               MAXPACKAGEWEIGHT
---------- ------------------------- ----------------
        12 Global Carrier                          75
        13 Leasing ROlls                             
        14 Granny Mail                               

14 rows selected. 

6 rows updated.
 SHIPPERID SHIPPERNAME               MAXPACKAGEWEIGHT
---------- ------------------------- ----------------
         1 Argen Shipping                         100
         2 Channel Express                        100
         3 Federal Express                        195
         4 U.S. Postal Service                     85
         5 Shipping Experts                       245
         6 Next Day Air                           295
         7 United Parcel Service                  220
         8 Mail Hub                               245
         9 Bike Courier                            25
        10 Mobile Runner                           75
        11 California Air Express                 245

 SHIPPERID SHIPPERNAME               MAXPACKAGEWEIGHT
---------- ------------------------- ----------------
        12 Global Carrier                          75
        13 Leasing ROlls                             
        14 Granny Mail                               

14 rows selected. 
Commit complete.
*/
--*****QUESTION 7******
SELECT ORDERID
FROM CUSTORDER
WHERE CUSTOMERID = 'I-200063';

SELECT SHIPMENTID, ORDERID
FROM SHIPMENT
WHERE ORDERID IN ('3000000204', '3000000471', '3001000551', '3001000662');

SELECT SHIPMENTID, ORDERID
FROM SHIPMENT
WHERE SHIPMENTID IN ('M041', 'H253', 'M102', 'M127');

SELECT SHIPMENTID, ORDERID
FROM SHIPMENT
WHERE SHIPMENTID IN '3001000662';

SELECT PACKAGENUMBER
FROM PACKINGSLIP
WHERE SHIPMENTID IN ('M041', 'H253', 'M102', 'M127');
SELECT ORDERID
FROM SHIPPEDITEM
WHERE SHIPMENTID IN ('M041', 'H253', 'M102', 'M127');
ROLLBACK;

DELETE FROM SHIPPEDITEM
WHERE (SHIPMENTID, ORDERID, PACKAGENUMBER) IN (('M041','3000000204', 1), ('H253','3000000471', 1), 
('M102','3001000551', 1), ('M127','3001000662', 1));

DELETE FROM PACKINGSLIP
WHERE (SHIPMENTID, PACKAGENUMBER) IN (('M041', 1), ('H253',1), ('M102',1), ('M127',1));

DELETE FROM CUSTORDERLINE
WHERE ORDERID IN ('3000000204', '3000000471', '3001000551', '3001000662');

DELETE FROM SHIPMENT
WHERE SHIPMENTID IN ('M041', 'H253', 'M102', 'M127');

DELETE FROM CUSTORDER
WHERE (ORDERID,CUSTOMERID) IN (('3000000204','I-200063'), ('3000000471','I-200063'),
('3001000551','I-200063'), ('3001000662','I-200063'));

DELETE FROM CUSTOMER
WHERE CUSTOMERID IN ('I-200063');

SELECT CUSTOMERID, ORDERID
FROM CUSTORDER
WHERE CUSTOMERID ='I-200063';

COMMIT;
/* RESULTS:
ORDERID   
----------
3000000204
3000000471
3001000551
3001000662
SHIPMENTID
----------
M041
SHIPMENTID
----------
H253
SHIPMENTID
----------
M102
SHIPMENTID
----------
L173

PACKAGENUMBER
-------------
            1
            1
            1
            1
            
12 rows deleted.
4 rows deleted.
12 rows deleted.
4 rows deleted.
4 rows deleted.
1 row deleted.
no rows selected
Commit complete.
*/

--*****QUESTION 8******
SELECT U.Username, SYSTIMESTAMP
FROM USER_USERS U, DUAL;

/* RESULTS:

USERNAME   SYSTIMESTAMP                          
--------- --------------------------------------
AJPOLAK   07-APR-21 06.34.11.593443000 PM -04:00
*/

/*
Question 9. Explain the difference between COMMIT and ROLLBACK. What
happens when you use each one?
COMMIT will keep the changes you just made to permanent changes. ROLLBACK lets you return to 
the database state before changes were made.

Question 10. Can an employeeID be added to just the PACKINGSLIP table and not
the EMPLOYEE table? Explain how this could happen in a database and
what quality controls would be missing.
I don't believe you can. If this did happen, the database would have referential integrity errors. 
The employeeid needs to be create first in the EMPLOYEE TABLE. 

Question 11. What are some limitations when making an update to a record
Must put the correct amount of numbers in even if it is a single digit number. Otherwise it will resukt in an error.
The attributes must match the attributes in the database. Updates only one table, but canupdate multiple rows at a time.
*/