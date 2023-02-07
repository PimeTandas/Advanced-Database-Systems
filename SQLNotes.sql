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

/*
WHERE statement.

The WHERE clause is used to filter records/ results. It is used to extract records that meet 
certain conditions.

WHERE clauses sytax are as followed:

SELECT (column1, column2) 
FROM (table_name)
WHERE (condition);

Example to return customers from Mexico:

SELECT *
FROM customers
WHERE country = 'Mexico';

The following operators are allowed to be used in a WHERE clause:
-- [ = ]                Equal
-- [ > ]                Greater than
-- [ >= ]               Grater than or equal to 
-- [ < ]                Less than
-- [ <= ]               Less than or equal to 
-- [ <> ] or [ != ]     Not equal to      
-- [ BETWEEN ]          Between certain ranges
-- [ LIKE ]             Check for a pattern
-- [ IN ]               To specify and check for multiple possible values in a column

The WHERE clause can be combined with multiple other WHERE clauses, using the the AND, NOT or OR 
opperators.

As with most programing languages the AND operator displays records which meet both WHERE clauses,
(is true for both).

And the OR operator displays records if any of the WHERE statments run true.

Finally the NOT operator checks and returns records which are NOT true based off the WHERE clause.

Some example syntaxes:

    WHERE condition1 AND condition2 AND condition3;
        WHERE country = 'Germany' AND city = 'Berlin';

    WHERE condition1 OR condition2 OR condition3;
        WHERE country = 'UK' or salary > 20,000;

    WHERE NOT condition;
        WHERE NOT country = 'Germany';

Perenthisis can be used to combine and make more complex statements/ expressions.
*/

/*
ORDER BY Keyword.
The ORDER BY keyword is used to sort the result-set into ascending or desending order. By deault
ascending. To change this to decending use the aditional DESC keyword. Typically this ORDER BY
keyword is wrote after the WHERE clause if there is one. See bellow:

    SELECT *
    FROM customers
    SORT BY country;

    OR

    SELECT *
    FROM customers
    SORT BY country DESC; 

Ordering by several different columns, The following orders by country first, but if multiple records
have the same country, then they are further ordered by customer name:

    SELECT *
    FROM customers
    ORDER BY country, customerName;

Can even add a cheeky little DESC or ASC:

    SELECT *
    FROM customers
    ORDER BY DESC country, ASC customerName;
*/

/* 
SQL INSERT INTO statement.

This is used to insert new records into a table in a database.
There are two possible ways to write an insert statement.

1. FIRST METHOD:
    Specify the column names and data to be inserted.

    INSERT INTO customers (name, age, gender ...)
    VALUES (value1, value2, value3...);

2. SECOND METHOD:
    The second works if you are adding values to all columns in the table. Meaning you do not need
    to specify the columns in the INSERT part of theh statement.

    INSERT INTO customers
    VALUES (value1, value2, value3...);
*/

/*
Null values is just a field with no value. If the table permits it and the value of the attrabute
is optional then it is possible to insert a new record or update an existing one without adding a value
to this all its fields. The field will then be saved with a null value in any spaces where a value
was ommited.

It is possible to test for null values in a WHERE clause using the IS NULL or IS NOT NULL operators.
*/

/* 
UPDATE Statement.

An update statment as it sounds is used to update preesiting records in a database.

The statments syntax is:

    UPDATE (table_name)
    SET column1 = value1, column2 = value2, column3 = value3
    WHERE (condition);

Here the WHERE clause is used to specify which records to UPDATE/ change. Dont be a supid idiot and 
omit the WHERE clause or EVERY SINGLE RECORD WILL BE UPDATED IN THE TABLE!!!!!!

    UPDATE Customers
    SET ContactName='Juan'
    WHERE Country='Mexico';
*/

/*
DELETE Statement.

As the name suggests these are used to delete existing records from a table.

    DELETE FROM (table_name)
    WHERE (condition);

Similar to UPDATE, the DELETE statement needs a WHERE clause else every single record in the table
will be deleted... and that would be pretty shit.

    DELETE FROM Customers 
    WHERE CustomerName = 'Alfreds Futterkiste';

The following statement deletes all rows in the customers table without actually deleting the table.

    DELETE FROM customers;
*/

/*
The SELECT TOP, LIMIT, FETCH FIRST and ROWNUM clauses Allows us to specify the number of records to return. The SELECT TOP clause is useful when we have lots of data records, as returning to much can massivly effect performance. Not all versions of SQL support all 
of these statements. Now lets look at each of them:

- SELECT TOP:

    SELECT TOP (50 | 10%) (column)
    FROM customers
    WHERE (condition);

    SELECT TOP 3 
    FROM customers;

    SELECT TOP 3 PERCENT
    FROM cutomers;

- LIMIT:

    SELECT (column)
    FROM customers
    WHERE (condition)
    LIMIT number;

    SELECT *
    FROM customers
    LIMIT 3;

- FETCH:

    SELECT (column)
    FROM customers
    WHERE (condition)
    FETCH FIRST number ROWS ONLY;

    SELECT * 
    FROM customers
    FETCH FIRST 3 ROWS ONLY;

    SELECT * 
    FROM customers
    FETCH FIRST 3 PERCENT ROWS ONLY;
*/

/*
The MIN() and MAX() functions.

As the name suggests MIN() returns the minium value in a given column.
While MAX() returns the largest value in a column.

- MIN()

    SELECT MIN(column)
    FROM customers
    WHERE condition;

    SELECT MIN(price)
    FROM products
    WHERE madein = 'China';

- MAX()

    SELECT MAX(column)
    FROM customers
    WHERE condition    
*/

/*
COUNT(), AVG() and SUM() Functions.

The COUNT() function returns the amount of records that meet a criteria. For example:

    SELECT COUNT(name)
    FROM customer
    WHERE spend > 10000;

The AVG() function returns an average value from a numerical column. For exmaple:

    SELECT AVG(price)
    FROM products
    WHERE madein = 'UK';

SUM() Function returns the sum of everything returned from a numerical column. For example:

    SECLECT SUM(price)
    FROM products;
*/

/*
The LIKE operator is used to look for specific patterns in a specific column.

There are two wildcards that can be used in conjunction with the LIKE operator.

- The Percentage Sign (%), represents zero, one or multiple characters.

- The Underscore Sign (_),  represents one single character.

The LIKE syntax: 

    SELECT column1, column2
    FROM customers
    WHERE columnN LIKE pattern;

Here are some examples of LIKE operations using wild cards:

- WHERE CustomerName LIKE 'a%';
    Finds any value in a column that starts with 'a'.

- WHERE CustomerName LIKE '%a';
    Finds any value in a column that ends with 'a'.

- WHERE CustomerName LIKE '%or%';
    Finds column values that contain 'or' in any position.

-
*/