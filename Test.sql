create table PresentationShops(
	id int primary key identity(1,1),
	psname varchar(50),
	city varchar(50),
)

create table Women(
	id int primary key identity(1,1),
	wname varchar(50),
	amount int
)

create table ShoeModels(
	id int primary key identity(1,1),
	smname varchar(50),
	season varchar(50)
)

create table Shoes(
	id int primary key identity(1,1),
	price int,
	shoe_model int foreign key references ShoeModels(id)
)

create table LinkShoesPresentationShop(
	id int primary key identity(1,1),
	number_of_shoes int,
	shoe int foreign key references Shoes(id),
	presentation_shop int foreign key references PresentationShops(id)
)

create table LinkWomenShoes(
	id int primary key identity(1,1),
	number_of_shoes int,
	price int,
	woman int foreign key references Women(id),
	shoe int foreign key references Shoes(id)
)

create or alter procedure usp_add_shoe_to_store @shoe int, @shop int, @shoe_nr int
as
	insert into LinkShoesPresentationShop(shoe,presentation_shop,number_of_shoes) values (@shoe,@shop,@shoe_nr)
go

insert into PresentationShops(psname,city) values ('Marelbo','Cluj Napoca')
insert into PresentationShops(psname,city) values ('Leonardo','Bucuresti')
insert into PresentationShops(psname,city) values ('Zara','Timisoara')

insert into Women(wname,amount) values ('Maria Gherg', 10000)
insert into Women(wname,amount) values ('Alexandra Pastol', 23586)
insert into Women(wname,amount) values ('Mara Mara', 3458)

insert into ShoeModels(smname,season) values('Tocuri', 'Winter')
insert into ShoeModels(smname,season) values('Cizme', 'Autumn')
insert into ShoeModels(smname,season) values('Sandale', 'Summer')

insert into Shoes(price,shoe_model) values(123,1)
insert into Shoes(price,shoe_model) values(450,2)
insert into Shoes(price,shoe_model) values(600,3)
insert into Shoes(price,shoe_model) values(400,3)
insert into Shoes(price,shoe_model) values(1000,2)
insert into Shoes(price,shoe_model) values(123,1)

exec usp_add_shoe_to_store 1,1,10
exec usp_add_shoe_to_store 1,2,10
exec usp_add_shoe_to_store 2,1,10
exec usp_add_shoe_to_store 3,2,10

insert into LinkWomenShoes(shoe,woman,number_of_shoes) values (1,1,1)
insert into LinkWomenShoes(shoe,woman,number_of_shoes) values (2,2,3)
insert into LinkWomenShoes(shoe,woman,number_of_shoes) values (1,3,1)
insert into LinkWomenShoes(shoe,woman,number_of_shoes) values (1,1,3)
insert into LinkWomenShoes(shoe,woman,number_of_shoes) values (3,2,1)
insert into LinkWomenShoes(shoe,woman,number_of_shoes) values (1,2,4)

select * from LinkWomenShoes
delete from LinkWomenShoes

create or alter view ViewWomen
as
select distinct W.wname as Woman
from LinkWomenShoes L inner join Shoes S on L.shoe=S.id inner join ShoeModels SM on SM.id=S.shoe_model inner join Women W on L.woman=W.id
group by SM.smname, W.wname
having sum(L.number_of_shoes)>=2
go

select * from ViewWomen
select * from LinkWomenShoes

create or alter function udf_pantofi
(@number int)
RETURNS TABLE
AS
RETURN (
	select distinct S.id as Shoe
	from Shoes S
	inner join LinkShoesPresentationShop L on S.id = L.shoe and (select count(distinct L.presentation_shop) from LinkShoesPresentationShop L where L.shoe = S.id) >= @number
)

select * from udf_pantofi(3)
select * from LinkShoesPresentationShop
