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
    FOREIGN KEY(bIN) References to tb_account(bID)
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
    FOREIGN KEY(bIN) References to tb_account(bID),
    FOREIGN KEY(supervisorID) References to tb_employee(supervisorID)
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
