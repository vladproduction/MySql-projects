/*7)Participation (Junction Table for Many-to-Many relationship between Driver and Event)
Attributes:
- ParticipationID (Integer, Primary Key)
- DriverID (Integer, Foreign Key, references Driver)
- EventID (Integer, Foreign Key, references Event)
- Position (Integer) – the finishing position of the driver in the event*/

CREATE TABLE Participation (
    ParticipationID INT AUTO_INCREMENT PRIMARY KEY,
    DriverID INT,
    EventID INT,
    Position INT,
    FOREIGN KEY (DriverID) REFERENCES Driver(DriverID),
    FOREIGN KEY (EventID) REFERENCES Event(EventID)
);