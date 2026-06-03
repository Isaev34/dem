CREATE TRIGGER trg_OrderStatusUpdate
ON Orders
AFTER UPDATE
AS
BEGIN

    INSERT INTO Order_Log
    (
        OrderID,
        OldStatus,
        NewStatus,
        ChangeDate,
        UserName
    )
    SELECT
        d.OrderID,
        d.Status,
        i.Status,
        GETDATE(),
        SYSTEM_USER
    FROM deleted d
    JOIN inserted i
        ON d.OrderID = i.OrderID
    WHERE d.Status <> i.Status;

END;
GO
# Проверка триггера
UPDATE Orders
SET Status = 'Completed'
WHERE OrderID = 2;

SELECT * FROM Order_Log;