/*
Austin Polak
CNIT 27200 Fall 2020
Lab Time: Sunday 6:00pm
Duration: 2 hours (02/21 8:00pm~)
*/
-- ****************
-- Question 1

select* from FOOD_SUPPLIER;

/* Results : 

SUP SUPPLIER_NAME                  SUPPLIER_CITY                 
--- ------------------------------ ------------------------------
Ard Arnoldo Deli                   Glencoe                       
Hsd Holden Street Deli             Hinsdale                      
Crm Cramer Market                  Hinsdale                      
Foi Fontinas Italian               Chicago                       
Fas Foster and Samson              Orland Park                   
Jd6 Justin's Deli at 601           Oak Brook                     
Jmd Jebston Montrose Deli          Chicago                       
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
*/
-- ****************
-- Question 2A

DESC WORKER

/* Results :

Name         Null?    Type         
------------ -------- ------------ 
WORKER_ID    NOT NULL CHAR(3)      
FIRST_NAME            VARCHAR2(10) 
LAST_NAME             VARCHAR2(20) 
CITY                  VARCHAR2(30) 
DEPT_CODE             VARCHAR2(3)  
HIRE_DATE             DATE         
CREDIT_LIMIT          NUMBER(4,2)  
PHONE_NUMBER          CHAR(4)      
MANAGER_ID            CHAR(3)      
*/

-- ****************
-- Question 2B

SELECT FIRST_NAME, LAST_NAME, DEPT_CODE, HIRE_DATE 
FROM WORKER;

/* Results :

FIRST_NAME LAST_NAME            DEP HIRE_DATE
---------- -------------------- --- ---------
Tracy      Reynolds             Exe 18-MAR-15
Carole     Shreve               Tch 17-JUL-18
Cole       Gradle               Leg 23-MAR-15
Rita       Campbell             Hmn 24-MAY-19
Maia       Neal                 Srv 01-APR-15
Kevin      Ridgeman                 01-OCT-06
Maria      Bensen               Aud 15-SEP-04
Tom        Armstrong            Com 01-JUL-16
Trevor     Vought               Acc 01-NOV-06
James      Kingman              Sal 17-DEC-07
Elizabeth  Cross                Tch 15-FEB-06

FIRST_NAME LAST_NAME            DEP HIRE_DATE
---------- -------------------- --- ---------
Tabitha    Tevona               Hmn 21-AUG-09
Darius     Richards             Leg 12-JAN-13
Taylor     Young                    12-NOV-08
Dana       Sumner               Fin 07-FEB-13
Amy        Trance               Aud 19-JUN-18
Denise     Harris               Hmn 28-MAR-05
Kevin      Johnson                  11-DEC-12
Kate       White                Aud 22-MAY-11
Cassie     Irwin                    13-SEP-03
Sean       Smith                Fin 19-APR-12
Keyanna    Jones                Tch 15-MAR-19

FIRST_NAME LAST_NAME            DEP HIRE_DATE
---------- -------------------- --- ---------
Matt       Martin               Sal 19-NOV-19
Katelynn   Rayner               Tch 07-OCT-11
Yvonne     Rivera                   13-NOV-15
Roy        Gonzalez             Acc 19-DEC-11
Brooks     Walsh                Srv 21-APR-07
Angie      Cross                Acc 19-JUN-07
Tonya      Montre                   07-MAR-12
Tyler      Harney               Tch 07-MAR-18
Sam        Frank                Srv 22-JUL-16
Jill       Williams                 16-MAR-19

32 rows selected. 
*/

-- ****************
-- Question 3A

select SUPPLIER_ID, PRODUCT_CODE, DESCRIPTION, PRICE FROM FOOD
WHERE PRICE='8' Or PRODUCT_CODE='Br';

/* Results :


SUP PR DESCRIPTION               PRICE
--- -- -------------------- ----------
Crm Br Bagel                         4
Jmd Pz Mushroom Pizza                8
Dpz Br Dinner Roll                   1
Gls Br Breadstick                 1.25
Lak Br Cheese Stick               2.35
*/

