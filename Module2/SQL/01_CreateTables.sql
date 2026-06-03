CREATE TABLE Clients
(
    ClientID INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100),
    Phone NVARCHAR(20)
);
CREATE TABLE Employees
(
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    Position NVARCHAR(50) NOT NULL
);
CREATE TABLE Products
(
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    Article NVARCHAR(50) NOT NULL UNIQUE,
    ProductName NVARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Category NVARCHAR(50) NOT NULL
);
CREATE TABLE Orders
(
    OrderID INT IDENTITY(1,1) PRIMARY KEY,

    ClientID INT NOT NULL,
    EmployeeID INT NOT NULL,

    OrderDate DATE NOT NULL,

    Status NVARCHAR(30) NOT NULL,

    CONSTRAINT FK_Orders_Clients
        FOREIGN KEY (ClientID)
        REFERENCES Clients(ClientID),

    CONSTRAINT FK_Orders_Employees
        FOREIGN KEY (EmployeeID)
        REFERENCES Employees(EmployeeID)
);
CREATE TABLE OrderItems
(
    OrderItemID INT IDENTITY(1,1) PRIMARY KEY,

    OrderID INT NOT NULL,
    ProductID INT NOT NULL,

    Quantity INT NOT NULL CHECK (Quantity > 0),

    CONSTRAINT FK_OrderItems_Orders
        FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID)
        ON DELETE CASCADE,

    CONSTRAINT FK_OrderItems_Products
        FOREIGN KEY (ProductID)
        REFERENCES Products(ProductID)
);
CREATE TABLE Order_Log
(
    LogID INT IDENTITY(1,1) PRIMARY KEY,

    OrderID INT,

    OldStatus NVARCHAR(30),

    NewStatus NVARCHAR(30),

    ChangeDate DATETIME DEFAULT GETDATE(),

    UserName NVARCHAR(100)
);
GO
CREATE UNIQUE INDEX IX_OneActiveOrderPerClient
ON Orders(ClientID)
WHERE Status <> 'Completed';
GO