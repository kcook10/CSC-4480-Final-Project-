/*List the people who work in the Seattle Restaurant and order their hours in descending order */
SELECT DISTINCT E.Fname, E.Lname, E.HoursWorked, R.Location
FROM EMPLOYEES E, RESTAURANT R
WHERE R.LOCATION = 'Seattle'
ORDER BY E.HoursWorked Desc;

/*List customers whose first name starts with A*/
SELECT Fname, Lname
FROM CUSTOMER
WHERE Fname LIKE 'A%';

/*List the first and last names of all customers who ordered to the Orlando or Boston restaurant*/
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
