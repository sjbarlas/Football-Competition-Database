/* 
Student Name: Saira Barlas
Student Number: C12809080
Case Study: Football Competition
*/

/* 
CREATING THE TABLES
*/
DROP TABLE Player CASCADE CONSTRAINTS PURGE; /* Player created */

DROP TABLE Result CASCADE CONSTRAINTS PURGE; /* Result created */

DROP TABLE Match CASCADE CONSTRAINTS PURGE; /* Match Created */

DROP TABLE Referee CASCADE CONSTRAINTS PURGE; /* Referee Created */

DROP TABLE Manager CASCADE CONSTRAINTS PURGE; /* Manager Created */

DROP TABLE Team CASCADE CONSTRAINTS PURGE; /* Team Created */

DROP TABLE Competition CASCADE CONSTRAINTS PURGE; /* Competition Created */

DROP TABLE Club CASCADE CONSTRAINTS PURGE; /* Club Created */

CREATE TABLE Club /* Club and it's attributes */
(
	Club_ID              INTEGER NOT NULL ,
	ClubHouse            VARCHAR2(74) NOT NULL ,
	ClubManagerName      VARCHAR2(74) NOT NULL ,
	ClubHomeGround       VARCHAR2(74) NOT NULL ,
	ClubDirections       VARCHAR2(150) NOT NULL ,
CONSTRAINT  XPKClub PRIMARY KEY (Club_ID)
);

CREATE TABLE Competition /* Competition and it's attributes */
(
	Competition_ID       INTEGER NOT NULL ,
	Sponsor              VARCHAR2(74) NOT NULL ,
	AgeGroup             INTEGER NOT NULL ,
	Fee                  INTEGER NOT NULL ,
	Prize                VARCHAR2(74) NOT NULL ,
	OrganisersName       VARCHAR2(74) NOT NULL ,
	OrganisersNumber     INTEGER NOT NULL ,
CONSTRAINT  XPKCompetition PRIMARY KEY (Competition_ID)
);

CREATE TABLE Team /* Team and it's attributes */
(
	Team_ID              INTEGER NOT NULL ,
	Competition_ID       INTEGER NOT NULL ,
	Club_ID              INTEGER NOT NULL ,
	Age                  INTEGER NOT NULL ,
	Address              VARCHAR2(74) NOT NULL ,
CONSTRAINT  XPKTeam PRIMARY KEY (Team_ID),
CONSTRAINT R_7 FOREIGN KEY (Club_ID) REFERENCES Club (Club_ID),
CONSTRAINT R_15 FOREIGN KEY (Competition_ID) REFERENCES Competition (Competition_ID)
);

CREATE TABLE Manager /* Manager and it's attributes */
(
	Manager_ID           INTEGER NOT NULL ,
	Team_ID              INTEGER NOT NULL ,
	ManagerName          VARCHAR2(74) NOT NULL ,
	ManagerPhone         INTEGER NOT NULL ,
	ManagerAddress       VARCHAR2(60) NOT NULL ,
CONSTRAINT  XPKManager PRIMARY KEY (Manager_ID),
CONSTRAINT R_16 FOREIGN KEY (Team_ID) REFERENCES Team (Team_ID)
);

CREATE TABLE Referee /* Referee and it's attributes */
(
	Ref_ID               INTEGER NOT NULL ,
	RefName              VARCHAR2(74) NOT NULL ,
	RefPhone             INTEGER NOT NULL ,
	RefAddress           VARCHAR2(74) NOT NULL ,
CONSTRAINT  XPKReferee PRIMARY KEY (Ref_ID)
);

