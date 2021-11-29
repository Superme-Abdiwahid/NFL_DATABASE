/* A sample database of the NFL at the moment @Author-Abdiwahid Bishar Hajir */
CREATE DATABASE NFL_DATABASE

CREATE TABLE AH_CUSTOMER
(
 
CustomerID Integer identity(1,1) primary key,
CustomerFname varchar(40),
CustomerLname varchar(40),
CustomerEmail varchar(40),
CustomerAddress varchar(40),
CustomerBirth DATE)
ALTER TABLE AH_Customer
ADD CustomerTypeID INTEGER
FOREIGN KEY REFERENCES AH_CustomerType(CustomerTypeID)
 
 
ALTER TABLE AH_Customer
ADD CustomerDescr varchar(100) not null
-----------------------------
 
 
-- Code for CustomerType -----------------
CREATE TABLE AH_CustomerType
(
CustomerTypeID Integer identity(1,1) primary key,
Customer_TypeName varchar(40),
Customer_TypeDescr varchar(80)
 
)
----------------------------------------------------
 
 
-- Table for order
CREATE TABLE AH_Order
(
OrderID Integer identity (1,1) primary key,
OrderDate DATE,
CustomerID INTEGER FOREIGN KEY REFERENCES AH_Customer(CustomerID)
)
 
ALTER TABLE AH_Order
ADD OrderTypeID Integer
Foreign key references AH_OrderType(OrderTypeID)
 
-----------------------------------
 
 
---Table for OrderType
Create Table AH_OrderType
(
OrderTypeID Integer identity(1,1) primary key,
OrderTypeName varchar(40),
OrderTypeDescr varchar(50)
 
)
 
 
-------------------
 
 
--- Table for Ticket
CREATE TABLE AH_Ticket
(
TicketID Integer identity (1,1) primary key,
TicketName varchar(40),
TicketEventDate DATE,
TicketPurchaseDate DATE,
OrderID INTEGER foreign key references AH_Order(OrderID)
)
 
ALTER TABLE AH_Ticket
ADD TicketTypeID INt
FOreign key References AH_TicketType(TicketTypeID)
 
 
ALTER TABLE AH_Ticket
ADD StadiumID INt
FOreign key References AH_Stadium(StadiumID)
 
 
--------------------------------------------------
 
 
----Table for ticketType
CREATE TABLE AH_TicketType
(
TicketTypeID Integer identity(1,1) primary key,
Ticket_TypeName varchar(40),
Ticket_TypeDescr varchar(80)
 
)
-----------------------------
 
 
--------Code for Stadium
CREATE TABLE AH_Stadium
(
StadiumID Integer identity(1,1) primary key,
StadiumName varchar(40),
LocationID INTEGER Foreign key References AH_Location(LocationID)
 
)
 
ALTER TABLE AH_Stadium
ADD StadiumTypeID INTEGER FOREIGN KEY REFERENCES  AH_StadiumType(StaduimTypeID)
---------------------------------------
 
 
--- Table for Stadium Type
CREATE TABLE AH_StadiumType
(
StadiumTypeID Integer identity(1,1) primary key,
StaduimTypeName varchar(40),
Stadium_TypeDescr varchar(75)
 
 
)
---------------------------------
 
 
 
-----------------------------
 
 
--- Code for location 
CREATE TABLE AH_Location
(
LocationID INTEGER IDENTITY(1,1) primary key,
LocationName varchar(40),
LocationDescr varchar(60)
 
)
--------------------------------
 
 
-- Table for ROle
CREATE TABLE AH_Role
(
RoleID Integer identity(1,1) primary key,
RoleName varchar(45),
RoleDescr varchar(78)
)
 
----------------------------------------------------
 
 
 
------Table for Player
CREATE TABLE AH_Player
(
PlayerID INTEGER IDENTITY(1,1) primary key,
PlayerFName varchar(40),
PlayerLName varchar(45),
PlayerNumber varchar(45),
PlayerHomeTown varchar(40),
PlayerHeight varchar(35),
PlayerWeight varchar(40),
TeamID INTEGER FOREIGN KEY REFERENCES AH_Team(TeamID),
PlayerBirth DATE
 
)
 
