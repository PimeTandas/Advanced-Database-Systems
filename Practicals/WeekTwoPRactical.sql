-- Part One: Read this.
-- https://docs.oracle.com/en/database/oracle/oracle-database/21/adobj/basic-components-of-oracle-objects.html#GUID-E2DD59A0-3FFC-4AC2-9A1B-4E457275BE0B

/*
Exercise One:
*/
--Create a Names Type

    CREATE TYPE tp_name AS OBJECT(
    firstName VARCHAR2(25),
    surName VARCHAR2(25));
    /
-- Create a Address type
    CREATE TYPE tp_address AS OBJECT(
    street VARCHAR2(40),
    city VARCHAR2(40),
    postCode VARCHAR2(8));
    /
-- Create a people type
    CREATE TYPE tp_peopleType AS OBJECT(
    pname tp_name,
    paddress tp_address,
    dateOfBirth DATE);
    /
-- Create a table of peoples
    CREATE TABLE tp_peopleTable OF tp_peopleType;

/*
Exercise Two:
*/
-- Insert 5 tuples into the peopleTable
    Insert into tp_peopleTable values (tp_Name('John', 'Smith'), tp_Address('10 Newington','Edinburgh', 'EH10 5DT'), '21-Feb-95');
    Insert into tp_peopleTable values (tp_Name('Patrick', 'Simon'), tp_Address('12 Leith', 'Edinburgh', 'EH1 5TT'), '21-Feb-95');
    Insert into tp_peopleTable values (tp_Name('Paul', 'Neville'), tp_Address('102 Morningside', 'Edinburgh', 'EH5 8HG'), '21-Feb-95');
    Insert into tp_peopleTable values (tp_Name('Sarah', 'Terry'), tp_Address('18 Liberton', 'Edinburgh', 'EH2 7EQ'), '21-Feb-95');
    Insert into tp_peopleTable values (tp_Name('Erin', 'King'), tp_Address('56 Stockbrige', 'Edinburgh', 'EH7 8WE'), '21-Feb-95');

/*
Exercise Three:
*/
-- Find the SurName and Street of 'John Smith'
    SELECT p.pname.surName, p.address.street 
    FROM tp_peopleTable p 
    WHERE p.pname.firstName = 'John' AND p.pname.surName = 'Smith';

/*
Exercise Four:
*/
--Try a bunch of different SELECT statements on the peopleTable
    SELECT *
    FROM TP_PEOPLETABLE;

    SELECT p.pname.firstName,  p.pname.surName
    FROM tp_peopleTable p;

    SELECT p.name.surName 
    FROM tp_peopleTable p;

    SELECT p.pname.surName 
    FROM tp_peopleTable p 
    WHERE p.pname.firstName = 'John';

/*
Exercise Five:
*/
-- Create an object type "address" that contains street name, number, flat number, city, postal code, and country in a manner so that street name, number and flat number are closely related and country is separate from all the other attributes. 
    CREATE TYPE tp_flat_address AS OBJECT(
        streetName  VARCHAR(20)
        streetNumber VARCHAR(3)
        flatNumber VARCHAR2(2));
    /
    CREATE TYPE tp_partialAddress AS OBJECT(
        fAddress tp_flat_address
        city VARCHAR2(20)
        postCode varchar(10));
    /
    CREATE TYPE tp_address AS OBJECT(
        partaddress tp_partialAddress
        country varchar2(20));

/*
Exercise Six:
*/
-- Create a type "person" which contains first name, middle initial, last name, phone (business, home, mobile) and address (from exercise 5). Make sure that first name, middle initial, last name are closely related and that the phone numbers are closely related to each other.
    CREATE TYPE tp_personNames AS OBJECT(
        firstName VARCHAR2(20),
        middleName VARCHAR2(20),
        lastName VARCHAR2(20));
    /
    CREATE TYPE tp_personNumbers AS OBJECT(
        businessNum VARCHAR2(20), 
        homeNum VARCHAR2(20),
        mobileMum VARCHAR2(20));
    /
    CREATE TYPE tp_person AS OBJECT(
        pnames tp_personNames,
        paddress tp_address,
        pnumbers tp_personNumbers);

/*
Exercise Seven:
*/
-- Create a 'person' table that corresponds to the 'person' type.
    CREATE TABLE tp_personTable OF tp_person;

