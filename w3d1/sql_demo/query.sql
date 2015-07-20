--------------------------------
------       Bank       --------
--------------------------------

-- List all employees (all columns)

-- SELECT
--   *
-- FROM
--   employee

-- List only some cols of employees

-- SELECT
--   fname, lname, start_date, title
-- FROM
--   employee


-- List fname, lname of tellers

-- SELECT
--   fname, lname, title
-- FROM
--   employee
-- WHERE
--   title = 'Teller'



-- List the different jobs at the bank

-- SELECT
--    DISTINCT title
-- FROM
--   employee



-- List the employees who are Tellers or Head Tellers


-- List tellers WHERE boss is Helen Fleming

-- SELECT
--   fname, lname, superior_emp_id, title
-- FROM
--   employee
-- WHERE
--   superior_emp_id = (
--     SELECT
--       emp_id
--     FROM
--       employee
--     WHERE
--       fname = 'Helen' AND lname = 'Fleming'
--   )


-- List tellers WHERE boss is NOT Helen Felming

-- SELECT
--   (boss.fname + " " + boss.lname) AS aliased, grunt.fname, grunt.lname
-- FROM
--   employee AS grunt
-- INNER JOIN
--   employee AS boss ON (grunt.superior_emp_id = boss.emp_id AND boss.fname = 'Helen')
-- ORDER BY
--   grunt.lname




-- List employees that started work before 2006


-- List the company's first 3 employees (by time of hire)


-- Give the most recently hired head teller


-- List all employees, ORDER BY descending job title, then ascending lname


-- List the job titles WHERE there is only one such employee


-- List the job titles WHERE there are numerous such employees


-- Give the amount of money that each customer has in the bank


-- Give the total amount of deposits for each type of account


-- Give the total amount of deposits for each type of account delimited also by branch WHERE the account was opened


-- For each account type, identify the account that has the least money


-- List the account types which have fewer than 2 such accounts but more than $10,000 total in that account type


-- List each account and its owner's name


-- List tellers whose boss is Helen Fleming or Paula Roberts (subquery)


-- List each employee and his/her boss (a self JOIN)


-- List tellers whose boss is Helen Fleming or Paula Roberts (JOIN)


-- List all accounts opened by someone in the operations department


-- How many accounts were opened by employees in the operations department?


-- Were the any accounts opened by employees in the operations department?


-- List each account and the employee that opened that account


-- List each account (account_id and avail_balance) and the employee who opened that account. If an employee has not opened any accounts, list NULL for the account information.


-- List employees who have not opened any accounts



--------------------------------
------      Tasks       --------
--------------------------------

-- List the tasks of Art Rohan

-- SELECT
--   *
-- FROM
--   users
-- JOIN
--   assignments ON users.id = assignments.user_id
-- JOIN
--   tasks ON assignments.task_id = tasks.id

-- List employees who have not been assigned any tasks

-- SELECT
--   users.name
-- FROM
--   users
-- LEFT OUTER JOIN
--   assignments ON users.id = assignments.user_id
-- LEFT OUTER JOIN
--   tasks ON assignments.task_id = tasks.id
-- WHERE
--   tasks.id IS NULL


-- List employees assigned to easy tasks (1 - 2)

-- SELECT
--   *
-- FROM
--   users
-- INNER JOIN
--   assignments ON users.id = assignments.user_id
-- INNER JOIN
--   tasks ON assignments.task_id = tasks.id
-- WHERE
--   tasks.difficulty IN (
--     SELECT
--       a_column
--     FROM
--       a_table
--   )


--------------------------------
------      Sports      --------
--------------------------------

-- JOIN the leagues and team tables together

-- SELECT
--   *
-- FROM
--   leagues
-- INNER JOIN
--   teams ON teams.league_id = leagues.id

-- JOIN all the tables together

-- SELECT
--   *
-- FROM
--   leagues
-- INNER JOIN
--   teams ON teams.league_id = leagues.id
-- INNER JOIN
--   players ON players.team_id = teams.id


-- Find all the Football players (ORDER BY team name asc, name desc)

-- SELECT DISTINCT
--   teams.name, players.name
-- FROM
--   leagues
-- INNER JOIN
--   teams ON teams.league_id = leagues.id
-- INNER JOIN
--   players ON players.team_id = teams.id
-- WHERE
--   leagues.sport = 'Football'
-- ORDER BY
--   teams.name, players.name DESC

-- Count the number of football players; alias the count

-- SELECT
--   COUNT(*) AS num_football_players
-- FROM
--   leagues
-- INNER JOIN
--   teams ON teams.league_id = leagues.id
-- INNER JOIN
--   players ON players.team_id = teams.id
-- WHERE
--   leagues.sport = 'Football'


-- Find each team's rival team
-- The roundabout way:
-- SELECT
--   teams1.name, rival_teams.name
-- FROM
--   teams AS teams1
-- INNER JOIN
--   teams AS rival_teams ON rival_teams.id = teams1.rival_team_id
-- INNER JOIN
--   teams AS teams3 ON rival_teams.rival_team_id = teams3.id



-- Find the mutual rivalries

