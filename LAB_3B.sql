/*
Austin Polak
CNIT 27200 Fall 2020
Lab Time: Wednesday 6:53pm
Duration: hours (02/24 12:14am~)
*/
-- ********Question 1*****

DESC SHIPMENT;

select SHIPMENTID, ORDERID, SHIPNAME, SHIPSTATE
FROM SHIPMENT
WHERE SHIPSTATE = 'OK';

/* A
Name           Null?    Type         
-------------- -------- ------------ 
SHIPMENTID     NOT NULL VARCHAR2(10) 
ORDERID                 VARCHAR2(10) 
SHIPPERID               NUMBER(4)    
SHIPNAME                VARCHAR2(20) 
SHIPADDRESS             VARCHAR2(40) 
SHIPCITY                VARCHAR2(20) 
SHIPSTATE               CHAR(2)      
SHIPPOSTALCODE          CHAR(10)  

B
SHIPMENTID ORDERID    SHIPNAME             SH
---------- ---------- -------------------- --
H163       3000000381 Daniel Hundnall      OK
H242       3000000460 Daniel Hundnall      OK
H288       3001000514 Daniel Hundnall      OK
L132       3001000507 Karen Marko          OK
L158       3001000574 Ted Zissa            OK
M118       3001000618 Karen Marko          OK
M119       3001000628 Karen Marko          OK
M121       3001000634 Karen Marko          OK
M072       3000000328 Shelia Eagon         OK

9 rows selected. 

*/
--*****QUESTION 2******
SELECT DISTINCT CITY
FROM EMPLOYEE;

SELECT DISTINCT CITY, JOBTITLE
FROM EMPLOYEE;
/* RESULTS:
A
CITY                
--------------------
Torrington
Putnam
Groton
New Haven
Enfield

B
CITY                 JOBTITLE                           
-------------------- -----------------------------------
New Haven            Chief Financial Officer            
Torrington           Engineer                           
Putnam               Chief Information Officer          
New Haven            Sales                              
Enfield              Engineer                           
Putnam               Sales                              
Torrington           Assembly                           
Enfield              VP Operations                      
Groton               VP Information                     
Enfield              Operations Officer                 
Groton               President                          

CITY                 JOBTITLE                           
-------------------- -----------------------------------
Putnam               Assembly                           
New Haven            Programmer Analyst                 
Groton               Assembly                           
Torrington           Sales                              
New Haven            Assembly                           
Putnam               Engineer                           
Torrington           Chief Sales Officer                
Torrington           Programmer Analyst                 
Torrington           Operations Officer                 
Torrington           DBA                                
Putnam               VP Finance                         

CITY                 JOBTITLE                           
-------------------- -----------------------------------
New Haven            Accountant                         
Enfield              Assembly                           

24 rows selected. 
*/
--*****QUESTION 3******
SET LINESIZE 200;
SELECT CUSTOMERID, CUSTLASTNAME, CITY, STATE, EMAILADDR
FROM CUSTOMER
WHERE CITY = 'Chicago';

SELECT CUSTOMERID, CUSTLASTNAME, CITY, STATE, EMAILADDR
FROM CUSTOMER
WHERE STATE = 'IL' AND (CITY ='Chicago' OR CITY = 'Rockford');

/* RESULTS:
A
CUSTOMERID CUSTLASTNAME         CITY                 ST EMAILADDR                                         
---------- -------------------- -------------------- -- --------------------------------------------------
C-200026   Lichty               Chicago              IL bankrupt@live.com                                 
C-200075   Bross                Chicago              IL placetolive@aptref.com 

B
CUSTOMERID CUSTLASTNAME         CITY                 ST EMAILADDR                                         
---------- -------------------- -------------------- -- --------------------------------------------------
C-200026   Lichty               Chicago              IL bankrupt@live.com                                 
C-200075   Bross                Chicago              IL placetolive@aptref.com                            
I-200006   Fannon               Rockford             IL ef@yahoo.com                                      
I-200038   Smith                Rockford             IL dsmith443@outlook.com                             
*/