/* 
Exercise Eight:
*/
-- Insert five rows of data into the 'person' table.
    INSERT INTO tp_personTable VALUES(tp_personNames('Patrick', 'Is', 'Cool'), tp_Address(tp_partialAddress(tp_flat_address('Cool Grove', '2', '14'), 'Melrose', 'TD6 BXY'), 'Scotland'), tp_personNumbers('07747588696', '0131556918', '07799922335'));
    INSERT INTO tp_personTable VALUES(tp_personNames('Cat', NULL, 'Nelson'), tp_Address(tp_partialAddress(tp_flat_address('Dalkith High Street', '2', '56'), 'Dalkith', 'EH6 24R'), 'Scotland'), tp_personNumbers('07747588696', '0131556918', '07799922335'));
    INSERT INTO tp_personTable VALUES(tp_personNames('Steven', NULL, 'Foo'), tp_Address(tp_partialAddress(tp_flat_address('Gatonside Something', '420', '69'), 'Gatonside', 'TD9 4XR'), 'Scotland'), tp_personNumbers('07747588696', '0131556918', '07799922335'));
    INSERT INTO tp_personTable VALUES(tp_personNames('Roo', 'James', 'McVean'), tp_Address(tp_partialAddress(tp_flat_address('High Cross Av', '1', '59'), 'Melrose', 'TD6 9BQ'), 'Afgan'), tp_personNumbers('07747588696', '0131556918', '07799922335'));
    INSERT INTO tp_personTable VALUES(tp_personNames('James', 'Dead', 'Doe'), tp_Address(tp_partialAddress(tp_flat_address('Grave Yard', '6', '66'), 'Melrose', '666 999'), 'North Korea'), tp_personNumbers('07747588696', '0131556918', '07799922335'));

/*
Exercise Nine:
*/
-- Alter type “person” created in practical I by adding an attribute “gender”.
    ALTER TYPE tp_Person ADD attribute (gender VARCHAR2(8)) cascade;

/*
Exercise Ten:
*/
-- Create a type "employee" under "person" that has an additional attribute "emp_ID" of type INT. Create it as NOT FINAL. 
    CREATE TYPE tp_employee UNDER tp_person(
        emp_ID INT)
        NOT FINAL;

/*
Exercise Eleven:
*/
-- Create a corresponding employee_table and insert 3 rows into it. 
    CREATE TABLE tp_employeeTable OF tp_employee;

    INSERT INTO tp_employeeTable VALUES(tp_personNames('Mark', 'James', 'Stevens'), tp_Address(tp_partialAddress(tp_flat_address('Cool Grove', '2', '14'), 'Melrose', 'TD5 BXY'), 'Scotland'), tp_personNumbers('07747588696', '0131556918', '07799922335'), 'Male', 6969);
    INSERT INTO tp_employeeTable VALUES(tp_personNames('Cat', 'Phatt', 'Puss Puss'), tp_Address(tp_partialAddress(tp_flat_address('Cool Grove', '2', '14'), 'Edinurgh', 'ED6 BXY'), 'Scotland'), tp_personNumbers('07747588696', '0131556918', '07799922335'), 'Female', 0001);
    INSERT INTO tp_employeeTable VALUES(tp_personNames('Please', 'Ben', 'Dover'), tp_Address(tp_partialAddress(tp_flat_address('Cool Grove', '2', '14'), 'Glasgow', 'GW6 BXY'), 'Scotland'), tp_personNumbers('07747588696', '0131556918', '07799922335'), 'Male', 5050);

/*
Exercise Twelve:
*/
-- Create a type "job" with four columns: "jobtitle" of datatype VARCHAR(20) and "job_ID", "salary_amount" and "years_of_experience" of datataype INT.
    CREATE TYPE tp_job AS OBJECT(
        jobtitle VARCHAR2(20),
        job_ID INT,
        salary_amount INT,
        years_of_experience INT)
        NOT FINAL;


/*
Exercise Thirteen:
*/
-- Create an object table "job_table" for this type. Insert 5 rows into this table
    CREATE TABLE job_table OF tp_job;

    INSERT INTO job_table VALUES('Developer', 01, 100000, 4);
    INSERT INTO job_table VALUES('Cleaner', 02, 100000, 5);
    INSERT INTO job_table VALUES('Designer', 03, 50000, 1);

/*
Exercise Fourteen:
*/
-- Alter both the employee_table and the job_table so that they have primary keys. 
    ALTER TABLE tp_employeeTable
        ADD (CONSTRAINT empID PRIMARY KEY(emp_ID));

    ALTER TABLE job_table
        ADD (CONSTRAINT jobID PRIMARY KEY(job_ID));