CREATE TABLE Match /* Match and it's attributes */
(
	Match_ID             INTEGER NOT NULL ,
	AwayTeam             INTEGER NOT NULL ,
	HomeTeam             INTEGER NOT NULL ,
	Ref_ID               INTEGER NOT NULL ,
	Competition_ID       INTEGER NOT NULL ,
	MatchVenue           VARCHAR2(74) NOT NULL ,
	MatchDate            VARCHAR2(74) NOT NULL ,
	MatchTime            VARCHAR2(74) NOT NULL ,
CONSTRAINT  XPKMatchD PRIMARY KEY (Match_ID),
CONSTRAINT R_6 FOREIGN KEY (Ref_ID) REFERENCES Referee (Ref_ID),
CONSTRAINT R_12 FOREIGN KEY (Competition_ID) REFERENCES Competition (Competition_ID),
CONSTRAINT R_13 FOREIGN KEY (HomeTeam) REFERENCES Team (Team_ID),
CONSTRAINT R_14 FOREIGN KEY (AwayTeam) REFERENCES Team (Team_ID)
);

CREATE TABLE Result /* Result and it's attributes */
(
	Result_ID            INTEGER NOT NULL ,
	Match_ID             INTEGER NOT NULL ,
	HomeTeamScore        INTEGER NOT NULL ,
	AwayTeamScore        INTEGER NOT NULL ,
CONSTRAINT  XPKResultF PRIMARY KEY (Result_ID),
CONSTRAINT R_8 FOREIGN KEY (Match_ID) REFERENCES Match (Match_ID)
);

CREATE TABLE Player /* Player and it's attributes */
(
	Player_ID            INTEGER NOT NULL ,
	Team_ID              INTEGER NOT NULL ,
	PlayerDOB            VARCHAR2(74) NOT NULL ,
	PlayerName           VARCHAR2(74) NOT NULL ,
	PlayerAddress        VARCHAR2(74) NOT NULL ,
	PlayerGaurdian       VARCHAR2(74) NOT NULL ,
CONSTRAINT  XPKPlayer PRIMARY KEY (Player_ID),
CONSTRAINT R_4 FOREIGN KEY (Team_ID) REFERENCES Team (Team_ID)
);





/*
POPULATING MY TABLES WITH THE RELEVANT INFO.
*/

Delete Result;
Delete Match;
Delete Referee;
Delete Player;
Delete Manager;
Delete Team;
Delete Competition;
Delete Club;

/* Competition Table Info. */
INSERT INTO COMPETITION (Competition_ID, Sponsor, AgeGroup, Fee, Prize, OrganisersName, OrganisersNumber)VALUES (201, 'UEFA', '15', '10000', 'Champions League Trophy U15','Sep Blatter', '872549123');
INSERT INTO COMPETITION (Competition_ID, Sponsor, AgeGroup, Fee, Prize, OrganisersName, OrganisersNumber)VALUES (202, 'Barclays', '12', '5000', 'FA Cup U12','Nigel Manson', '871265389');
INSERT INTO COMPETITION (Competition_ID, Sponsor, AgeGroup, Fee, Prize, OrganisersName, OrganisersNumber)VALUES (203, 'LFP', '16', '12000', 'Copa Del Ray U16','Xavi Sanchez', '851198723');

