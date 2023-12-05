/*List the people who work in the Seattle Restaurant and order their hours in descending order */
SELECT DISTINCT E.Fname, E.Lname, E.HoursWorked, R.Location
FROM EMPLOYEES E, RESTAURANT R
WHERE R.LOCATION = 'Seattle'
ORDER BY E.HoursWOrked Desc;
