select * from room
select * from orders
select * from roomTypeAndPrice
insert into roomTypeAndPrice values('���˼�',32);
insert into roomTypeAndPrice values('˫�˼�',50);
insert into room values('101','���˼�','���Ǽ�');
insert into room values('102','���˼�','30ƽ');
insert into room values('103','˫�˼�','40ƽ');

select * from customers
select * from usertab

insert into usertab values('Ф����','160510111');
insert into usertab values('������','160510114');
insert into usertab values('����','160510113');
delete from customers where customerName='����'
delete from orders where customerIDCard='510722199808186256'