/* Club Table Info. */
INSERT INTO Club (Club_ID, ClubHouse, ClubManagerName, ClubHomeGround, ClubDirections)VALUES (101, 'Manchester United', 'Barry Robson', 'Trafford', 'Beside City');
INSERT INTO Club (Club_ID, ClubHouse, ClubManagerName, ClubHomeGround, ClubDirections)VALUES (102, 'Manchester City', 'Gerry Renner', 'Ethihad Stadium', 'Beside United');
INSERT INTO Club (Club_ID, ClubHouse, ClubManagerName, ClubHomeGround, ClubDirections)VALUES (103, 'Real Madrid', 'Rafa Benitez', 'Santiago Bernabeau', 'Beside the Catalans');
INSERT INTO Club (Club_ID, ClubHouse, ClubManagerName, ClubHomeGround, ClubDirections)VALUES (104, 'Barcalona', 'Jose Callejon', 'Camp Nou', 'Beside Madrid');
INSERT INTO Club (Club_ID, ClubHouse, ClubManagerName, ClubHomeGround, ClubDirections)VALUES (105, 'Chelsea', 'Mark Walsh', 'Stamford Bridge', 'Beside London Central');
INSERT INTO Club (Club_ID, ClubHouse, ClubManagerName, ClubHomeGround, ClubDirections)VALUES (106, 'Arsenal', 'David May', 'Emirates Stadium', 'Beside London East');
INSERT INTO Club (Club_ID, ClubHouse, ClubManagerName, ClubHomeGround, ClubDirections)VALUES (107, 'Liverpool', 'Harrison Good', 'Anfield', 'Beside Merseyside');
INSERT INTO Club (Club_ID, ClubHouse, ClubManagerName, ClubHomeGround, ClubDirections)VALUES (108, 'Juventus', 'Paolo Di Canio', 'Stadio Del Alpe', 'Central Italy');
INSERT INTO Club (Club_ID, ClubHouse, ClubManagerName, ClubHomeGround, ClubDirections)VALUES (109, 'Bayern Munich', 'Mark Schurlle', 'Munich Stadium', 'Central Germany');
INSERT INTO Club (Club_ID, ClubHouse, ClubManagerName, ClubHomeGround, ClubDirections)VALUES (110, 'Borussia Dortmund', 'Kevin Schneiderlen', 'Dortmund Stadium', 'North East Germany');
INSERT INTO Club (Club_ID, ClubHouse, ClubManagerName, ClubHomeGround, ClubDirections)VALUES (111, 'PSG (Paris-Saint-Germain)', 'Lorent Blonc', 'Parc De France', 'Central France');

/* Under 15's Teams All Clubs */
INSERT INTO Team (Team_ID,COMPETITION_ID,club_id,Age, Address)VALUES(401,201,101,15, 'Old Trafford Stadium Manchester England'); 
INSERT INTO Team (Team_ID,COMPETITION_ID,club_id,Age, Address)VALUES(402,201,102,15, 'Ethihad Stadium Manchester England'); 
INSERT INTO Team (Team_ID,COMPETITION_ID,club_id,Age, Address)VALUES(403,201,103,15, 'Saniago Bernabeau Stadium Madrid Spain'); 
INSERT INTO Team (Team_ID,COMPETITION_ID,club_id,Age, Address)VALUES(404,201,104,15, 'Camp Nou Barcalona Catalonia Spain'); 
INSERT INTO Team (Team_ID,COMPETITION_ID,club_id,Age, Address)VALUES(405,201,105,15, 'Stamford Bridge Chelsea London England'); 
INSERT INTO Team (Team_ID,COMPETITION_ID,club_id,Age, Address)VALUES(406,201,106,15, 'Emirates Stadium Arsenal London England'); 
INSERT INTO Team (Team_ID,COMPETITION_ID,club_id,Age, Address)VALUES(407,201,107,15, 'Anfield Stadium Liverpool England'); 
INSERT INTO Team (Team_ID,COMPETITION_ID,club_id,Age, Address)VALUES(408,201,108,15, 'Stadio Del Alpe Juventus Italy'); 
INSERT INTO Team (Team_ID,COMPETITION_ID,club_id,Age, Address)VALUES(409,201,109,15, 'Munich Stadium Munich Germany'); 
INSERT INTO Team (Team_ID,COMPETITION_ID,club_id,Age, Address)VALUES(410,201,110,15, 'Dortmund Stadium Dortmund Germany'); 

/* Under 12's Teams English Clubs */
INSERT INTO Team (Team_ID,COMPETITION_ID,club_id,Age, Address)VALUES(411,202,101,12, 'Old Trafford Stadium Manchester England'); 
INSERT INTO Team (Team_ID,COMPETITION_ID,club_id,Age, Address)VALUES(412,202,102,12, 'Ethihad Stadium Manchester England'); 
INSERT INTO Team (Team_ID,COMPETITION_ID,club_id,Age, Address)VALUES(413,202,105,12, 'Stamford Bridge Chelsea London England'); 
INSERT INTO Team (Team_ID,COMPETITION_ID,club_id,Age, Address)VALUES(414,202,106,12, 'Emirates Stadium Arsenal London England'); 
INSERT INTO Team (Team_ID,COMPETITION_ID,club_id,Age, Address)VALUES(415,202,107,12, 'Anfield Stadium Liverpool England'); 

