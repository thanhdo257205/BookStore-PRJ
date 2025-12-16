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

-- Bags
UPDATE Product
SET description = N'Joust Duffle Bag là túi du lịch cỡ lớn với thiết kế chắc chắn và chất liệu bền bỉ. Sản phẩm có không gian chứa rộng rãi, phù hợp cho các chuyến đi dài ngày, tập gym hoặc công tác. Quai xách và dây đeo được gia cố chắc chắn, giúp người dùng dễ dàng mang theo trong mọi hoàn cảnh.'
WHERE name = N'Joust Duffle Bag';

UPDATE Product
SET description = N'Compete Track Tote là túi tote thể thao gọn nhẹ, thiết kế đơn giản nhưng tiện dụng. Sản phẩm phù hợp để mang theo đồ tập, sách vở hoặc vật dụng cá nhân khi đi học, đi làm hay tập luyện thể thao. Chất liệu vải bền, dễ vệ sinh và sử dụng lâu dài.'
WHERE name = N'Compete Track Tote';

UPDATE Product
SET description = N'Impulse Duffle sở hữu phong cách hiện đại cùng sức chứa lớn, đáp ứng tốt nhu cầu di chuyển thường xuyên. Túi được thiết kế nhiều ngăn tiện lợi, giúp sắp xếp đồ đạc gọn gàng. Đây là lựa chọn lý tưởng cho người yêu thích sự năng động và tiện lợi.'
WHERE name = N'Impulse Duffle';

UPDATE Product
SET description = N'Wayfarer Messenger Bag là túi đeo chéo thời trang, phù hợp cho công việc và sinh hoạt hằng ngày. Thiết kế thanh lịch, dễ kết hợp trang phục, bên trong có nhiều ngăn nhỏ để đựng laptop, tài liệu và phụ kiện cá nhân.'
WHERE name = N'Wayfarer Messenger Bag';

UPDATE Product
SET description = N'Rival Messenger là túi messenger trẻ trung, năng động, phù hợp cho sinh viên và nhân viên văn phòng. Túi có thiết kế gọn gàng, dễ mang theo, đáp ứng tốt nhu cầu di chuyển hằng ngày với phong cách hiện đại.'
WHERE name = N'Rival Messenger';

-- Backpacks
UPDATE Product
SET description = N'Driven Backpack là balo đa năng với thiết kế chắc chắn, phù hợp cho học tập, làm việc và du lịch. Không gian bên trong rộng rãi, có ngăn riêng cho laptop và các vật dụng cần thiết, mang lại sự tiện lợi tối đa cho người sử dụng.'
WHERE name = N'Driven Backpack';

UPDATE Product
SET description = N'Fusion Backpack mang phong cách thời trang cao cấp, được thiết kế nhiều ngăn thông minh. Sản phẩm phù hợp cho người dùng cần mang theo laptop, sách vở và phụ kiện cá nhân một cách gọn gàng và an toàn.'
WHERE name = N'Fusion Backpack';

UPDATE Product
SET description = N'Strive Shoulder Pack là túi đeo vai nhỏ gọn, tiện lợi khi mang theo các vật dụng cá nhân như điện thoại, ví, chìa khóa. Thiết kế đơn giản, phù hợp cho các hoạt động di chuyển nhẹ nhàng hằng ngày.'
WHERE name = N'Strive Shoulder Pack';

-- Accessories
UPDATE Product
SET description = N'Chaz Kangeroo Hoodie là áo hoodie phong cách thể thao, được làm từ chất liệu mềm mại và thoáng khí. Sản phẩm giúp giữ ấm tốt, phù hợp cho thời tiết mát mẻ và các hoạt động ngoài trời.'
WHERE name = N'Chaz Kangeroo Hoodie';

UPDATE Product
SET description = N'Set of Sprite Yoga Straps là bộ dây tập yoga chất lượng cao, hỗ trợ người tập thực hiện các động tác chính xác và an toàn. Sản phẩm phù hợp cho cả người mới bắt đầu và người tập yoga chuyên nghiệp.'
WHERE name = N'Set of Sprite Yoga Straps';

UPDATE Product
SET description = N'Crown Summit là phụ kiện thời trang cao cấp với thiết kế tinh tế và hiện đại. Sản phẩm dễ dàng kết hợp với nhiều phong cách trang phục, giúp tạo điểm nhấn nổi bật cho người sử dụng.'
WHERE name = N'Crown Summit';


SELECT [id]
      ,[name]
      ,[image]
      ,[quantity]
      ,[price]
      ,[description]
      ,[categoryId]
  FROM [dbo].[Product]



select p.categoryId, c.name, sum(p.quantity) as sum_quantity from Product p
join Category c on c.id = p.categoryId
group by p.categoryId, c.name


SELECT [id]
      ,[name]
  FROM [dbo].[Category]



