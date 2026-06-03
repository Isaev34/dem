CREATE PROCEDURE sp_CheckClient
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        c.ClientID,
        c.FullName,

        CASE
            WHEN c.Email IS NOT NULL
                 AND EXISTS
                 (
                     SELECT 1
                     FROM Orders o
                     WHERE o.ClientID = c.ClientID
                       AND o.Status = 'Completed'
                 )
            THEN 1
            ELSE 0
        END AS StatusResult

    FROM Clients c;
END;
GO
# Проверка процедуры
EXEC sp_CheckClient;