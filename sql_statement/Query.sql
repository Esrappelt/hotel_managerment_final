--�޸ı�
--��room�����������url
alter table room 
add roomUrl varchar(50)
select * from room
update room set roomUrl = 'img/single1' where roomNumber = '1001'
update room set roomUrl = 'img/single2' where roomNumber = '1002'
update room set roomUrl = 'img/double1' where roomNumber = '1003'
update room set roomUrl = 'img/double2' where roomNumber = '1002'
--Ԥ��
--������ס���˷�ʱ���ѯ�շ���
select room.roomType,roomTypeAndPrice.price,room.roomNumber,roomUrl
	from room inner join roomTypeAndPrice
	on room.roomType = roomTypeAndPrice.roomType
	where roomNumber not in
	--���Ӳ�ѯ���޸�
	(select orders.roomNumber from orders where((orders.checkInTime  between '2018-12-1' and '2018-12-2')) or ((orders.checkOutTime between '2018-12-1' and '2018-12-2')))
--���������û���Ϣ�������ǵ���Ϣ
insert customers values('1','��','С��','123456789',100,'��㵽')
insert orders values('Ԥ����','1                 ','1002','2018-12-1','2018-12-3',100,'2018-12-2')
delete from orders
delete from customers
delete from timeExtension
select * from customers
select * from orders
select * from timeExtension
--��ס
update orders
	set orderStatus = '����ס'
	--��ҪID��
	where orders.customerIDCard = '11111             '
	
--�˷�
update orders
	set orderStatus = '���˷�'
	where orders.customerIDCard = '11111             '
select * from orders where customerIDCard = '511023199810101871'
--����
declare @addMoney int,@orderNumber int,@oldExpiryTime date,@newExpiryTime date
exec dbo.getPrice '1002',3,@addMoney output,@orderNumber output,@oldExpiryTime output,@newExpiryTime output
select @addMoney as addMoney,@orderNumber as orderNumber,@oldExpiryTime as oldExpiryTime,@newExpiryTime as newExpiryTime
--insert timeExtension values(12,'2018-12-03','2018-12-04',100)





