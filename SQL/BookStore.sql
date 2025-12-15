CREATE DATABASE BookStore
USE BookStore

CREATE TABLE Category (
	id INT IDENTITY(1, 1) PRIMARY KEY,
	name nvarchar(150)
)

CREATE TABLE Product (
	id int IDENTITY(1, 1) PRIMARY KEY,
	name NVARCHAR(150) NOT NULL,
	image NVARCHAR(MAX),
	quantity INT NOT NULL,
	price FLOAT NOT NULL,
	description NVARCHAR(MAX),
	categoryId int,
	CONSTRAINT FK_CATEGORY FOREIGN KEY (categoryId) REFERENCES Category(id)
)

INSERT INTO Category (name) VALUES
(N'Bags'),
(N'Backpacks'),
(N'Accessories');



INSERT INTO Product (name, image, quantity, price, description, categoryId) VALUES
-- Bags
(N'Joust Duffle Bag',        '1.jpg', 100, 60.00, NULL, 6),
(N'Compete Track Tote',     '19.jpg', 100, 32.00, NULL, 6),
(N'Impulse Duffle',         '11.jpg', 80,  74.00, NULL, 6),
(N'Wayfarer Messenger Bag', '9.jpg',  90,  35.00, NULL, 6),
(N'Rival Messenger',        '8.jpg',  90,  35.00, NULL, 6),

-- Backpacks
(N'Driven Backpack',        '18.jpg', 120, 34.00, NULL, 7),
(N'Fusion Backpack',        '10.jpg', 110, 59.00, NULL, 7),
(N'Strive Shoulder Pack',   '7.jpg',  95,  30.00, NULL, 7),

-- Accessories
(N'Chaz Kangeroo Hoodie',   '3.jpg',  70,  52.00, NULL, 8),
(N'Set of Sprite Yoga Straps','5.jpg', 150, 34.00, NULL,8),
(N'Crown Summit',           '3.jpg',  60,  36.00, NULL, 8);


SELECT [id]
      ,[name]
      ,[image]
      ,[quantity]
      ,[price]
      ,[description]
      ,[categoryId]
  FROM [dbo].[Product]



