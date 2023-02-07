 /*
Austin Polak
CNIT 27200 Fall 2020
Lab Time: Sunday 3:14pm
Duration: hours (02/28 7:35pm~)
*/
-- ********Question 1*****

DESC USER_TABLES;

SELECT Table_Name
FROM USER_TABLES;
/* RESULTS:
A)
Name                      Null?    Type           
------------------------- -------- -------------- 
TABLE_NAME                NOT NULL VARCHAR2(128)  
TABLESPACE_NAME                    VARCHAR2(30)   
CLUSTER_NAME                       VARCHAR2(128)  
IOT_NAME                           VARCHAR2(128)  
STATUS                             VARCHAR2(8)    
PCT_FREE                           NUMBER         
PCT_USED                           NUMBER         
INI_TRANS                          NUMBER         
MAX_TRANS                          NUMBER         
INITIAL_EXTENT                     NUMBER         
NEXT_EXTENT                        NUMBER         
MIN_EXTENTS                        NUMBER         
MAX_EXTENTS                        NUMBER         
PCT_INCREASE                       NUMBER         
FREELISTS                          NUMBER         
FREELIST_GROUPS                    NUMBER         
LOGGING                            VARCHAR2(3)    
BACKED_UP                          VARCHAR2(1)    
NUM_ROWS                           NUMBER         
BLOCKS                             NUMBER         
EMPTY_BLOCKS                       NUMBER         
AVG_SPACE                          NUMBER         
CHAIN_CNT                          NUMBER         
AVG_ROW_LEN                        NUMBER         
AVG_SPACE_FREELIST_BLOCKS          NUMBER         
NUM_FREELIST_BLOCKS                NUMBER         
DEGREE                             VARCHAR2(10)   
INSTANCES                          VARCHAR2(10)   
CACHE                              VARCHAR2(5)    
TABLE_LOCK                         VARCHAR2(8)    
SAMPLE_SIZE                        NUMBER         
LAST_ANALYZED                      DATE           
PARTITIONED                        VARCHAR2(3)    
IOT_TYPE                           VARCHAR2(12)   
TEMPORARY                          VARCHAR2(1)    
SECONDARY                          VARCHAR2(1)    
NESTED                             VARCHAR2(3)    
BUFFER_POOL                        VARCHAR2(7)    
FLASH_CACHE                        VARCHAR2(7)    
CELL_FLASH_CACHE                   VARCHAR2(7)    
ROW_MOVEMENT                       VARCHAR2(8)    
GLOBAL_STATS                       VARCHAR2(3)    
USER_STATS                         VARCHAR2(3)    
DURATION                           VARCHAR2(15)   
SKIP_CORRUPT                       VARCHAR2(8)    
MONITORING                         VARCHAR2(3)    
CLUSTER_OWNER                      VARCHAR2(128)  
DEPENDENCIES                       VARCHAR2(8)    
COMPRESSION                        VARCHAR2(8)    
COMPRESS_FOR                       VARCHAR2(30)   
DROPPED                            VARCHAR2(3)    
READ_ONLY                          VARCHAR2(3)    
SEGMENT_CREATED                    VARCHAR2(3)    
RESULT_CACHE                       VARCHAR2(7)    
CLUSTERING                         VARCHAR2(3)    
ACTIVITY_TRACKING                  VARCHAR2(23)   
DML_TIMESTAMP                      VARCHAR2(25)   
HAS_IDENTITY                       VARCHAR2(3)    
CONTAINER_DATA                     VARCHAR2(3)    
INMEMORY                           VARCHAR2(8)    
INMEMORY_PRIORITY                  VARCHAR2(8)    
INMEMORY_DISTRIBUTE                VARCHAR2(15)   
INMEMORY_COMPRESSION               VARCHAR2(17)   
INMEMORY_DUPLICATE                 VARCHAR2(13)   
DEFAULT_COLLATION                  VARCHAR2(100)  
DUPLICATED                         VARCHAR2(1)    
SHARDED                            VARCHAR2(1)    
EXTERNAL                           VARCHAR2(3)    
HYBRID                             VARCHAR2(3)    
CELLMEMORY                         VARCHAR2(24)   
CONTAINERS_DEFAULT                 VARCHAR2(3)    
CONTAINER_MAP                      VARCHAR2(3)    
EXTENDED_DATA_LINK                 VARCHAR2(3)    
EXTENDED_DATA_LINK_MAP             VARCHAR2(3)    
INMEMORY_SERVICE                   VARCHAR2(12)   
INMEMORY_SERVICE_NAME              VARCHAR2(1000) 
CONTAINER_MAP_OBJECT               VARCHAR2(3)    
MEMOPTIMIZE_READ                   VARCHAR2(8)    
MEMOPTIMIZE_WRITE                  VARCHAR2(8)    
HAS_SENSITIVE_COLUMN               VARCHAR2(3)    
ADMIT_NULL                         VARCHAR2(3)    
DATA_LINK_DML_ENABLED              VARCHAR2(3)    
LOGICAL_REPLICATION                VARCHAR2(8)    

B)

TABLE_NAME                                                                                                                      
--------------------------------------------------------------------------------------------------------------------------------
WORKER
FOOD
DEPARTMENT
LUNCH
LUNCH_ITEM
FOOD_SUPPLIER
CUSTOMER
SUPPLIER
CATEGORY
SHIPPER
EMPLOYEE

TABLE_NAME                                                                                                                      
--------------------------------------------------------------------------------------------------------------------------------
INVENTORYPART
SUPPLIEDPART
BILLOFMATERIALS
PURCHASEORDER
PURCHORDERLINE
MACHINE
PROCESSROUTING
PROCESS
MACHINEPROCESS
OPERATION
CUSTORDER

TABLE_NAME                                                                                                                      
--------------------------------------------------------------------------------------------------------------------------------
CUSTORDERLINE
SHIPMENT
PACKINGSLIP
SHIPPEDITEM
TIMECARDLINE

27 rows selected.
*/

