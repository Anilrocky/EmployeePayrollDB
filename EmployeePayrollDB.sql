--UC1
Create Database payroll_service;
Use payroll_service;

--UC2
Create Table employee_payroll
(
Id int Primary Key identity(1,1),
Name VarChar(30),
Salary Bigint,
StartDate Date
);

--UC3
Insert into employee_payroll(Name,Salary,StartDate) values('Anil','50000','2020-04-21');
Insert into employee_payroll(Name,Salary,StartDate) values('Somu','30000','2020-06-15');
Insert into employee_payroll(Name,Salary,StartDate) values('Selena','2000','2020-09-03');
Insert into employee_payroll(Name,Salary,StartDate) values('Hemanth','70000','2020-04-13');
Insert into employee_payroll(Name,Salary,StartDate) values('Chandu','4000','2020-08-14');

--UC4
Select * From employee_payroll;

--UC5
Select * From employee_payroll where StartDate between cast('2020-04-25' as Date) and CURRENT_TIMESTAMP;

--UC6
Alter Table employee_payroll Add Gender varchar(1)
Update employee_payroll set Gender='M' where Name='Anil';
Update employee_payroll set Gender='M' where Name='Somu';
Update employee_payroll set Gender='F' where Name='Selena';
Update employee_payroll set Gender='M' where Name='Hemanth';
Update employee_payroll set Gender='F' where Name='Chandu';

--UC7
Select SUM(Salary) from employee_payroll where Gender='M' group by Gender;
Select Gender,Avg(salary) from employee_payroll group by Gender;
Select MIN(Salary) from employee_payroll where Gender='M';
Select MAX(Salary) from employee_payroll where Gender='M';
Select Count(*) from employee_payroll group by Gender;

--UC8
Alter table employee_payroll Add Phone varchar(10), Address varchar(100), Department varchar(20);

--UC9
Alter table employee_payroll Add BasicPay Bigint, Deductions Bigint, TaxablePay Bigint, IncomeTax Bigint, NetPay Bigint;

--UC10
Insert into employee_payroll(Name,Salary,StartDate,Gender,Phone,Address,Department,BasicPay,Deductions,TaxablePay,IncomeTax,NetPay) values('Terissa','1000','2020-07-15','F','9807654321','Bangalore','Sales',100,100,100,100,500);
Insert into employee_payroll(Name,Salary,StartDate,Gender,Phone,Address,Department,BasicPay,Deductions,TaxablePay,IncomeTax,NetPay) values('Terissa','1000','2020-07-15','F','9807654321','Bangalore','Marketing',100,100,100,100,500);

--UC10-Refactor
Alter Table employee_payroll drop column Department;

--UC11
Create Table Department
(
Id int primary key identity(1,1),
DeptName varchar(20),
EmployeeId int foreign key references employee_payroll(Id)
);

--UC12
Insert into Department(DeptName,EmployeeId) values('Sales',1);
Insert into Department(DeptName,EmployeeId) values('Marketing',1);