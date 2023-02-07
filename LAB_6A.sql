/*
Austin Polak
CNIT 27200 Fall 2020
Lab Time: Monday 5:00pm
Duration: 1hour and 42 minutes (03/22 6:42pm)
*/
-- ********Question 1*****
SELECT W.WORKER_ID, FIRST_NAME,LAST_NAME, LUNCH_ID, LUNCH_DATE
FROM WORKER W INNER JOIN LUNCH L
ON W.WORKER_ID = L.WORKER_ID
WHERE CITY = 'Aurora'
ORDER BY LUNCH_DATE;

SELECT W.WORKER_ID, FIRST_NAME,LAST_NAME, LUNCH_ID, LUNCH_DATE
FROM WORKER W LEFT JOIN LUNCH L
ON W.WORKER_ID = L.WORKER_ID
WHERE CITY = 'Aurora' 
ORDER BY LUNCH_DATE;

SELECT W.WORKER_ID, FIRST_NAME,LAST_NAME, LUNCH_ID, LUNCH_DATE
FROM WORKER W LEFT JOIN LUNCH L
ON W.WORKER_ID = L.WORKER_ID
WHERE CITY = 'Aurora' 
AND LUNCH_ID IS NULL
ORDER BY LUNCH_DATE;

/*  RESULTS:
A)WOR FIRST_NAME LAST_NAME              LUNCH_ID LUNCH_DAT
--- ---------- -------------------- ---------- ---------
570 Amy        Trance                       17 01-JUN-20
560 Kevin      Ridgeman                     22 03-JUN-20
560 Kevin      Ridgeman                     21 03-JUN-20
560 Kevin      Ridgeman                     28 10-JUN-20
560 Kevin      Ridgeman                     29 10-JUN-20
560 Kevin      Ridgeman                     36 15-JUN-20

6 rows selected. 
B)WOR FIRST_NAME LAST_NAME              LUNCH_ID LUNCH_DAT
--- ---------- -------------------- ---------- ---------
570 Amy        Trance                       17 01-JUN-20
560 Kevin      Ridgeman                     22 03-JUN-20
560 Kevin      Ridgeman                     21 03-JUN-20
560 Kevin      Ridgeman                     28 10-JUN-20
560 Kevin      Ridgeman                     29 10-JUN-20
560 Kevin      Ridgeman                     36 15-JUN-20
583 Tonya      Montre                                   

7 rows selected. 
C)WOR FIRST_NAME LAST_NAME              LUNCH_ID LUNCH_DAT
--- ---------- -------------------- ---------- ---------
583 Tonya      Montre                                   

*/
--*****QUESTION 2******
SELECT F.SUPPLIER_ID, DESCRIPTION, COUNT(QUANTITY)
FROM FOOD F LEFT JOIN LUNCH_ITEM LI
ON F.PRODUCT_CODE = LI.PRODUCT_CODE
AND F.SUPPLIER_ID = LI.SUPPLIER_ID 
group by F.SUPPLIER_ID, DESCRIPTION;

