/*6)Venue
Attributes:
- VenueID (Integer, Primary Key)
- VenueName (Varchar)
- Location (Varchar)*/

CREATE TABLE Venue(
	VenueID INT AUTO_INCREMENT PRIMARY KEY,
    VenueName VARCHAR(50),
    Location VARCHAR(50)
);