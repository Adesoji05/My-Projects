-- Create the database
CREATE DATABASE KangarooDelivery;
USE KangarooDelivery;

-- Customer table
CREATE TABLE Customer (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    LastName VARCHAR(50) NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL
);

INSERT INTO Customer (LastName, FirstName, Email, PhoneNumber)
VALUES 
('Smith', 'John', 'john.smith@gmail.com', '1234567890'),
('Johnson', 'Emily', 'emily.johnson@gmail.com', '0987654321'),
('Brown', 'Michael', 'michael.brown@gmail.com', '1122334455'),
('Taylor', 'Sarah', 'sarah.taylor@gmail.com', '5566778899'),
('Anderson', 'David', 'david.anderson@gmail.com', '6677889900'),
('Thomas', 'Laura', 'laura.thomas@gmail.com', '4455667788'),
('Jackson', 'Daniel', 'daniel.jackson@gmail.com', '2233445566'),
('White', 'Sophia', 'sophia.white@gmail.com', '3344556677'),
('Harris', 'James', 'james.harris@gmail.com', '7788990011'),
('Martin', 'Olivia', 'olivia.martin@gmail.com', '9900112233'),
('Thompson', 'Noah', 'noah.thompson@gmail.com', '8877665544'),
('Garcia', 'Isabella', 'isabella.garcia@gmail.com', '5566778899'),
('Martinez', 'Ethan', 'ethan.martinez@gmail.com', '4433221100'),
('Robinson', 'Ava', 'ava.robinson@gmail.com', '2211445566'),
('Clark', 'Liam', 'liam.clark@gmail.com', '3322110099');

-- Manager table
CREATE TABLE Manager (
    ManagerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL
);

INSERT INTO Manager (FirstName, LastName, Email)
VALUES 
('Alice', 'Brown', 'alice.brown@gmail.com'),
('Mark', 'Davis', 'mark.davis@gmail.com'),
('Sophia', 'Wilson', 'sophia.wilson@gmail.com'),
('James', 'Taylor', 'james.taylor@gmail.com'),
('Emily', 'Moore', 'emily.moore@gmail.com'),
('Michael', 'White', 'michael.white@gmail.com'),
('Laura', 'Anderson', 'laura.anderson@gmail.com'),
('David', 'Clark', 'david.clark@gmail.com'),
('Sarah', 'Martinez', 'sarah.martinez@gmail.com'),
('Daniel', 'Robinson', 'daniel.robinson@gmail.com'),
('Olivia', 'Garcia', 'olivia.garcia@gmail.com'),
('Noah', 'Thompson', 'noah.thompson@gmail.com'),
('Liam', 'Martin', 'liam.martin@gmail.com'),
('Ethan', 'Jackson', 'ethan.jackson@gmail.com'),
('Ava', 'Harris', 'ava.harris@gmail.com');


-- Restaurant table
CREATE TABLE Restaurant (
    RestaurantID INT AUTO_INCREMENT PRIMARY KEY,
    RestaurantName VARCHAR(100) NOT NULL,
    Address VARCHAR(255) NOT NULL
);

INSERT INTO Restaurant (RestaurantName, Address)
VALUES 
('Burger King', '123 Main St'),
('Pizza Hut', '456 Elm St'),
('Subway', '789 Pine St'),
('Domino\'s', '101 Maple St'),
('McDonald\'s', '202 Oak St'),
('KFC', '303 Cedar St'),
('Taco Bell', '404 Walnut St'),
('Wendy\'s', '505 Birch St'),
('Chipotle', '606 Cherry St'),
('Chick-fil-A', '707 Spruce St'),
('Panda Express', '808 Ash St'),
('Five Guys', '909 Willow St'),
('Arby\'s', '111 Poplar St'),
('Papa John\'s', '222 Magnolia St'),
('IHOP', '333 Cypress St');


-- Driver table
CREATE TABLE Driver (
    DriverID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    NI_Number VARCHAR(20) UNIQUE NOT NULL,
    DrivingLicenseNumber VARCHAR(20) UNIQUE NOT NULL,
    LicenseIssueDate DATE NOT NULL,
    LicenseExpiryDate DATE NOT NULL,
    CountryOfIssue VARCHAR(50) NOT NULL,
    ManagerID INT NOT NULL,
    RestaurantID INT NOT NULL,
    FOREIGN KEY (ManagerID) REFERENCES Manager(ManagerID),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurant(RestaurantID)
);

