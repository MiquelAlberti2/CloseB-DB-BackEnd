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
INSERT INTO closeb_schema.Customers(CustomerID,First,Last,City,ZIP,State,Street) VALUES (1,'Bobinette','Backson','Portsmouth',23705,'Virginia','07936 Kennedy Road');
INSERT INTO closeb_schema.Customers(CustomerID,First,Last,City,ZIP,State,Street) VALUES (2,'Lisa','Taillard','Pittsburgh',15240,'Pennsylvania','9 Oriole Crossing');
INSERT INTO closeb_schema.Customers(CustomerID,First,Last,City,ZIP,State,Street) VALUES (3,'Hilton','Schumacher','Spokane',99210,'Washington','18779 Tomscot Park');
INSERT INTO closeb_schema.Customers(CustomerID,First,Last,City,ZIP,State,Street) VALUES (4,'Marybeth','Tosney','Houston',77095,'Texas','36 Twin Pines Drive');
INSERT INTO closeb_schema.Customers(CustomerID,First,Last,City,ZIP,State,Street) VALUES (5,'Ruthe','Este','Huntsville',35815,'Alabama','834 Lyons Alley');
INSERT INTO closeb_schema.Customers(CustomerID,First,Last,City,ZIP,State,Street) VALUES (6,'Meade','Conniam','Brooklyn',11210,'New York','89838 Holmberg Lane');
INSERT INTO closeb_schema.Customers(CustomerID,First,Last,City,ZIP,State,Street) VALUES (7,'Roseanne','McLucas','Washington',20591,'District of Columbia','6 Jay Trail');
INSERT INTO closeb_schema.Customers(CustomerID,First,Last,City,ZIP,State,Street) VALUES (8,'Leoline','Doneld','Dallas',75246,'Texas','4 Messerschmidt Court');
INSERT INTO closeb_schema.Customers(CustomerID,First,Last,City,ZIP,State,Street) VALUES (9,'Bethina','Haskayne','West Palm Beach',33411,'Florida','04 Macpherson Alley');
INSERT INTO closeb_schema.Customers(CustomerID,First,Last,City,ZIP,State,Street) VALUES (10,'Meagan','Moizer','Mesquite',75185,'Texas','9 Ohio Alley');

-- Brands
INSERT INTO closeb_schema.Brands(BrandID,Name,Email,City,ZIP,State,Street) VALUES (1,'Marcia Frick','mfrick0@hexun.com','Fresno',93794,'California','5102 Packers Junction');
INSERT INTO closeb_schema.Brands(BrandID,Name,Email,City,ZIP,State,Street) VALUES (2,'Flo Schrinel','fschrinel1@purevolume.com','Portland',97286,'Oregon','2639 Onsgard Park');
INSERT INTO closeb_schema.Brands(BrandID,Name,Email,City,ZIP,State,Street) VALUES (3,'Briny Jeanenet','bjeanenet2@tamu.edu','Orlando',32868,'Florida','76 Moose Street');
INSERT INTO closeb_schema.Brands(BrandID,Name,Email,City,ZIP,State,Street) VALUES (4,'Orren Jossum','ojossum3@oracle.com','Houston',77293,'Texas','66024 Browning Point');
INSERT INTO closeb_schema.Brands(BrandID,Name,Email,City,ZIP,State,Street) VALUES (5,'Hayes Treacher','htreacher4@stanford.edu','Jackson',39216,'Mississippi','36 Blackbird Parkway');
INSERT INTO closeb_schema.Brands(BrandID,Name,Email,City,ZIP,State,Street) VALUES (6,'Keane Reavey','kreavey5@slideshare.net','Orlando',32891,'Florida','8 Barnett Drive');
INSERT INTO closeb_schema.Brands(BrandID,Name,Email,City,ZIP,State,Street) VALUES (7,'Terrye Dimitru','tdimitru6@people.com.cn','Homestead',33034,'Florida','78 Grasskamp Plaza');
INSERT INTO closeb_schema.Brands(BrandID,Name,Email,City,ZIP,State,Street) VALUES (8,'Gretta Pentycross','gpentycross7@bigcartel.com','Newark',07195,'New Jersey','28519 Magdeline Center');
INSERT INTO closeb_schema.Brands(BrandID,Name,Email,City,ZIP,State,Street) VALUES (9,'Leanor Tommei','ltommei8@google.com.hk','Inglewood',90305,'California','56895 Columbus Junction');
INSERT INTO closeb_schema.Brands(BrandID,Name,Email,City,ZIP,State,Street) VALUES (10,'Gianina Portugal','gportugal9@booking.com','Panama City',32405,'Florida','351 Parkside Drive');