-- ****************
-- Question 3B

select SUPPLIER_ID, PRODUCT_CODE, DESCRIPTION, PRICE FROM FOOD
WHERE PRODUCT_CODE='Br' Or (PRICE='8' Or PRICE='4.50');

/* Results :

SUP PR DESCRIPTION               PRICE
--- -- -------------------- ----------
Hsd Ds Velvet Cake                 4.5
Crm Br Bagel                         4
Foi Ds Apple Pie                   4.5
Jmd Pz Mushroom Pizza                8
Dpz Br Dinner Roll                   1
Gls Br Breadstick                 1.25
Lak Br Cheese Stick               2.35

7 rows selected. 
*/

-- ****************
-- Question 4

select SUPPLIER_NAME from FOOD_SUPPLIER
WHERE SUPPLIER_NAME LIKE ('%Deli%') or SUPPLIER_NAME LIKE ('%Bakery%');

/* Results :


SUPPLIER_NAME                 
------------------------------
Arnoldo Deli
Holden Street Deli
Justin's Deli at 601
Jebston Montrose Deli
Rosemont Bakery
Harper Bakery
Blue Sky Deli
Lakeshore Bakery

8 rows selected. 
*/

-- ****************
-- Question 5A

select WORKER_ID, LAST_NAME, HIRE_DATE, CITY from WORKER
WHERE HIRE_DATE = '01-JAN-2012'
Or HIRE_DATE <= '31-DEC-2017';

/* Results :


WOR LAST_NAME            HIRE_DATE CITY                          
--- -------------------- --------- ------------------------------
555 Reynolds             18-MAR-15 Chicago                       
557 Gradle               23-MAR-15 Wilmette                      
559 Neal                 01-APR-15 Hinsdale                      
560 Ridgeman             01-OCT-06 Aurora                        
561 Bensen               15-SEP-04 Wilmette                      
562 Armstrong            01-JUL-16 Glencoe                       
563 Vought               01-NOV-06 Oak Brook                     
564 Kingman              17-DEC-07 Chicago                       
565 Cross                15-FEB-06                               
566 Tevona               21-AUG-09 Oak Brook                     
567 Richards             12-JAN-13 Oak Brook                     

WOR LAST_NAME            HIRE_DATE CITY                          
--- -------------------- --------- ------------------------------
568 Young                12-NOV-08 Wilmette                      
569 Sumner               07-FEB-13 Evanston                      
571 Harris               28-MAR-05 Chicago                       
572 Johnson              11-DEC-12 Hinsdale                      
573 White                22-MAY-11                               
574 Irwin                13-SEP-03                               
575 Smith                19-APR-12 Glencoe                       
578 Rayner               07-OCT-11 Evanston                      
579 Rivera               13-NOV-15                               
580 Gonzalez             19-DEC-11                               
581 Walsh                21-APR-07 Oak Brook                     

WOR LAST_NAME            HIRE_DATE CITY                          
--- -------------------- --------- ------------------------------
582 Cross                19-JUN-07 Hinsdale                      
583 Montre               07-MAR-12 Aurora                        
585 Frank                22-JUL-16 Evanston                      

25 rows selected. 

*/

-- ****************
-- Question 5B

select WORKER_ID, LAST_NAME, HIRE_DATE, CITY from WORKER
WHERE HIRE_DATE BETWEEN '01-JAN-2012' AND '31-DEC-2017';

/* Results :

WOR LAST_NAME            HIRE_DATE CITY                          
--- -------------------- --------- ------------------------------
555 Reynolds             18-MAR-15 Chicago                       
557 Gradle               23-MAR-15 Wilmette                      
559 Neal                 01-APR-15 Hinsdale                      
562 Armstrong            01-JUL-16 Glencoe                       
567 Richards             12-JAN-13 Oak Brook                     
569 Sumner               07-FEB-13 Evanston                      
572 Johnson              11-DEC-12 Hinsdale                      
575 Smith                19-APR-12 Glencoe                       
579 Rivera               13-NOV-15                               
583 Montre               07-MAR-12 Aurora                        
585 Frank                22-JUL-16 Evanston                      

11 rows selected. 
*/