/* Under 16's Teams Spanish Clubs */
INSERT INTO Team (Team_ID,COMPETITION_ID,club_id,Age, Address)VALUES(416,203,103,16, 'Saniago Bernabeau Stadium Madrid Spain'); 
INSERT INTO Team (Team_ID,COMPETITION_ID,club_id,Age, Address)VALUES(417,203,104,16, 'Camp Nou Barcalona Catalonia Spain'); 
    
/* Under 15's Managers */
INSERT INTO Manager (Manager_ID, Team_ID, ManagerName, ManagerPhone, ManagerAddress)VALUES (301, 401,'Mark Reid', 0871122459, '38 Bloomfield Drive');
INSERT INTO Manager (Manager_ID, Team_ID, ManagerName, ManagerPhone, ManagerAddress)VALUES (302, 402,'David Blatt', 0871122459, '38 Bloomfield Drive');
INSERT INTO Manager (Manager_ID, Team_ID, ManagerName, ManagerPhone, ManagerAddress)VALUES (303, 403,'Alvaro Navas', 0871122459, '38 Bloomfield Drive');
INSERT INTO Manager (Manager_ID, Team_ID, ManagerName, ManagerPhone, ManagerAddress)VALUES (304, 404,'Jordi Lopez', 0871122459, '38 Bloomfield Drive');
INSERT INTO Manager (Manager_ID, Team_ID, ManagerName, ManagerPhone, ManagerAddress)VALUES (305, 405,'Darren Lynch', 0871122459, '38 Bloomfield Drive');
INSERT INTO Manager (Manager_ID, Team_ID, ManagerName, ManagerPhone, ManagerAddress)VALUES (306, 406,'Harry Hill', 0871122459, '38 Bloomfield Drive');
INSERT INTO Manager (Manager_ID, Team_ID, ManagerName, ManagerPhone, ManagerAddress)VALUES (307, 407,'Larry Moyes', 0871122459, '38 Bloomfield Drive');
INSERT INTO Manager (Manager_ID, Team_ID, ManagerName, ManagerPhone, ManagerAddress)VALUES (308, 408,'Andre Lahm', 0871122459, '38 Bloomfield Drive');
INSERT INTO Manager (Manager_ID, Team_ID, ManagerName, ManagerPhone, ManagerAddress)VALUES (309, 409,'Bastian Vettel', 0871122459, '38 Bloomfield Drive');

/* Under 12's Managers */
INSERT INTO Manager (Manager_ID, Team_ID, ManagerName, ManagerPhone, ManagerAddress)VALUES (310, 410,'Carl Moloney', 0871122459, '38 Bloomfield Drive');
INSERT INTO Manager (Manager_ID, Team_ID, ManagerName, ManagerPhone, ManagerAddress)VALUES (311, 411,'David Mullens', 0871122459, '38 Bloomfield Drive');
INSERT INTO Manager (Manager_ID, Team_ID, ManagerName, ManagerPhone, ManagerAddress)VALUES (312, 412,'Ralf Morrison', 0871122459, '38 Bloomfield Drive');
INSERT INTO Manager (Manager_ID, Team_ID, ManagerName, ManagerPhone, ManagerAddress)VALUES (313, 413,'Darren Snodgrass', 0871122459, '38 Bloomfield Drive');
INSERT INTO Manager (Manager_ID, Team_ID, ManagerName, ManagerPhone, ManagerAddress)VALUES (314, 414,'John Morgan', 0871122459, '38 Bloomfield Drive');
INSERT INTO Manager (Manager_ID, Team_ID, ManagerName, ManagerPhone, ManagerAddress)VALUES (315, 415,'Carl Dempsey', 0871122459, '38 Bloomfield Drive');