--**********QUESTION 4**********
SELECT SUPPLIERID,PARTNUMBER, UNITCOST, UNITOFMEASURE, 
(UNITCOST / UNITOFMEASURE) AS PIECE_PER_COST
FROM SUPPLIEDPART
WHERE UNITOFMEASURE BETWEEN '30' AND '40' 
AND (UNITCOST / UNITOFMEASURE) <=50
ORDER BY UNITCOST;
/* RESULTS:
SUPPLIERID PARTNUMBER   UNITCOST UNITOFMEASURE PIECE_PER_COST
---------- ---------- ---------- ------------- --------------
MM-104     BRK-009         85.85            32      2.6828125
TA-144     CAB-017        124.75            34     3.66911765
PA-450     CAB-022        145.85            32      4.5578125
WE-450     CAB-012        187.75            30     6.25833333
CA-105     CAB-004        194.75            32      6.0859375
DCI-450    ICAB-005       224.75            32      7.0234375
CF-450     ADT-003        225.85            32      7.0578125
PP-103     BRK-001         244.6            35     6.98857143
CF-450     MIC-007        459.25            33     13.9166667
MY-450     CAB-002        554.75            32     17.3359375
PP-103     MIC-005        557.51            39     14.2951282

SUPPLIERID PARTNUMBER   UNITCOST UNITOFMEASURE PIECE_PER_COST
---------- ---------- ---------- ------------- --------------
C-455      ADT-004        615.44            35         17.584
PP-103     CRD-006        745.85            32     23.3078125
NN-455     CAB-026        745.85            32     23.3078125
CA-103     MIC-001       1149.25            33     34.8257576
MC-455     MEM-012       1435.86            32      44.870625
PP-103     MOM-004       1545.85            32     48.3078125

17 rows selected. 
*/

--**********QUESTION 5**********
SELECT EMPLOYEEID, FIRSTNAME || ' ' || LASTNAME AS EMPLOYEE_NAME, BIRTHDATE, JOBTITLE
FROM EMPLOYEE
WHERE (BIRTHDATE BETWEEN '1-JAN-1975' AND '31-DEC-1990')
AND RELEASEDATE is null
AND JOBTITLE = 'DBA' OR JOBTITLE = 'Engineer';
/* RESULTS:
EMPLOYEEID EMPLOYEE_NAME                        BIRTHDATE JOBTITLE                           
---------- ------------------------------------ --------- -----------------------------------
250104     Michael Blair                        28-SEP-80 Engineer                           
250200     Lauren Hernandez                     17-NOV-91 Engineer                           
250209     Trinidad Reyes                       01-MAY-82 Engineer                           
250559     Carmen Romilda                       23-JUN-82 Engineer                           
250700     Charles Jones                        26-JUN-75 DBA                                
250944     Ryan Thompson                        20-JUN-86 Engineer                           

6 rows selected. 
*/

