create table Clients(
	fiscal_code int primary key identity(1,1),
	cname varchar(100)
)

create table Agents(
	fname varchar(50),
	lname varchar(50),
	id int primary key identity(1,1)
)

create table Products(
	id int primary key identity(1,1),
	pname varchar(50),
	measure_unit varchar(50)
)

create table Bills(
	number int primary key identity(1,1),
	date_of_emission date,
	client int foreign key references Clients(fiscal_code),
	agent int foreign key references Agents(id),
)

create table LinkBillProduct(
	bill int not null foreign key references Bills(number),
	product int not null foreign key references Products(id),
	order_number int not null unique,
	price int,
	quantity int, 
	primary key(bill, order_number)
)

drop table LinkBillProduct

create or alter procedure usp_add_product_on_bill @bill int, @product int, @order_number int, @price int, @quantity int
as
	if exists(select * from LinkBillProduct L where L.bill = @bill and L.order_number = @order_number)
		raiserror('Can not introduce on this order number!', 18, 1)
	if exists(select * from LinkBillProduct L where L.bill = @bill and L.product = @product)
	begin
		--set @quantity = (-1)*@quantity
		--print(@quantity)
		insert into LinkBillProduct(bill, product, order_number, price, quantity) values (@bill, @product, @order_number, @price, (-1)*@quantity)
	end
	else
		insert into LinkBillProduct(bill, product, order_number, price, quantity) values (@bill, @product, @order_number, @price, @quantity)
go 

insert into Products(measure_unit, pname) values ('grame', 'paine')
insert into Products(measure_unit, pname) values ('ml', 'vin')
insert into Products(measure_unit, pname) values ('grame', 'shaorma')


insert into Clients(cname) values ('Ion')
insert into Clients(cname) values ('Vasile')

insert into Agents(fname,lname) values('Vasili', 'Adamesc')
insert into Agents(fname,lname) values('Oana', 'Bedner')

insert into Bills(client,agent,date_of_emission) values(1,1,SYSDATETIME())
insert into Bills(client,agent,date_of_emission) values(1,2,SYSDATETIME())
insert into Bills(client,agent,date_of_emission) values(2,1,SYSDATETIME())
insert into Bills(client,agent,date_of_emission) values(2,2,SYSDATETIME())

exec usp_add_product_on_bill 1,1,1,10,4
exec usp_add_product_on_bill 1,3,3,15,1
exec usp_add_product_on_bill 2,3,5,15,1
exec usp_add_product_on_bill 2,3,4,15,1
exec usp_add_product_on_bill 2,1,10,60,2

select * from LinkBillProduct

select distinct(B.number), B.client, B.date_of_emission, (select sum(L.price*L.quantity) from LinkBillProduct L where L.bill = B.number)
from Bills B
inner join LinkBillProduct L on B.number = L.bill and (select sum(L.price*L.quantity) from LinkBillProduct L where L.bill = B.number) > 60


