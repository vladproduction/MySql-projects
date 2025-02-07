/*2)Ticket
Attributes:
- TicketID (Integer, Primary Key)
- EventID (Integer, Foreign Key, references Event)
- SeatNumber (Varchar)
- Price (Decimal)
- CustomerID (Integer, Foreign Key, references Customer)*/

CREATE TABLE Ticket (
    TicketID INT AUTO_INCREMENT PRIMARY KEY,
    EventID INT,
    SeatNumber VARCHAR(50),
    Price DECIMAL(10, 2),
    CustomerID INT,
    FOREIGN KEY (EventID) REFERENCES Event(EventID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);