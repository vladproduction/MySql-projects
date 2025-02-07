/*5)Driver
Attributes:
- DriverID (Integer, Primary Key)
- FirstName (Varchar)
- LastName (Varchar)
- TeamID (Integer, Foreign Key, references Team)*/

CREATE TABLE Driver (
    DriverID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    TeamID INT,
    FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);