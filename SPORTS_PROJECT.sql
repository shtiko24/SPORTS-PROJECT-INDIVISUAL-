SELECT * FROM SPPRO
SELECT * FROM SPGAME
SELECT * FROM SPPOINTS

---question 3 -- find 2nd highest student as per points IN YEAR 2021
Select * from SPPOINTS order by total desc ---JUST DISPLAYS FIRST RANK
Select uid,sportsid,total from SPPOINTS order by total desc 

SELECT*, ROW_NUMBER() OVER(ORDER BY TOTAL DESC)  ROW_NUM FROM SPPOINTS---DISPLAYS RANK NO AS ROWnum
Select * from SPPOINTS order by total asc 
SELECT *, DENSE_RANK() OVER (ORDER BY total DESC) DENRANK FROM SPPOINTS--- gives same no to the same value 

select * from (select *, dense_rank()over (order by total desc) as rank from sppoints) SPPOINTS where rank = 2---to show any rank no 

----------coping and conning
select* into spg from SPGAME----same table copied
select* from spg
DROP TABLE SPG1
select sportsid, points into spg1 from SPGAME--coping only required columns
select * from spg1

----------------joins------
select S1.std_name,S1. branch,S1. UID , S1.YEAR ,S2.UID FROM  SPpro AS S1 
   LEFT JOIN SPPOINTS AS S2 ON S1.UID = S2.UID
   WHERE S1.YEAR =2021

select * from SPPOINTS inner join SPpro  -- for whole table * that i both tables and all column we use star
on SPPOINTS.uid= SPpro.uid
-- for vast data specific table only table
select SPpro.Std_Name, SPPOINTS.TOTAL from sppro inner join SPPOINTS 
on SPpro.uid=SPPOINTS.uid
select SPpro.Branch, SPPOINTS.sportsID from sppro inner join SPPOINTS
on SPPOINTS.uid=SPpro.uid

select sppro.*, SPPOINTS.TOTAL  from SPpro inner join SPPOINTS 
on sppro.uid=sppoints.uid 

-------subquiries-------

select * from sppro
select* from sppoints
--q) of students playing badminton
select std_name from SPpro where uid IN (select UID from sppoints where sportsID = 'BAD36')---CHECK WHEATHER U WRITE UID IN BOTH THE SELECT STATEMENT

---q) student JADHAV PRITI KAILAS points and sports she played
SELECT TOTAL,sportsID,column3,column4,column5,column6,columN7 FROM SPPOINTS WHERE UID IN (SELECT UID FROM SPPRO WHERE Std_Name ='JADHAV PRITI KAILAS')--NO ANSWER

--q) display students details who has total points = 19
select * from SPpro where uid IN (select UID from sppoints where total=19 )

--q) display points from year 2022
select * from SPPOINTS where uid in (select uid from sppro where year=2022)

--q) display points less than 36
select * from sppro where uid in ( select uid from sppoints where total > 36)


---utube durga video no 6 -display student name who bought laptop
--for three queries watch utube durga part 6