ALTER TABLE AH_Player
ADD PlayerTypeID INTEGER
Foreign key references BP_PlayerType(PlayerTypeID)
----------------------------------------------
 
-- Table for PlayerType
 
ALTER TABLE AH_PlayerType
ADD PlayerTypeDescr varchar(80)


ALTER TABLE AH_PlayerType
ADD PlayerTypeName varchar(80)
 
 
------
 
 
---Table for Team
CREATE TABLE AH_Team
(
TeamID Integer identity(1,1) primary key,
TeamName varchar(40),
TeamCity varchar(45),
TeamShortName varchar(40)
 
)
 
ALTER TABLE AH_Team
ADD StadiumID INTEGER FOREIGN KEY REFERENCES AH_Stadium(StadiumID)
 
 
 
-----------------------
 
 
 
---Table for GameType
CREATE TABLE AH_GameType
(
GameTypeID Integer identity(1,1) primary key,
GameTypeName varchar(30),
GameTypeDescr varchar(65)
 
 
)
 
------------------------------------------------
 
---TABle FOr Game
CREATE TABLE AH_Game
(
GameID Integer Identity(1,1) primary key,
GameDate DATE,
GameTypeID Integer Foreign Key References AH_GameType(GameTypeID),
SeasonWeek varchar(40)
 
)
 
-----------------------------
 
 
 
---- TAble for Roster
CREATE TABLE AH_Roster
(
RosterID Integer identity(1,1) primary key,
BeginDate DATE,
EndDate DATE,
PlayerID Integer foreign key References AH_Player(PlayerID)
 
 
)
 
ALTER TABLE AH_Roster
ADD TeamID INTEGER FOREIGN KEY REFERENCES AH_Team(TeamID)
 
--------------------------------
 
 
--- Table for Team Game Statitics
CREATE TABLE AH_Team_Game_Statistic
(
TeamID INT,
GameID INT,
StatisticID INT,
Primary key(TeamID, GameID, StatisticID)
 
 
)
 
ALTER TABLE AH_Team_Game_Statistic
ADD Foreign key (TeamID) References AH_Team(TeamID)
 
ALTER TABLE AH_Team_Game_Statistic
ADD Foreign key (GameID) References AH_Game(GameID)
 
 
ALTER TABLE AH_Team_Game_Statistic
ADD Foreign key (StatisticID) References AH_Statistics(StatisticID)
 
 
----------------------
 
 
--- Table for RosterGame
CREATE TABLE AH_RosterGame
(
RosterGameID Integer identity(1,1) primary key,
RosterID Integer foreign key References AH_Roster(RosterID)
 
 
)
ALTER TABLE AH_RosterGame
ADD GameID Integer foreign Key References AH_Game(GameID)
 
 
 
 
--------------------------
 
---Table for PlayerRole
 
 
 
---------------------------------------
 
 
 
---- Beging to populate into CustomerType
INSERT INTO AH_CustomerType(Customer_TypeName, Customer_TypeDescr)
VALUES('Fans', 'People who support NFL players at games')
 
 
 
 
INSERT INTO AH_CustomerType(Customer_TypeName, Customer_TypeDescr)
VALUES('Corporate', 'Buys in bulk')
 
INSERT INTO AH_CustomerType(Customer_TypeName, Customer_TypeDescr)
VALUES('Consumer' , 'Buys in single quantities')
 
 
 
/*CREATE  Update_Customer_table
@Customer_Typename VARCHAR(40),
@Customer_Lname varchar(40), 
@Customer_Email varchar(60),
@Customer_Adress varchar(50),
@CustomerDescr varchar(80),
@Customer_FirstName varchar(40)
AS
DECLARE @Customer_Type_IDS INTEGER
SET @Customer_Type_IDS = (Select CustomerTypeID FROM AH_CustomerType WHERE Customer_TypeName = @Customer_Typename)
Begin Transaction AH
INSERT INTO AH_Customer(CustomerFname, CustomerTypeID, CustomerLname, CustomerEmail, CustomerAddress, CustomerDescr)
VALUES(@Customer_FirstName, @Customer_Type_IDS, @Customer_Lname, @Customer_Email, @Customer_Adress, @CustomerDescr)
COMMIT TRANSACTION AH*/

