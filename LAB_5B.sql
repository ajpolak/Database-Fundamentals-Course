/*
Austin Polak
CNIT 27200 Fall 2020
Lab Time: Wednesday 8:05pm
Duration: hours (03/17 11:53am~)
*/
-- ********Question 1*****
SELECT SUPPLIERID, COMPANYNAME, CONTACTNAME
FROM SUPPLIER
WHERE SUPPLIERID NOT IN
(SELECT SUPPLIERID
FROM SUPPLIEDPART);

/* 
SUPPLIERID COMPANYNAME                    CONTACTNAME         
---------- ------------------------------ --------------------
AM-450     Computer Club                  Rob Thomas          
PA-385     Wearable Techies               Julie Evans         
PA-399     Secure Solutions               Johanna Tighe       
SE-450     Security Associates            Gina Wendal         
SE-455     Cyber Tech                     Robert Case         
*/
--*****QUESTION 2******
SET LINESIZE 200
SELECT PARTNUMBER, UNITCOST, SUPPLIERID, COMPANYNAME, STATE
FROM SUPPLIER
WHERE STATE = 'NM' OR STATE = 'AZ'
AND SUPPLIERID IN (SELECT SUPPLIERID FROM SUPPLIEDPART WHERE UNITCOST < 500);

SET LINESIZE 200
SELECT PARTNUMBER, UNITCOST, S.SUPPLIERID, COMPANYNAME, STATE
FROM SUPPLIER S INNER JOIN SUPPLIEDPART SP
ON S.SUPPLIERID = SP.SUPPLIERID
WHERE STATE = 'NM' OR STATE = 'AZ'
AND UNITCOST < 500;
/* RESULTS:
PARTNUMBER   UNITCOST SUPPLIERID COMPANYNAME                    ST
---------- ---------- ---------- ------------------------------ --
BRK-010        124.65 MSN-105    Computer Medic                 AZ
MIC-010        134.85 MSN-105    Computer Medic                 AZ
PRT-003         419.4 NA-450     Cables and Kits                NM
MOD-003        125.97 NA-450     Cables and Kits                NM
ADT-006        289.85 NA-450     Cables and Kits                NM
PS-001         167.22 PA-384     Cyber Saver                    AZ
PS-002         285.56 PA-384     Cyber Saver                    AZ
PS-003         283.88 PA-384     Cyber Saver                    AZ

8 rows selected. 
*/
--*****QUESTION 3******
SELECT CO.ORDERID, COUNT(PARTNUMBER) AS TOTAL_PARTS, SUM(UNITPRICE) AS TOTAL_AMT, MIN(UNITPRICE) AS MIN_PRICE, MAX(UNITPRICE) AS MAX_PRICE
FROM CUSTORDER CO INNER JOIN CUSTORDERLINE COL
ON CO.ORDERID = COL.ORDERID
WHERE CUSTOMERID = 'I-200157' 
group by CO.ORDERID;

SELECT CO.ORDERID, COUNT(PARTNUMBER) AS TOTAL_PARTS, SUM(UNITPRICE) AS TOTAL_AMT, MIN(UNITPRICE) AS MIN_PRICE, MAX(UNITPRICE) AS MAX_PRICE
FROM CUSTORDER CO INNER JOIN CUSTORDERLINE COL
ON CO.ORDERID = COL.ORDERID
WHERE CUSTOMERID = 'I-200157'
group by CO.ORDERID
HAVING SUM(UNITPRICE) > 200;

/* RESULTS:
A)
ORDERID    TOTAL_PARTS  TOTAL_AMT  MIN_PRICE  MAX_PRICE
---------- ----------- ---------- ---------- ----------
3001000521           3     219.93       9.99     139.99
3001000668           1    1846.79    1846.79    1846.79
3000000383           1        129        129        129
3001000607           3     119.48       29.5      49.99
3001000515           4      99.92       1.99      39.99

B)
ORDERID    TOTAL_PARTS  TOTAL_AMT  MIN_PRICE  MAX_PRICE
---------- ----------- ---------- ---------- ----------
3001000521           3     219.93       9.99     139.99
3001000668           1    1846.79    1846.79    1846.79          
*/

