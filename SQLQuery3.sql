exec usp_run_tests

create or alter proc [dbo].[uspRunTests]
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
GO

