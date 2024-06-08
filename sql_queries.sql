

/* teams with points greater than 15. */
SELECT team_name, total_points
FROM IPL
WHERE total_points > 15;

/* teams with greater than 15 points */
SELECT DISTINCT team_name
FROM IPL
WHERE total_points > 15
ORDER BY team_name DESC;



/* avg of run scored. */
SELECT AVG(total_run_scored) AS average_run_scored
FROM IPL;

/* filter out team with max points. */
SELECT team_name
FROM IPL
WHERE total_points = (
    SELECT MAX(total_points)
    FROM IPL
);

/* top 5 team with highest points. */
SELECT DISTINCT team_name
FROM IPL
ORDER BY team_name DESC
LIMIT 5;

---- reading the IPL table
SELECT * FROM ipl;

---- SUM of points by Teams
SELECT 
    Team_Name,
    SUM(Total_Points) AS TotalPointsObtained
FROM 
    IPL
GROUP BY Team_Name
ORDER BY TotalPointsObtained DESC;


----- Rank based on maximum points obtained
SELECT 
    Team_Name,
    RANK() OVER (ORDER BY SUM(Total_Points) DESC) AS Rank,
	SUM(Total_Points) AS TotalPointsObtained
FROM 
    IPL
GROUP BY 
    Team_Name;

