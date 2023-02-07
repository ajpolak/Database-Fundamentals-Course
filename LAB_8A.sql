/*
Austin Polak
CNIT 27200 Fall 2020
Lab Time: Sunday 1:26pm
Duration: 5 HOURS (04/04 6:26pm)
*/
-- ********Question 1*****
   SELECT WORKER_ID FROM WORKER WHERE WORKER_ID = 588;
   
   INSERT INTO WORKER(WORKER_ID, FIRST_NAME, LAST_NAME, CITY, DEPT_CODE, HIRE_DATE, CREDIT_LIMIT, PHONE_NUMBER, MANAGER_ID)
   VALUES ('588', 'Maia', 'Jackson', 'Evanston', 'Tch', '30-JAN-21', '30', '7592', '565');
   
   SELECT * FROM WORKER WHERE WORKER_ID = 588;
   
   SELECT WORKER_ID FROM LUNCH WHERE WORKER_ID = 588;
   
   INSERT INTO LUNCH (LUNCH_ID, LUNCH_DATE, WORKER_ID)
   VALUES ('50', '02-FEB-21', '588');
    INSERT INTO LUNCH (LUNCH_ID, LUNCH_DATE, WORKER_ID)
   VALUES ('51', '04-FEB-21', '588');
   INSERT INTO LUNCH (LUNCH_ID, LUNCH_DATE, WORKER_ID)
   VALUES ('52', '05-FEB-21', '588');
   
   SELECT * FROM LUNCH WHERE WORKER_ID = 588;
   
   INSERT INTO LUNCH_ITEM(LUNCH_ID, ITEM_NUMBER, SUPPLIER_ID, PRODUCT_CODE, QUANTITY)
   VALUES('50', '4', 'Gls', 'Ds', '1');
    INSERT INTO LUNCH_ITEM(LUNCH_ID, ITEM_NUMBER, SUPPLIER_ID, PRODUCT_CODE, QUANTITY)
   VALUES('50', '1', 'Hsd', 'Cs', '2');  
   INSERT INTO LUNCH_ITEM(LUNCH_ID, ITEM_NUMBER, SUPPLIER_ID, PRODUCT_CODE, QUANTITY)
   VALUES('51', '2', 'Hsd', 'Sp', '2');
    INSERT INTO LUNCH_ITEM(LUNCH_ID, ITEM_NUMBER, SUPPLIER_ID, PRODUCT_CODE, QUANTITY)
   VALUES('51', '3', 'Foi', 'Sp', '1');
    INSERT INTO LUNCH_ITEM(LUNCH_ID, ITEM_NUMBER, SUPPLIER_ID, PRODUCT_CODE, QUANTITY)
   VALUES('52', '3', 'Crm', 'Ps', '1');
   INSERT INTO LUNCH_ITEM(LUNCH_ID, ITEM_NUMBER, SUPPLIER_ID, PRODUCT_CODE, QUANTITY)
   VALUES('52', '4', 'Foi', 'Ff', '1');
   
   SELECT * 
   FROM LUNCH L INNER JOIN LUNCH_ITEM LI
   ON L.LUNCH_ID = LI.LUNCH_ID
   WHERE WORKER_ID = 588;
   
   COMMIT;
/*  RESULTS:
no rows selected
1 row inserted.

WOR FIRST_NAME LAST_NAME            CITY                           DEP HIRE_DATE CREDIT_LIMIT PHON MAN
--- ---------- -------------------- ------------------------------ --- --------- ------------ ---- ---
588 Maia       Jackson              Evanston                       Tch 30-JAN-21           30 7592 565

no rows selected
1 row inserted.
1 row inserted.
1 row inserted.

  LUNCH_ID LUNCH_DAT WOR
---------- --------- ---
        50 02-FEB-21 588
        51 04-FEB-21 588
        52 05-FEB-21 588
1 row inserted.
1 row inserted.
1 row inserted.
1 row inserted.
1 row inserted.
1 row inserted.

  LUNCH_ID LUNCH_DAT WOR   LUNCH_ID ITEM_NUMBER SUP PR   QUANTITY
---------- --------- --- ---------- ----------- --- -- ----------
        50 02-FEB-21 588         50           4 Gls Ds          1
        50 02-FEB-21 588         50           1 Hsd Cs          2
        51 04-FEB-21 588         51           2 Hsd Sp          2
        51 04-FEB-21 588         51           3 Foi Sp          1
        52 05-FEB-21 588         52           3 Crm Ps          1
        52 05-FEB-21 588         52           4 Foi Ff          1

6 rows selected. 

Commit complete.
*/

--*****QUESTION 2******
SELECT SUPPLIER_ID, SUPPLIER_NAME, SUPPLIER_CITY
FROM FOOD_SUPPLIER
WHERE SUPPLIER_ID = 'Jmd';

UPDATE FOOD_SUPPLIER
SET SUPPLIER_NAME = 'Jordan Market Deli', SUPPLIER_CITY = 'Glencoe'
WHERE SUPPLIER_ID = 'Jmd';

COMMIT;