-- Categories
INSERT INTO closeb_schema.Categories(Title,Description) VALUES ('Yellow','Turnip - Wax');
INSERT INTO closeb_schema.Categories(Title,Description) VALUES ('Pink','Contreau');
INSERT INTO closeb_schema.Categories(Title,Description) VALUES ('Puce','Beer - Steamwhistle');
INSERT INTO closeb_schema.Categories(Title,Description) VALUES ('Blue','Muffin - Mix - Bran And Maple 15l');
INSERT INTO closeb_schema.Categories(Title,Description) VALUES ('Blue','Longos - Cheese Tortellini');
INSERT INTO closeb_schema.Categories(Title,Description) VALUES ('Red','Pepper - Gypsy Pepper');
INSERT INTO closeb_schema.Categories(Title,Description) VALUES ('Teal','Crab - Meat Combo');
INSERT INTO closeb_schema.Categories(Title,Description) VALUES ('Crimson','French Kiss Vanilla');
INSERT INTO closeb_schema.Categories(Title,Description) VALUES ('Yellow','Banana Turning');
INSERT INTO closeb_schema.Categories(Title,Description) VALUES ('Puce','Croissants Thaw And Serve');

-- Products
INSERT INTO closeb_schema.Products(Name,Description,ProductID,Price,BrandID,Category_Title) VALUES ('Anisette - Mcguiness','object-oriented',1,50,9,'Puce');
INSERT INTO closeb_schema.Products(Name,Description,ProductID,Price,BrandID,Category_Title) VALUES ('Pike - Frozen Fillet','workforce',2,32,2,'Yellow');
INSERT INTO closeb_schema.Products(Name,Description,ProductID,Price,BrandID,Category_Title) VALUES ('Crackers - Melba Toast','background',3,97,6,'Pink');
INSERT INTO closeb_schema.Products(Name,Description,ProductID,Price,BrandID,Category_Title) VALUES ('Bagel - Sesame Seed Presliced','definition',4,91,3,'Puce');
INSERT INTO closeb_schema.Products(Name,Description,ProductID,Price,BrandID,Category_Title) VALUES ('Straw - Regular','initiative',5,88,6,'Yellow');
INSERT INTO closeb_schema.Products(Name,Description,ProductID,Price,BrandID,Category_Title) VALUES ('Beef - Short Ribs','Synchronised',6,88,5,'Puce');
INSERT INTO closeb_schema.Products(Name,Description,ProductID,Price,BrandID,Category_Title) VALUES ('Brocolinni - Gaylan, Chinese','fault-tolerant',7,14,10,'Blue');
INSERT INTO closeb_schema.Products(Name,Description,ProductID,Price,BrandID,Category_Title) VALUES ('Vinegar - Cider','modular',8,79,10,'Teal');
INSERT INTO closeb_schema.Products(Name,Description,ProductID,Price,BrandID,Category_Title) VALUES ('Lamb Shoulder Boneless Nz','conglomeration',9,80,7,'Yellow');
INSERT INTO closeb_schema.Products(Name,Description,ProductID,Price,BrandID,Category_Title) VALUES ('Mushroom - Morel Frozen','Automated',10,59,4,'Crimson');


