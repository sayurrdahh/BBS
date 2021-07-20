create table BBS (
	bbsID INT,
	bbsTitle VARCHAR(50),
	userID VARCHAR(20),
    bbsDate DATETIME,
	bbsCONTENT VARCHAR(2048),
    bbsAvailable INT,
 	PRIMARY KEY (bbsID)
 );