SELECT * 
FROM FOOD_SUPPLIER WHERE SUPPLIER_ID = 'Jmd';

/* RESULTS:
SUP SUPPLIER_NAME                  SUPPLIER_CITY                 
--- ------------------------------ ------------------------------
Jmd Jebston Montrose Deli          Chicago       

1 row updated.
Commit complete.

SUP SUPPLIER_NAME                  SUPPLIER_CITY                 
--- ------------------------------ ------------------------------
Jmd Jordan Market Deli             Glencoe           
*/

-- ********Question 3*****
SELECT SUPPLIER_ID, DESCRIPTION, PRICE
FROM FOOD
WHERE SUPPLIER_ID = 'Jmd';

UPDATE FOOD
SET PRICE = (PRICE * 1.5)
WHERE SUPPLIER_ID ='Jmd';

/*  RESULTS:
 SUP DESCRIPTION               PRICE
--- -------------------- ----------
Jmd Mushroom Pizza                8
Jmd Potato Soup                6.25
Jmd Iced Tea                   2.85
Jmd Cole Slaw                   1.5

4 rows updated.

SUP DESCRIPTION               PRICE
--- -------------------- ----------
Jmd Mushroom Pizza               12
Jmd Potato Soup                9.38
Jmd Iced Tea                   4.28
Jmd Cole Slaw                  2.25
*/

--*****QUESTION 4******
SELECT F.SUPPLIER_ID, F.PRODUCT_CODE
FROM FOOD F LEFT JOIN LUNCH_ITEM LI
ON F.PRODUCT_CODE = LI.PRODUCT_CODE
AND F.SUPPLIER_ID = LI.SUPPLIER_ID
WHERE LI.SUPPLIER_ID IS NULL;

DELETE FROM FOOD
WHERE (SUPPLIER_ID || PRODUCT_CODE)
IN (SELECT (F.SUPPLIER_ID || F.PRODUCT_CODE)
FROM FOOD F LEFT JOIN LUNCH_ITEM LI
ON F.PRODUCT_CODE = LI.PRODUCT_CODE
AND F.SUPPLIER_ID = LI.SUPPLIER_ID
WHERE LI.SUPPLIER_ID IS NULL);

SELECT SUPPLIER_ID, PRODUCT_CODE, DESCRIPTION
FROM FOOD;
/* RESULTS:
SUP PR
--- --
Gls Vr
Jmd Vt

2 rows deleted.
no rows selected

SUP PR DESCRIPTION         
--- -- --------------------
Ard Pz Sausage Pizza       
Hsd Cs Chef Salad          
Hsd Sp Chicken Soup        
Hsd Ds Velvet Cake         
Hsd Pp Protein Plate       
Crm Sw Grilled Cheese      
Crm Ps Philly Melt         
Crm Hb Ham Melt            
Crm Br Bagel               
Foi Vt Broccoli Salad      
Foi Ff French Fries        

SUP PR DESCRIPTION         
--- -- --------------------
Foi Sp Barley Soup         
Foi Ds Apple Pie           
Jd6 Vr Soda                
Jd6 Cf Coffee              
Jd6 Ds Brownie             
Jmd Sp Potato Soup         
Jmd Vr Iced Tea            
Jmd Pz Mushroom Pizza      
Lss Sw Grilled Cheese      
Lss Sp Veggie Soup         
Dpz Pz Cheese Pizza        

SUP PR DESCRIPTION         
--- -- --------------------
Dpz Br Dinner Roll         
Dpz Sc Cheese Sauce        
Gls Ds Sugar Cookie        
Gls Br Breadstick          
Blu Sw Turkey Club         
Blu Cp Chips               
Lak Sw Caprese             
Lak Sd Spinach Salad       
Lak Br Cheese Stick        

31 rows selected. 
*/
-- ********Question 5*****
SELECT SUPPLIER_ID, SUPPLIER_NAME
FROM FOOD_SUPPLIER 
WHERE SUPPLIER_ID NOT IN 
(SELECT SUPPLIER_ID
FROM FOOD);

DELETE FROM FOOD_SUPPLIER
WHERE SUPPLIER_ID IN ('Fas', 'Gio', 'Har', 'Rby');

SELECT SUPPLIER_ID, SUPPLIER_NAME, SUPPLIER_CITY
FROM FOOD_SUPPLIER;

ROLLBACK;
/*  RESULTS:
SUP SUPPLIER_NAME                 
--- ------------------------------
Fas Foster and Samson             
Gio Gio and Sons                  
Har Harper Bakery                 
Rby Rosemont Bakery      

4 rows deleted.
no rows selected

SUP SUPPLIER_NAME                  SUPPLIER_CITY                 
--- ------------------------------ ------------------------------
Ard Arnoldo Deli                   Glencoe                       
Hsd Holden Street Deli             Hinsdale                      
Crm Cramer Market                  Hinsdale                      
Foi Fontinas Italian               Chicago                       
Jd6 Justin's Deli at 601           Oak Brook                     
Jmd Jordan Market Deli             Glencoe                       
Lss Lucias Sub Shop                Aurora                        
Dpz Downtowner Pizza               Chicago                       
Gls Great Lakes Station            Wilmette                      
Blu Blue Sky Deli                  Wilmette                      
Lak Lakeshore Bakery               Chicago                       

11 rows selected. 

Rollback complete.
*/