--**********QUESTION 4**********
SELECT CO.ORDERID, ORDERDATE, SHIPMENTID, CUSTFIRSTNAME || ' ' || CUSTLASTNAME AS REQUESTED_BY, STATE
FROM CUSTOMER C INNER JOIN CUSTORDER CO
ON C.CUSTOMERID = CO.CUSTOMERID 
INNER JOIN SHIPMENT S
ON CO.ORDERID = S.ORDERID
WHERE CO.ORDERID IS NOT NULL
AND SHIPMENTID NOT IN
(SELECT SHIPMENTID
FROM PACKINGSLIP);
/* RESULTS:
ORDERID    ORDERDATE SHIPMENTID REQUESTED_BY                         ST
---------- --------- ---------- ------------------------------------ --
3001000797 29-MAR-20 H380       Richard Kluth                        DE
3001000805 31-MAR-20 H383       Kevin Zubarev                        MI
3001000800 30-MAR-20 H381       Kelly Jordan                         FL
3001000807 31-MAR-20 H384       Courtney Cortez                      CT
3001000801 30-MAR-20 H382       Sonny Nagel                          CT
3001000803 30-MAR-20 M161       Shirley Osborne                      GA
3001000799 29-MAR-20 M160       Karen Mangus                         FL
3001000703 01-MAR-20 M137       Joan Hedden                          AR
3001000750 13-MAR-20 M147       Louise Cool                          ID
3001000790 27-MAR-20 L257       Verna McGrew                         AL
3001000802 30-MAR-20 L260       Jamie Thompson                       GA

ORDERID    ORDERDATE SHIPMENTID REQUESTED_BY                         ST
---------- --------- ---------- ------------------------------------ --
3000000030 13-JUL-19 L006       David Tietz                          MN
3001000667 23-FEB-20 M129       John Skadberg                        KY
3001000804 30-MAR-20 L261       Mary Jo Wales                        OR
3001000798 29-MAR-20 L259       Tom Baker                            KY
3001000806 31-MAR-20 L262       Daniel Rodkey                        CO
3001000791 27-MAR-20 L258       Steven Yaun                          IN
3001000808 31-MAR-20 M162       Andy Huegel                          DE
3001000796 29-MAR-20 M159       Janet Reece                          MA

19 rows selected. 
*/

--**********QUESTION 5**********
SELECT SH.SHIPPERID, SHIPPERNAME, CONTACTNAME, EMAILADDR, COUNT(SHIPMENTID) AS SHIPMENT_COUNT
FROM SHIPPER SH INNER JOIN SHIPMENT S
ON SH.SHIPPERID = S.SHIPPERID 
group by SH.SHIPPERID, SHIPPERNAME, CONTACTNAME, EMAILADDR
ORDER BY SHIPPERNAME;
/* RESULTS:
 SHIPPERID SHIPPERNAME               CONTACTNAME          EMAILADDR                                          SHIPMENT_COUNT
---------- ------------------------- -------------------- -------------------------------------------------- --------------
         1 Argen Shipping            Tim Mantel           tmantel@argen.com                                             138
         2 Channel Express           Gloria Trackner      gtrackner@chexpress.com                                       159
         3 Federal Express           Michael Emilson      emike@fedex.com                                               164
         8 Mail Hub                  Christine Roush      croush@mailhub.com                                             37
         6 Next Day Air              Lana Brown           lanab@nda.com                                                  51
         5 Shipping Experts          Greg Hemmel          ghemmel@shipex.com                                             81
         4 U.S. Postal Service       Suzanne Carroll      suzyc@usps.gov                                                139
         7 United Parcel Service     Julia Rosewill       juliar@ups.com                                                 37

8 rows selected. 
*/

--**********QUESTION 6**********
COL TOTALPRICE FORMAT $99999.99
SELECT PO.PURCHORDERID, DATEORDERED, CONTACTNAME, SUM(ORDEREDUNITCOST) AS TOTALCOST, (SUM(ORDEREDUNITCOST) / 3) AS PAYMENTS,  ROUND(AVG(SHIPPINGLAG),2) AS AVG_SHIPPINGLAG
FROM SUPPLIER S INNER JOIN PURCHASEORDER PO
ON S.SUPPLIERID = PO.SUPPLIERID
INNER JOIN PURCHORDERLINE POL
ON PO.SUPPLIERID = POL.SUPPLIERID
AND PO.PURCHORDERID = POL.PURCHORDERID 
INNER JOIN SUPPLIEDPART SP
ON S.SUPPLIERID = SP.SUPPLIERID
group by PO.PURCHORDERID, DATEORDERED, CONTACTNAME
ORDER BY PO.PURCHORDERID;

