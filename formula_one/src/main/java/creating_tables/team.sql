/*4)Team
Attributes:
- TeamID (Integer, Primary Key)
- TeamName (Varchar)
- Country (Varchar)*/

CREATE TABLE Team (
	TeamID INT AUTO_INCREMENT PRIMARY KEY,
    TeamName VARCHAR(50),
    Country VARCHAR(50)
);