-- ********Question 2*****

SET LINESPACED 200;
SELECT TRUNC (477.83649, 1)
FROM DUAL;

SET LINESPACED 200;
SELECT TRUNC (477.83649, 2)
FROM DUAL;

SET LINESPACED 200;
SELECT ROUND (477.83649, -1)
FROM DUAL;

SET LINESPACED 200;
SELECT ROUND (477.83649, 1)
FROM DUAL;

SET LINESPACED 200;
SELECT ROUND (477.83649, 2)
FROM DUAL;

SET LINESPACED 200;
SELECT ROUND (477.83649, -1)
FROM DUAL;

/* RESULTS:
A)
a)
TRUNC(477.83649,1)
------------------
             477.8
b)
TRUNC(477.83649,2)
------------------
            477.83
c)
TRUNC(477.83649,-1)
-------------------
                470 

B)
a)
ROUND(477.83649,1)
------------------
             477.8
b)
ROUND(477.83649,2)
------------------
            477.84
c)
ROUND(477.83649,-1)
-------------------
                480
*/
-- ********Question 3*****
SET LINESPACE 200;
SELECT DESCRIPTION, LENGTH(DESCRIPTION) AS DESC_LENGTH,PRODUCT_CODE,UPPER(PRODUCT_CODE)
FROM FOOD
WHERE DESCRIPTION LIKE '%Pizza%' OR DESCRIPTION LIKE '%Cake%';
/* RESULTS:

DESCRIPTION          DESC_LENGTH PR UP
-------------------- ----------- -- --
Sausage Pizza                 13 Pz PZ
Velvet Cake                   11 Ds DS
Mushroom Pizza                14 Pz PZ
Cheese Pizza                  12 Pz PZ
*/
-- ********Question 4*****

SELECT SUPPLIER_ID, DESCRIPTION, PRICE, NVL(PRICE_UPCHARGE, '.01') AS PRICE_UPCHARGE
FROM FOOD
WHERE PRICE BETWEEN 6.00 AND 12.00;

