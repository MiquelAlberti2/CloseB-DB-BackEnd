-- This file is to bootstrap a database for the CS3200 project. 

-- Create a new database.  You can change the name later.  You'll
-- need this name in the FLASK API file(s),  the AppSmith 
-- data source creation.
CREATE DATABASE closeb;

-- Via the Docker Compose file, a special user called webapp will 
-- be created in MySQL. We are going to grant that user 
-- all privilages to the new database we just created. 
-- TODO: If you changed the name of the database above, you need 
-- to change it here too.
GRANT all privileges ON closeb.* TO 'webapp'@'%';
flush privileges;

-- Move into the database we just created.
-- TODO: If you changed the name of the database above, you need to
-- change it here too. 
USE closeb;


SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `closeb_schema` ;
CREATE SCHEMA IF NOT EXISTS `closeb_schema` DEFAULT CHARACTER SET latin1 ;
USE `closeb_schema` ;

-- Create the Customers table
CREATE TABLE IF NOT EXISTS closeb_schema.Customers (
  CustomerID INT PRIMARY KEY AUTO_INCREMENT,
  First VARCHAR(50) NOT NULL,
  Last VARCHAR(50) NOT NULL,
  City VARCHAR(100),
  ZIP VARCHAR(10),
  State VARCHAR(50),
  Street VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS closeb_schema.Brands (
    BrandID INT AUTO_INCREMENT,
    Name VARCHAR(50),
    Email VARCHAR(50),
    City VARCHAR(50),
    ZIP VARCHAR(50) NOT NULL,
    State VARCHAR(50),
    Street VARCHAR(50),
    PRIMARY KEY (BrandID)
);

CREATE TABLE IF NOT EXISTS closeb_schema.Categories (
    Title VARCHAR(50),
    Description VARCHAR(50),
    PRIMARY KEY (Title)
);

CREATE TABLE IF NOT EXISTS closeb_schema.Products (
    Name VARCHAR(50),
    Description VARCHAR(50),
    ProductID INT AUTO_INCREMENT,
    Price INT,
    BrandID INT,
    Category_Title VARCHAR(50),
    PRIMARY KEY (ProductID),
    -- If Brand is updated/deleted, update/delete Product
    -- If Category is updated/deleted, update/delete Product
    CONSTRAINT fk_1 FOREIGN KEY (BrandID) REFERENCES Brands(BrandID)
      ON UPDATE CASCADE
      ON DELETE CASCADE,
    CONSTRAINT fk_2 FOREIGN KEY (Category_Title) REFERENCES Categories(Title)
      ON UPDATE CASCADE
      ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS closeb_schema.Variants (
    ProductID INT,
    color VARCHAR(50),
    size VARCHAR(50),
    stock INT,
    PRIMARY KEY (ProductID, color, size),
    -- If Products is updated/deleted, update/delete the variants connected to the productID
    CONSTRAINT fk_3 FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
      ON UPDATE CASCADE
      ON DELETE CASCADE
);



CREATE TABLE IF NOT EXISTS closeb_schema.Carriers (
  CarrierID INT AUTO_INCREMENT,
  Phone VARCHAR(20) NOT NULL,
  Email VARCHAR(50) NOT NULL,
  PRIMARY KEY (CarrierID)
);

CREATE TABLE IF NOT EXISTS closeb_schema.Carrier_rates (
  CarrierID INT NOT NULL,
  ZIP VARCHAR(10) NOT NULL,
  Price DECIMAL NOT NULL,
  PRIMARY KEY (ZIP, CarrierID),
  -- Carrier rates updated/deleted when carrier is
  CONSTRAINT fk_4 FOREIGN KEY (CarrierID) REFERENCES Carriers(CarrierID)
      ON UPDATE CASCADE
      ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS closeb_schema.Orders (
  OrderID INT AUTO_INCREMENT,
  Date DATETIME DEFAULT CURRENT_TIMESTAMP,
  Price DECIMAL,
  CustomerID INT,
  isReturn BOOLEAN, -- foreign key for OrderID cannot reference two tables
  PRIMARY KEY (OrderID),

  -- Orders updates if Customer is updated
  -- If Customer is deleted, all of its orders are deleted
  CONSTRAINT fk_5 FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
      ON UPDATE CASCADE
      ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS closeb_schema.OrderDetails (
  OrderID INT,
  ProductID INT,
  Quantity INT,
  PRIMARY KEY (OrderID, ProductID),
  -- If Orders is updated, Order Details is Updated
  -- If Order is deleted, Order Details is Deleted
  CONSTRAINT fk_6 FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
      ON UPDATE CASCADE
      ON DELETE CASCADE,
  -- If Product is updated, Order Details is Updated
  -- If Product is deleted, Order Details is Deleted
  CONSTRAINT fk_7 FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
      ON UPDATE CASCADE
      ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS closeb_schema.Shipments (
  ShipmentID INT AUTO_INCREMENT ,
  ShippingCost DECIMAL,
  CarrierID INT,
  OrderID INT,

  PRIMARY KEY (ShipmentID),

  -- Shipment updates if Order is updated
  -- Can't delete order if a shipment exists for it
  CONSTRAINT fk_8 FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
      ON UPDATE CASCADE
      ON DELETE RESTRICT,
  -- Shipment updates if carrier id is updated
  -- Can't delete carrier if a shipment exists that they're carrying
  CONSTRAINT fk_9 FOREIGN KEY (CarrierID) REFERENCES Carriers(CarrierID)
      ON UPDATE CASCADE
      ON DELETE RESTRICT
);




-- Create the Wish_lists table
CREATE TABLE IF NOT EXISTS Wish_lists (
  WishID INT AUTO_INCREMENT,
  Name VARCHAR(100) NOT NULL,
  CustomerID INT,
  PRIMARY KEY(WishID),
  -- If Customer is updated, update its wish list
  -- If Customer is deleted, delete its wish list
  CONSTRAINT fk_10 FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
      ON UPDATE CASCADE
      ON DELETE CASCADE
);


-- Create the Wish_item table
CREATE TABLE IF NOT EXISTS Wish_item (
  WishID INT,
  ProductID INT,
  PRIMARY KEY (WishID, ProductID),

  -- If WishList is updated/deleted, update/delete Wish_item
  -- If ProductID is updated/deleted, update/delete Wish_item
  CONSTRAINT fk_11 FOREIGN KEY (WishID) REFERENCES Wish_lists(WishID)
      ON UPDATE CASCADE
      ON DELETE CASCADE,
  CONSTRAINT fk_12 FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
      ON UPDATE CASCADE
      ON DELETE CASCADE
);

-- Create the Social_Media table
CREATE TABLE IF NOT EXISTS Social_Media (
  Handle VARCHAR(50) PRIMARY KEY,
  BrandID INT,

  -- If Brand is updated/deleted, update/delete its Social Media
  CONSTRAINT fk_13 FOREIGN KEY (BrandID) REFERENCES Brands(BrandID)
      ON UPDATE CASCADE
      ON DELETE CASCADE
);

-- Create the Review_made table
CREATE TABLE IF NOT EXISTS Review_made (
  CustomerID INT,
  ProductID INT,
  n_stars INT,
  Comment VARCHAR(500),
  PRIMARY KEY (CustomerID, ProductID),
  -- If Customer is updated/deleted, update/delete review_made
  -- If Product is updated/deleted, update/delete review_made
  CONSTRAINT fk_14 FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
      ON UPDATE CASCADE
      ON DELETE CASCADE,
  CONSTRAINT fk_15 FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
      ON UPDATE CASCADE
      ON DELETE CASCADE
);



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
