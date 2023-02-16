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

-- Firstly the sql bellow creates the tables required:

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
    FOREIGN KEY(bID) References tb_branch(bID)
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
    PRIMARY KEY(custID, accNum),
    FOREIGN KEY(custID) References tb_customer(custID),
    FOREIGN KEY(accNum) References tb_account(accNum)
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
    Insert Into tb_Employee values(1,'New Street','Glasgow','DG9 3PY','Liam','Sobotko','23452345','23452345','32452354',NULL,'Manager',3000.00,'PY85759S',2,'11-jan-15');
    Insert Into tb_Employee values(2,'New Street','Glasgow','DG9 3PY','Liam','Soboton','23452345','23452345','32452354',1,'Accountant',3000.00,'PY85759S',3,'11-jan-15');
    Insert Into tb_Employee values(3,'New Street','Glasgow','DG9 3PY','Liam','Sobotko','23452345','23452345','32452354',2,'Manager',2000.00,'PY85759S',2,'11-jan-15');
    Insert Into tb_Employee values(4,'New Street','Glasgow','DG9 3PY','Liam','Sonotko','23452345','23452345','32452354',1,'Accountant',1000.00,'PY85759S',2,'11-jan-15');
    Insert Into tb_Employee values(5,'New Street','Glasgow','DG9 3PY','Liam','Sobotko','23452345','23452345','32452354',2,'Accountant',1000.00,'PY85759S',5,'11-jan-15');
    Insert Into tb_Employee values(6,'New Street','Glasgow','DG9 3PY','John','Smith','23452345','23452345','32452354',3,'Accountant',1500.00,'PY85759S',2,'11-jan-15');

-- Adding data into the * table.
    Insert Into tb_Customer values(1,'Basdgf','asdfsg','DF8 3HG','asdf','asdfg','432546','23664356','32465436','dfgsdsh');
    Insert Into tb_Customer values(2,'Basdgf','asdfsg','DF8 3HG','asdf','asdfg','432546','23664356','32465436','dfgsdsh');
    Insert Into tb_Customer values(3,'Basdgf','asdfsg','DF8 3HG','asdf','asdfg','432546','23664356','32465436','dfgsdsh');
    Insert Into tb_Customer values(4,'Basdgf','asdfsg','DF8 3HG','asdf','asdfg','432546','23664356','32465436','dfgsdsh');
    Insert Into tb_Customer values(5,'Basdgf','asdfsg','DF8 3HG','asdf','asdfg','432546','23664356','32465436','dfgsdsh');
    Insert Into tb_Customer values(6,'Basdgf','asdfsg','DF8 3HG','asdf','asdfg','432546','23664356','32465436','dfgsdsh');
    Insert Into tb_Customer values(7,'Basdgf','asdfsg','DF8 3HG','asdf','asdfg','432546','23664356','32465436','dfgsdsh');
    Insert Into tb_Customer values(8,'Basdgf','asdfsg','DF8 3HG','asdf','asdfg','432546','23664356','32465436','dfgsdsh');
    Insert Into tb_Customer values(9,'Basdgf','asdfsg','DF8 3HG','asdf','asdfg','432546','23664356','32465436','dfgsdsh');
    Insert Into tb_Customer values(10,'Basdgf','asdfsg','DF8 3HG','asdf','asdfg','432546','23664356','32465436','dfgsdsh');
    Insert Into tb_Customer values(11,'Basdgf','asdfsg','DF8 3HG','asdf','asdfg','432546','23664356','32465436','dfgsdsh');
    Insert Into tb_Customer values(12,'Basdgf','asdfsg','DF8 3HG','asdf','asdfg','432546','23664356','32465436','dfgsdsh');
    Insert Into tb_Customer values(13,'Basdgf','asdfsg','DF8 3HG','asdf','asdfg','432546','23664356','32465436','dfgsdsh');
    Insert Into tb_Customer values(14,'Basdgf','asdfsg','DF8 3HG','asdf','asdfg','432546','23664356','32465436','dfgsdsh');
    Insert Into tb_Customer values(15,'Basdgf','asdfsg','DF8 3HG','asdf','asdfg','432546','23664356','32465436','dfgsdsh');
    Insert Into tb_Customer values(16,'Basdgf','asdfsg','DF8 3HG','asdf','asdfg','432546','23664356','32465436','dfgsdsh');
    Insert Into tb_Customer values(17,'Basdgf','asdfsg','DF8 3HG','asdf','asdfg','432546','23664356','32465436','dfgsdsh');
    Insert Into tb_Customer values(18,'Basdgf','asdfsg','DF8 3HG','asdf','asdfg','432546','23664356','32465436','dfgsdsh');
    Insert Into tb_Customer values(19,'Basdgf','asdfsg','DF8 3HG','asdf','asdfg','432546','23664356','32465436','dfgsdsh');
    Insert Into tb_Customer values(20,'Basdgf','asdfsg','DF8 3HG','asdf','asdfg','432546','23664356','32465436','dfgsdsh');
    Insert Into tb_Customer values(21,'Basdgf','asdfsg','DF8 3HG','asdf','asdfg','432546','23664356','32465436','dfgsdsh');
    Insert Into tb_Customer values(22,'Basdgf','asdfsg','DF8 3HG','asdf','asdfg','432546','23664356','32465436','dfgsdsh');
    Insert Into tb_Customer values(23,'Basdgf','asdfsg','DF8 3HG','asdf','asdfg','432546','23664356','32465436','dfgsdsh');
    Insert Into tb_Customer values(24,'Basdgf','asdfsg','DF8 3HG','asdf','asdfg','432546','23664356','32465436','dfgsdsh');
    Insert Into tb_Customer values(25,'Basdgf','asdfsg','DF8 3HG','asdf','asdfg','432546','23664356','32465436','dfgsdsh');

