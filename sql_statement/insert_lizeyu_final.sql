--���뵽customer
INSERT [dbo].[customers] ([customerIDCard], [customerGender], [customerName], [customerPhoneNumber], [totalAmount]) VALUES (N'111111111111111111', N'��  ', N'��Ѹ��', N'19999999999', 899)
INSERT [dbo].[customers] ([customerIDCard], [customerGender], [customerName], [customerPhoneNumber], [totalAmount]) VALUES (N'222222222222222222', N'��  ', N'��Ӿ��', N'17777777777', 9999)
INSERT [dbo].[customers] ([customerIDCard], [customerGender], [customerName], [customerPhoneNumber], [totalAmount]) VALUES (N'233333333333333333', N'��  ', N'������', N'13999999999', 1314)
INSERT [dbo].[customers] ([customerIDCard], [customerGender], [customerName], [customerPhoneNumber], [totalAmount]) VALUES (N'333333333333333333', N'��  ', N'����', N'19999999999', 3999)
INSERT [dbo].[customers] ([customerIDCard], [customerGender], [customerName], [customerPhoneNumber], [totalAmount]) VALUES (N'510113199806295310', N'��  ', N'�Ż���', N'13838381438', 5999)
INSERT [dbo].[customers] ([customerIDCard], [customerGender], [customerName], [customerPhoneNumber], [totalAmount]) VALUES (N'51050219971215873X', N'��  ', N'Ф����', N'13541846167', 9999)
INSERT [dbo].[customers] ([customerIDCard], [customerGender], [customerName], [customerPhoneNumber], [totalAmount]) VALUES (N'511023199810101871', N'��  ', N'������', N'15828620802', 39998)
INSERT [dbo].[customers] ([customerIDCard], [customerGender], [customerName], [customerPhoneNumber], [totalAmount]) VALUES (N'511321199802250318', N'��  ', N'Ӻ��', N'18888888888', 19999)
--���뵽[roomTypeAndPrice]
INSERT [dbo].[roomTypeAndPrice] ([roomType], [price]) VALUES (N'���˼�', 699)
INSERT [dbo].[roomTypeAndPrice] ([roomType], [price]) VALUES (N'������', 19999)
INSERT [dbo].[roomTypeAndPrice] ([roomType], [price]) VALUES (N'�������˷�', 3999)
INSERT [dbo].[roomTypeAndPrice] ([roomType], [price]) VALUES (N'����˫�˷�', 5999)
INSERT [dbo].[roomTypeAndPrice] ([roomType], [price]) VALUES (N'���¼�', 1314)
INSERT [dbo].[roomTypeAndPrice] ([roomType], [price]) VALUES (N'���˼�', 1399)
INSERT [dbo].[roomTypeAndPrice] ([roomType], [price]) VALUES (N'�����', 899)
INSERT [dbo].[roomTypeAndPrice] ([roomType], [price]) VALUES (N'˫�˼�', 999)
INSERT [dbo].[roomTypeAndPrice] ([roomType], [price]) VALUES (N'����׷�', 9999)
--���뵽room
INSERT [dbo].[room] ([roomNumber], [roomType], [remarks]) VALUES (N'1001  ', N'������', N'ֻҪ����룬���Ǿ���')
INSERT [dbo].[room] ([roomNumber], [roomType], [remarks]) VALUES (N'1002  ', N'����׷�', N'ֻҪ����룬���Ǿ���')
INSERT [dbo].[room] ([roomNumber], [roomType], [remarks]) VALUES (N'1003  ', N'����˫�˷�', N'wifi��100Ӣ�����ӣ�����')
INSERT [dbo].[room] ([roomNumber], [roomType], [remarks]) VALUES (N'1004  ', N'�������˷�', N'ֻҪ����룬���Ǿ���')
INSERT [dbo].[room] ([roomNumber], [roomType], [remarks]) VALUES (N'1005  ', N'���˼�', N'������,������ʦ')
INSERT [dbo].[room] ([roomNumber], [roomType], [remarks]) VALUES (N'1006  ', N'���¼�', N'����������Ѱ�ȫ��')
INSERT [dbo].[room] ([roomNumber], [roomType], [remarks]) VALUES (N'1007  ', N'˫�˼�', N'�޴���')
INSERT [dbo].[room] ([roomNumber], [roomType], [remarks]) VALUES (N'1008  ', N'�����', N'�߼��칫��,���Կյ�')
INSERT [dbo].[room] ([roomNumber], [roomType], [remarks]) VALUES (N'1009  ', N'���˼�', N'�豸��ȫ')
--���뵽order
SET IDENTITY_INSERT [dbo].[orders] ON
INSERT [dbo].[orders] ([orderNumber], [orderStatus], [customerIDCard], [roomNumber], [checkInTime], [checkOutTime], [totalMoney], [orderTime]) VALUES (16, N'Ԥ����            ', N'511023199810101871', N'1001  ', CAST(0x213F0B00 AS Date), CAST(0x253F0B00 AS Date), 39998, CAST(0x133F0B00 AS Date))
INSERT [dbo].[orders] ([orderNumber], [orderStatus], [customerIDCard], [roomNumber], [checkInTime], [checkOutTime], [totalMoney], [orderTime]) VALUES (17, N'Ԥ����            ', N'51050219971215873X', N'1002  ', CAST(0x253F0B00 AS Date), CAST(0x263F0B00 AS Date), 9999, CAST(0x133F0B00 AS Date))
INSERT [dbo].[orders] ([orderNumber], [orderStatus], [customerIDCard], [roomNumber], [checkInTime], [checkOutTime], [totalMoney], [orderTime]) VALUES (18, N'Ԥ����            ', N'510113199806295310', N'1003  ', CAST(0x213F0B00 AS Date), CAST(0x243F0B00 AS Date), 5999, CAST(0x133F0B00 AS Date))
INSERT [dbo].[orders] ([orderNumber], [orderStatus], [customerIDCard], [roomNumber], [checkInTime], [checkOutTime], [totalMoney], [orderTime]) VALUES (19, N'Ԥ����            ', N'511321199802250318', N'1001  ', CAST(0x253F0B00 AS Date), CAST(0x283F0B00 AS Date), 19999, CAST(0x133F0B00 AS Date))
INSERT [dbo].[orders] ([orderNumber], [orderStatus], [customerIDCard], [roomNumber], [checkInTime], [checkOutTime], [totalMoney], [orderTime]) VALUES (20, N'Ԥ����            ', N'111111111111111111', N'1008  ', CAST(0x233F0B00 AS Date), CAST(0x263F0B00 AS Date), 899, CAST(0x133F0B00 AS Date))
INSERT [dbo].[orders] ([orderNumber], [orderStatus], [customerIDCard], [roomNumber], [checkInTime], [checkOutTime], [totalMoney], [orderTime]) VALUES (21, N'Ԥ����            ', N'222222222222222222', N'1002  ', CAST(0x213F0B00 AS Date), CAST(0x243F0B00 AS Date), 9999, CAST(0x133F0B00 AS Date))
INSERT [dbo].[orders] ([orderNumber], [orderStatus], [customerIDCard], [roomNumber], [checkInTime], [checkOutTime], [totalMoney], [orderTime]) VALUES (22, N'Ԥ����            ', N'333333333333333333', N'1004  ', CAST(0x213F0B00 AS Date), CAST(0x243F0B00 AS Date), 3999, CAST(0x133F0B00 AS Date))
INSERT [dbo].[orders] ([orderNumber], [orderStatus], [customerIDCard], [roomNumber], [checkInTime], [checkOutTime], [totalMoney], [orderTime]) VALUES (23, N'Ԥ����            ', N'233333333333333333', N'1006  ', CAST(0x223F0B00 AS Date), CAST(0x253F0B00 AS Date), 1314, CAST(0x133F0B00 AS Date))
SET IDENTITY_INSERT [dbo].[orders] OFF
--���뵽����
SET IDENTITY_INSERT [dbo].[timeExtension] ON
INSERT [dbo].[timeExtension] ([operatingID], [orderNumber], [oldExpiryDate], [newExpiryDate], [addMoney]) VALUES (8, 16, CAST(0x243F0B00 AS Date), CAST(0x253F0B00 AS Date), 19999)
SET IDENTITY_INSERT [dbo].[timeExtension] OFF