/* Under 16's Managers */
INSERT INTO Manager (Manager_ID, Team_ID, ManagerName, ManagerPhone, ManagerAddress)VALUES (316, 416,'Sergio Negredo', 0871122459, '38 Bloomfield Drive');
INSERT INTO Manager (Manager_ID, Team_ID, ManagerName, ManagerPhone, ManagerAddress)VALUES (317, 417,'Carlos Vela', 0871122459, '38 Bloomfield Drive');

/* Referee Table Info. */    
INSERT INTO REFEREE (REF_ID,REFNAME, REFPHONE,REFADDRESS)VALUES(701,'Tim Howard',086283123,'18 Mersey Way');
INSERT INTO REFEREE (REF_ID,REFNAME, REFPHONE,REFADDRESS)VALUES(702,'Darren Enfield',0851297746,'132 Greater Manchester Drive');
INSERT INTO REFEREE (REF_ID,REFNAME, REFPHONE,REFADDRESS)VALUES(703,'Mark Clatenberg',0891156776,'85 Moore Street London');
INSERT INTO REFEREE (REF_ID,REFNAME, REFPHONE,REFADDRESS)VALUES(704,'Larry Wilson',0833009978,'100 Benson Stree Lower Birmingham');
INSERT INTO REFEREE (REF_ID,REFNAME, REFPHONE,REFADDRESS)VALUES(705,'Morgan Pederson',0871606123,'85 Bootham Terrace');

/* Manchester United Under 15's Manchester united Players */  
INSERT INTO Player (PLAYER_ID,TEAM_ID, PLAYERDOB,PLAYERNAME,PLAYERADDRESS,PLAYERGAURDIAN)VALUES(801,401,'06-09-2003','John Henry','Preem Gardens','Bob');
INSERT INTO Player (PLAYER_ID,TEAM_ID, PLAYERDOB,PLAYERNAME,PLAYERADDRESS,PLAYERGAURDIAN)VALUES(802,401,'14-12-2003','Mark Mullens','Oval Way','Bob');

/* Manchester Ciy Under 15's Players */
INSERT INTO Player (PLAYER_ID,TEAM_ID, PLAYERDOB,PLAYERNAME,PLAYERADDRESS,PLAYERGAURDIAN)VALUES(803,402,'11-03-2003','Darren Wright','Barrets town','Gerry');
INSERT INTO Player (PLAYER_ID,TEAM_ID, PLAYERDOB,PLAYERNAME,PLAYERADDRESS,PLAYERGAURDIAN)VALUES(804,402,'13-10-2003','Darren Brien','Glove Street ','Gerry');

/* Real Madrid Under 15's Players */
INSERT INTO Player (PLAYER_ID,TEAM_ID, PLAYERDOB,PLAYERNAME,PLAYERADDRESS,PLAYERGAURDIAN)VALUES(805,403,'23-08-2003','Mario Lopez','Madrid Lower','Carlo');
INSERT INTO Player (PLAYER_ID,TEAM_ID, PLAYERDOB,PLAYERNAME,PLAYERADDRESS,PLAYERGAURDIAN)VALUES(806,403,'24-11-2003','Paolo Navas','Madrid Upper','Carlo');

/* Barcalona Under 15's Players */
INSERT INTO Player (PLAYER_ID,TEAM_ID, PLAYERDOB,PLAYERNAME,PLAYERADDRESS,PLAYERGAURDIAN)VALUES(807,404,'12-04-2003','Pedro Alves','Catalonia west','Fabio');
INSERT INTO Player (PLAYER_ID,TEAM_ID, PLAYERDOB,PLAYERNAME,PLAYERADDRESS,PLAYERGAURDIAN)VALUES(808,404,'26-11-2003','Javier Hernanes','Catalonia East ','Fabio');

/* Chelsea Under 15's Players */
INSERT INTO Player (PLAYER_ID,TEAM_ID, PLAYERDOB,PLAYERNAME,PLAYERADDRESS,PLAYERGAURDIAN)VALUES(809,405,'13-07-2003','Kevin Kid','London South','Carl');
INSERT INTO Player (PLAYER_ID,TEAM_ID, PLAYERDOB,PLAYERNAME,PLAYERADDRESS,PLAYERGAURDIAN)VALUES(810,405,'30-08-2003','Mark Robson','London North ','Carl');