--*****QUESTION 6******
SELECT *
FROM FOOD_SUPPLIER;

SELECT F.SUPPLIER_ID, F.PRODUCT_CODE
FROM FOOD F LEFT JOIN LUNCH_ITEM LI
ON F.PRODUCT_CODE = LI.PRODUCT_CODE
AND F.SUPPLIER_ID = LI.SUPPLIER_ID
WHERE LI.SUPPLIER_ID IS NULL;

SELECT SUPPLIER_ID, DESCRIPTION, PRICE
FROM FOOD
WHERE SUPPLIER_ID = 'Jmd';

   SELECT * 
   FROM LUNCH L INNER JOIN LUNCH_ITEM LI
   ON L.LUNCH_ID = LI.LUNCH_ID
   WHERE WORKER_ID = 588;
/* RESULTS:

SUP SUPPLIER_NAME                  SUPPLIER_CITY                 
--- ------------------------------ ------------------------------
Ard Arnoldo Deli                   Glencoe                       
Hsd Holden Street Deli             Hinsdale                      
Crm Cramer Market                  Hinsdale                      
Foi Fontinas Italian               Chicago                       
Fas Foster and Samson              Orland Park                   
Jd6 Justin's Deli at 601           Oak Brook                     
Jmd Jordan Market Deli             Glencoe                       
Rby Rosemont Bakery                Glencoe                       
Lss Lucias Sub Shop                Aurora                        
Har Harper Bakery                  Hinsdale                      
Dpz Downtowner Pizza               Chicago                       

SUP SUPPLIER_NAME                  SUPPLIER_CITY                 
--- ------------------------------ ------------------------------
Gls Great Lakes Station            Wilmette                      
Gio Gio and Sons                   Chicago                       
Blu Blue Sky Deli                  Wilmette                      
Lak Lakeshore Bakery               Chicago                       

15 rows selected. 


SUP PR
--- --
Gls Vr
Jmd Vt


SUP DESCRIPTION               PRICE
--- -------------------- ----------
Jmd Mushroom Pizza                8
Jmd Potato Soup                6.25
Jmd Iced Tea                   2.85
Jmd Cole Slaw                   1.5


  LUNCH_ID LUNCH_DAT WOR   LUNCH_ID ITEM_NUMBER SUP PR   QUANTITY
---------- --------- --- ---------- ----------- --- -- ----------
        50 02-FEB-21 588         50           4 Gls Ds          1
        50 02-FEB-21 588         50           1 Hsd Cs          2
        51 04-FEB-21 588         51           2 Hsd Sp          2
        51 04-FEB-21 588         51           3 Foi Sp          1
        52 05-FEB-21 588         52           3 Crm Ps          1
        52 05-FEB-21 588         52           4 Foi Ff          1

6 rows selected. 

*/
-- ********Question 7*****
DROP TABLE TRAVEL;
CREATE TABLE TRAVEL(
WORKER_ID char(3) CONSTRAINT TRAVEL_PK PRIMARY KEY,
DEPT_CODE varchar2(3),
TRAVEL_LIMIT number(4,2),
Authorization char(2));

DESC TRAVEL;

ALTER TABLE TRAVEL
ADD CONSTRAINT TRAVEL_FK FOREIGN KEY(WORKER_ID) REFERENCES WORKER;

INSERT INTO TRAVEL (WORKER_ID, TRAVEL_LIMIT)
SELECT WORKER_ID, (CREDIT_LIMIT + CREDIT_LIMIT*.25)
FROM WORKER
WHERE MANAGER_ID = 555 ;

UPDATE TRAVEL
SET AUTHORIZATION = 'A7'
WHERE WORKER_ID IS NOT NULL;

SELECT * FROM TRAVEL;

COMMIT;
/*  RESULTS:
1)
Error starting at line : 321 in command -
DROP TABLE TRAVEL
Error report -
ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Table TRAVEL created.

Name          Null?    Type        
------------- -------- ----------- 
WORKER_ID     NOT NULL CHAR(3)     
DEPT_CODE              VARCHAR2(3) 
TRAVEL_LIMIT           NUMBER(4,2) 
AUTHORIZATION          CHAR(2)     

2)
Table TRAVEL altered.
3)
9 rows inserted.

WOR DEP TRAVEL_LIMIT AU
--- --- ------------ --
556             37.5   
557               35   
558             37.5   
559             32.5   
561            31.25   
563             37.5   
564            41.25   
569               35   
579            28.75   

9 rows selected. 
4)
9 rows updated.

5)
WOR DEP TRAVEL_LIMIT AU
--- --- ------------ --
556             37.5 A7
557               35 A7
558             37.5 A7
559             32.5 A7
561            31.25 A7
563             37.5 A7
564            41.25 A7
569               35 A7
579            28.75 A7

9 rows selected. 

Commit complete.
*/
