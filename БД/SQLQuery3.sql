
--������� ��
Create Database Air_transportation;

--���������� ��
use Air_transportation;

--������� �������
--�������� ������� �����
CREATE TABLE Baggage
(
    IDBaggage INT PRIMARY KEY,
    AmountOfBaggage VARCHAR(20) ,
	Price VARCHAR(20) 
)

--�������� ������� ��������� �����
CREATE TABLE ServiceDep
(
    ClassOfService INT PRIMARY KEY,
	IDBaggage INT REFERENCES Baggage(IDBaggage),
    Nutrition VARCHAR(20) 
)

--�������� ������� �������
CREATE TABLE Clients
(
    IDClients INT PRIMARY KEY,
    IDBaggage INT REFERENCES Baggage(IDBaggage),
	MobileNumber INT,
	FullNameClients VARCHAR(20),
	RegularCustomer INT
)

--�������� ������� ������
CREATE TABLE Tickets
(
    IDTickets INT PRIMARY KEY, 
	IDClients INT REFERENCES Clients(IDClients)
)

--�������� ������� �����������
CREATE TABLE Registration
(
    IDRegistration INT PRIMARY KEY,
    IDTickets INT REFERENCES Tickets(IDTickets)
)

--�������� ������������� ������� �����������_�������
CREATE TABLE Registration_Clients
(
    IDRegistration INT REFERENCES Registration(IDRegistration) ,
    IDClients INT REFERENCES Clients(IDClients)
)

--�������� ������� ����� ����������
CREATE TABLE DestinationAddress
(
    IDAddressDestination INT PRIMARY KEY,
)

--�������� ������� ����� �����������
CREATE TABLE DepartureAddress
(
    IDAddressDeparture INT PRIMARY KEY,
)

--�������� ������� ���������
CREATE TABLE Airports
(
    IDAirports INT PRIMARY KEY,
    IDAddressDeparture INT REFERENCES DepartureAddress(IDAddressDeparture),
	IDAddressDestination INT REFERENCES DestinationAddress(IDAddressDestination),
	City NVARCHAR(20),
	GMT NVARCHAR(20)
)

--�������� ������� ��������
CREATE TABLE TicketFlights
(
    IDNumberFlights INT PRIMARY KEY,
    IDTickets INT REFERENCES Tickets(IDTickets),
    Amount INT
)

--�������� ������� �������
CREATE TABLE Aircrafts
(
    IDAircraft INT PRIMARY KEY,
    Model_aircraft NVARCHAR(20),
    Amount INT
)

--�������� ������� �����
CREATE TABLE Flights
(
    IDFlights INT PRIMARY KEY,
	IDAircraft INT REFERENCES Aircrafts(IDAircraft),
    Timetable NVARCHAR(20),
    StatusFlight VARCHAR(20)
)

--�������� ������������� ������� ���������_�����
CREATE TABLE Airports_Flights
(
    IDAirports INT REFERENCES Airports(IDAirports),
	IDFlights INT REFERENCES Flights(IDFlights)
)

--�������� ������� �����
CREATE TABLE Seats
(
    IDSeats INT PRIMARY KEY,
    IDAircraft INT REFERENCES Aircrafts(IDAircraft),
    IDClients INT REFERENCES Clients(IDClients),
	FareConditions INT
)

--�������� ������� ���������� ������
CREATE TABLE BoardingPasses
(
    IDBoardingPasses INT PRIMARY KEY,
    IDNumberFlights INT REFERENCES TicketFlights(IDNumberFlights),
	IDClients INT REFERENCES Clients(IDClients),
	IDTickets INT REFERENCES Tickets(IDTickets),
	IDSeats INT REFERENCES Seats (IDSeats)
)

--������ ������ � �������

--������ ������ � ������� �����
INSERT INTO dbo.Baggage (IDBaggage, AmountOfBaggage, Price) 
VALUES
(1,'10��','1200'),
(2,'23��','2000'),
(3,'46��','4300')

--������ ������ � ������� ��������� �����
INSERT INTO dbo.ServiceDep (ClassOfService,IDBaggage, Nutrition) 
VALUES
(1,1,'�����������'),
(2,2,'������'),
(3,3,'������')

--�������� ��� ������� FullNameClients �� NVARCHAR(200)
ALTER TABLE dbo.Clients
ALTER COLUMN FullNameClients NVARCHAR(200);

--�������� ��� ������� MobileNumber �� NVARCHAR(60)
ALTER TABLE dbo.Clients
ALTER COLUMN MobileNumber NVARCHAR(60);
GO

--������ ������ � ������� �������
INSERT INTO dbo.Clients (IDClients, IDBaggage, MobileNumber, FullNameClients, RegularCustomer) 
VALUES
(1, 3, 79244124764,  '������ ���� ��������', 0),
(2, 3, 79242423464,  '������� ����� ���������', 1),
(3, 1, 79236633104,  '��������� �������� �����������', 1),
(4, 3, 79244104764,  '������� ������ �������', 0),
(5, 3, 79240023464,  '����������� ��������� �������������', 1),
(6, 2, 79236633104,  '��� ��� �������', 1),
(7, 3, 79204124764,  '��� ��� �������', 0),
(8, 3, 79242423134,  '������ ���� ����������', 0),
(9, 2, 79236655104,  '������ ���� ��������', 0),
(10, 1, 79236655104, '�������� ������ ����������', 1)
GO

