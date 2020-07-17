create or alter proc usp_insert_contracts @nr_of_rows int
as
	declare @n int
	declare @random1 int
	declare @random2 int
	set @n=1
	set identity_insert Contract on
	while @n<@nr_of_rows
	begin
		set @random1 = floor(rand()*10000)
		set @random2 = floor(rand()*10000)
		insert into Contract(cid, fcid, fid) values(@n, @random1, @random2)
		set @n=@n+1
	end
	set identity_insert Contract off
GO

--a)
exec usp_insert_footballers 10000
delete from Footballers where fid >= 4

--1
select * from Footballers as F where F.fid = 110

--2
select * from Footballers as F where F.lname = 'L_26'

--3
CREATE NONCLUSTERED INDEX Index_Fname ON Footballers(fname);

DROP INDEX Index_Fname on Footballers

select distinct(fname) from Footballers

--4,5
select * from Footballers as F where F.cnp = 10003

--b)
exec usp_insert_football_clubs 10000
delete from FootballClubs where fcid >= 4

select * from FootballClubs where revenue_position = 20

CREATE NONCLUSTERED INDEX Index_Revenue ON FootballClubs(revenue_position);

DROP INDEX Index_Revenue on FootballClubs

--c)
exec usp_insert_contracts 1000
select * from Contract
delete from Contract

create or alter view task_c
as select fname
	from Footballers as F
	Join Contract C on F.fid = C.fid 

select * from task_c





