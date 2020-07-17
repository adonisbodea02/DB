create or alter proc usp_insert_test
as
	declare @table_id int
	declare @nr_of_rows int
	declare curs cursor local for
		select T.TableID,T.NoOfRows from TestTables T where T.TestID = 1 order by T.Position
	open curs
	fetch next from curs into @table_id,@nr_of_rows
	while @@FETCH_STATUS=0
	begin
		if @table_id=1
		begin
			exec usp_insert_quizzes @nr_of_rows
		end
		else if @table_id=2
		begin
			exec usp_insert_songs @nr_of_rows
		end
		else if @table_id=3
		begin 
			exec usp_insert_links @nr_of_rows
		end
		fetch next from curs into @table_id,@nr_of_rows
	end
	close curs
	deallocate curs
go

create or alter proc usp_insert_quizzes @nr_of_rows int
as
	declare @n int
	set @n=20
	set identity_insert Quizzes on
	while @n<@nr_of_rows
	begin
		insert into Quizzes(quiz_id, creator) values(@n,'Creator_'+CONVERT(varchar(255),@n))
		set @n=@n+1
	end
	set identity_insert Quizzes off
go

create or alter proc usp_insert_songs @nr_of_rows int
as
	declare @n int
	set @n=20
	set identity_insert Songs on
	while @n<@nr_of_rows
	begin
		insert into Songs(song_id, song_name) values(@n,'Song_'+CONVERT(varchar(255),@n))
		set @n=@n+1
	end
	set identity_insert Songs off
go

create or alter proc usp_insert_links @nr_of_rows int
as
	declare @n int
	set @n=20
	while @n<@nr_of_rows
	begin
		insert into Links_Song_Quiz(song_id, quiz_id) values(@n,@n)
		set @n=@n+1
	end
go

create or alter proc usp_delete_test
as
	declare @table_id int
	declare curs cursor local for
		select T.TableID from TestTables T where T.TestID=2 order by T.Position
	open curs
	fetch next from curs into @table_id
	while @@FETCH_STATUS=0
	begin
		declare @delete_command varchar(100)
		if @table_id=2
		begin
			set @delete_command='DELETE FROM Songs WHERE song_id > 19'
		end
		else if @table_id=1
		begin
			set @delete_command='DELETE FROM Quizzes WHERE quiz_id > 19'
		end
		else if @table_id=3
		begin 
			set @delete_command='DELETE FROM Links_Song_Quiz WHERE quiz_id > 19 and song_id > 19'
		end
		exec (@delete_command)
		fetch next from curs into @table_id
	end
	close curs
	deallocate curs
go

create or alter proc usp_run_tests
as
	declare @start datetime
	declare @end datetime

	set @start=GETDATE()
	exec usp_run_TableTest
	set @end=GETDATE()

	declare @start2 datetime
	declare @end2 datetime

	set @start2=GETDATE()
	exec usp_run_ViewTest
	set @end2=GETDATE()

	insert into TestRuns(Description,StartAt,EndAt)
	values ('Tests for inserting/deleting and views', @start, @end2)

	declare @last int
	select @last = max(TestRuns.TestRunID) from TestRuns

	insert into TestRunTables(TestRunID,TableID,StartAt,EndAt)
	values (@last,1,@start,@end),(@last,2,@start,@end),(@last,3,@start,@end)

	insert into TestRunViews(TestRunID,ViewID,StartAt,EndAt)
	values (@last,1,@start2,@end2),(@last,2,@start2,@end2),(@last,3,@start2,@end2)
go

create or alter proc usp_run_TableTest
as
	declare @start datetime
	declare @end datetime

	set @start=GETDATE()
	exec usp_insert_test
	exec usp_delete_test
	set @end=GETDATE()
go

create or alter proc usp_run_ViewTest
as
	declare @start datetime
	declare @end datetime

	exec usp_insert_test
	set @start=GETDATE()

	declare @vid int
	declare curs cursor local for select T.ViewID from TestViews as T where T.TestID=1
	open curs
	fetch next from curs into @vid
	while @@FETCH_STATUS=0
	begin
		declare @command varchar(150)
		if @vid=1
		begin
			set @command='select * from Songs'
		end
		else if @vid=2
		begin
			set @command='select * from Songs as S full outer join Links_Song_Quiz as L on S.song_id = L.song_id'
		end
		else if @vid=3
		begin
			set @command='select Count(S.song_id) AS nr from Songs as S inner join Links_Song_Quiz as L on S.song_id = L.song_id group by S.genre'
		end
		exec (@command)
		fetch next from curs into @vid
	end
	close curs
	deallocate curs
	set @end=GETDATE()
	exec usp_delete_test
go

exec usp_run_tests

set identity_insert Quizzes off
set identity_insert Songs off