--**********QUESTION 6**********
SELECT CUSTOMERID, CUSTLASTNAME, CUSTFIRSTNAME, CITY, STATE
FROM CUSTOMER
WHERE STATE NOT IN ('IN', 'IL', 'KY')
AND EMAILADDR IS NULL
ORDER BY CITY;
/* RESULTS:

CUSTOMERID CUSTLASTNAME         CUSTFIRSTNAME   CITY                 ST
---------- -------------------- --------------- -------------------- --
I-200057   Owens                Tonya           Abbeville            SC
I-200095   Schuman              Joseph          Akron                OH
I-200090   Laake                James           Aladdin              WY
I-200071   Zissa                Ted             Ardmore              OK
I-200016   Austin               Peter           Barnwell             SC
I-200050   Schilling            James           Cedar Rapids         IA
I-200003   Hague                Carl            Cincinnati           OH
I-200107   Basham               Nancy           Dexter               ME
I-200076   Carlton              Tim             Enfield              CT
I-200101   Dunlap               Chris           Gillette             WY
I-200086   McGrew               Zach            Globe                AZ

CUSTOMERID CUSTLASTNAME         CUSTFIRSTNAME   CITY                 ST
---------- -------------------- --------------- -------------------- --
I-200044   Cool                 Louise          Hailey               ID
I-200081   Price                Bryan           Hampton              VA
I-200123   Bowen                Linda           Huron                SD
I-200075   Cortez               Robert          Keene                NH
I-200140   Webb                 Jim             Lowell               MA
I-200129   Vanderhoff           Rosemary        Macon                GA
I-200040   Gunderson            Kathy           Marianna             FL
I-200151   Huegel               Andy            Milford              DE
I-200139   Malady               Frank           Nahunta              GA
I-200067   Camargo              Travis          Neosho               MO
I-200082   Ziekart              Helene          New Haven            CT

CUSTOMERID CUSTLASTNAME         CUSTFIRSTNAME   CITY                 ST
---------- -------------------- --------------- -------------------- --
I-200012   Jackson              Kevin           New Orleans          LA
I-200150   Poczekay             Irene           Newport              RI
I-200091   Stabnik              Daniel          Perryville           MO
I-200073   Eagon                Dean            Peublo               CO
I-200079   Wilson               Christina       Pratt                KS
I-200029   Baldocchio           Tammi           Slatersville         RI
I-200024   Hedden               Joan            Springdale           AR
I-200066   Ball                 Ruth            St. Cloud            MN
I-200013   Osborne              Shirley         Swainsboro           GA
I-200036   Montgomery           Andrea          Thurmont             MD
I-200064   Jacko                Jo              Tucson               AZ

CUSTOMERID CUSTLASTNAME         CUSTFIRSTNAME   CITY                 ST
---------- -------------------- --------------- -------------------- --
I-200055   Clute                Jon             Tucson               AZ
I-200160   Hill                 Zack            Winston              OR
I-200056   Henderson            Elizabeth       Zeona                SD

36 rows selected. 
*/

--**********QUESTION 7**********
SET LINESIZE 200;
SELECT EMAILADDR, COMPANYNAME, CONTACTNAME, STATE
FROM SUPPLIER
WHERE COMPANYNAME LIKE '%Computer%' Or State = 'NY';
/* RESULTS:
EMAILADDR                                          COMPANYNAME                    CONTACTNAME          ST
-------------------------------------------------- ------------------------------ -------------------- --
rthomas@compclub.com                               Computer Club                  Rob Thomas           PA
Sgoodman@compzone.com                              Computer Zone                  Sandy Goodman        ID
acyr@itcreate.com                                  IT Creations                   Adam Cyr             NY
Wnewlon@comvision.com                              Computer Visions               William Newlon       CA
LoraineP@targetpc.com                              TargetPC                       Loraine Platt        NY
eclark@limitcomp.com                               Limited Comp                   Elizabeth Clark      NY
jpickett@compsurplus.com                           Computer Surplus               Jamie Pickett        OH
Dblythe@compmedic.com                              Computer Medic                 Donald Blythe        AZ
bpritchett@compsurplus.com                         Computer Surplus               Brenda Pritchett     DE
jtighe@securesol.com                               Secure Solutions               Johanna Tighe        NY

10 rows selected. 
*/