/* RESULTS:

PURCHORDER DATEORDER CONTACTNAME           TOTALCOST   PAYMENTS AVG_SHIPPINGLAG
---------- --------- -------------------- ---------- ---------- ---------------
EE99-001   12-APR-20 Dorothy Beering        74402.09 24800.6967            3.14
EE99-002   26-APR-20 Travis Honn               52701      17567             3.2
EE99-003   20-MAY-20 Brenda Pritchett      120337.14   40112.38            2.67
EE99-004   20-MAY-20 Paul Smith             20616.55 6872.18333             2.6
EE99-005   23-MAY-20 Gary Mikels            23376.21    7792.07            1.67
EE99-006   23-MAY-20 Kelli Jones           113104.03 37701.3433               2
EE99-007   24-MAY-20 Sandy Goodman          11852.85    3950.95             3.2
EE99-008   26-JUL-20 Timothy Neal              15354       5118               3
EE99-009   27-JUL-20 Wade Holle             34956.35 11652.1167               3
EE99-010   27-JUL-20 Lance Andrews          46774.92   15591.64            2.17
EE99-011   27-JUL-20 Yauleng Depoe          13812.12    4604.04               2

PURCHORDER DATEORDER CONTACTNAME           TOTALCOST   PAYMENTS AVG_SHIPPINGLAG
---------- --------- -------------------- ---------- ---------- ---------------
EE99-012   27-JUL-20 Darlene Jenkins        27532.68    9177.56            2.67
EE99-013   08-AUG-20 Kevin Martin           20071.88 6690.62667            3.25
EE99-014   08-AUG-20 Alice Mynhier           9520.15 3173.38333             2.4
EE99-015   13-AUG-20 Thurman Mezzo           6005.92 2001.97333            2.25
EE99-016   03-SEP-20 Adam Cyr               44432.08 14810.6933            2.45
EE99-017   04-SEP-20 Stephen Bird          133967.04   44655.68             2.5
EE99-018   05-SEP-20 Elizabeth Clark       144787.68   48262.56            2.56
EE99-019   05-SEP-20 David Becker           11516.64    3838.88             1.5
EE99-021   06-SEP-20 Debra Cruz              6333.21    2111.07               2
EE99-022   06-SEP-20 William Newlon         31453.75 10484.5833               3
EE99-023   07-SEP-20 Jennie Fry             215143.5    71714.5            2.92

PURCHORDER DATEORDER CONTACTNAME           TOTALCOST   PAYMENTS AVG_SHIPPINGLAG
---------- --------- -------------------- ---------- ---------- ---------------
EE99-024   09-SEP-20 Jamie Pickett          78073.04 26024.3467            3.13
EE99-026   10-SEP-20 Tim White                1478.8 492.933333             2.5
EE99-027   10-SEP-20 Gordon Mayes          232909.08   77636.36            2.58
EE99-028   10-SEP-20 Pam Krick               82630.3 27543.4333             2.8
EE99-029   10-SEP-20 Donald Blythe           5755.56    1918.52             2.5

27 rows selected. 


*/