/* Arsenal Under 15's Players */
INSERT INTO Player (PLAYER_ID,TEAM_ID, PLAYERDOB,PLAYERNAME,PLAYERADDRESS,PLAYERGAURDIAN)VALUES(811,406,'14-05-2003','Nigel Martin','London central','Mark');
INSERT INTO Player (PLAYER_ID,TEAM_ID, PLAYERDOB,PLAYERNAME,PLAYERADDRESS,PLAYERGAURDIAN)VALUES(812,406,'09-02-2003','Jerry Lane','London West ','Mark');

/* Liverpool Under 15's Players */
INSERT INTO Player (PLAYER_ID,TEAM_ID, PLAYERDOB,PLAYERNAME,PLAYERADDRESS,PLAYERGAURDIAN)VALUES(813,407,'17-09-2003','Ravel Morrison','Merseyside Way','Harry');
INSERT INTO Player (PLAYER_ID,TEAM_ID, PLAYERDOB,PLAYERNAME,PLAYERADDRESS,PLAYERGAURDIAN)VALUES(814,407,'30-11-2003','Liam Brady','Merseyside Drive ','Harry');

/* Juventus Under 15's Players */
INSERT INTO Player (PLAYER_ID,TEAM_ID, PLAYERDOB,PLAYERNAME,PLAYERADDRESS,PLAYERGAURDIAN)VALUES(815,408,'30-12-2003','Mario Lupi','Milan central ','Marco');
INSERT INTO Player (PLAYER_ID,TEAM_ID, PLAYERDOB,PLAYERNAME,PLAYERADDRESS,PLAYERGAURDIAN)VALUES(816,408,'27-11-2003','Carlo Nesta',' Rome Central','Marco');

/* Bayern Munich Under 15's Players */
INSERT INTO Player (PLAYER_ID,TEAM_ID, PLAYERDOB,PLAYERNAME,PLAYERADDRESS,PLAYERGAURDIAN)VALUES(817,409,'11-01-2003','Andre Schurlle','Munich Upper','Philip');
INSERT INTO Player (PLAYER_ID,TEAM_ID, PLAYERDOB,PLAYERNAME,PLAYERADDRESS,PLAYERGAURDIAN)VALUES(818,409,'25-12-2003','Bastian Lahm','Munich Lower ','Philip');

/* Borussia Dortmund 15's Players */
INSERT INTO Player (PLAYER_ID,TEAM_ID, PLAYERDOB,PLAYERNAME,PLAYERADDRESS,PLAYERGAURDIAN)VALUES(819,410,'12-12-2003','David Reus','Dortmund East','Bastian');
INSERT INTO Player (PLAYER_ID,TEAM_ID, PLAYERDOB,PLAYERNAME,PLAYERADDRESS,PLAYERGAURDIAN)VALUES(820,410,'13-03-2003','Marco Schneiderlen','Dortmund West ','Bastian');

/* Manchester United 12's Players */
INSERT INTO Player (PLAYER_ID,TEAM_ID, PLAYERDOB,PLAYERNAME,PLAYERADDRESS,PLAYERGAURDIAN)VALUES(821,411,'18-11-2005','Carl Power','Manchester East','Darren');
INSERT INTO Player (PLAYER_ID,TEAM_ID, PLAYERDOB,PLAYERNAME,PLAYERADDRESS,PLAYERGAURDIAN)VALUES(822,411,'12-01-2005','Barry Loughlin','Manchester West ','Darren');

/* Manchester City Under 12's Players */
INSERT INTO Player (PLAYER_ID,TEAM_ID, PLAYERDOB,PLAYERNAME,PLAYERADDRESS,PLAYERGAURDIAN)VALUES(823,412,'23-03-2005','Larry Mullens','Greater Manchester','Darragh');
INSERT INTO Player (PLAYER_ID,TEAM_ID, PLAYERDOB,PLAYERNAME,PLAYERADDRESS,PLAYERGAURDIAN)VALUES(824,412,'05-10-2005','Carl Power','Lower Manchester ','Darragh');