INSERT INTO Driver (FirstName, LastName, Salary, Email, NI_Number, DrivingLicenseNumber, LicenseIssueDate, LicenseExpiryDate, CountryOfIssue, ManagerID, RestaurantID)
VALUES 
('John', 'Doe', 2500.00, 'john.doe@gmail.com', 'NI12345', 'DL12345', '2020-01-01', '2030-01-01', 'USA', 1, 1),
('Emily', 'Smith', 2700.00, 'emily.smith@gmail.com', 'NI12346', 'DL12346', '2019-03-15', '2029-03-15', 'Canada', 2, 2),
('Michael', 'Brown', 2600.00, 'michael.brown@gmail.com', 'NI12347', 'DL12347', '2021-06-10', '2031-06-10', 'UK', 3, 3),
('Sarah', 'Johnson', 2800.00, 'sarah.johnson@gmail.com', 'NI12348', 'DL12348', '2018-09-20', '2028-09-20', 'Australia', 4, 4),
('David', 'Taylor', 2400.00, 'david.taylor@gmail.com', 'NI12349', 'DL12349', '2017-11-05', '2027-11-05', 'USA', 5, 5),
('Laura', 'Anderson', 3000.00, 'laura.anderson@gmail.com', 'NI12350', 'DL12350', '2022-01-25', '2032-01-25', 'Canada', 6, 6),
('Daniel', 'White', 2550.00, 'daniel.white@gmail.com', 'NI12351', 'DL12351', '2020-02-15', '2030-02-15', 'UK', 7, 7),
('Sophia', 'Clark', 2900.00, 'sophia.clark@gmail.com', 'NI12352', 'DL12352', '2019-08-30', '2029-08-30', 'Australia', 8, 8),
('James', 'Harris', 2650.00, 'james.harris@gmail.com', 'NI12353', 'DL12353', '2021-12-12', '2031-12-12', 'USA', 9, 9),
('Olivia', 'Martin', 2750.00, 'olivia.martin@gmail.com', 'NI12354', 'DL12354', '2018-05-18', '2028-05-18', 'Canada', 10, 10),
('Noah', 'Garcia', 2500.00, 'noah.garcia@gmail.com', 'NI12355', 'DL12355', '2020-07-22', '2030-07-22', 'UK', 11, 11),
('Ethan', 'Thompson', 2450.00, 'ethan.thompson@gmail.com', 'NI12356', 'DL12356', '2017-10-15', '2027-10-15', 'Australia', 12, 12),
('Ava', 'Robinson', 2850.00, 'ava.robinson@gmail.com', 'NI12357', 'DL12357', '2023-04-01', '2033-04-01', 'USA', 13, 13),
('Liam', 'Jackson', 2600.00, 'liam.jackson@gmail.com', 'NI12358', 'DL12358', '2019-09-09', '2029-09-09', 'Canada', 14, 14),
('Isabella', 'Moore', 2950.00, 'isabella.moore@gmail.com', 'NI12359', 'DL12359', '2021-02-14', '2031-02-14', 'UK', 15, 15);


-- Motorbike table
CREATE TABLE Motorbike (
    RegistrationNumber VARCHAR(20) PRIMARY KEY,
    Color VARCHAR(20) NOT NULL,
    PurchaseDate DATE NOT NULL,
    EngineSize VARCHAR(20) NOT NULL,
    DriverID INT NOT NULL,
    FOREIGN KEY (DriverID) REFERENCES Driver(DriverID)
);

INSERT INTO Motorbike (RegistrationNumber, Color, PurchaseDate, EngineSize, DriverID)
VALUES 
('REG12345', 'Red', '2020-01-15', '150cc', 1),
('REG12346', 'Blue', '2019-05-10', '200cc', 2),
('REG12347', 'Black', '2021-03-20', '250cc', 3),
('REG12348', 'Green', '2018-07-25', '300cc', 4),
('REG12349', 'Yellow', '2020-09-12', '150cc', 5),
('REG12350', 'White', '2019-11-05', '200cc', 6),
('REG12351', 'Gray', '2021-02-18', '250cc', 7),
('REG12352', 'Orange', '2020-04-22', '300cc', 8),
('REG12353', 'Purple', '2018-12-31', '150cc', 9),
('REG12354', 'Blue', '2019-06-15', '200cc', 10),
('REG12355', 'Red', '2021-01-05', '250cc', 11),
('REG12356', 'Green', '2020-08-30', '300cc', 12),
('REG12357', 'Black', '2018-03-10', '150cc', 13),
('REG12358', 'White', '2019-10-25', '200cc', 14),
('REG12359', 'Yellow', '2021-05-15', '250cc', 15);


-- Category table
CREATE TABLE Category (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL
);