CREATE TABLE AH_PlayerType
(PlayerTypeID INTEGER IDENTITY(1, 1) primary key,
PlayerName varchar(50) NOT NULL)
--------------------------------------------------------------------
-- create table
CREATE TABLE AH_StatisticsType
(StatisticTypeID INTEGER IDENTITY(1, 1) primary key,
StatTypeName varchar(50) NOT NULL,
StatTypeDescr varchar(125) NOT NULL)
--------------------------------------------------------------------
-- create table
CREATE TABLE AH_Statistics
(StatisticID INTEGER IDENTITY(1, 1) primary key,
StatName varchar(50) NOT NULL,
StatDescr varchar(125) NOT NULL)
-- add foreign key
ALTER TABLE AH_Statistics
ADD StatisticTypeID INT
FOREIGN KEY REFERENCES AH_StatisticsType (StatisticTypeID)
--------------------------------------------------------------------
-- create table
CREATE TABLE AH_Employee
(EmployeeID INTEGER IDENTITY(1, 1) primary key,
EmployeeFName varchar(50) NOT NULL,
EmployeeLName varchar(50) NOT NULL,
EmployeeEmail varchar(50) NOT NULL,
EmployeeAddress varchar(125) NOT NULL,
EmployeeBirthDate Date)
--------------------------------------------------------------------
-- create table
CREATE TABLE AH_EmployeeRole
(EmployeeRoleID INTEGER IDENTITY(1, 1) primary key,
BeginDate Date,
EndDate Date)
-- add foreign key
ALTER TABLE AH_EmployeeRole
ADD EmployeeID INT
FOREIGN KEY REFERENCES AH_Employee (EmployeeID)
-- add foreign key
ALTER TABLE AH_EmployeeRole
ADD RoleID INT
FOREIGN KEY REFERENCES AH_Role (RoleID)
-- add foreign key
ALTER TABLE AH_EmployeeRole
ADD PlayerID INT
FOREIGN KEY REFERENCES AH_Player (PlayerID)

DELETE FROM AH_PlayerType
WHERE PlayerTypeID = '2'


INSERT INTO AH_PlayerType (PlayerTypeName, PlayerTypeDescr)
VALUES('All Around', 'Player can do everything well')
 
INSERT INTO AH_PlayerType (PlayerTypeName, PlayerTypeDescr)
VALUES('Defensive', 'Player is defensive minded')
 
INSERT INTO AH_PlayerType (PlayerTypeName, PlayerTypeDescr)
VALUES('Goaline_Scorer', 'Player can score at the one yardline')
 
INSERT INTO AH_PlayerType (PlayerTypeName, PlayerTypeDescr)
VALUES('RunningBack', 'Player is a running back')
 
INSERT INTO AH_PlayerType(PlayerTypeName, PlayerTypeDescr)
VALUES('Great Accuary', 'Player has a good accuary and throw')
 
INSERT INTO AH_PlayerType (PlayerTypeName, PlayerTypeDescr)
VALUES('BLOCK', 'Player is a good blocker with good panackas')


INSERT INTO AH_Player(PlayerFName, PlayerLName, PlayerNumber,
PlayerHomeTown, PlayerHeight, PlayerWeight, PlayerBirth, PlayerTypeID)
VALUES ('Russel ', 'Wilson', 30, 'Cinncanti, OH', '5-11', '200', 'Novemeber 19, 1984',
(SELECT PlayerTypeID FROM AH_PlayerType WHERE PlayerTypeName = 'RunningBack'))
 
INSERT INTO AH_Player(PlayerFName, PlayerLName, PlayerNumber,
PlayerHomeTown, PlayerHeight, PlayerWeight, PlayerBirth, PlayerTypeID)
VALUES ('Aaron', 'Rodger', 30, 'Akron, OH', '6-3', '190', 'March 14, 1988',
(SELECT PlayerTypeID FROM AH_PlayerType WHERE PlayerTypeName = 'BLOCK'))
 
