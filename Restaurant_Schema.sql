DROP TABLE ORDERS CASCADE CONSTRAINTS;
DROP TABLE CUSTOMER CASCADE CONSTRAINTS;
DROP TABLE RESTAURANT CASCADE CONSTRAINTS;
DROP TABLE EMPLOYEES CASCADE CONSTRAINTS;
DROP SEQUENCE seqOID;
DROP SEQUENCE seqCID;
DROP SEQUENCE seqRID;
DROP SEQUENCE seqEID;
CREATE TABLE EMPLOYEES(
  Lname  Char(50)  NOT NULL,
  Fname  Char(50)  NOT NULL,
  PhoneNum  Char(12)  NOT NULL,
  HoursWorked  Int  NOT NULL,
  EmployeeID  Int  NOT NULL,
  CONSTRAINT  EMPLOYEES_PK  PRIMARY KEY(EmployeeID)
  );
CREATE SEQUENCE seqEID INCREMENT BY 1 START WITH 1;
CREATE TABLE CUSTOMER(
  Lname  Char(50)  NOT NULL,
  Fname  Char(50)  NOT NULL,
  PhoneNum  Char(12)  NOT NULL,
  CustomerID  Int  NOT NULL,
  CONSTRAINT  Customer_PK  PRIMARY KEY(CustomerID)
  );
CREATE SEQUENCE seqCID INCREMENT BY 1 START WITH 1;
CREATE TABLE RESTAURANT(
  SuperID  Int  NOT NULL,
  PhoneNum  Char(12)  NOT NULL,
  Location  VarChar(100)  NOT NULL,
  RestaurantID  Int  NOT NULL,
  CONSTRAINT  RESTAURANT_PK  PRIMARY KEY(RestaurantID),
  CONSTRAINT RESTAURANT_FK  FOREIGN KEY(SuperID) REFERENCES EMPLOYEES(EmployeeID)
  );
CREATE SEQUENCE seqRID INCREMENT BY 1 START WITH 1;
CREATE TABLE ORDERS(
  OrderId  Int  NOT NULL,
  Price  Number(6,2)  NOT NULL,
  Times  VarChar(50) NOT NULL,
  Order_Type  Char(50)  NOT NULL,
  EmployeeID  Int  NOT NULL,
  Dates  Date NOT NULL,
  Table_num  Int CHECK(Table_num > 0 AND Table_num < 11) NULL,
  CustomerID  Int  NOT NULL,
  RestaurantID  Int  NOT NULL,
  CONSTRAINT ORDERS_PK  PRIMARY KEY(OrderID),
  CONSTRAINT ORDERS_FK  FOREIGN KEY(CustomerID) REFERENCES CUSTOMER(CustomerID),
  CONSTRAINT ORDERSRESTAURANT_FK  FOREIGN KEY(RestaurantID) REFERENCES RESTAURANT(RestaurantID)
  CONSTRAINT ORDERSEMPLOYEE  FOREIGN KEY(EmployeeID) REFERENCES EMPLOYEES(EmployeeID)
  );