--**********QUESTION 7**********
SELECT C.CUSTOMERID, C.EMAILADDR, ORDERDATE, SHIPPERNAME, SUM(UNITPRICE * ORDERQUANTITY) AS TOTAL
FROM CUSTOMER C INNER JOIN CUSTORDER CO
ON C.CUSTOMERID = CO.CUSTOMERID
INNER JOIN CUSTORDERLINE COL
ON CO.ORDERID = COL.ORDERID
INNER JOIN SHIPMENT SM
ON CO.ORDERID = SM.ORDERID
INNER JOIN SHIPPER S
ON S.SHIPPERID = SM.SHIPPERID
WHERE ORDERDATE BETWEEN '01-JAN-2019' AND '31-DEC-2019'
AND STATE IN ('WA', 'CA') 
GROUP BY C.CUSTOMERID, C.EMAILADDR, ORDERDATE, SHIPPERNAME
HAVING SUM(UNITPRICE * ORDERQUANTITY) < 500;
/* RESULTS:
CUSTOMERID EMAILADDR                                          ORDERDATE SHIPPERNAME                    TOTAL
---------- -------------------------------------------------- --------- ------------------------- ----------
C-200004   cgatz@accela.com                                   09-NOV-19 U.S. Postal Service            299.8
I-200100   rcollins@live.com                                  29-OCT-19 Next Day Air                  167.94
I-200027   dsharp@gmail.com                                   08-OCT-19 U.S. Postal Service           151.93
I-200027   dsharp@gmail.com                                   30-NOV-19 U.S. Postal Service           429.83
C-200018   ahoover@granicus.com                               08-DEC-19 U.S. Postal Service           307.83
I-200004   jjordan@zohomail.com                               02-JUL-19 Federal Express               188.94
I-200004   jjordan@zohomail.com                               19-AUG-19 Federal Express               266.58
I-200100   rcollins@live.com                                  07-OCT-19 Next Day Air                  280.93
I-200100   rcollins@live.com                                  16-DEC-19 U.S. Postal Service           188.93
C-200015   burnskaren@gmail.com                               02-NOV-19 Next Day Air                     299
C-200004   cgatz@accela.com                                   04-AUG-19 Federal Express                441.5

CUSTOMERID EMAILADDR                                          ORDERDATE SHIPPERNAME                    TOTAL
---------- -------------------------------------------------- --------- ------------------------- ----------
I-200004   jjordan@zohomail.com                               01-DEC-19 Channel Express               179.87
I-200033   richerj@yahoo.com                                  29-JUL-19 Federal Express                67.95

13 rows selected. 
*/

--**********QUESTION 8**********
SELECT CO.ORDERID, ORDERDATE, C.EMAILADDR, STOCKPRICE, PARTDESCRIPTION, CATEGORYNAME
FROM CATEGORY CG INNER JOIN INVENTORYPART IP
ON CG.CATEGORYID = IP.CATEGORYID
INNER JOIN CUSTORDERLINE COL
ON IP.PARTNUMBER = COL.PARTNUMBER
INNER JOIN CUSTORDER CO
ON CO.ORDERID = COL.ORDERID
INNER JOIN CUSTOMER C
ON C.CUSTOMERID = CO.CUSTOMERID
WHERE ORDERDATE BETWEEN '01-MAR-20' AND '31-MAR-20' 
AND STOCKPRICE > 200
AND (C.EMAILADDR LIKE '%gmail%' OR C.EMAILADDR LIKE '%yahoo%');
/* RESULTS:

ORDERID    ORDERDATE EMAILADDR                                          STOCKPRICE PARTDESCRIPTION                                    CATEGORYNAME                  
---------- --------- -------------------------------------------------- ---------- -------------------------------------------------- ------------------------------
3001000798 29-MAR-20 tbaker@yahoo.com                                       803.76 FLY L                                              Computers                     
3001000806 31-MAR-20 dannie@yahoo.com                                      1211.76 Basic PRESTIEGE 8000 TOWER PC                      Computers                     
3001000706 01-MAR-20 jjones@gmail.com                                       803.76 FLY L                                              Computers                     
3001000707 01-MAR-20 dchang@yahoo.com                                      1226.16 Basic 3.6 GHZ INTEL CORE I7                        Computers                     
3001000716 03-MAR-20 mshade33@yahoo.com                                      299.4 LASER JET 2000SE                                   Accessories                   
3001000730 07-MAR-20 rstahley@gmail.com                                     457.99 SOCKET MINI BAREBONE                               Basics                        
3001000739 09-MAR-20 supplycrafts@gmail.com                                1177.49 Basic PRETIEGE 9000                                Computers                     
3001000743 10-MAR-20 mswatson@gmail.com                                     257.99 850 ATHLON PROCESSOR                               Processors                    
3001000760 16-MAR-20 sign3@gmail.com                                        969.35 Basic G1850 XEON                                   Computers                     
3001000760 16-MAR-20 sign3@gmail.com                                        460.79 850 AMD RYZEN PROCESSOR                            Processors                    
3001000763 17-MAR-20 laurie@yahoo.com                                       960.37 Basic AMD ATHLON X2                                Computers                     

ORDERID    ORDERDATE EMAILADDR                                          STOCKPRICE PARTDESCRIPTION                                    CATEGORYNAME                  
---------- --------- -------------------------------------------------- ---------- -------------------------------------------------- ------------------------------
3001000766 17-MAR-20 marcw332@gmail.com                                    1227.09 FLY XPST                                           Computers                     
3001000769 20-MAR-20 vacation@gmail.com                                    1341.76 Basic PRESTIEGE 8100 MID TOWER PC                  Computers                     
3001000775 21-MAR-20 matsm@gmail.com                                        457.99 SOCKET MINI BAREBONE                               Basics                        
3001000776 21-MAR-20 storage@gmail.com                                      969.35 Basic G1850 XEON                                   Computers                     

15 rows selected. 
*/

