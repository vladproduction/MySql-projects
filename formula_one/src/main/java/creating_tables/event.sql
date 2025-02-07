/*1)Event
Attributes:
- EventID (Integer, Primary Key)
- EventName (Varchar)
- EventDate (Date)
- Location (Varchar)
- Type (Enum: Race, Qualifying, Practice)
- VenueID (Integer, Foreign Key, references Venue)*/
/*CREATE TABLE IF NOT EXISTS Event (
	...
    assume table not exists we can use this script
    ...
);*/

CREATE TABLE Event (
    EventID INT AUTO_INCREMENT PRIMARY KEY,
    EventName VARCHAR(255) NOT NULL,
    EventDate DATE NOT NULL,
    Location VARCHAR(255),
    Type ENUM('RACE', 'QUALIFYING', 'PRACTICE') NOT NULL,
    VenueID INT,
    FOREIGN KEY (VenueID) REFERENCES Venue(VenueID)
);