INSERT INTO AH_Player(PlayerFName, PlayerLName, PlayerNumber,
PlayerHomeTown, PlayerHeight, PlayerWeight, PlayerBirth, PlayerTypeID)
VALUES ('Damian', 'Lillard', 0, 'Oakland, CA', '6-2', '250', 'July 15, 1990',
(SELECT PlayerTypeID FROM AH_PlayerType WHERE PlayerTypeName = 'All Around'))
 
 
INSERT INTO AH_Player(PlayerFName, PlayerLName, PlayerNumber,
PlayerHomeTown, PlayerHeight, PlayerWeight, PlayerBirth, PlayerTypeID)
VALUES ('Abdi', 'Hajir', 9, 'Seattle, WA', '6-0', '160', 'August 14, 2002',
(SELECT PlayerTypeID FROM AH_PlayerType WHERE PlayerTypeName = 'Defensive'))
 
INSERT INTO AH_Player(PlayerFName, PlayerLName, PlayerNumber,
PlayerHomeTown, PlayerHeight, PlayerWeight, PlayerBirth, PlayerTypeID)
VALUES ('James', 'Jones', 11, 'New York, City', '7-2', '289', 'March 3, 1988',
(SELECT PlayerTypeID FROM AH_PlayerType WHERE PlayerTypeName = 'Goaline_Scorer'))
 
INSERT INTO AH_Player(PlayerFName, PlayerLName, PlayerNumber,
PlayerHomeTown, PlayerHeight, PlayerWeight, PlayerBirth, PlayerTypeID)
VALUES ('Ron', 'harper', 2, 'Seattle, WA', '6-7', '225', 'June 29, 1991',
(SELECT PlayerTypeID FROM AH_PlayerType WHERE PlayerTypeName = 'Defensive'))
 
INSERT INTO AH_Player(PlayerFName, PlayerLName, PlayerNumber,
PlayerHomeTown, PlayerHeight, PlayerWeight, PlayerBirth, PlayerTypeID)
VALUES ('Nader', 'Smith Junior', 1, 'Green Bay, WI', '5-9', '130', 'July 1, 1990',
(SELECT PlayerTypeID FROM AH_PlayerType WHERE PlayerTypeName = 'Goaline_Scorer'))


 
INSERT INTO AH_Ticket(TicketName, TicketPurchaseDate, TicketTypeID, StadiumID, OrderID, TicketEventDate)
VALUES('Seahawks vs Giants game ticket', 'July 16 2020', (Select TicketTypeID FROM AH_TicketType WHERE Ticket_TypeName = 'Regular Season Ticket'),
(Select StadiumID FROM AH_Stadium WHERE StadiumName = 'Key Arena'), (Select OrderID FROM AH_Order where OrderDate = 'May 20 2005'), 
'April 20 2003')
 
 
INSERT INTO AH_Ticket(TicketName, TicketPurchaseDate, TicketTypeID, StadiumID, OrderID, TicketEventDate)
VALUES('Packers vs Colts game ticket', 'May 14 2001', (Select TicketTypeID FROM AH_TicketType WHERE Ticket_TypeName = 'Regular Season Ticket'),
(Select StadiumID FROM AH_Stadium WHERE StadiumName = 'Moda Center'), (Select OrderID FROM AH_Order where OrderDate = 'July 20 2012'), 
'April 20 2003')