SELECT SUPPLIER_ID, DESCRIPTION, PRICE, PRICE_UPCHARGE
FROM FOOD
WHERE PRICE BETWEEN '6' AND '12';
/* RESULTS:
SUP DESCRIPTION               PRICE PRICE_UPCHARGE
--- -------------------- ---------- --------------
Ard Sausage Pizza              6.25            .01
Hsd Protein Plate                 9             .5
Crm Philly Melt                 8.6             .7
Crm Ham Melt                    7.2             .3
Jmd Potato Soup                6.25            .01
Jmd Mushroom Pizza                8            .15
Dpz Cheese Pizza                8.5            .01
Blu Turkey Club                 7.5             .5
Lak Spinach Salad              6.25            .01

9 rows selected. 

SUP DESCRIPTION               PRICE PRICE_UPCHARGE
--- -------------------- ---------- --------------
Ard Sausage Pizza              6.25               
Hsd Protein Plate                 9             .5
Crm Philly Melt                 8.6             .7
Crm Ham Melt                    7.2             .3
Jmd Potato Soup                6.25               
Jmd Mushroom Pizza                8            .15
Dpz Cheese Pizza                8.5               
Blu Turkey Club                 7.5             .5
Lak Spinach Salad              6.25               

9 rows selected. 
*/
-- ********Question 5*****

SELECT TO_CHAR(MIN(HIRE_DATE), 'MONTH DD, YYYY, DAY') AS MIN_DATE,
TO_CHAR(MAX(HIRE_DATE), 'MONTH DD, YYYY, DAY') AS MAX_DATE
FROM WORKER;
/* RESULTS:
MIN_DATE                      MAX_DATE                     
----------------------------- -----------------------------
SEPTEMBER 13, 2003, SATURDAY  NOVEMBER  19, 2019, TUESDAY  
*/
-- ********Question 6*****

SELECT DEPT_CODE,COUNT(*) AS WORKERS_DEPT, TO_CHAR(SUM(CREDIT_LIMIT),'$999.99') AS TOTAL_CREDIT
FROM WORKER
GROUP BY DEPT_CODE
ORDER  BY DEPT_CODE;

SELECT DEPT_CODE,COUNT(WORKER_ID) AS WORKERS_DEPT, TO_CHAR(SUM(CREDIT_LIMIT),'$999.99') AS TOTAL_CREDIT
FROM WORKER
GROUP BY DEPT_CODE
ORDER  BY DEPT_CODE;

SELECT DEPT_CODE,COUNT(CITY) AS WORKERS_DEPT, TO_CHAR(SUM(CREDIT_LIMIT),'$999.99') AS TOTAL_CREDIT
FROM WORKER
GROUP BY DEPT_CODE
ORDER  BY DEPT_CODE;
/* RESULTS:

DEP WORKERS_DEPT TOTAL_CR
--- ------------ --------
Acc            3   $72.00
Aud            3   $72.00
Com            1   $22.00
Exe            1   $45.00
Fin            2   $48.00
Hmn            3   $68.00
Leg            2   $50.00
Sal            2   $53.00
Srv            3   $89.00
Tch            5  $132.00
               7  $172.00

11 rows selected. 


DEP WORKERS_DEPT TOTAL_CR
--- ------------ --------
Acc            3   $72.00
Aud            3   $72.00
Com            1   $22.00
Exe            1   $45.00
Fin            2   $48.00
Hmn            3   $68.00
Leg            2   $50.00
Sal            2   $53.00
Srv            3   $89.00
Tch            5  $132.00
               7  $172.00

11 rows selected. 


DEP WORKERS_DEPT TOTAL_CR
--- ------------ --------
Acc            2   $72.00
Aud            2   $72.00
Com            1   $22.00
Exe            1   $45.00
Fin            2   $48.00
Hmn            3   $68.00
Leg            2   $50.00
Sal            2   $53.00
Srv            3   $89.00
Tch            4  $132.00
               5  $172.00

11 rows selected. 
*/
-- ********Question 7*****

