
--Создаем БД
Create Database Air_transportation;

--Используем БД
use Air_transportation;

--Создаем таблицы
--Создание таблицы Багаж
CREATE TABLE Baggage
(
    IDBaggage INT PRIMARY KEY,
    AmountOfBaggage VARCHAR(20) ,
	Price VARCHAR(20) 
)

--Создание таблицы Сервисный Отдел
CREATE TABLE ServiceDep
(
    ClassOfService INT PRIMARY KEY,
	IDBaggage INT REFERENCES Baggage(IDBaggage),
    Nutrition VARCHAR(20) 
)

--Создание таблицы Клиенты
CREATE TABLE Clients
(
    IDClients INT PRIMARY KEY,
    IDBaggage INT REFERENCES Baggage(IDBaggage),
	MobileNumber INT,
	FullNameClients VARCHAR(20),
	RegularCustomer INT
)

--Создание таблицы Билеты
CREATE TABLE Tickets
(
    IDTickets INT PRIMARY KEY, 
	IDClients INT REFERENCES Clients(IDClients)
)

--Создание таблицы Регистрация
CREATE TABLE Registration
(
    IDRegistration INT PRIMARY KEY,
    IDTickets INT REFERENCES Tickets(IDTickets)
)

--Создание промежуточной таблицы Регистрация_Клиенты
CREATE TABLE Registration_Clients
(
    IDRegistration INT REFERENCES Registration(IDRegistration) ,
    IDClients INT REFERENCES Clients(IDClients)
)

--Создание таблицы Пункт Назначения
CREATE TABLE DestinationAddress
(
    IDAddressDestination INT PRIMARY KEY,
)

--Создание таблицы Пункт Отправления
CREATE TABLE DepartureAddress
(
    IDAddressDeparture INT PRIMARY KEY,
)

--Создание таблицы Аэропорты
CREATE TABLE Airports
(
    IDAirports INT PRIMARY KEY,
    IDAddressDeparture INT REFERENCES DepartureAddress(IDAddressDeparture),
	IDAddressDestination INT REFERENCES DestinationAddress(IDAddressDestination),
	City NVARCHAR(20),
	GMT NVARCHAR(20)
)

--Создание таблицы Перелеты
CREATE TABLE TicketFlights
(
    IDNumberFlights INT PRIMARY KEY,
    IDTickets INT REFERENCES Tickets(IDTickets),
    Amount INT
)

--Создание таблицы Самолёты
CREATE TABLE Aircrafts
(
    IDAircraft INT PRIMARY KEY,
    Model_aircraft NVARCHAR(20),
    Amount INT
)

--Создание таблицы Рейсы
CREATE TABLE Flights
(
    IDFlights INT PRIMARY KEY,
	IDAircraft INT REFERENCES Aircrafts(IDAircraft),
    Timetable NVARCHAR(20),
    StatusFlight VARCHAR(20)
)

--Создание промежуточной таблицы Аэропорты_Рейсы
CREATE TABLE Airports_Flights
(
    IDAirports INT REFERENCES Airports(IDAirports),
	IDFlights INT REFERENCES Flights(IDFlights)
)

--Создание таблицы Места
CREATE TABLE Seats
(
    IDSeats INT PRIMARY KEY,
    IDAircraft INT REFERENCES Aircrafts(IDAircraft),
    IDClients INT REFERENCES Clients(IDClients),
	FareConditions INT
)

--Создание таблицы Посадочные талоны
CREATE TABLE BoardingPasses
(
    IDBoardingPasses INT PRIMARY KEY,
    IDNumberFlights INT REFERENCES TicketFlights(IDNumberFlights),
	IDClients INT REFERENCES Clients(IDClients),
	IDTickets INT REFERENCES Tickets(IDTickets),
	IDSeats INT REFERENCES Seats (IDSeats)
)

--Вносим данные в таблицы

--Вносим данные в таблицу Багаж
INSERT INTO dbo.Baggage (IDBaggage, AmountOfBaggage, Price) 
VALUES
(1,'10кг','1200'),
(2,'23кг','2000'),
(3,'46кг','4300')