-- Variants
INSERT INTO closeb_schema.Variants(ProductID,color,size,stock) VALUES (3,'Purple','M',82);
INSERT INTO closeb_schema.Variants(ProductID,color,size,stock) VALUES (4,'Orange','L',90);
INSERT INTO closeb_schema.Variants(ProductID,color,size,stock) VALUES (9,'Khaki','3XL',39);
INSERT INTO closeb_schema.Variants(ProductID,color,size,stock) VALUES (7,'Pink','L',66);
INSERT INTO closeb_schema.Variants(ProductID,color,size,stock) VALUES (5,'Pink','XL',18);
INSERT INTO closeb_schema.Variants(ProductID,color,size,stock) VALUES (9,'Blue','3XL',15);
INSERT INTO closeb_schema.Variants(ProductID,color,size,stock) VALUES (4,'Maroon','3XL',92);
INSERT INTO closeb_schema.Variants(ProductID,color,size,stock) VALUES (7,'Crimson','M',53);
INSERT INTO closeb_schema.Variants(ProductID,color,size,stock) VALUES (5,'Purple','L',69);
INSERT INTO closeb_schema.Variants(ProductID,color,size,stock) VALUES (9,'Puce','XS',61);

-- Carriers
INSERT INTO closeb_schema.Carriers(CarrierID,Phone,Email) VALUES (1,'471-242-4269','ballwood0@mashable.com');
INSERT INTO closeb_schema.Carriers(CarrierID,Phone,Email) VALUES (2,'617-298-3473','nwanstall1@europa.eu');
INSERT INTO closeb_schema.Carriers(CarrierID,Phone,Email) VALUES (3,'197-142-9568','mbaskeyfied2@merriam-webster.com');
INSERT INTO closeb_schema.Carriers(CarrierID,Phone,Email) VALUES (4,'484-676-4764','afynn3@newyorker.com');
INSERT INTO closeb_schema.Carriers(CarrierID,Phone,Email) VALUES (5,'828-159-1161','nwelbeck4@hao123.com');
INSERT INTO closeb_schema.Carriers(CarrierID,Phone,Email) VALUES (6,'914-696-3120','sbellie5@adobe.com');
INSERT INTO closeb_schema.Carriers(CarrierID,Phone,Email) VALUES (7,'951-406-2126','rdenidge6@wired.com');
INSERT INTO closeb_schema.Carriers(CarrierID,Phone,Email) VALUES (8,'126-729-7584','obegwell7@nyu.edu');
INSERT INTO closeb_schema.Carriers(CarrierID,Phone,Email) VALUES (9,'728-741-1806','rpegler8@nationalgeographic.com');
INSERT INTO closeb_schema.Carriers(CarrierID,Phone,Email) VALUES (10,'493-398-6933','jsmeeton9@hibu.com');


-- Carrier_rates
INSERT INTO closeb_schema.Carrier_rates(CarrierID,Location,price) VALUES (2,'4 Veith Alley',38);
INSERT INTO closeb_schema.Carrier_rates(CarrierID,Location,price) VALUES (6,'4 Derek Park',2);
INSERT INTO closeb_schema.Carrier_rates(CarrierID,Location,price) VALUES (3,'839 Wayridge Circle',39);
INSERT INTO closeb_schema.Carrier_rates(CarrierID,Location,price) VALUES (9,'6356 Dapin Way',69);
INSERT INTO closeb_schema.Carrier_rates(CarrierID,Location,price) VALUES (1,'82 Myrtle Plaza',92);
INSERT INTO closeb_schema.Carrier_rates(CarrierID,Location,price) VALUES (1,'4078 Lake View Circle',87);
INSERT INTO closeb_schema.Carrier_rates(CarrierID,Location,price) VALUES (9,'98160 Northview Court',5);
INSERT INTO closeb_schema.Carrier_rates(CarrierID,Location,price) VALUES (3,'26 Del Mar Way',53);
INSERT INTO closeb_schema.Carrier_rates(CarrierID,Location,price) VALUES (9,'00 Mesta Crossing',51);
INSERT INTO closeb_schema.Carrier_rates(CarrierID,Location,price) VALUES (4,'7346 Warner Pass',36);

