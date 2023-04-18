#
# Converted from MS Access 2010 closeb_schema database (closeb_schema.accdb) using
# Bullzip MS Access to MySQL Version 5.1.242. http://www.bullzip.com
#
# CHANGES MADE AFTER INITIAL CONVERSION
# * column and row names in CamelCase converted to lower_case_with_underscore
# * space and slash ("/") in table and column names replaced with _underscore_
# * id column names converted to "id"
# * foreign key column names converted to xxx_id
# * variables of type TIMESTAMP converted to DATETIME to avoid TIMESTAMP
#   range limitation (1997 - 2038 UTC), and other limitations.
# * unique and foreign key checks disabled while loading data
#
#------------------------------------------------------------------
#

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

USE `closeb_schema`;

#
# Dumping data
#

-- Customers
INSERT INTO Customers(First,Last,City,ZIP,State,Street) VALUES ('Yelena','Bridgwood','Orlando',32808,'Florida','737 Forest Run Road');
INSERT INTO Customers(First,Last,City,ZIP,State,Street) VALUES ('Bren','Giamuzzo','Tucson',85720,'Arizona','84615 Rusk Trail');
INSERT INTO Customers(First,Last,City,ZIP,State,Street) VALUES ('Randolf','Tremblot','Saint Louis',63116,'Missouri','8418 Dryden Point');

-- Brands
INSERT INTO Brands(Name,Email,City,ZIP,State,Street) VALUES ('Obediah O''Moylane','oomoylane0@go.com','Toledo',43656,'Ohio','9 Melby Court');
INSERT INTO Brands(Name,Email,City,ZIP,State,Street) VALUES ('Hermie Manns','hmanns1@sakura.ne.jp','Inglewood',90305,'California','2081 Shopko Parkway');
INSERT INTO Brands(Name,Email,City,ZIP,State,Street) VALUES ('Gabby Oosthout de Vree','goosthout2@ucsd.edu','Orlando',32835,'Florida','6 Loeprich Drive');

-- Categories
INSERT INTO Categories(Title,Description) VALUES ('Fuscia','Orange Roughy 6/8 Oz');
INSERT INTO Categories(Title,Description) VALUES ('Teal','Tomatoes - Cherry, Yellow');
INSERT INTO Categories(Title,Description) VALUES ('Aquamarine','Bread - Bagels, Plain');

-- Products
INSERT INTO Products(Name,Description,Price,BrandID,Category_Title) VALUES ('Cheese - Le Cheve Noir','circuit',47,1,'Fuscia');
INSERT INTO Products(Name,Description,Price,BrandID,Category_Title) VALUES ('Steam Pan Full Lid','benchmark',47,2,'Teal');
INSERT INTO Products(Name,Description,Price,BrandID,Category_Title) VALUES ('Flower - Leather Leaf Fern','Organic',60,3,'Aquamarine');


-- Variants
INSERT INTO Variants(ProductID,color,size,stock) VALUES (1,'Red','3XL',1);
INSERT INTO Variants(ProductID,color,size,stock) VALUES (2,'Pink','L',43);
INSERT INTO Variants(ProductID,color,size,stock) VALUES (3,'Teal','XS',34);

-- Carriers
INSERT INTO Carriers(Phone,Email) VALUES ('801-887-3263','echasmer0@si.edu');
INSERT INTO Carriers(Phone,Email) VALUES ('415-547-0169','hinnes1@noaa.gov');
INSERT INTO Carriers(Phone,Email) VALUES ('216-184-9563','glivzey2@google.com');

-- Carrier_rates
INSERT INTO Carrier_rates(CarrierID,Location,price) VALUES (1, '935 Daystar Parkway',97);
INSERT INTO Carrier_rates(CarrierID,Location,price) VALUES (2, '8 Memorial Hill',26);
INSERT INTO Carrier_rates(CarrierID,Location,price) VALUES (3, '4031 Maple Trail',49);

-- Orders
INSERT INTO Orders(Price,CustomerID,isReturn) VALUES (34,1,0);
INSERT INTO Orders(Price,CustomerID,isReturn) VALUES (90,2,1);
INSERT INTO Orders(Price,CustomerID,isReturn) VALUES (68,3,1);

-- OrderDetails
INSERT INTO OrderDetails(OrderID,ProductID,Quantity) VALUES (1,1,9);
INSERT INTO OrderDetails(OrderID,ProductID,Quantity) VALUES (2,2,8);
INSERT INTO OrderDetails(OrderID,ProductID,Quantity) VALUES (3,3,8);

-- Shipments
INSERT INTO Shipments(ShippingCost,CarrierID,OrderID) VALUES (42,1,1);
INSERT INTO Shipments(ShippingCost,CarrierID,OrderID) VALUES (70,2,2);
INSERT INTO Shipments(ShippingCost,CarrierID,OrderID) VALUES (19,3,3);

-- Wish_lists
INSERT INTO Wish_lists(Name,CustomerID) VALUES ('Jaquith',1);
INSERT INTO Wish_lists(Name,CustomerID) VALUES ('Mufi',2);
INSERT INTO Wish_lists(Name,CustomerID) VALUES ('Alexina',3);

-- Wish_item
INSERT INTO Wish_item(WishID,ProductID) VALUES (1,1);
INSERT INTO Wish_item(WishID,ProductID) VALUES (2,2);
INSERT INTO Wish_item(WishID,ProductID) VALUES (3,3);

-- Social_Media
INSERT INTO Social_Media(Handle,BrandID) VALUES ('Keylex',1);
INSERT INTO Social_Media(Handle,BrandID) VALUES ('Namfix',2);
INSERT INTO Social_Media(Handle,BrandID) VALUES ('Matsoft',3);

-- Review_made
INSERT INTO Review_made(CustomerID,ProductID,n_stars,Comment) VALUES (1,'1','2','Team-oriented');
INSERT INTO Review_made(CustomerID,ProductID,n_stars,Comment) VALUES (2,'2','1','Cloned');
INSERT INTO Review_made(CustomerID,ProductID,n_stars,Comment) VALUES (3,'3','2','artificial intelligence');


SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;