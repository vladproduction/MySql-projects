/*3)Customer
Attributes:
- CustomerID (Integer, Primary Key)
- FirstName (Varchar)
- LastName (Varchar)
- Email (Varchar)
- PhoneNumber (Varchar)*/

CREATE TABLE Customer(
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(50),
    PhoneNumber VARCHAR(50)
);