-- Orders
INSERT INTO closeb_schema.Orders(OrderID,Price,CustomerID,isReturn) VALUES (1,100,1,'true');
INSERT INTO closeb_schema.Orders(OrderID,Price,CustomerID,isReturn) VALUES (2,55,6,'false');
INSERT INTO closeb_schema.Orders(OrderID,Price,CustomerID,isReturn) VALUES (3,67,5,'false');
INSERT INTO closeb_schema.Orders(OrderID,Price,CustomerID,isReturn) VALUES (4,41,10,'true');
INSERT INTO closeb_schema.Orders(OrderID,Price,CustomerID,isReturn) VALUES (5,60,7,'true');
INSERT INTO closeb_schema.Orders(OrderID,Price,CustomerID,isReturn) VALUES (6,34,5,'false');
INSERT INTO closeb_schema.Orders(OrderID,Price,CustomerID,isReturn) VALUES (7,50,8,'true');
INSERT INTO closeb_schema.Orders(OrderID,Price,CustomerID,isReturn) VALUES (8,37,7,'true');
INSERT INTO closeb_schema.Orders(OrderID,Price,CustomerID,isReturn) VALUES (9,82,4,'false');
INSERT INTO closeb_schema.Orders(OrderID,Price,CustomerID,isReturn) VALUES (10,35,5,'false');

-- OrderDetails
INSERT INTO closeb_schema.OrderDetails(OrderID,ProductID,Quantity) VALUES (3,6,8);
INSERT INTO closeb_schema.OrderDetails(OrderID,ProductID,Quantity) VALUES (4,5,1);
INSERT INTO closeb_schema.OrderDetails(OrderID,ProductID,Quantity) VALUES (4,7,5);
INSERT INTO closeb_schema.OrderDetails(OrderID,ProductID,Quantity) VALUES (6,2,9);
INSERT INTO closeb_schema.OrderDetails(OrderID,ProductID,Quantity) VALUES (4,8,1);
INSERT INTO closeb_schema.OrderDetails(OrderID,ProductID,Quantity) VALUES (4,9,8);
INSERT INTO closeb_schema.OrderDetails(OrderID,ProductID,Quantity) VALUES (6,6,7);
INSERT INTO closeb_schema.OrderDetails(OrderID,ProductID,Quantity) VALUES (1,5,5);
INSERT INTO closeb_schema.OrderDetails(OrderID,ProductID,Quantity) VALUES (3,2,8);
INSERT INTO closeb_schema.OrderDetails(OrderID,ProductID,Quantity) VALUES (8,2,4);

-- Shipments
INSERT INTO closeb_schema.Shipments(ShipmentID,ShipmentCost,CarrierID,OrderID) VALUES (1,69,10,3);
INSERT INTO closeb_schema.Shipments(ShipmentID,ShipmentCost,CarrierID,OrderID) VALUES (2,57,4,10);
INSERT INTO closeb_schema.Shipments(ShipmentID,ShipmentCost,CarrierID,OrderID) VALUES (3,60,6,3);
INSERT INTO closeb_schema.Shipments(ShipmentID,ShipmentCost,CarrierID,OrderID) VALUES (4,99,6,3);
INSERT INTO closeb_schema.Shipments(ShipmentID,ShipmentCost,CarrierID,OrderID) VALUES (5,14,5,7);
INSERT INTO closeb_schema.Shipments(ShipmentID,ShipmentCost,CarrierID,OrderID) VALUES (6,38,9,6);
INSERT INTO closeb_schema.Shipments(ShipmentID,ShipmentCost,CarrierID,OrderID) VALUES (7,17,9,10);
INSERT INTO closeb_schema.Shipments(ShipmentID,ShipmentCost,CarrierID,OrderID) VALUES (8,13,5,8);
INSERT INTO closeb_schema.Shipments(ShipmentID,ShipmentCost,CarrierID,OrderID) VALUES (9,57,5,10);
INSERT INTO closeb_schema.Shipments(ShipmentID,ShipmentCost,CarrierID,OrderID) VALUES (10,54,2,4);

