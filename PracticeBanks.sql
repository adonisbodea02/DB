create or alter procedure usp_delete_transactions @card bigint
AS
	delete from Transactions where Transactions.card_nr = @card
GO

select * from Transactions

execute usp_delete_transactions 14628396419

select * from Transactions

create or alter view usp_all_atms
as
select distinct C.number, C.bank_account
from Cards C
INNER JOIN Transactions T on (select count(distinct T.atm_id) from Transactions T where T.card_nr = C.number) = (select count(distinct A.atm_id) from ATMs A)
go

select * from Transactions

create or alter function usf_bogati
()
RETURNS TABLE
AS
RETURN (
	select distinct C.number, C.cvv_code
	from Cards C
	INNER JOIN Transactions T on (select sum(T.amount) from Transactions T where T.card_nr = C.number) > 2000
)

select * from usf_bogati()


insert into Transactions(atm_id, card_nr, time_of_transaction, amount) values (1, 98678714879, SYSDATETIME(), 15000) 
insert into Transactions(atm_id, card_nr, time_of_transaction, amount) values (2, 86378790808, SYSDATETIME(), 270)
insert into Transactions(atm_id, card_nr, time_of_transaction, amount) values (2, 86378790808, SYSDATETIME(), 300)
insert into Transactions(atm_id, card_nr, time_of_transaction, amount) values (3, 14628396419, SYSDATETIME(), 6700)
insert into Transactions(atm_id, card_nr, time_of_transaction, amount) values (1, 14628396419, SYSDATETIME(), 880)
insert into Transactions(atm_id, card_nr, time_of_transaction, amount) values (2, 14628396419, SYSDATETIME(), 100)
insert into Transactions(atm_id, card_nr, time_of_transaction, amount) values (1, 86378790808, SYSDATETIME(), 300)
insert into Transactions(atm_id, card_nr, time_of_transaction, amount) values (3, 86378790808, SYSDATETIME(), 300)