-- Adding data into the * table.
    Insert Into tb_CustomerAccount values(1,1);
    Insert Into tb_CustomerAccount values(2,1);
    Insert Into tb_CustomerAccount values(3,1);
    Insert Into tb_CustomerAccount values(4,1);
    Insert Into tb_CustomerAccount values(5,1);
    Insert Into tb_CustomerAccount values(6,2);
    Insert Into tb_CustomerAccount values(7,2);
    Insert Into tb_CustomerAccount values(8,2);
    Insert Into tb_CustomerAccount values(9,2);
    Insert Into tb_CustomerAccount values(10,2);
    Insert Into tb_CustomerAccount values(11,3);
    Insert Into tb_CustomerAccount values(12,3);
    Insert Into tb_CustomerAccount values(13,3);
    Insert Into tb_CustomerAccount values(14,3);
    Insert Into tb_CustomerAccount values(15,3);
    Insert Into tb_CustomerAccount values(16,4);
    Insert Into tb_CustomerAccount values(17,4);
    Insert Into tb_CustomerAccount values(18,4);
    Insert Into tb_CustomerAccount values(19,4);
    Insert Into tb_CustomerAccount values(20,4);
    Insert Into tb_CustomerAccount values(21,5);
    Insert Into tb_CustomerAccount values(22,5);
    Insert Into tb_CustomerAccount values(23,5);
    Insert Into tb_CustomerAccount values(24,5);
    Insert Into tb_CustomerAccount values(25,5);

-- 1.2
-- Find employees whos Surname incudes 'on'.
    SELECT * 
    FROM tb_employee 
    WHERE surName LIKE '%on%';

-- 1.3
-- Find employees whose salary is more than £2800.
    SELECT * 
    FROM tb_employee 
    WHERE salary > 2800;

-- 1.4
-- Find employees who work at the Morningside, Edinburgh branch.
    SELECT * 
    FROM tb_employee 
    WHERE bID = (SELECT bID FROM tb_branch WHERE street = 'Morningside');

-- 1.5
-- Find employees whose supervisor is a manager.
    SELECT * 
    FROM tb_employee 
    WHERE supervisorID 
    IN (SELECT empID FROM tb_employee WHERE title = 'Manager');

-- 1.6 
-- Find customers who have a current account in Morningside, Edinburgh branch and the balance is
-- more than £2000.
    SELECT *
    FROM tb_customer c
    JOIN tb_customerAccount j ON c.custID = j.custID
    JOIN tb_account a ON j.accNum = a.accNum
    JOIN tb_branch b ON b.bID = a.bID;
    WHERE b.street = 'Morningside' AND a.balance > 2000;

-- 1.7
-- Find employees whose salary is more than John Smith's salary at Morningside, Edinburgh branch.
    SELECT *
    FROM tb_employee e 
    WHERE salary > 
        (SELECT salary 
        FROM tb_employee e
        JOIN tb_branch b ON e.bID = b.bID
        WHERE b.street = 'Morningside' AND e.firstName = 'John' AND e.surName = 'Smith');

-- 1.8
-- Find customers who opened their accounts before 01/09/2018.
    SELECT *
    FROM tb_customer c
    JOIN tb_customerAccount t ON c.custID = t.custID
    JOIN tb_account a ON t.accNum = a.accNum
    WHERE a.openDate < '01-sep-18';

-- 1.9
-- Find customer who has the highest balance in current account in the bank.
    SELECT *
    FROM tb_customer c
    JOIN tb_customerAccount t ON c.custID = t.custID
    JOIN tb_account a ON t.accNum = a.accNum
    WHERE a.accNum = 
        (SELECT accNum FROM
            (SELECT * 
            FROM tb_account
            ORDER BY balance DESC)
        WHERE accType='Current'
        FETCH FIRST 1 ROWS ONLY);

-- 1.10
-- At each branch, find customers who have the highest balance.
    SELECT *
    FROM 