SELECT F.SUPPLIER_ID, DESCRIPTION, COUNT(QUANTITY)
FROM FOOD F INNER JOIN LUNCH_ITEM LI
ON F.PRODUCT_CODE = LI.PRODUCT_CODE
AND F.SUPPLIER_ID = LI.SUPPLIER_ID 
group by F.SUPPLIER_ID, DESCRIPTION;
/* RESULTS:
A)SUP DESCRIPTION          COUNT(QUANTITY)
--- -------------------- ---------------
Jmd Mushroom Pizza                     2
Jmd Iced Tea                           7
Lss Veggie Soup                        2
Jd6 Soda                              19
Foi French Fries                      10
Dpz Cheese Pizza                       2
Gls Mango Smoothie                     0
Jmd Cole Slaw                          0
Hsd Chef Salad                        13
Blu Turkey Club                        1
Lak Caprese                            1

SUP DESCRIPTION          COUNT(QUANTITY)
--- -------------------- ---------------
Lak Cheese Stick                       1
Crm Grilled Cheese                     5
Ard Sausage Pizza                      2
Dpz Dinner Roll                        4
Crm Ham Melt                           6
Foi Broccoli Salad                     1
Jd6 Brownie                            9
Jd6 Coffee                             4
Lss Grilled Cheese                     4
Hsd Velvet Cake                        6
Crm Philly Melt                       12

SUP DESCRIPTION          COUNT(QUANTITY)
--- -------------------- ---------------
Blu Chips                              1
Crm Bagel                              1
Foi Barley Soup                        3
Gls Sugar Cookie                       4
Gls Breadstick                         1
Jmd Potato Soup                        1
Dpz Cheese Sauce                       1
Hsd Chicken Soup                      10
Foi Apple Pie                          3
Hsd Protein Plate                      1
Lak Spinach Salad                      1

33 rows selected. 
B)
SUP DESCRIPTION          COUNT(QUANTITY)
--- -------------------- ---------------
Jmd Mushroom Pizza                     2
Jmd Iced Tea                           7
Lss Veggie Soup                        2
Jd6 Soda                              19
Foi French Fries                      10
Dpz Cheese Pizza                       2
Hsd Chef Salad                        13
Blu Turkey Club                        1
Lak Caprese                            1
Lak Cheese Stick                       1
Crm Grilled Cheese                     5

SUP DESCRIPTION          COUNT(QUANTITY)
--- -------------------- ---------------
Ard Sausage Pizza                      2
Dpz Dinner Roll                        4
Crm Ham Melt                           6
Foi Broccoli Salad                     1
Jd6 Brownie                            9
Jd6 Coffee                             4
Lss Grilled Cheese                     4
Hsd Velvet Cake                        6
Crm Philly Melt                       12
Blu Chips                              1
Crm Bagel                              1

SUP DESCRIPTION          COUNT(QUANTITY)
--- -------------------- ---------------
Foi Barley Soup                        3
Gls Sugar Cookie                       4
Gls Breadstick                         1
Jmd Potato Soup                        1
Dpz Cheese Sauce                       1
Hsd Chicken Soup                      10
Foi Apple Pie                          3
Hsd Protein Plate                      1
Lak Spinach Salad                      1

31 rows selected. 
*/
--*****QUESTION 3******
SELECT WORKER_ID, FIRST_NAME,LAST_NAME, D.DEPT_CODE, DEPARTMENT_NAME
FROM DEPARTMENT D INNER JOIN WORKER W
ON D.DEPT_CODE = W.DEPT_CODE
ORDER BY WORKER_ID;

SELECT WORKER_ID, FIRST_NAME,LAST_NAME, D.DEPT_CODE, DEPARTMENT_NAME
FROM DEPARTMENT D RIGHT JOIN WORKER W
ON D.DEPT_CODE = W.DEPT_CODE
ORDER BY WORKER_ID;

SELECT WORKER_ID, FIRST_NAME,LAST_NAME, D.DEPT_CODE, DEPARTMENT_NAME
FROM DEPARTMENT D LEFT JOIN WORKER W
ON D.DEPT_CODE = W.DEPT_CODE
ORDER BY WORKER_ID;

SELECT DEPT_CODE, DEPARTMENT_NAME
FROM DEPARTMENT
WHERE DEPT_CODE NOT IN (SELECT DEPT_CODE
FROM WORKER
WHERE DEPT_CODE IS NOT NULL);


