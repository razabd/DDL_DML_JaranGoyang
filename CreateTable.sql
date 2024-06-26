-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-06-25 18:18:09.838

-- tables
-- Table: CUSTOMER
CREATE TABLE CUSTOMER (
    CustomerID int NOT NULL,
    Name varchar(100) NOT NULL,
    Password char(8) NOT NULL,
    Address text NOT NULL,
    PhoneNumber varchar(15) NOT NULL,
    Email varchar(100) NOT NULL,
    MemberStatus boolean NOT NULL,
    Latitude decimal(9,6) NOT NULL,
    Longtitude decimal(9,6) NOT NULL,
    CONSTRAINT CUSTOMER_pk PRIMARY KEY (CustomerID)
);

-- Table: Cart
CREATE TABLE Cart (
    CartID int NOT NULL,
    CartListItem text NOT NULL,
    CartDate timestamp NOT NULL,
    TotalAmount decimal(10,2) NOT NULL,
    CUSTOMER_CustomerID int NOT NULL,
    CONSTRAINT Cart_pk PRIMARY KEY (CartID),
    CONSTRAINT Cart_CUSTOMER FOREIGN KEY (CUSTOMER_CustomerID) REFERENCES CUSTOMER (CustomerID)
);

-- Table: Cart_Menu
CREATE TABLE Cart_Menu (
    Cart_CartID int NOT NULL,
    Menu_MenuID int NOT NULL,
    CONSTRAINT Cart_Menu_pk PRIMARY KEY (Cart_CartID, Menu_MenuID),
    CONSTRAINT Cart_Menu_Cart FOREIGN KEY (Cart_CartID) REFERENCES Cart (CartID),
    CONSTRAINT Cart_Menu_Menu FOREIGN KEY (Menu_MenuID) REFERENCES Menu (MenuID)
);

-- Table: Menu
CREATE TABLE Menu (
    MenuID int NOT NULL,
    ItemName varchar(100) NOT NULL,
    Price decimal(10,2) NOT NULL,
    Category varchar(100) NOT NULL,
    Stock int NOT NULL,
    Restorant_RestorantID int NOT NULL,
    CONSTRAINT Menu_pk PRIMARY KEY (MenuID),
    CONSTRAINT Menu_Restorant FOREIGN KEY (Restorant_RestorantID) REFERENCES Restorant (RestorantID)
);

-- Table: Payment
CREATE TABLE Payment (
    PaymentID int NOT NULL,
    PaymentDate timestamp NOT NULL,
    PaymentAmount decimal(10,2) NOT NULL,
    PaymentMethod varchar(50) NOT NULL,
    PaymentStatus boolean NOT NULL,
    CUSTOMER_CustomerID int NOT NULL,
    Promotions_PromoID int NOT NULL,
    Cart_CartID int NOT NULL,
    Restorant_RestorantID int NOT NULL,
    CONSTRAINT Payment_pk PRIMARY KEY (PaymentID),
    CONSTRAINT Payment_CUSTOMER FOREIGN KEY (CUSTOMER_CustomerID) REFERENCES CUSTOMER (CustomerID),
    CONSTRAINT Payment_Promotions FOREIGN KEY (Promotions_PromoID) REFERENCES Promotions (PromoID),
    CONSTRAINT Cart_Payment FOREIGN KEY (Cart_CartID) REFERENCES Cart (CartID),
    CONSTRAINT Restorant_Payment FOREIGN KEY (Restorant_RestorantID) REFERENCES Restorant (RestorantID)
);

-- Table: Promotions
CREATE TABLE Promotions (
    PromoID int NOT NULL,
    CodePromo varchar(8) NOT NULL,
    StartDate date NOT NULL,
    EndDate date NOT NULL,
    DiscountAmount decimal(10,2) NOT NULL,
    CONSTRAINT Promotions_pk PRIMARY KEY (PromoID)
);

-- Table: Restorant
CREATE TABLE Restorant (
    RestorantID int NOT NULL,
    RestorantName varchar(100) NOT NULL,
    RestorantAddress text NOT NULL,
    Latitude decimal(9,6) NOT NULL,
    Longitude decimal(9,6) NOT NULL,
    CONSTRAINT Restorant_pk PRIMARY KEY (RestorantID)
);

-- End of file.
