/*List the people who work in the Seattle Restaurant and order their hours in descending order */
SELECT DISTINCT E.Fname, E.Lname, E.HoursWorked, R.Location
FROM EMPLOYEES E, RESTAURANT R
WHERE R.LOCATION = 'Seattle'
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

/*Insert a table number out of the constraint*/
INSERT INTO ORDERS (OrderID, Price, Times, Order_Type, EmployeeID, Dates, Table_num, CustomerID, RestaurantID)
VALUES (4952, 11.00, '2:33', 'Here', 13810408, '27-OCT-23', 23, 58245964, 33028090);