--������ ������ � ������� ������
INSERT INTO dbo.Tickets (IDTickets, IDClients) 
VALUES
(1, 10),
(2, 3),
(3, 1),
(4, 6),
(5, 5),
(6, 8),
(7, 9)

--������ ������ � ������� �����������
INSERT INTO dbo.Registration (IDRegistration, IDTickets) 
VALUES
(1, 1),
(2, 1),
(3, 4),
(4, 5),
(5, 5),
(6, 6),
(7, 7),
(8, 7),
(9, 3),
(10, 4)

GO

--������ ������ � ������� �����������_�������
INSERT INTO dbo.Registration_Clients (IDRegistration, IDClients) 
VALUES
(1, 10),
(2, 3),
(3, 1),
(4, 6),
(5, 5),
(6, 8),
(7, 9),
(8, 9),
(9, 1),
(10, 6)


--������ ������ � ������� ����� ����������
INSERT INTO dbo.DestinationAddress (IDAddressDestination) 
VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20)

--������ ������ � ������� ����� ������
INSERT INTO dbo.DepartureAddress (IDAddressDeparture) 
VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20)

--������ ������ � ������� ���������
INSERT INTO dbo.Airports (IDAirports, IDAddressDeparture, IDAddressDestination, City, GMT) 
VALUES			
(1, 20, 17,  'London', 'GMT +1'),
(2, 17, 20,  'Moscow', 'GMT+3'),
(3, 17, 20,  'Moscow', 'GMT+3'),
(4, 3, 9,  'St-Petersburg', 'GMT+3'),
(5, 2, 8,  'Berlin', 'GMT+2'),
(6, 6, 8,  'Voronezh', 'GMT+3'),
(7, 8, 10,  'Paris', 'GMT+2'),
(8, 7, 11,  'Orel', 'GMT+3'),
(9, 11, 1,  'Krakow', 'GMT+2'),
(10, 14 , 3, 'Monaco', 'GMT+2')
GO
--�������� ��� ������� FullNameClients �� NVARCHAR(200)

--������ ������ � ������� ��������
INSERT INTO dbo.TicketFlights (IDNumberFlights, IDTickets, Amount) 
VALUES
(1, 4, 3 ),
(2, 3, 3),
(3, 1, 2),
(4, 2, 1),
(5, 5, 1),
(6, 7, 2),
(7, 7, 5),
(8, 6, 6),
(9, 1, 1),
(10, 6, 1)

--������ ������ � ������� ��������
INSERT INTO dbo.Aircrafts (IDAircraft, Model_aircraft, Amount) 
VALUES			
(1, 'Airbus A319neo', 156),
(2, 'ATR EVO', 144),
(3, 'Boeing 777X', 425 ),
(4, 'Cessna 408', 14),
(5, '����� ��-21', 76),
(6, '����-44 ������', 124),
(7, 'Airbus A319neo', 156),
(8, 'Airbus A319neo', 156),
(9, 'Cessna 408', 14),
(10, 'Cessna 408', 14)

--������ ������ � ������� �����
INSERT INTO dbo.Flights (IDFlights, IDAircraft, Timetable, StatusFlight) 
VALUES			
(1, 1,  '�������', '����������'),
(2, 2,  '�������', '����������'),
(3, 3,  '�������', '����������'),
(4, 4,  '�����������', '����������'),
(5, 7,  '�����������', '����������'),
(6, 5,  '�����������', '����������'),
(7, 6,  '�����������', '����������'),
(8, 8,  '����������� ', '����������'),
(9, 9,  '������� ���������', '���������� � ������'),
(10, 10, '������� ���������', '���������� � ������')
GO

--������ ������ � ������� Airports_Flights
INSERT INTO dbo.Airports_Flights (IDAirports, IDFlights) 
VALUES
(1, 1),
(2, 5),
(3, 4),
(4, 6),
(5, 3),
(5, 5),
(5, 6),
(8, 9),
(10, 1),
(10, 6)

--������ ������ � ������� Seats
INSERT INTO dbo.Seats (IDSeats, IDAircraft, IDClients, FareConditions) 
VALUES
(1, 1, 1, 1),
(2, 2, 3, 2),
(3, 4, 2, 2),
(4, 5, 5, 1),
(5, 3, 8, 3),
(6, 6, 6, 3),
(7, 7, 4, 1),
(8, 8, 9, 4),
(9, 9, 10, 5),
(10, 10, 7, 5)

--������ ������ � ������� BoardingPasses
INSERT INTO dbo.BoardingPasses (IDBoardingPasses, IDNumberFlights, IDClients, IDTickets, IDSeats) 
VALUES
(1, 2, 1, 1,1),
(2, 3, 3, 2,1),
(3, 4, 2, 2,2),
(4, 5, 5, 1,3),
(5, 1, 8, 3,4),
(6, 6, 6, 7,5),
(7, 7, 4, 1,2),
(8, 8, 9, 4,7),
(9, 10, 10, 6,8),
(10, 9, 7, 5,9)
GO

--��������� ���������� ���������� �  ���������
Create Procedure AircraftInfo 
AS
begin
	SELECT Model_aircraft, Amount  FROM dbo.Aircrafts
end;
GO

-- ���������� ����������
Execute AircraftInfo;


GO

--��������� ���������� ���������� � ��������� ������� ����������� �� 10%
Update 
dbo.TicketFlights
SET 
Amount = Amount * 1.1
GO