--**********QUESTION 8**********
SELECT CUSTOMERID, (CUSTTITLE || ' ' || CUSTLASTNAME) AS GREETING, PHONE, EMAILADDR
FROM CUSTOMER
WHERE EMAILADDR LIKE '%gmail%'
AND COMPANYNAME IS NULL;
/* RESULTS:
CUSTOMERID GREETING                   PHONE        EMAILADDR                                         
---------- -------------------------- ------------ --------------------------------------------------
I-200002   Mr. Caldwell               606-901-1238 lcaldwell@gmail.com                               
I-200007   Ms. Cain                   517-901-2610 jcain@gmail.com                                   
I-200010   Dr. Gross                  908-879-8672 jgross@gmail.com                                  
I-200021   Mr. Smith                  719-822-8828 matsm@gmail.com                                   
I-200026   Ms. Xu                     417-546-2570 txu@gmail.com                                     
I-200027   Ms. Sharp                  360-650-5604 dsharp@gmail.com                                  
I-200034   Mr. Jones                  971-522-5851 jjones@gmail.com                                  
I-200042   Mr. Trenkle                856-267-7913 gtrenkle@gmail.com                                
I-200047   Dr. Yarian                 919-310-2224 syarian@gmail.com                                 
I-200048   Mr. Bollock                307-635-1692 pat@gmail.com                                     
I-200053   Mrs. Pearl                 660-447-8319 spearl@gmail.com                                  

CUSTOMERID GREETING                   PHONE        EMAILADDR                                         
---------- -------------------------- ------------ --------------------------------------------------
I-200077   Mrs. Hundley               304-713-3298 jenhund@gmail.com                                 
I-200080   Mr. Nugent                 802-352-8923 nugent@gmail.com                                  
I-200104   Mr. Gardiner               225-313-6268 lgardiner@gmail.com                               
I-200111   Mr. Manaugh                907-747-5603 jmanaugh@gmail.com                                
I-200114   Mr. Darling                860-684-1620 randolph@gmail.com                                
I-200126   Mr. Moore                  206-692-2845 chrismoore29@gmail.com                            
I-200127   Mrs. Watson                801-746-7701 mswatson@gmail.com                                
I-200131   Mr. Stahley                305-774-5340 rstahley@gmail.com                                
I-200142   Mr. Williams               435-774-4595 marcw332@gmail.com                                
I-200147   Mr. Yaun                   317-780-9804 stevenyaun@gmail.com                              
I-200157   Ms. Toldner                403-744-4677 mtoldner@gmail.com                                

CUSTOMERID GREETING                   PHONE        EMAILADDR                                         
---------- -------------------------- ------------ --------------------------------------------------
I-200158   Ms. Tennison               914-622-8633 jtennison@gmail.com                               

23 rows selected. 
*/

--**********QUESTION 9**********
SELECT SUPPLIERID, CATALOGNUMBER, UNITQUANTITY, ORDEREDUNITCOST, (UNITQUANTITY * ORDEREDUNITCOST) AS SUBTOTAL
FROM PURCHORDERLINE
WHERE ORDEREDUNITCOST > 3000
ORDER BY UNITQUANTITY;
/* RESULTS:

SUPPLIERID CATALOGNUM UNITQUANTITY ORDEREDUNITCOST   SUBTOTAL
---------- ---------- ------------ --------------- ----------
DE-450     950-6879              1         5319.82    5319.82
WE-450     525-0254              1         5623.82    5623.82
CV-104     600-3645              1         3219.64    3219.64
LL-455     375-2475              1         7051.73    7051.73
JLI-450    500-3143              2         6047.37   12094.74
MC-455     625-4701              2         3023.64    6047.28
MM-104     900-6198              2         5373.73   10747.46
CCS-106    450-1872              2         3239.73    6479.46
MC-455     625-6136              2         6479.73   12959.46
WE-450     525-0683              2        12351.33   24702.66
RC-450     875-6392              2         7539.64   15079.28

SUPPLIERID CATALOGNUM UNITQUANTITY ORDEREDUNITCOST   SUBTOTAL
---------- ---------- ------------ --------------- ----------
GC-450     100-1308              2         5759.73   11519.46
OI-450     175-5737              3         6244.22   18732.66
SS-455     550-4737              3         5218.48   15655.44
PP-103     225-5281              3          5507.7    16523.1
SS-455     550-2602              5         5792.52    28962.6
MC-455     625-0668              5         3455.64    17278.2
SS-455     550-9888              5         8622.38    43111.9
LL-455     375-3877              7         3022.11   21154.77
MY-450     300-3181             20         3003.82    60076.4
NA-450     250-1642             20          7549.2     150984
OI-450     175-2503             25          5038.5   125962.5

22 rows selected. 
*/

/*
Question 10: Using describe let me see the name of rows and columns.
Question 11: 'AND' means the data will need to have both conditions in the statement. 
Where 'OR' will want to pull data that is fullfilling either condition in the 'OR' Statement.
Question 12: Using 'NOT IN' means everything but (what is not wanted in the table).
It will limit the data being search through and the table will be smaller.
Question 13: Concatenating is when you combine two names of rows and forming a new one. 
R1 || ' ' || R2
Question 14: 'LIKE' will let you pull up anything with a certain name in it. 
Question 15: A calculated field uses the values from another field. 
To filter out unwanted results for better analyses.
Also, to calculate ratios to save storage resources and database process.