CREATE PROCEDURE AH_update_team_ID_Total
@Team_Name2 varchar(40),
@TeamCity2 varchar(50),
@TeamShortName2 varchar(15),
@Team_ID2 INT OUTPUT
AS
SET @Team_ID2 = (Select TeamID FROM AH_Team WHERE TeamName = @Team_Name2 AND TeamCity = @TeamCity2 AND TeamShortName = @TeamShortName2)
 
 
SET @Player_ID = (Select PlayerID FROM AH_Player WHERE PlayerFName = @PlayerF_Name AND PlayerLName = @PlayerL_Name AND PlayerNumber = @PlayerNumber AND PlayerBirth = @PlayerBirthdate)
CREATE PROCEDURE AH_UPDATE_PLAYERID
@PlayerF_Name2 varchar(40),
@PlayerL_Name2 varchar(40),
@PlayerNumber2 varchar(40),
@PlayerBirthdate2 DATE,
@Player_ID2 INT OUTPUT
AS
SET @Player_ID2 = (Select PlayerID FROM AH_Player WHERE PlayerFName = @PlayerF_Name2 AND PlayerLName = @PlayerL_Name2 AND PlayerNumber = @PlayerNumber2 AND PlayerBirth = @PlayerBirthdate2)
 
 
 
 
CREATE PROCEDURE AH_Insert_Into_RosterGame
@EndDate DATE,
@BeginDate DATE,
@SeasonWeek varchar(40),
@GameDate DATE
AS
DECLARE @Roster_ID INTEGER, @Game_ID INTEGER
EXEC UPDATE_ROSTERID
@BeginDate2 = @BeginDate,
@EndDate2 = @EndDate,
@Roster_ID2 = @Roster_ID OUTPUT
 
EXEC Update_Game_ID_RosterGame
@SeasonWeek2 = @SeasonWeek,
@Game_ID2 = @Game_ID OUTPUT
BEGIN TRANSACTION BEGIN_UPDATING
INSERT INTO AH_RosterGame(GameID, RosterID)
VALUES(@Game_ID, @Roster_ID)
COMMIT TRANSACTION BEGIN_UPDATING
 
 
SET @Roster_ID = (Select RosterID FROM AH_Roster WHERE BeginDate = @BeginDate AND EndDate = @EndDate AND Salary = @Salary)
ALTER PROCEDURE UPDATE_ROSTERID
@BeginDate2 DATE,
@EndDate2 DATE,
 
@Roster_ID2 INT OUTPUT
AS
SET @Roster_ID2 = (Select RosterID FROM AH_Roster WHERE BeginDate = @BeginDate2 AND EndDate = @EndDate2 )
 
 
 
 
CREATE PROCEDURE AH_Update_Game_ID_RosterGame
@SeasonWeek2 varchar(50),
@Game_ID2 INT OUTPUT
AS
SET @Game_ID2 = (SELECT GameID FROM AH_Game WHERE SeasonWeek = @SeasonWeek2)
EXEC Insert_Into_RosterGame
@EndDate = 'March 31, 2003',
@BeginDate = 'March 1, 2000',
@SeasonWeek = '12',
@GameDate = 'November 18 2020' 
 
 
EXEC Insert_Into_RosterGame
@EndDate = 'May 31, 2020',
@BeginDate = 'June 1, 1998',
@SeasonWeek = '12',
@GameDate = 'September 19, 2017' 
 
 
EXEC Insert_Into_RosterGame
@EndDate = 'December 31, 2020',
@BeginDate = 'June 1, 2009',
@SeasonWeek = '12',
@GameDate = 'December 19, 2010 ' 
 
SELECT * FROM AH_Roster_Game_Statistic
 
DELETE FROM AH_RosterGame WHERE RosterGameID = 8
DELETE FROM AH_RosterGame WHERE RosterGameID = 2
DELETE FROM AH_RosterGame WHERE RosterGameID = 3
 
 
CREATE PROCEDURE AH_Update_Tables_RosterGameStat
@Stat_Name varchar(40),
@Game_Date DATE,
@Quarter_Name varchar(40),
@RosterID INT,
@GameTime varchar(30)
AS
DECLARE @Statistic_ID INT, @Quarter_ID INTEGER, @Roster_GameID INTEGER
SET @Statistic_ID = (Select StatisticID FROM BP_Statistics WHERE StatName = @Stat_Name)
SET @Quarter_ID = (Select QuarterID FROM AH_Quarter WHERE QuarterName = @Quarter_Name)
SET @Roster_GameID = (Select RosterGameID FROM AH_RosterGame WHERE RosterID = @RosterID)
BEGIN TRANSACTION update_roster_Game_Stats_table
INSERT INTO AH_Roster_Game_Statistic(RosterGameID, GameTime, QuarterID, StatisticID)
VALUES(@Roster_GameID , @GameTime, @Quarter_ID, @Statistic_ID)
COMMIT TRANSACTION update_roster_Game_Stats_table
