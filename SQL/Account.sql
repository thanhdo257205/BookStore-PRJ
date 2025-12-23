USE BookStore

CREATE TABLE Role (
	id int identity(1, 1) primary key,
	name nvarchar(50)
)

CREATE TABLE Account (
	id INT IDENTITY(1, 1) PRIMARY KEY,
	username nvarchar(50) not null,
	password nvarchar(50) not null,
	email nvarchar(100) ,
	address nvarchar(MAX),
	roleid int,
	CONSTRAINT FK_ACCOUNT_ROLE FOREIGN KEY (roleid) REFERENCES Role(id)
)

CREATE TABLE Cart (
    id INT IDENTITY(1,1) PRIMARY KEY,
    accountId INT NOT NULL,
    createdAt DATETIME DEFAULT GETDATE(),

    CONSTRAINT FK_Cart_Account
        FOREIGN KEY (accountId) REFERENCES Account(id)
);

CREATE TABLE CartItem (
    id INT IDENTITY(1,1) PRIMARY KEY,
    cartId INT NOT NULL,
    productId INT NOT NULL,
    quantity INT NOT NULL,

    CONSTRAINT FK_CartItem_Cart
        FOREIGN KEY (cartId) REFERENCES Cart(id),

    CONSTRAINT FK_CartItem_Product
        FOREIGN KEY (productId) REFERENCES Product(id),

    CONSTRAINT UQ_Cart_Product UNIQUE (cartId, productId)
);



INSERT INTO Role (name) VALUES
(N'Admin'),
(N'Manager'),
(N'Staff'),
(N'User');

INSERT INTO Account (username, password, email, address, roleid) VALUES
-- Admin
(N'admin',     N'admin123',  N'admin@gmail.com',     N'Hà Nội',        1),

-- Manager
(N'manager01', N'man123',    N'manager01@gmail.com', N'Đà Nẵng',       2),

-- Staff
(N'staff01',   N'staff123',  N'staff01@gmail.com',   N'TP. Hồ Chí Minh',3),
(N'staff02',   N'staff123',  N'staff02@gmail.com',   N'Cần Thơ',       3),

-- User
(N'user01',    N'user123',   N'user01@gmail.com',    N'Hải Phòng',     4),
(N'user02',    N'user123',   N'user02@gmail.com',    N'Bình Dương',    4),
(N'user03',    N'user123',   N'user03@gmail.com',    N'Đồng Nai',      4);

SELECT [id]
      ,[username]
      ,[password]
      ,[email]
      ,[address]
      ,[roleid]
  FROM [dbo].[Account]
  WHERE username = ? AND password = ?

GO

SELECT * FROM Account WHERE username = 'user01'

INSERT INTO Account(username, password) VALUES (?, ?)

SELECT * FROM Cart WHERE accountId = ?

SELECT * FROM CartItem WHERE cartId = ?



INSERT INTO [dbo].[Cart]
           ([accountId])
     VALUES
           (?)
INSERT INTO [dbo].[CartItem]
           ([cartId]
           ,[productId]
           ,[quantity])
     VALUES
           (<cartId, int,>
           ,<productId, int,>
           ,<quantity, int,>)


select * from CartItem

insert into CartItem values (1, 12, 1)

SELECT * FROM CartItem WHERE cartId = ? AND productId = ?


UPDATE [dbo].[CartItem]
   SET [quantity] = (SELECT quantity FROM CartItem WHERE cartId = ? AND productId = ?) + ?
 WHERE cartId = ? and productId = ?

 select * from Product



DELETE FROM [dbo].[CartItem]
      WHERE cartId = ? AND productId = ?


