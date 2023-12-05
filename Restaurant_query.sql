/*List the people who work in the Seattle Restaurant and order their hours in descending order */
SELECT DISTINCT E.Fname, E.Lname, E.HoursWorked, R.Location
FROM EMPLOYEES E, RESTAURANT R
WHERE R.LOCATION = 'Seattle'
ORDER BY E.HoursWorked Desc;

/*List customers whose first name starts with A*/
SELECT Fname, Lname
FROM CUSTOMER
WHERE Fname LIKE 'A%';