-- ****************
-- Question 6A

select WORKER.DEPT_CODE, DEPARTMENT.DEPT_CODE from WORKER 
FULL JOIN DEPARTMENT
ON WORKER.DEPT_CODE =DEPARTMENT.DEPT_CODE;

/* 
Yes, boith tables have same numbers. 

Results :

DEP DEP
--- ---
Exe Exe
Tch Tch
Leg Leg
Hmn Hmn
Srv Srv
       
Aud Aud
Com Com
Acc Acc
Sal Sal
Tch Tch

DEP DEP
--- ---
Hmn Hmn
Leg Leg
       
Fin Fin
Aud Aud
Hmn Hmn
       
Aud Aud
       
Fin Fin
Tch Tch

DEP DEP
--- ---
Sal Sal
Tch Tch
       
Acc Acc
Srv Srv
Acc Acc
       
Tch Tch
Srv Srv
       
    Pur

DEP DEP
--- ---
    Mkt
    Shp
    Fac

36 rows selected. 
*/

-- ****************
-- Question 6B

select WORKER.DEPT_CODE, DEPARTMENT.DEPT_CODE from WORKER 
INNER JOIN DEPARTMENT
ON WORKER.DEPT_CODE =DEPARTMENT.DEPT_CODE;

/* 
The reason for having only one instance printed out for the department codes 
is that the query uses INNER JOIN.

Results :
DEP DEP
--- ---
Exe Exe
Tch Tch
Leg Leg
Hmn Hmn
Srv Srv
Aud Aud
Com Com
Acc Acc
Sal Sal
Tch Tch
Hmn Hmn

DEP DEP
--- ---
Leg Leg
Fin Fin
Aud Aud
Hmn Hmn
Aud Aud
Fin Fin
Tch Tch
Sal Sal
Tch Tch
Acc Acc
Srv Srv

DEP DEP
--- ---
Acc Acc
Tch Tch
Srv Srv

25 rows selected. 
*/

-- ****************
-- Question 7

select SUPPLIER_ID, DESCRIPTION, (PRICE) AS OLDPRICE, (PRICE * 1.04) AS NEWPRICE
FROM FOOD
WHERE SUPPLIER_ID = 'Lss'
Or SUPPLIER_ID = 'Crm'
Or SUPPLIER_ID = 'Dpz';

/* Results :

SUP DESCRIPTION            OLDPRICE   NEWPRICE
--- -------------------- ---------- ----------
Crm Bagel                         4       4.16
Crm Ham Melt                    7.2      7.488
Crm Philly Melt                 8.6      8.944
Crm Grilled Cheese             5.25       5.46
Dpz Dinner Roll                   1       1.04
Dpz Cheese Pizza                8.5       8.84
Dpz Cheese Sauce                .75        .78
Lss Veggie Soup                4.85      5.044
Lss Grilled Cheese             5.95      6.188

9 rows selected. 
*/

-- ****************
-- Question 8

select WORKER_ID, DEPT_CODE, FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME
FROM WORKER
WHERE DEPT_CODE= 'Tch' 
Or DEPT_CODE= 'Leg' 
Or DEPT_CODE= 'Aud';

/* Results :

WOR DEP FULL_NAME                      
--- --- -------------------------------
556 Tch Carole Shreve                  
557 Leg Cole Gradle                    
561 Aud Maria Bensen                   
565 Tch Elizabeth Cross                
567 Leg Darius Richards                
570 Aud Amy Trance                     
573 Aud Kate White                     
576 Tch Keyanna Jones                  
578 Tch Katelynn Rayner                
584 Tch Tyler Harney                   

10 rows selected. 
*/