/* Chelsea Under 12's Players */
INSERT INTO Player (PLAYER_ID,TEAM_ID, PLAYERDOB,PLAYERNAME,PLAYERADDRESS,PLAYERGAURDIAN)VALUES(825,413,'23-08-2005','Ben Kinsey','London upper','Nigel');
INSERT INTO Player (PLAYER_ID,TEAM_ID, PLAYERDOB,PLAYERNAME,PLAYERADDRESS,PLAYERGAURDIAN)VALUES(826,413,'15-09-2005','Barry Ryan','London North ','Nigel');

/* Arsenal Under 12's Players */
INSERT INTO Player (PLAYER_ID,TEAM_ID, PLAYERDOB,PLAYERNAME,PLAYERADDRESS,PLAYERGAURDIAN)VALUES(827,414,'01-01-2005','Darren Osbourne','London South','John');
INSERT INTO Player (PLAYER_ID,TEAM_ID, PLAYERDOB,PLAYERNAME,PLAYERADDRESS,PLAYERGAURDIAN)VALUES(828,414,'29-08-2005','Owen Wright','London North ','John');

/* Liverpool Under 12's Players */
INSERT INTO Player (PLAYER_ID,TEAM_ID, PLAYERDOB,PLAYERNAME,PLAYERADDRESS,PLAYERGAURDIAN)VALUES(829,415,'11-03-2005','Owen King','Merseyside South','Paul');
INSERT INTO Player (PLAYER_ID,TEAM_ID, PLAYERDOB,PLAYERNAME,PLAYERADDRESS,PLAYERGAURDIAN)VALUES(830,415,'13-10-2005','Brian Duggan','Merseyside North ','Paul');

/* Real Madrid Under 16's Players */
INSERT INTO Player (PLAYER_ID,TEAM_ID, PLAYERDOB,PLAYERNAME,PLAYERADDRESS,PLAYERGAURDIAN)VALUES(831,416,'12-07-2005','David Villa','Madrid Upper','Xavi');
INSERT INTO Player (PLAYER_ID,TEAM_ID, PLAYERDOB,PLAYERNAME,PLAYERADDRESS,PLAYERGAURDIAN)VALUES(832,416,'16-11-2005','Diego Lopez','Madrid Lower ','Xavi');

/* Barclona Under 16's Players */
INSERT INTO Player (PLAYER_ID,TEAM_ID, PLAYERDOB,PLAYERNAME,PLAYERADDRESS,PLAYERGAURDIAN)VALUES(833,416,'09-05-2005','Pedro Mendez','Catalonia Upper','Xabi');
INSERT INTO Player (PLAYER_ID,TEAM_ID, PLAYERDOB,PLAYERNAME,PLAYERADDRESS,PLAYERGAURDIAN)VALUES(834,416,'14-08-2005','Cristiano Lopez','Catalonia Lower ','Xabi');

