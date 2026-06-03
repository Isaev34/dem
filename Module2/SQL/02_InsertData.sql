USE OnlineShop;
GO

INSERT INTO Clients
(FullName, Email, Phone)
VALUES
('Иванов Иван Иванович', 'ivan@mail.ru', '89001112233'),
('Петров Петр Петрович', 'petr@mail.ru', '89002223344'),
('Сидоров Сергей Сергеевич', 'sidorov@mail.ru', '89003334455');

INSERT INTO Employees
(FullName, Position)
VALUES
('Смирнов Алексей', 'Менеджер'),
('Кузнецов Андрей', 'Старший менеджер'),
('Орлов Дмитрий', 'Администратор');

INSERT INTO Products
(Article, ProductName, Price, Category)
VALUES
('A001', 'Ноутбук', 50000, 'Техника'),
('A002', 'Мышь', 1500, 'Техника'),
('A003', 'Клавиатура', 2500, 'Техника');

INSERT INTO Orders
(ClientID, EmployeeID, OrderDate, Status)
VALUES
(1,1,'20250110','Completed'),
(2,2,'20250115','Processing'),
(3,3,'20250120','Completed');

INSERT INTO OrderItems
(OrderID, ProductID, Quantity)
VALUES
(1,1,1),
(1,2,2),
(2,3,1);
GO