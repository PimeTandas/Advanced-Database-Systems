-- A place for collating any notes I may have on SQL, as part of Advanced Database Systems

/* 
SQL Stands for structured qurey languauge. And is used to manage qurey and manipulate databases.
SQL Allows you to:

- Execute Querys agenst a database.
- Retreve data from a database.
- Insert records into a database.
- Update records in a database.
- Delete records from a database.
- Create new databases.
- Create new tables in a database.
- Create views in a database.
- Set permisions.
??- Create stored procedures.???

While SQL is a standard there are different versions of the laungage. But all should support the
main commands.

A database is a collection of one or more tables. Each table in a databse is identifyable by a name.
Which contain rows (records) of data.
*/

-- SELECT is the most basic SQL command, the following selects everything the 'Customer' table.
SELECT * FROM Customer;

-- Some of the most important SQL comands are listed bellow:
SELECT -- Extracts data from the database. 
UPDATE -- Updates the data in the database.
DELETE -- Deletes the data in a database.
INSERT INTO -- Inserts new data into a database.
CREATE DATABASE -- Allows us to create a new database.
ALTER DATABASE -- Modifys the database.
CREATE TABLE -- Allows us to create a new table.
ALTER TABLE -- Modifys the table.
DROP TABLE -- Deletes a table from a database.
CREATE INDEX -- Creates an index. ??(A search key)??
DROP INDEX -- Deletes an index.

/*
The SELECT statement.

As mentioned before this gets us data from a database. The data returned to us is stored in a
resulting table called the; result-set.

The select sytax is as followed.

SELECT (column1, column2...)
FROM (table_name);

In this example column1 and column2 represent the fields (columns) that you wish to select from 
the table. If you wish to select all fields from the data then you can simpliy use.

SELECT *
FROM (table_name);

A real working example would be:

SELECT city, income
FROM employee;
*/

/*
The SELECT DISTINCT statement.

As the name suggests this allows us to return only distinct values. Inside a table columns often 
contain lots of the same values. This allows us to only return one of each!

The syntax is as follwed:

SELECT DISTINCT *
FROM (table_name);

It basicly removes duplicates if your not bothered about the quantity of each result.
*/