-- Wish_lists
INSERT INTO Wish_lists(WishID,Name,CustomerID) VALUES (1,'Jarred Cucinotta',1);
INSERT INTO Wish_lists(WishID,Name,CustomerID) VALUES (2,'Chandra Biesty',8);
INSERT INTO Wish_lists(WishID,Name,CustomerID) VALUES (3,'Susannah Drew',8);
INSERT INTO Wish_lists(WishID,Name,CustomerID) VALUES (4,'Randy Novotna',10);
INSERT INTO Wish_lists(WishID,Name,CustomerID) VALUES (5,'Tristam Crathorne',3);
INSERT INTO Wish_lists(WishID,Name,CustomerID) VALUES (6,'Lotte Rawcliffe',7);
INSERT INTO Wish_lists(WishID,Name,CustomerID) VALUES (7,'Vassili Mellows',1);
INSERT INTO Wish_lists(WishID,Name,CustomerID) VALUES (8,'Gillian Godman',8);
INSERT INTO Wish_lists(WishID,Name,CustomerID) VALUES (9,'Vasili Eynaud',6);
INSERT INTO Wish_lists(WishID,Name,CustomerID) VALUES (10,'Leonanie Edelheid',9);

-- Wish_item
INSERT INTO Wish_item(WishID,ProductID) VALUES (1,7);
INSERT INTO Wish_item(WishID,ProductID) VALUES (3,2);
INSERT INTO Wish_item(WishID,ProductID) VALUES (9,1);
INSERT INTO Wish_item(WishID,ProductID) VALUES (9,5);
INSERT INTO Wish_item(WishID,ProductID) VALUES (4,6);
INSERT INTO Wish_item(WishID,ProductID) VALUES (9,2);
INSERT INTO Wish_item(WishID,ProductID) VALUES (2,2);
INSERT INTO Wish_item(WishID,ProductID) VALUES (1,6);
INSERT INTO Wish_item(WishID,ProductID) VALUES (5,10);
INSERT INTO Wish_item(WishID,ProductID) VALUES (6,9);

-- Social_Media
INSERT INTO Social_Media(Handle,BrandID) VALUES ('Solarbreeze',5);
INSERT INTO Social_Media(Handle,BrandID) VALUES ('Stronghold',8);
INSERT INTO Social_Media(Handle,BrandID) VALUES ('Opela',9);
INSERT INTO Social_Media(Handle,BrandID) VALUES ('Wrapsafe',4);
INSERT INTO Social_Media(Handle,BrandID) VALUES ('Aerified',1);
INSERT INTO Social_Media(Handle,BrandID) VALUES ('Lotlux',2);
INSERT INTO Social_Media(Handle,BrandID) VALUES ('Bamity',9);
INSERT INTO Social_Media(Handle,BrandID) VALUES ('Cookley',10);
INSERT INTO Social_Media(Handle,BrandID) VALUES ('Lotstring',3);
INSERT INTO Social_Media(Handle,BrandID) VALUES ('Bamity',7);

-- Review_made
INSERT INTO Review_made(CustomerID,ProductID,n_stars,Comment) VALUES (3,6,2,'implementation');
INSERT INTO Review_made(CustomerID,ProductID,n_stars,Comment) VALUES (2,3,1,'Object-based');
INSERT INTO Review_made(CustomerID,ProductID,n_stars,Comment) VALUES (6,6,5,'adapter');
INSERT INTO Review_made(CustomerID,ProductID,n_stars,Comment) VALUES (3,4,2,'context-sensitive');
INSERT INTO Review_made(CustomerID,ProductID,n_stars,Comment) VALUES (2,10,5,'intangible');
INSERT INTO Review_made(CustomerID,ProductID,n_stars,Comment) VALUES (6,5,4,'motivating');
INSERT INTO Review_made(CustomerID,ProductID,n_stars,Comment) VALUES (6,6,5,'empowering');
INSERT INTO Review_made(CustomerID,ProductID,n_stars,Comment) VALUES (8,7,4,'orchestration');
INSERT INTO Review_made(CustomerID,ProductID,n_stars,Comment) VALUES (6,7,3,'exuding');
INSERT INTO Review_made(CustomerID,ProductID,n_stars,Comment) VALUES (1,9,3,'implementation');



SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
