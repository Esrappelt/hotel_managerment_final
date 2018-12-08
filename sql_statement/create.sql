create database db

USE [db]
GO
/****** Object:  Table [dbo].[usertab]    Script Date: 12/05/2018 21:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usertab](
	[uid] [nchar](15) NOT NULL,
	[upwd] [nchar](12) NOT NULL
) ON [PRIMARY]
GO
create database hotel_db
CREATE TABLE roomTypeAndPrice
(
	--�������ͣ����룩
	roomType VARCHAR(32),
	--�۸�
	price int check(price > 0),
	--����
	PRIMARY KEY (roomType)
)
CREATE TABLE room
(
	roomNumber CHAR(6),
	roomType VARCHAR(32) NOT NULL,
	remarks VARCHAR(32),
	PRIMARY KEY (roomNumber),
	FOREIGN KEY (roomType) REFERENCES roomTypeAndPrice(roomType)
)

CREATE TABLE customers
(
	--�˿����֤
	customerIDCard CHAR(18),
	--�Ա�
	customerGender CHAR(4) check (customerGender ='��' or customerGender='Ů'),  --���� �л�Ů  
	--����
	customerName VARCHAR(16) NOT NULL,  
	--�ֻ�����
	customerPhoneNumber CHAR(11) , 
	--���ѽ��
	totalAmount INT check(totalAmount > 0),  
	--����
	PRIMARY KEY (customerIDCard)
)

CREATE TABLE orders
(
	--������
	orderNumber int identity(1,1) NOT NULL  , 
	--����״̬
	orderStatus CHAR(18) check (orderStatus = 'Ԥ����' or orderStatus = '����ס'or orderStatus = '���˷�'),
	--�ͻ����֤
	customerIDCard CHAR(18),
	--��ס�����
	roomNumber CHAR(6) NOT NULL,
	--��סʱ��
	checkInTime DATE NOT NULL,
	--���ʱ��
	checkOutTime DATE NOT NULL,
	--�踶���(���ڿ������ѣ�������Ϊ���)
	totalMoney INT check(totalMoney > 0) NOT NULL,
	--Ԥ��ʱ��
	orderTime DATE NOT NULL,
	--����
	PRIMARY KEY (orderNumber),
	--���
	FOREIGN KEY (customerIDCard) REFERENCES customers(customerIDCard),

	FOREIGN KEY (roomNumber) REFERENCES room(roomNumber),

)

CREATE TABLE timeExtension    
(
	--������¼��
	operatingID int identity(1,1) check(operatingID > 0) not null,
	--�����Ķ�����(�Ǽ�¼�еĶ����ţ����룬���ն�����)
	orderNumber int not null,
	--ס��ԭ��������
	oldExpiryDate DATE NOT NULL,
	--ס���µ�������
	newExpiryDate DATE NOT NULL,
	--��Ҫ��ӵĽ��
	addMoney INT check(addMoney > 0) NOT NULL,
	--����
	PRIMARY KEY (operatingID),
	--���
	FOREIGN KEY (orderNumber) REFERENCES orders(orderNumber)

)

-- �������µĹ˿������ܽ��Ĵ�����
IF OBJECT_ID('insertAddMoneyToOrdersTrigger','TR') IS NOT NULL
DROP TRIGGER insertAddMoneyToOrdersTrigger
CREATE trigger insertAddMoneyToOrdersTrigger 
ON timeExtension 
after insert 
as
begin
	declare @addMoney int
	declare @orderNumber int
	declare @customerIDCard char(18)
	declare @newExpiryDate date
	select @orderNumber=orderNumber from inserted
	select @addMoney=addMoney from inserted
	select @newExpiryDate=newExpiryDate from inserted
	--����orders
	update orders
	set orders.checkOutTime = @newExpiryDate,totalMoney = totalMoney + @addMoney
	where orderNumber = @orderNumber
	--ѡ��ID
	select @customerIDCard = customerIDCard
	from orders
	where orderNumber = @orderNumber
	--����customers
	update customers
	set customers.totalAmount = customers.totalAmount+ @addMoney
	where customerIDCard = @customerIDCard
end

-- ����������ͼ
drop view incomeView
create view incomeView
as
-- ѡ���˷�ʱ�䣬�ܽ���������
select checkOutTime, sum(totalMoney) totalIncome, count(*) num from orders 
group by checkOutTime
--����������ͼ
--select * from incomeView

--����������Ϣ��ͼ
create view roomInfoView
as
select top 100 percent room.*,rp.price
from room join roomTypeAndPrice as rp 
on room.roomType = rp.roomType
order by rp.price desc
--���Է�����Ϣ��ͼ
--select * from roomInfoView

--�������Ѷ�����ͼ
create 	view timeExtensionOrdersView
as 
select
	timeExtension.orderNumber,
	customers.customerName,
	customers.customerPhoneNumber,
	orders.roomNumber,
	orders.checkInTime,
	timeExtension.oldExpiryDate,
	timeExtension.newExpiryDate,
	timeExtension.addMoney
from timeExtension inner join orders
on timeExtension.orderNumber = orders.orderNumber inner join customers
on orders.customerIDCard = customers.customerIDCard
--�������Ѷ�����ͼ
--select * from timeExtensionOrdersView

--����������ͼ
create view orderview
as
select top 100 percent
	orders.orderNumber,
	orders.orderStatus,
	customers.customerName,
    room.roomNumber,
    room.roomType,
    orders.orderTime,
    orders.checkInTime,
    orders.checkOutTime,
    customers.customerPhoneNumber,
    orders.totalMoney
from orders inner join customers
on orders.customerIDCard = customers.customerIDCard
inner join room
on orders.roomNumber = room.roomNumber
inner join roomTypeAndPrice
on room.roomType = roomTypeAndPrice.roomType
order by orders.orderNumber desc
--���Զ�����ͼ
select * from orderview

--�洢���̣������ס���⣩
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE getPrice(
	@roomNumber int,
	@addDay int,
	@addMoney int output,
	@orderNumber int output,
	@oldExpiryTime date output,
	@newExpiryTime date output
)
AS
BEGIN
	declare @price int
	--��ȡ������
	select @orderNumber = orders.orderNumber 
	from orders 
	where roomNumber = @roomNumber and orderStatus != '���˷�'
	--��ȡ�����ͷ���ļ۸�
	select @price = roomTypeAndPrice.price 
	from roomTypeAndPrice inner join room on roomTypeAndPrice.roomType = room.roomType
	where room.roomNumber = @roomNumber
	--�����Ҫ�ӵ�Ǯ
	set @addMoney = @price * @addDay
	--��ȡԭ����ʱ��
	select @oldExpiryTime = orders.checkOutTime from orders where orderNumber = @orderNumber
	--�����µ���ʱ��
	set @newExpiryTime = DATEADD(DAY,@addDay,@oldExpiryTime)
END
GO
--�洢���̣������ס���⣩
declare @addMoney int,@orderNumber int,@oldExpiryTime date,@newExpiryTime date
exec dbo.getPrice '1002',3,@addMoney output,@orderNumber output,@oldExpiryTime output,@newExpiryTime output
select @addMoney as addMoney,@orderNumber as orderNumber,@oldExpiryTime as oldExpiryTime,@newExpiryTime as newExpiryTime


�洢���̣����������ͼ��ѯѡ��
USE [hotel_db]
GO
/****** Object:  StoredProcedure [dbo].[showView]    Script Date: 12/06/2018 21:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[ChooseSearchInfo](
	@para varchar(25),
	@Type varchar(25)
)
AS
BEGIN
	if @Type = 'customerName'
		select * from orderView where customerName like '%'+@para+'%'
	else if @Type = 'roomNumber'
		select * from orderView where roomNumber like '%'+@para+'%'
	else if @Type = 'roomType'
		select * from orderview where roomType like '%'+@para+'%'
	else if @Type = 'orderTime'
		select * from orderview where checkInTime like '%'+@para+'%'
	else if @Type = 'checkOutTime'
		select * from orderview where checkOutTime like '%'+@para+'%'
	else if @Type = 'customerPhoneNumber'
		select * from orderview where customerPhoneNumber like '%'+@para+'%'
	else if @Type = 'totalMoney'
		select * from orderview where totalMoney like '%'+@para+'%'
	END
--���Դ洢���̣������ͼѡ�����⣩
declare @Type varchar(25),@para varchar(25)
set @Type = 'totalMoney'
set @para = '3'
exec ChooseSearchInfo @para,@Type

