-- drop database command
DROP TABLE university;

-- create database 
CREATE DATABASE university;

-- use database
USE university;

-- create table departments1
CREATE TABLE departments1(
DeptID CHAR(4) PRIMARY KEY,
DeptName VARCHAR(50) NOT NULL unique );

-- create table designations1
CREATE TABLE Designations1(
DesigID CHAR(5) PRIMARY KEY,
DesigName VARCHAR(80) NOT NULL UNIQUE );

-- create table employee01
CREATE TABLE employee01(
Empid CHAR(4) PRIMARY KEY,
name VARCHAR(100) NOT NULL,
DOB DATE NOT NULL,
Mobile CHAR(10),
Email VARCHAR(100),
DeptID CHAR(4),
DesigID CHAR(5),
FOREIGN KEY (DeptID) REFERENCES departments1 (DeptID),       -- use foreign key in employee01 table references to departments table
foreign key (DesigID) references designations1 (DesigID),    -- use foreign key in employee01 table references to designations1 table
Basic FLOAT NOT NULL );

-- show table
DESC departments1;
DESC designations1;
DESC employee01;

-- insert records into departments1 table
INSERT INTO departments1 VALUES( 'D111','Sales');
INSERT INTO departments1 VALUES( 'D113','Marketing');
INSERT INTO departments1 VALUES( 'D112','IT');
SELECT* FROM departments1 ORDER BY DeptID;

-- insert records into desigfnation table
INSERT INTO designations1 VALUES( 'DG102','Manager');
INSERT INTO designations1 VALUES( 'DG103','Executive');
INSERT INTO designations1 VALUES('DG101','Developer');
SELECT*FROM designations1 ORDER BY DesigID;

-- insert records into employee01 table
INSERT INTO employee01 VALUES('E001','Myra','2000-01-04','6677889900','myra@gmail.com','D112','DG101',80000);
INSERT INTO employee01 VALUES('E002','Gavin','2001-06-27','9988223301','gavin@gmail.com','D111','DG103',25000);
INSERT INTO employee01 VALUES('E003','jason','1999-06-20','8097896456','jason@gmail.com','D113','DG102',50000);

-- view all records from all columns
SELECT*FROM employee01;
-- view records from specified columns
SELECT Empid, name, email, Basic FROM employee01;
-- view spwcified records from specified columns (Empid='E002')
SELECT * FROM employee01 WHERE Empid='E002';
-- view specified records from specified column (other than Empid='E002)'
  -- Solution 1
SELECT *FROM employee01 WHERE NOT Empid='E002';
   -- solution 2
SELECT* FROM employee01 WHERE Empid<>'E002';
   -- solution 3 (In some versions only)
SELECT * FROM employee01 WHERE Empid != 'E002';

-- to update records 
 -- solution 1
UPDATE employee01 
SET basic=84000 
WHERE Empid='E001';
SELECT*FROM employee01;

 -- solution 2
UPDATE employee01 
SET Basic= Basic*1.2;
 -- solution 3
SELECT Empid, name AS Name, Email, Basic, 0.3*Basic AS TAX FROM employee01;
-- example... 
UPDATE employee01
SET Basic= 53000
WHERE Empid='E002';
SELECT*FROM employee01;

-- select all those records where Basic is greater than 50000 
SELECT * FROM employee01 WHERE Basic >= 50000;

-- fetch records from all 3 tables to see employee name and designation name
  -- solution 1
SELECT e.Empid AS EmployeeID, e.name AS EmpName, e.Basic, d1.DeptName, dg1.DesigName
FROM employee01 e, departments1 d1, designations1 dg1
WHERE e.DeptID=d1.DeptID AND e.DesigID=dg1.DesigID;

  -- solution 2
SELECT e1.Empid AS Employee_ID, e1.name AS Employee_Name, e1.Basic, d2.DeptName AS Department_Name, dg2.DesigName AS Designation_Name
FROM employee01 e1
JOIN departments1 d2 ON e1.DeptID=d2.DeptID
JOIN designations1 dg2 ON e1.DesigID=dg2.DesigID;

-- ctreating and using virtual tables
 -- create a query to show DA as 95% of Basic, HRA AS 65% of Basic, PF as 12% of Basic
SELECT Empid AS EmployeeID, name AS Name, Basic, 0.95*Basic AS DA, 0.65*Basic AS HRA, 0.12*Basic AS PF 
FROM employee01; 