/* RESULTS:
A)
WOR FIRST_NAME LAST_NAME            DEP DEPARTMENT_NAME               
--- ---------- -------------------- --- ------------------------------
555 Tracy      Reynolds             Exe Executive                     
556 Carole     Shreve               Tch Technology                    
557 Cole       Gradle               Leg Legal                         
558 Rita       Campbell             Hmn Human Resources               
559 Maia       Neal                 Srv Service                       
561 Maria      Bensen               Aud Auditing                      
562 Tom        Armstrong            Com Compliance                    
563 Trevor     Vought               Acc Accounting                    
564 James      Kingman              Sal Sales                         
565 Elizabeth  Cross                Tch Technology                    
566 Tabitha    Tevona               Hmn Human Resources               

WOR FIRST_NAME LAST_NAME            DEP DEPARTMENT_NAME               
--- ---------- -------------------- --- ------------------------------
567 Darius     Richards             Leg Legal                         
569 Dana       Sumner               Fin Finance                       
570 Amy        Trance               Aud Auditing                      
571 Denise     Harris               Hmn Human Resources               
573 Kate       White                Aud Auditing                      
575 Sean       Smith                Fin Finance                       
576 Keyanna    Jones                Tch Technology                    
577 Matt       Martin               Sal Sales                         
578 Katelynn   Rayner               Tch Technology                    
580 Roy        Gonzalez             Acc Accounting                    
581 Brooks     Walsh                Srv Service                       

WOR FIRST_NAME LAST_NAME            DEP DEPARTMENT_NAME               
--- ---------- -------------------- --- ------------------------------
582 Angie      Cross                Acc Accounting                    
584 Tyler      Harney               Tch Technology                    
585 Sam        Frank                Srv Service                       

25 rows selected. 

B)
WOR FIRST_NAME LAST_NAME            DEP DEPARTMENT_NAME               
--- ---------- -------------------- --- ------------------------------
555 Tracy      Reynolds             Exe Executive                     
556 Carole     Shreve               Tch Technology                    
557 Cole       Gradle               Leg Legal                         
558 Rita       Campbell             Hmn Human Resources               
559 Maia       Neal                 Srv Service                       
560 Kevin      Ridgeman                                               
561 Maria      Bensen               Aud Auditing                      
562 Tom        Armstrong            Com Compliance                    
563 Trevor     Vought               Acc Accounting                    
564 James      Kingman              Sal Sales                         
565 Elizabeth  Cross                Tch Technology                    

WOR FIRST_NAME LAST_NAME            DEP DEPARTMENT_NAME               
--- ---------- -------------------- --- ------------------------------
566 Tabitha    Tevona               Hmn Human Resources               
567 Darius     Richards             Leg Legal                         
568 Taylor     Young                                                  
569 Dana       Sumner               Fin Finance                       
570 Amy        Trance               Aud Auditing                      
571 Denise     Harris               Hmn Human Resources               
572 Kevin      Johnson                                                
573 Kate       White                Aud Auditing                      
574 Cassie     Irwin                                                  
575 Sean       Smith                Fin Finance                       
576 Keyanna    Jones                Tch Technology                    

WOR FIRST_NAME LAST_NAME            DEP DEPARTMENT_NAME               
--- ---------- -------------------- --- ------------------------------
577 Matt       Martin               Sal Sales                         
578 Katelynn   Rayner               Tch Technology                    
579 Yvonne     Rivera                                                 
580 Roy        Gonzalez             Acc Accounting                    
581 Brooks     Walsh                Srv Service                       
582 Angie      Cross                Acc Accounting                    
583 Tonya      Montre                                                 
584 Tyler      Harney               Tch Technology                    
585 Sam        Frank                Srv Service                       
586 Jill       Williams                                               

32 rows selected. 

C)WOR FIRST_NAME LAST_NAME            DEP DEPARTMENT_NAME               
--- ---------- -------------------- --- ------------------------------
555 Tracy      Reynolds             Exe Executive                     
556 Carole     Shreve               Tch Technology                    
557 Cole       Gradle               Leg Legal                         
558 Rita       Campbell             Hmn Human Resources               
559 Maia       Neal                 Srv Service                       
561 Maria      Bensen               Aud Auditing                      
562 Tom        Armstrong            Com Compliance                    
563 Trevor     Vought               Acc Accounting                    
564 James      Kingman              Sal Sales                         
565 Elizabeth  Cross                Tch Technology                    
566 Tabitha    Tevona               Hmn Human Resources               

WOR FIRST_NAME LAST_NAME            DEP DEPARTMENT_NAME               
--- ---------- -------------------- --- ------------------------------
567 Darius     Richards             Leg Legal                         
569 Dana       Sumner               Fin Finance                       
570 Amy        Trance               Aud Auditing                      
571 Denise     Harris               Hmn Human Resources               
573 Kate       White                Aud Auditing                      
575 Sean       Smith                Fin Finance                       
576 Keyanna    Jones                Tch Technology                    
577 Matt       Martin               Sal Sales                         
578 Katelynn   Rayner               Tch Technology                    
580 Roy        Gonzalez             Acc Accounting                    
581 Brooks     Walsh                Srv Service                       

WOR FIRST_NAME LAST_NAME            DEP DEPARTMENT_NAME               
--- ---------- -------------------- --- ------------------------------
582 Angie      Cross                Acc Accounting                    
584 Tyler      Harney               Tch Technology                    
585 Sam        Frank                Srv Service                       
                                    Shp Shipping                      
                                    Pur Purchasing                    
                                    Mkt Marketing                     
                                    Fac Facilities                    

29 rows selected. 

D)
DEP DEPARTMENT_NAME               
--- ------------------------------
Fac Facilities                    
Mkt Marketing                     
Pur Purchasing                    
Shp Shipping                      

*/