--Вносим данные в таблицу Сервисный Отдел
INSERT INTO dbo.ServiceDep (ClassOfService,IDBaggage, Nutrition) 
VALUES
(1,1,'СуперЭконом'),
(2,2,'Эконом'),
(3,3,'Бизнес')

--Изменяем тип столбца FullNameClients на NVARCHAR(200)
ALTER TABLE dbo.Clients
ALTER COLUMN FullNameClients NVARCHAR(200);

--Изменяем тип столбца MobileNumber на NVARCHAR(60)
ALTER TABLE dbo.Clients
ALTER COLUMN MobileNumber NVARCHAR(60);
GO

--Вносим данные в таблицу Клиенты
INSERT INTO dbo.Clients (IDClients, IDBaggage, MobileNumber, FullNameClients, RegularCustomer) 
VALUES
(1, 3, 79244124764,  'Иванов Иван Иванович', 0),
(2, 3, 79242423464,  'Семенов Семен Семенович', 1),
(3, 1, 79236633104,  'Анатольев Анатолий Анатольевич', 1),
(4, 3, 79244104764,  'Никитин Никита Никитич', 0),
(5, 3, 79240023464,  'Владиславов Владислав Владиславович', 1),
(6, 2, 79236633104,  'Джо Джо Джостар', 1),
(7, 3, 79204124764,  'Дио Джо Джостар', 0),
(8, 3, 79242423134,  'Петров Петр Петровович', 0),
(9, 2, 79236655104,  'Иванов Илья Иванович', 0),
(10, 1, 79236655104, 'Кириллов Кирилл Кириллович', 1)
GO

--Вносим данные в таблицу Билеты
INSERT INTO dbo.Tickets (IDTickets, IDClients) 
VALUES
(1, 10),
(2, 3),
(3, 1),
(4, 6),
(5, 5),
(6, 8),
(7, 9)

--Вносим данные в таблицу Регистрация
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

--Вносим данные в таблицу Регистрация_Клиенты
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


--Вносим данные в таблицу Пункт Назначения
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

--Вносим данные в таблицу Пункт Вылета
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

--Вносим данные в таблицу Аэропорты
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
--Изменяем тип столбца FullNameClients на NVARCHAR(200)

--Вносим данные в таблицу Перелеты
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

--Вносим данные в таблицу Самолеты
INSERT INTO dbo.Aircrafts (IDAircraft, Model_aircraft, Amount) 
VALUES			
(1, 'Airbus A319neo', 156),
(2, 'ATR EVO', 144),
(3, 'Boeing 777X', 425 ),
(4, 'Cessna 408', 14),
(5, 'Иркут МС-21', 76),
(6, 'ТВРС-44 Ладога', 124),
(7, 'Airbus A319neo', 156),
(8, 'Airbus A319neo', 156),
(9, 'Cessna 408', 14),
(10, 'Cessna 408', 14)

--Вносим данные в таблицу Рейсы
INSERT INTO dbo.Flights (IDFlights, IDAircraft, Timetable, StatusFlight) 
VALUES			
(1, 1,  'Посадка', 'Подготовка'),
(2, 2,  'Посадка', 'Подготовка'),
(3, 3,  'Посадка', 'Подготовка'),
(4, 4,  'Регистрация', 'Подготовка'),
(5, 7,  'Регистрация', 'Подготовка'),
(6, 5,  'Регистрация', 'Подготовка'),
(7, 6,  'Регистрация', 'Подготовка'),
(8, 8,  'Регистрация ', 'Подготовка'),
(9, 9,  'Посадка Завершена', 'Подготовка к вылету'),
(10, 10, 'Посадка Завершена', 'Подготовка к вылету')
GO

--Вносим данные в таблицу Airports_Flights
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

--Вносим данные в таблицу Seats
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

--Вносим данные в таблицу BoardingPasses
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

--Процедура извлечения информации о  самолетах
Create Procedure AircraftInfo 
AS
begin
	SELECT Model_aircraft, Amount  FROM dbo.Aircrafts
end;
GO

-- Извлечение информации
Execute AircraftInfo;


GO

--Процедура извлечения информации о стоимости билетов домноженное на 10%
Update 
dbo.TicketFlights
SET 
Amount = Amount * 1.1
GO

