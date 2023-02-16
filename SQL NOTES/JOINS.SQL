-- SQL JOINS
/*
An SQL join clause is used to join two or more columns of data based on a related or shared column.
There are many different type of JOIN clauses:

-- INNER JOIN
    Returns values that have matching values in both tables.

-- LEFT (OUTER) JOIN.
    Returns all values from the left table and matched values from the right.

-- RIGHT (OUTER) JOIN
    Returns all values from the right table and matched values from the left.

-- FULL (OUTER) JOIN
    Returns all records when there is a match in either left or right tables.

Lets look at them one by one.
*/

-- INNER JOIN
-- The INNER JOIN keyword selects records that have matching values in both tables.

    SELECT column_name(s)
    FROM table1
    INNER JOIN table2
    ON table1.column_name = table2.column_name;

-- LEFT (OUTER) JOIN
00