--**********QUESTION 4**********
SELECT SUPPLIER_NAME
FROM FOOD_SUPPLIER
WHERE SUPPLIER_CITY = 'Chicago'
UNION
SELECT FIRST_NAME || ' ' || LAST_NAME
FROM WORKER
WHERE DEPT_CODE IN ('Tch', 'Leg', 'Fac');

/* RESULTS:

SUPPLIER_NAME                  
-------------------------------
Carole Shreve
Cole Gradle
Darius Richards
Downtowner Pizza
Elizabeth Cross
Fontinas Italian
Gio and Sons
Jebston Montrose Deli
Katelynn Rayner
Keyanna Jones
Lakeshore Bakery

SUPPLIER_NAME                  
-------------------------------
Tyler Harney

12 rows selected.

*/

--**********QUESTION 5**********
SELECT SUPPLIER_CITY
FROM FOOD_SUPPLIER
INTERSECT
SELECT CITY
FROM WORKER;


/* RESULTS:
SUPPLIER_CITY                 
------------------------------
Aurora
Chicago
Glencoe
Hinsdale
Oak Brook
Wilmette

6 rows selected. 

*/

--**********QUESTION 6**********
SELECT DISTINCT NVL(SUPPLIER_CITY, 'NO CITY')
FROM FOOD_SUPPLIER;

SELECT DISTINCT NVL(CITY, 'NO CITY')
FROM WORKER;

SELECT DISTINCT NVL(SUPPLIER_CITY, 'NO CITY')
FROM FOOD_SUPPLIER
MINUS
SELECT DISTINCT NVL(CITY, 'NO CITY')
FROM WORKER;

SELECT DISTINCT NVL(CITY, 'NO CITY')
FROM WORKER
MINUS
SELECT DISTINCT NVL(SUPPLIER_CITY, 'NO CITY')
FROM FOOD_SUPPLIER;
/* RESULTS:
A)
NVL(SUPPLIER_CITY,'NOCITY')   
------------------------------
Oak Brook
Aurora
Orland Park
Chicago
Wilmette
Glencoe
Hinsdale

7 rows selected. 
B)
NVL(CITY,'NOCITY')            
------------------------------
Oak Brook
Aurora
NO CITY
Chicago
Wilmette
Evanston
Hinsdale
Glencoe

8 rows selected. 
C)

NVL(SUPPLIER_CITY,'NOCITY')   
------------------------------
Orland Park

D)
NVL(CITY,'NOCITY')            
------------------------------
Evanston
NO CITY
*/