--**********QUESTION 9**********
SELECT P.ECNUMBER, P.PARTNUMBER, P.PROCESSID, PURPOSE, INSTRUCTION
FROM PROCESS P INNER JOIN OPERATION O
ON P.PROCESSID = O.PROCESSID
AND P.ECNUMBER = O.ECNUMBER
AND P.PARTNUMBER = O.PARTNUMBER
WHERE OPERATIONSTEP = 'LABEL'
AND (P.ECNUMBER LIKE '%PACK-007%' OR P.ECNUMBER LIKE '%ASSEM-007%');
/* RESULTS:
ECNUMBER   PARTNUMBER PROCESSID  PURPOSE                        INSTRUCTION                                  
---------- ---------- ---------- ------------------------------ ---------------------------------------------
ASSEM-007  CTR-007    ASSEMBLY   ASSEMBLE FINAL PRODUCT         PRINT AND APPLY MAILING LABEL                
PACK-007   DVD-001    SHIP       BARCODE,LABEL,SECURE FOR SHIP  PRINT AND APPLY MAILING LABEL                
PACK-007   DVD-002    SHIP       BARCODE,LABEL,SECURE FOR SHIP  PRINT AND APPLY MAILING LABEL       

*/
--**********QUESTION 10**********
SELECT ORDERID, ORDERDATE, COMPANYNAME, STATE
FROM CUSTOMER C INNER JOIN CUSTORDER CO
ON C.CUSTOMERID = CO.CUSTOMERID
WHERE ORDERDATE BETWEEN '01-JAN-19' AND '31-DEC-20' 
AND COMPANYNAME LIKE '%System%'
ORDER BY ORDERDATE;
/* RESULTS:
ORDERID    ORDERDATE COMPANYNAME                              ST
---------- --------- ---------------------------------------- --
3000000124 25-AUG-19 Gan Systems                              FL
3000000140 31-AUG-19 Gan Systems                              FL
3000000189 21-SEP-19 Gan Systems                              FL
3000000306 11-NOV-19 Gan Systems                              FL
3000000477 16-DEC-19 Fire Alarm Systems                       UT
3001000536 20-JAN-20 Fire Alarm Systems                       UT

6 rows selected. 


*/

/*
Question 11: 
A nested query is inside the WHERE clause. The data returned by the nested query is used by the outer statement.
Question 12: 
To join two tables with a composite PK. Doing this INNER Join, you have to join every PK that matches the parent table with using AND after every attribute being combined.
It is different because you will have to join the next atrribute with using the AND clause. They are similar because they are still joining tables and using a INNER JOIN.
Question 13: 
To join 3 tables together, you will need to use two inner join. After the first INNER JOIN, you input another INNER JOIN the follows the relationship between tables*parent to child).
This will return on rows having pairs in another table. 
Question 14: Table aliases are usesd to rename a table in a statement. The column aliases are used to rename a table's columns for the purpose of the query.
Question 15: when not joining all the composite keys in question . The results displayed a extra row. This is because the sttribute is in two tables displaying the same outcome twice.*/