/*
Austin Polak
CNIT 27200 Fall 2020
Lab Time: Sunday 4:17pm
Duration: hours (03/14 N/A~)
*/
-- ********Question 1*****
SELECT SUPPLIER_ID, PRODUCT_CODE, DESCRIPTION, PRICE
FROM FOOD
WHERE SUPPLIER_ID 
IN (SELECT SUPPLIER_ID
FROM FOOD_SUPPLIER
WHERE SUPPLIER_NAME LIKE '%Deli%')
ORDER BY SUPPLIER_ID;


/* RESULTS:
SUP PR DESCRIPTION               PRICE
--- -- -------------------- ----------
Ard Pz Sausage Pizza              6.25
Blu Cp Chips                       2.8
Blu Sw Turkey Club                 7.5
Hsd Cs Chef Salad                 5.75
Hsd Ds Velvet Cake                 4.5
Hsd Pp Protein Plate                 9
Hsd Sp Chicken Soup               4.25
Jd6 Cf Coffee                     1.55
Jd6 Ds Brownie                    3.45
Jd6 Vr Soda                       2.25
Jmd Pz Mushroom Pizza                8

SUP PR DESCRIPTION               PRICE
--- -- -------------------- ----------
Jmd Sp Potato Soup                6.25
Jmd Vr Iced Tea                   2.85
Jmd Vt Cole Slaw                   1.5

14 rows selected. 

*/
--*****QUESTION 2******
SET LINESIZE 200
SELECT WORKER_ID,LAST_NAME,DEPT_CODE,CREDIT_LIMIT
FROM WORKER
WHERE WORKER_ID 
NOT IN (SELECT WORKER_ID
FROM LUNCH);
/* RESULTS:
WOR LAST_NAME            DEP CREDIT_LIMIT
--- -------------------- --- ------------
556 Shreve               Tch           30
558 Campbell             Hmn           30
561 Bensen               Aud           25
566 Tevona               Hmn           21
569 Sumner               Fin           28
574 Irwin                              32
580 Gonzalez             Acc           18
583 Montre                             25
586 Williams                           25

9 rows selected. 
*/
--*****QUESTION 3******
SET LINESIZE 200
SELECT W.WORKER_ID, LAST_NAME, DEPT_CODE, LUNCH_ID, TO_CHAR(LUNCH_DATE, 'MON-YYYY') AS LUNCH_DATE
FROM WORKER W INNER JOIN LUNCH L
ON W.WORKER_ID = L.WORKER_ID
WHERE LUNCH_DATE LIKE '%MAY%' OR LUNCH_DATE LIKE '%JULY%'
ORDER BY LUNCH_DATE;

/* RESULTS:
WOR LAST_NAME            DEP   LUNCH_ID LUNCH_DA
--- -------------------- --- ---------- --------
555 Reynolds             Exe          7 MAY-2020
555 Reynolds             Exe          8 MAY-2020
557 Gradle               Leg          2 MAY-2020
559 Neal                 Srv          9 MAY-2020
562 Armstrong            Com          4 MAY-2020
564 Kingman              Sal          6 MAY-2020
584 Harney               Tch          1 MAY-2020
568 Young                             3 MAY-2020
568 Young                            13 MAY-2020
573 White                Aud         11 MAY-2020
577 Martin               Sal         12 MAY-2020

WOR LAST_NAME            DEP   LUNCH_ID LUNCH_DA
--- -------------------- --- ---------- --------
582 Cross                Acc          5 MAY-2020
564 Kingman              Sal         10 MAY-2020

13 rows selected. 
*/

--**********QUESTION 4**********
SELECT LAST_NAME, FIRST_NAME, DEPT_CODE, LUNCH_DATE
FROM WORKER W INNER JOIN LUNCH L
ON W.WORKER_ID = L.WORKER_ID
WHERE DEPT_CODE = 'Leg';

SELECT LAST_NAME, FIRST_NAME, DEPT_CODE, LUNCH_DATE, L.LUNCH_ID, ITEM_NUMBER
FROM WORKER W INNER JOIN LUNCH L 
ON W.WORKER_ID = L.WORKER_ID
INNER JOIN LUNCH_ITEM LI
ON L.LUNCH_ID = LI.LUNCH_ID
WHERE DEPT_CODE = 'Leg';