INSERT INTO Category (CategoryName)
VALUES 
('Burgers'), ('Pizzas'), ('Sandwiches'), ('Desserts'), ('Beverages'),
('Salads'), ('Breakfast'), ('Seafood'), ('Vegetarian'), ('Grill'),
('Pasta'), ('Soups'), ('Rice'), ('Snacks'), ('Sides');


-- Item table
CREATE TABLE Item (
    ItemID INT AUTO_INCREMENT PRIMARY KEY,
    ItemName VARCHAR(100) NOT NULL,
    CategoryID INT NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

INSERT INTO Item (ItemName, CategoryID)
VALUES
('Cheeseburger', 1),
('Pepperoni Pizza', 1),
('Caesar Salad', 2),
('Chicken Wings', 1),
('Veggie Wrap', 2),
('Grilled Salmon', 3),
('Beef Steak', 3),
('Spaghetti Bolognese', 1),
('Garlic Bread', 1),
('Tacos', 4),
('Sushi Roll', 4),
('Fried Rice', 5),
('Spring Rolls', 5),
('Chocolate Cake', 6),
('Apple Pie', 6);


-- Price table
CREATE TABLE Price (
    PriceID INT AUTO_INCREMENT PRIMARY KEY,
    ItemID INT NOT NULL,
    RestaurantID INT NOT NULL,
    ItemPrice DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ItemID) REFERENCES Item(ItemID),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurant(RestaurantID)
);

INSERT INTO Price (ItemID, RestaurantID, ItemPrice)
VALUES
(1, 1, 5.99),  -- Cheeseburger
(2, 1, 12.99), -- Pepperoni Pizza
(3, 2, 7.99),  -- Caesar Salad
(4, 1, 8.99),  -- Chicken Wings
(5, 2, 6.49),  -- Veggie Wrap
(6, 3, 14.99), -- Grilled Salmon
(7, 3, 18.99), -- Beef Steak
(8, 1, 11.99), -- Spaghetti Bolognese
(9, 1, 2.99),  -- Garlic Bread
(10, 4, 3.99), -- Tacos
(11, 4, 9.99), -- Sushi Roll
(12, 5, 7.49), -- Fried Rice
(13, 5, 5.99), -- Spring Rolls
(14, 6, 4.99), -- Chocolate Cake
(15, 6, 3.49); -- Apple Pie


-- Order table
CREATE TABLE `Orders` (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    OrderDate DATE NOT NULL,
    CustomerID INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

INSERT INTO `Orders` (OrderDate, CustomerID)
VALUES
('2024-01-15', 1),
('2024-02-10', 2),
('2024-03-05', 3),
('2024-04-18', 4),
('2024-05-20', 5),
('2024-06-25', 6),
('2024-07-15', 7),
('2024-08-10', 8),
('2024-09-12', 9),
('2024-10-05', 10),
('2024-11-01', 11),
('2024-12-10', 12),
('2024-01-01', 13),
('2024-02-18', 14),
('2024-03-22', 15);


-- Order_Details table
CREATE TABLE Order_Details (
    OrderDetailsID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    ItemID INT NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES `Orders`(OrderID),
    FOREIGN KEY (ItemID) REFERENCES Item(ItemID)
);

INSERT INTO Order_Details (OrderID, ItemID, Quantity)
VALUES
(1, 1, 2),   -- Order 1, Cheeseburger, Quantity 2
(2, 2, 1),   -- Order 2, Pepperoni Pizza, Quantity 1
(3, 3, 3),   -- Order 3, Caesar Salad, Quantity 3
(4, 4, 5),   -- Order 4, Chicken Wings, Quantity 5
(5, 5, 4),   -- Order 5, Veggie Wrap, Quantity 4
(6, 6, 2),   -- Order 6, Grilled Salmon, Quantity 2
(7, 7, 1),   -- Order 7, Beef Steak, Quantity 1
(8, 8, 3),   -- Order 8, Spaghetti Bolognese, Quantity 3
(9, 9, 2),   -- Order 9, Garlic Bread, Quantity 2
(10, 10, 6),  -- Order 10, Tacos, Quantity 6
(11, 11, 4),  -- Order 11, Sushi Roll, Quantity 4
(12, 12, 1),  -- Order 12, Fried Rice, Quantity 1
(13, 13, 3),  -- Order 13, Spring Rolls, Quantity 3
(14, 14, 2),  -- Order 14, Chocolate Cake, Quantity 2
(15, 15, 5);  -- Order 15, Apple Pie, Quantity 5

select * from customer;
select * from category;
select * from driver;
select * from item;
select * from manager;
select * from motorbike;
select * from order_details;
select * from orders;
select * from price;
select * from restaurant;





