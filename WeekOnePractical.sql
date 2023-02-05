/* 
1.1 Create a database and add the following tables:
[/] Branch(bID, street, street, p_code, bphone)

[/] Acount(accNum, accType, balance, bID, inRate, limitOfFreeOD, openDate)

[/]  Employee(empID, street, city, postCode, firstName, surName, empHomePhone, empMobile1
    empMobile2m, supervisorID, title, salary , niNum, bID, joinDate) 

[/]  Customer(custID, street, city, postCode, firstName, surName, custHomePhone, 
    custMobile1, custMobile2, niNum)

[/]  CustomerAccount(custID, accNum)
*/

-- Firstly bellow create the tables required:

CREATE TABLE tb_branch(
    bID INT,
    street VARCHAR(200) UNIQUE,
    city VARCHAR(200),
    psotCode VARCHAR(200),
    bPhone VARCHAR2(200) UNIQUE,
    PRIMARY KEY(bID)
);

CREATE TABLE tb_account(
    accNum INT,
    accType VARCHAR2(200),
    balance DECIMAL(18,2),
    bID INT,
    inRate DECIMAL(18,2),
    limitOfFreeOD DECIMAL(18,2),
    openDate DATE,
    PRIMARY KEY(accNum),
    FOREIGN KEY(bIN) References to tb_branch(bID)
);

CREATE TABLE tb_employee(
    empID INT,
    street VARCHAR2(200),
    city VARCHAR2(200),
    postCode VARCHAR2(10),
    firstName VARCHAR2(200),
    surName VARCHAR2(200),
    empHomePhone VARCHAR2(11),
    empMobile1 VARCHAR2(11),
    empMobile2 VARCHAR2(11),
    supervisorID INT,
    title VARCHAR2(50),
    salary DECIMAL(18,2),
    niNum VARCHAR2(10),
    bID INT,
    joinDate DATE,
    PRIMARY KEY(empID),
    FOREIGN KEY(bID) References tb_branch(bID),
    FOREIGN KEY(supervisorID) References tb_employee(empID)
);
-- Learnt something here;
-- Can have more than one foreign key and must reference to the table it is located in.

CREATE TABLE tb_customer(
    custID INT,
    street VARCHAR2(200),
    city VARCHAR2(200),
    postCode VARCHAR2(10),
    firstName VARCHAR2(200),
    surName VARCHAR2(200),
    custHomePhone VARCHAR2(11),
    custMobile1 VARCHAR2(11),
    custMobile2 VARCHAR2(11),
    niNum VARCHAR2(10),
    PRIMARY KEY(custID)
);

CREATE TABLE tb_customerAccount(
    custID INT,
    accNum INT,
    PRIMARY KEY(custID, accNum)
    FOREIGN KEY(custID) References to tb_customer(custID)
    FOREIGN KEY(accNum) References to tb_account(accNum)
);
-- Learnt something here too; 
-- Seems you can have more than one primary key and can even nest them together when they are defined.

/*
1.2 Populate the tables by inserting test data.
*/

-- Adding data into the *tb_branch table.
INSERT INTO tb_branch VALUES(1,'Ormiston Grove', 'Melrose', 'TD6 9SR', '01984700831');
INSERT INTO tb_branch VALUES(2,'Queen Street', 'Edinburgh', 'TD6 9SR', '01984700832');
INSERT INTO tb_branch VALUES(3,'High Street', 'Gala', 'TD7 QYZ', '01984700833');
INSERT INTO tb_branch VALUES(4,'Sand City', 'Bagdad', 'A11 AHK', '01984700834');
INSERT INTO tb_branch VALUES(5,'Hehe Street Name', 'Kill yourself vill', 'HE1 111', '01984700835');

-- Adding data into the *tb_account table.
INSERT INTO tb_account VALUES(1, 'Student', 2002.00, 2, 500.25, 2000.00, '11-jan-17');
INSERT INTO tb_account VALUES(2, 'Current', 1500.00, 2, 500.25, 2000.00, '11-jan-16');
INSERT INTO tb_account VALUES(3, 'Student', 200.00, 1, 500.25, 2000.00, '11-jan-18');
INSERT INTO tb_account VALUES(4, 'Youth', 4000.00, 4, 500.25, 2000.00, '11-jan-12');
INSERT INTO tb_account VALUES(5, 'Current', 22.00, 5, 500.25, 2000.00, '11-jan-13');

-- Adding data into the * table.

-- Adding data into the * table.

-- Adding data into the * table.

-- 1.2
-- Find employees whos Surname incudes 'on'.
SELECT * FROM tb_employee WHERE surName LIKE '%on%';

-- 1.3
-- Find employees whose salary is more than £2800.
SELECT * FROM tb_employee WHERE salary > 2800;

-- 1.4
-- Find employees who work at the Morningside, Edinburgh branch.

-- 1.5
-- Find employees whose supervisor is a manager.

-- 1.6 
-- Find customers who have a current account in Morningside, edinburgh branch and the balance is
-- more than £2000.

-- 1.7
-- Find employees whose salart is more than  John Smith's salary at Morningside, Edinburgh branch.

-- 1.8
-- Find customers who opened their accounts before 01/09/2018.

-- 1.9
-- Find customers who have the highest balance in current account in the bank.

-- 1.10
-- At each branch, find customers who have the highest balance.