/* Match Table Info. */
INSERT INTO Match (Match_ID,AwayTeam,HomeTeam,ref_id,competition_id, MATCHVENUE,MATCHDATE,MATCHTIME)VALUES(601,401,402,703,201,'Ethihad Stadium','2013-07-07','11:00');
INSERT INTO Match (Match_ID,AwayTeam,HomeTeam,ref_id,competition_id, MATCHVENUE,MATCHDATE,MATCHTIME)VALUES(602,403,404,703,201,'Camp Nou','2013-06-03','11:00');
INSERT INTO Match (Match_ID,AwayTeam,HomeTeam,ref_id,competition_id, MATCHVENUE,MATCHDATE,MATCHTIME)VALUES(603,405,406,705,201,'Emirates Stadium','2013-06-07','11:00');
INSERT INTO Match (Match_ID,AwayTeam,HomeTeam,ref_id,competition_id, MATCHVENUE,MATCHDATE,MATCHTIME)VALUES(604,407,408,702,201,'Stadio Del Alpe','2013-05-09','11:00');
INSERT INTO Match (Match_ID,AwayTeam,HomeTeam,ref_id,competition_id, MATCHVENUE,MATCHDATE,MATCHTIME)VALUES(605,409,410,701,201,'Dortmund Stadium','2013-06-22','11:00');
INSERT INTO Match (Match_ID,AwayTeam,HomeTeam,ref_id,competition_id, MATCHVENUE,MATCHDATE,MATCHTIME)VALUES(606,401,407,702,201,'Anfield','2013-05-06','11:00');
INSERT INTO Match (Match_ID,AwayTeam,HomeTeam,ref_id,competition_id, MATCHVENUE,MATCHDATE,MATCHTIME)VALUES(607,403,406,701,201,'Emirates Stadium','2013-05-03','11:00');
INSERT INTO Match (Match_ID,AwayTeam,HomeTeam,ref_id,competition_id, MATCHVENUE,MATCHDATE,MATCHTIME)VALUES(608,412,411,703,202,'Old Trafford','2013-07-03','11:00');
INSERT INTO Match (Match_ID,AwayTeam,HomeTeam,ref_id,competition_id, MATCHVENUE,MATCHDATE,MATCHTIME)VALUES(609,413,414,705,202,'Emirates Stadium','2013-07-01','11:00');
INSERT INTO Match (Match_ID,AwayTeam,HomeTeam,ref_id,competition_id, MATCHVENUE,MATCHDATE,MATCHTIME)VALUES(610,415,412,701,202,'Ethihad Stadium','2013-07-03','11:00');
INSERT INTO Match (Match_ID,AwayTeam,HomeTeam,ref_id,competition_id, MATCHVENUE,MATCHDATE,MATCHTIME)VALUES(611,413,411,701,202,'Old Trafford','2013-08-04','11:00');
INSERT INTO Match (Match_ID,AwayTeam,HomeTeam,ref_id,competition_id, MATCHVENUE,MATCHDATE,MATCHTIME)VALUES(612,416,417,704,203,'Camp Nou','2013-03-08','11:00');

/* Result Table Info. */
INSERT INTO Result (RESULT_ID,MATCH_ID,HOMETEAMSCORE, AWAYTEAMSCORE)VALUES(501,601,0,4); 
INSERT INTO Result (RESULT_ID,MATCH_ID,HOMETEAMSCORE, AWAYTEAMSCORE)VALUES(502,602,1,3); 
INSERT INTO Result (RESULT_ID,MATCH_ID,HOMETEAMSCORE, AWAYTEAMSCORE)VALUES(503,603,5,1); 
INSERT INTO Result (RESULT_ID,MATCH_ID,HOMETEAMSCORE, AWAYTEAMSCORE)VALUES(504,604,2,2); 
INSERT INTO Result (RESULT_ID,MATCH_ID,HOMETEAMSCORE, AWAYTEAMSCORE)VALUES(505,605,1,0); 
INSERT INTO Result (RESULT_ID,MATCH_ID,HOMETEAMSCORE, AWAYTEAMSCORE)VALUES(506,606,2,1); 
INSERT INTO Result (RESULT_ID,MATCH_ID,HOMETEAMSCORE, AWAYTEAMSCORE)VALUES(507,607,4,2); 
INSERT INTO Result (RESULT_ID,MATCH_ID,HOMETEAMSCORE, AWAYTEAMSCORE)VALUES(508,608,1,3); 
INSERT INTO Result (RESULT_ID,MATCH_ID,HOMETEAMSCORE, AWAYTEAMSCORE)VALUES(509,609,2,2); 
INSERT INTO Result (RESULT_ID,MATCH_ID,HOMETEAMSCORE, AWAYTEAMSCORE)VALUES(510,610,1,1); 
INSERT INTO Result (RESULT_ID,MATCH_ID,HOMETEAMSCORE, AWAYTEAMSCORE)VALUES(511,611,0,2); 
INSERT INTO Result (RESULT_ID,MATCH_ID,HOMETEAMSCORE, AWAYTEAMSCORE)VALUES(512,612,6,4); 

commit;