SELECT SUPPLIER_ID, PRODUCT_CODE, COUNT(ITEM_NUMBER) AS LUNCH_ITEMS
FROM LUNCH_ITEM
GROUP BY SUPPLIER_ID, PRODUCT_CODE
ORDER BY SUPPLIER_ID;
/* RESULTS:

SUP PR LUNCH_ITEMS
--- -- -----------
Ard Pz           2
Blu Cp           1
Blu Sw           1
Crm Br           1
Crm Hb           6
Crm Ps          12
Crm Sw           5
Dpz Br           4
Dpz Pz           2
Dpz Sc           1
Foi Ds           3

SUP PR LUNCH_ITEMS
--- -- -----------
Foi Ff          10
Foi Sp           3
Foi Vt           1
Gls Br           1
Gls Ds           4
Hsd Cs          13
Hsd Ds           6
Hsd Pp           1
Hsd Sp          10
Jd6 Cf           4
Jd6 Ds           9

SUP PR LUNCH_ITEMS
--- -- -----------
Jd6 Vr          19
Jmd Pz           2
Jmd Sp           1
Jmd Vr           7
Lak Br           1
Lak Sd           1
Lak Sw           1
Lss Sp           2
Lss Sw           4

31 rows selected. 
*/
-- ********Question 8*****
SELECT SUPPLIER_ID, ROUND(AVG(PRICE), 2) AS AVG_PRICE
FROM FOOD
GROUP BY SUPPLIER_ID;

SELECT SUPPLIER_ID, COUNT(*), ROUND(AVG(PRICE), 2) AS AVG_PRICE
FROM FOOD
GROUP BY SUPPLIER_ID;

SELECT SUPPLIER_ID, COUNT(*), ROUND(AVG(PRICE), 2) AS AVG_PRICE
FROM FOOD
WHERE PRODUCT_CODE IN ('Pz', 'Sp', 'Ds')
GROUP BY SUPPLIER_ID;

SELECT SUPPLIER_ID, COUNT(*), ROUND(AVG(PRICE), 2) AS AVG_PRICE
FROM FOOD
WHERE PRODUCT_CODE IN ('Pz', 'Sp', 'Ds')
GROUP BY SUPPLIER_ID
HAVING AVG(PRICE)>4.5;
/* RESULTS:
a)
SUP  AVG_PRICE
--- ----------
Ard       6.25
Blu       5.15
Crm       6.26
Dpz       3.42
Foi       3.69
Gls       3.23
Hsd       5.88
Jd6       2.42
Jmd       4.65
Lak        4.7
Lss        5.4

11 rows selected. 

b)
SUP   COUNT(*)  AVG_PRICE
--- ---------- ----------
Ard          1       6.25
Blu          2       5.15
Crm          4       6.26
Dpz          3       3.42
Foi          4       3.69
Gls          3       3.23
Hsd          4       5.88
Jd6          3       2.42
Jmd          4       4.65
Lak          3        4.7
Lss          2        5.4

11 rows selected. 

c)
SUP   COUNT(*)  AVG_PRICE
--- ---------- ----------
Ard          1       6.25
Dpz          1        8.5
Foi          2       4.63
Gls          1        3.5
Hsd          2       4.38
Jd6          1       3.45
Jmd          2       7.13
Lss          1       4.85

8 rows selected. 

d)
SUP   COUNT(*)  AVG_PRICE
--- ---------- ----------
Ard          1       6.25
Dpz          1        8.5
Foi          2       4.63
Jmd          2       7.13
Lss          1       4.85
*/
-- ********Question 9*****
SELECT PRODUCT_CODE, DESCRIPTION, PRICE
    FROM FOOD
    WHERE PRICE >= (SELECT AVG(PRICE)
    FROM FOOD);
    
    SELECT AVG(PRICE)
    FROM FOOD;
/* RESULTS:
a)
PR DESCRIPTION               PRICE
-- -------------------- ----------
Pz Sausage Pizza              6.25
Cs Chef Salad                 5.75
Pp Protein Plate                 9
Sw Grilled Cheese             5.25
Ps Philly Melt                 8.6
Hb Ham Melt                    7.2
Sp Barley Soup                4.75
Sp Potato Soup                6.25
Pz Mushroom Pizza                8
Sw Grilled Cheese             5.95
Sp Veggie Soup                4.85

PR DESCRIPTION               PRICE
-- -------------------- ----------
Pz Cheese Pizza                8.5
Vr Mango Smoothie             4.95
Sw Turkey Club                 7.5
Sw Caprese                     5.5
Sd Spinach Salad              6.25

16 rows selected. 

b)
AVG(PRICE)
----------
4.56212121
*/