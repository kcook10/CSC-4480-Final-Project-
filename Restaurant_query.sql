/*List the people who work in the Seattle Restaurant and order their hours in descending order */
SELECT DISTINCT E.Fname, E.Lname, E.HoursWorked, R.Location
FROM EMPLOYEES E, RESTAURANT R, ORDERS O
WHERE E.EmployeeID = O.EmployeeID
AND R.RestaurantID = O.RestaurantID
AND R.LOCATION = 'Seattle'
ORDER BY E.HoursWorked Desc;

/* Add an Order */ 
INSERT INTO ORDERS (OrderID, Price, Times, Order_Type, EmployeeID, Dates, Table_num, CustomerID, RestaurantID)
VALUES (9193, 17.00, '3:53', 'Here', 98845244, '25-OCT-23', 2, 67103745, 83113856);

/* Add an Order with Repeated Data*/ 
INSERT INTO ORDERS (OrderID, Price, Times, Order_Type, EmployeeID, Dates, Table_num, CustomerID, RestaurantID)
VALUES (9193, 17.00, '3:53', 'Here', 98845244, '25-OCT-23', 2, 67103745, 83113856);

/*List customers whose first name starts with A*/
SELECT Fname, Lname
FROM CUSTOMER
WHERE Fname LIKE 'A%';

/* List the employees who work on To Go orders*/
SELECT DISTINCT E.Fname,E.Lname,O.Order_Type, O.EmployeeID
FROM EMPLOYEES E, ORDERS O
WHERE E.EmployeeID = O.EmployeeID
AND O.Order_Type = 'To Go'
ORDER BY Lname;

/*List the first and last names of all customers who ordered to the Orlando or Boston Restaurant*/
SELECT DISTINCT C.Fname, C.Lname
FROM CUSTOMER C
WHERE C.CustomerID IN
    (SELECT O.CustomerID
    FROM ORDERS O
    JOIN RESTAURANT R ON O.RestaurantID = R.RestaurantID
    WHERE R.Location = 'Orlando')
    OR C.CustomerID IN
    (SELECT O.CustomerID
    FROM ORDERS O
    JOIN RESTAURANT R ON O.RestaurantID = R.RestaurantID
    WHERE R.Location = 'Boston');
/* List Employees who work on orders that cost more than $20*/

SELECT DISTINCT E.Fname, E.Lname, O.Price
FROM ORDERS O JOIN EMPLOYEES E
ON E.EMPLOYEEID = O.EMPLOYEEID
WHERE O.Price > 20.00
Order by E.Lname;

/*Insert a table number out of the constraint*/
INSERT INTO ORDERS (OrderID, Price, Times, Order_Type, EmployeeID, Dates, Table_num, CustomerID, RestaurantID)
VALUES (4952, 11.00, '2:33', 'Here', 13810408, '27-OCT-23', 23, 58245964, 33028090);
