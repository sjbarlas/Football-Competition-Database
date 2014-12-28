/* 
Student Name: Saira J. Barlas
Student Number: C12809080
Case Study: Football Competition
*/

/*
Inner Equijoin
- Columns with the same name from the tables can be joined to display one column in a table (Club_ID from Club and Team) 
*/
SELECT Club.ClubHouse, Team.Address, Team.Club_ID
FROM Club, Team
WHERE Club.Club_ID=Team.Club_ID;

/*
Left Outer Join
- Returns all the rows from the left table (Club), even if there are no matches in he right table (Team)
- If there are no matches, it will return a NULL value for each
*/
SELECT Club.ClubManagerName, Team.Club_ID
FROM Club
LEFT JOIN Team
ON Club.Club_ID=Team.Club_ID
ORDER BY Club.ClubManagerName;
 
/*
Right Outer Join
- Similar to Left Outer Join but rows from the right will be returned
*/
SELECT Team.Age, Club.Club_ID
FROM Team
RIGHT JOIN Club
ON Team.Club_ID=Club.Club_ID
ORDER BY Team.Age;

/* 
Natural Join
- Occurs implicitly by comparing all the same named columns in both tables (Club_ID in both tables)
*/
SELECT *FROM Club NATURAL JOIN Team;

/*
Non Equijoin
- Displaying the Age of Players (Team) that are under 12 and what ClubHouse (Match) they belong to and under what Manager (Match)
- This join uses comparison operator(s) and not equals (=)
*/
SELECT e.Age, j.ClubHouse, j.ClubManagerName
FROM Team e, Club j
WHERE e.Age <= 12;