SELECT LAST_NAME, FIRST_NAME, DEPARTMENT_NAME, LUNCH_DATE, L.LUNCH_ID, ITEM_NUMBER
FROM WORKER W INNER JOIN LUNCH L 
ON W.WORKER_ID = L.WORKER_ID
INNER JOIN LUNCH_ITEM LI
ON L.LUNCH_ID = LI.LUNCH_ID
INNER JOIN DEPARTMENT D
ON W.DEPT_CODE = D.DEPT_CODE
WHERE W.DEPT_CODE = 'Leg';
/* RESULTS:
a)
LAST_NAME            FIRST_NAME DEP LUNCH_DAT
-------------------- ---------- --- ---------
Gradle               Cole       Leg 22-MAY-20
Gradle               Cole       Leg 15-JUN-20
Richards             Darius     Leg 10-JUN-20

b)
LAST_NAME            FIRST_NAME DEP LUNCH_DAT   LUNCH_ID ITEM_NUMBER
-------------------- ---------- --- --------- ---------- -----------
Gradle               Cole       Leg 22-MAY-20          2           1
Gradle               Cole       Leg 22-MAY-20          2           2
Gradle               Cole       Leg 22-MAY-20          2           3
Gradle               Cole       Leg 22-MAY-20          2           4
Richards             Darius     Leg 10-JUN-20         32           1
Richards             Darius     Leg 10-JUN-20         32           2
Gradle               Cole       Leg 15-JUN-20         35           1
Gradle               Cole       Leg 15-JUN-20         35           2

8 rows selected.

c)
LAST_NAME            FIRST_NAME DEPARTMENT_NAME                LUNCH_DAT   LUNCH_ID ITEM_NUMBER
-------------------- ---------- ------------------------------ --------- ---------- -----------
Gradle               Cole       Legal                          22-MAY-20          2           1
Gradle               Cole       Legal                          22-MAY-20          2           2
Gradle               Cole       Legal                          22-MAY-20          2           3
Gradle               Cole       Legal                          22-MAY-20          2           4
Richards             Darius     Legal                          10-JUN-20         32           1
Richards             Darius     Legal                          10-JUN-20         32           2
Gradle               Cole       Legal                          15-JUN-20         35           1
Gradle               Cole       Legal                          15-JUN-20         35           2

8 rows selected.
*/

--**********QUESTION 5**********
SELECT FS.SUPPLIER_ID, SUPPLIER_NAME, SUPPLIER_CITY, COUNT(F.PRODUCT_CODE) AS SUPPLIEDFOOD
FROM FOOD_SUPPLIER FS 
INNER JOIN FOOD F
ON FS.SUPPLIER_ID = F.SUPPLIER_ID
INNER JOIN LUNCH_ITEM L 
ON F.PRODUCT_CODE = L.PRODUCT_CODE
GROUP BY SUPPLIER_NAME
HAVING COUNT(F.PRODUCT_CODE)>10;
/* RESULTS:

*/

--**********QUESTION 6**********
col totalprice format $999.99
SELECT LAST_NAME, FIRST_NAME, DEPT_CODE, LUNCH_DATE, L.LUNCH_ID, MAX(PRICE) AS TOTALPRICE
FROM WORKER W
INNER JOIN LUNCH L
ON W.WORKER_ID = L.WORKER_ID
INNER JOIN LUNCH_ITEM LHI
ON L.LUNCH_ID = LHI.LUNCH_ID
INNER JOIN FOOD F
ON LHI.SUPPLIER_ID = F.SUPPLIER_ID
AND LHI.PRODUCT_CODE = F.PRODUCT_CODE
WHERE DEPT_CODE IS NOT NULL
AND MAX(PRICE) IN
(SELECT MAX(PRICE)
FROM FOOD WHERE PRICE= 'JUNE-2020')
ORDER BY ;
/* RESULTS:


*/

