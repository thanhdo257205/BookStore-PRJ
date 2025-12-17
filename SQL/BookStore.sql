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
  WHERE id = 1



select p.categoryId, c.name, sum(p.quantity) as sum_quantity from Product p
join Category c on c.id = p.categoryId
group by p.categoryId, c.name


SELECT [id]
      ,[name]
  FROM [dbo].[Category]

SELECT * FROM Category
SELECT * FROM Product p
join Category c on c.id = p.categoryId
WHERE C.name = 'Accessories'

SELECT * FROM Product
WHERE name LIKE 


INSERT INTO Product (name, image, quantity, price, description, categoryId) VALUES
-- Bags (categoryId = 6)
(N'Urban Travel Duffel',      '1.jpg',  85,  65.00, N'Túi du lịch phong cách đô thị, chất liệu vải dày, chống nước nhẹ.', 6),
(N'Classic Leather Tote',     '19.jpg', 70,  88.00, N'Túi tote da cổ điển, phù hợp đi làm và đi học.', 6),
(N'Sporty Gym Bag',           '11.jpg', 120, 45.00, N'Túi thể thao gọn nhẹ, nhiều ngăn tiện lợi cho tập gym.', 6),
(N'Casual Messenger Pro',     '9.jpg',  95,  42.00, N'Túi đeo chéo phong cách casual, phù hợp sinh viên.', 6),
(N'Weekend Carry Bag',        '8.jpg',  60,  55.00, N'Túi xách cuối tuần, sức chứa lớn, khóa kéo chắc chắn.', 6),
(N'Compact City Bag',         '1.jpg',  110, 38.00, N'Túi nhỏ gọn dành cho di chuyển trong thành phố.', 6),
(N'Business Shoulder Bag',    '19.jpg', 50,  92.00, N'Túi vai doanh nhân, thiết kế sang trọng, đựng laptop.', 6),
(N'Explorer Duffel',          '11.jpg', 75,  70.00, N'Túi duffel dành cho du lịch và dã ngoại.', 6),
(N'Minimal Tote Bag',         '9.jpg',  130, 29.00, N'Túi tote tối giản, nhẹ, dễ phối đồ.', 6),
(N'Street Style Bag',         '8.jpg',  90,  41.00, N'Túi phong cách đường phố, trẻ trung năng động.', 6),

-- Backpacks (categoryId = 7)
(N'Everyday Backpack',        '18.jpg', 140, 36.00, N'Balo dùng hằng ngày, nhẹ và bền.', 7),
(N'Laptop Backpack Pro',      '10.jpg', 100, 68.00, N'Balo chuyên dụng cho laptop, chống sốc tốt.', 7),
(N'Hiking Backpack',          '7.jpg',  60,  85.00, N'Balo leo núi, nhiều ngăn, phù hợp đi phượt.', 7),
(N'Student Backpack',         '18.jpg', 160, 32.00, N'Balo học sinh sinh viên, giá tốt.', 7),
(N'Travel Backpack 40L',      '10.jpg', 70,  95.00, N'Balo du lịch dung tích lớn 40L.', 7),
(N'Office Smart Backpack',    '7.jpg',  90,  72.00, N'Balo văn phòng, thiết kế hiện đại.', 7),
(N'Waterproof Backpack',      '18.jpg', 55,  88.00, N'Balo chống nước, phù hợp thời tiết mưa.', 7),
(N'Compact Laptop Pack',      '10.jpg', 110, 54.00, N'Balo laptop gọn nhẹ, dễ mang theo.', 7),
(N'Urban Rolltop Backpack',   '7.jpg',  65,  79.00, N'Balo cuộn miệng phong cách urban.', 7),
(N'Outdoor Adventure Pack',   '18.jpg', 50,  99.00, N'Balo phiêu lưu ngoài trời, chịu tải tốt.', 7),

-- Accessories (categoryId = 8)
(N'Fitness Wrist Wrap',       '3.jpg',  200, 12.00, N'Băng quấn cổ tay hỗ trợ tập gym.', 8),
(N'Yoga Stretch Belt',        '5.jpg',  180, 18.00, N'Dây tập yoga giúp kéo giãn cơ thể.', 8),
(N'Winter Sport Hoodie',      '3.jpg',  90,  58.00, N'Áo hoodie thể thao giữ ấm mùa đông.', 8),
(N'Running Cap',              '5.jpg',  150, 15.00, N'Mũ chạy bộ nhẹ, thấm hút mồ hôi.', 8),
(N'Outdoor Gloves',           '3.jpg',  120, 22.00, N'Găng tay outdoor, chống trơn trượt.', 8),
(N'Gym Water Bottle',         '5.jpg',  300, 10.00, N'Bình nước thể thao dung tích 750ml.', 8),
(N'Sport Headband',           '3.jpg',  220, 9.00,  N'Băng đô thể thao co giãn tốt.', 8),
(N'Yoga Mat Strap',           '5.jpg',  170, 14.00, N'Dây đeo thảm yoga tiện lợi.', 8),
(N'Casual Sport Socks',       '3.jpg',  250, 8.00,  N'Tất thể thao êm ái, thấm hút mồ hôi.', 8),
(N'Lightweight Gym Towel',    '5.jpg',  190, 11.00, N'Khăn tập gym nhẹ, nhanh khô.', 8);



INSERT INTO Product (name, image, quantity, price, description, categoryId) VALUES
-- ===================== Bags (6) =====================
(N'Premium Travel Duffel', '1.jpg', 70, 78.00, N'Túi du lịch cao cấp, bền bỉ, phù hợp đi xa.', 6),
(N'Lightweight Tote', '19.jpg', 140, 26.00, N'Túi tote nhẹ, tiện mang hằng ngày.', 6),
(N'Multi Pocket Messenger', '11.jpg', 95, 49.00, N'Túi đeo chéo nhiều ngăn, tiện dụng.', 6),
(N'Vintage Shoulder Bag', '9.jpg', 60, 65.00, N'Túi vai phong cách vintage.', 6),
(N'Large Capacity Bag', '8.jpg', 85, 58.00, N'Túi xách dung tích lớn cho du lịch.', 6),
(N'Urban Mini Bag', '1.jpg', 160, 24.00, N'Túi mini phong cách urban.', 6),
(N'Canvas Daily Bag', '19.jpg', 120, 34.00, N'Túi canvas dùng hằng ngày.', 6),
(N'Street Messenger X', '11.jpg', 100, 44.00, N'Túi messenger phong cách đường phố.', 6),
(N'Compact Office Bag', '9.jpg', 75, 52.00, N'Túi công sở gọn nhẹ.', 6),
(N'Weekend Tote Plus', '8.jpg', 65, 62.00, N'Túi tote dành cho cuối tuần.', 6),
(N'Business Carry Pro', '1.jpg', 55, 95.00, N'Túi xách doanh nhân cao cấp.', 6),
(N'Sport Travel Bag', '19.jpg', 130, 48.00, N'Túi thể thao du lịch tiện lợi.', 6),
(N'Daily Messenger Lite', '11.jpg', 145, 39.00, N'Túi đeo chéo nhẹ cho sinh viên.', 6),
(N'Leather Look Tote', '9.jpg', 80, 68.00, N'Túi tote giả da sang trọng.', 6),
(N'Outdoor Carry Bag', '8.jpg', 90, 55.00, N'Túi xách ngoài trời bền chắc.', 6),
(N'City Style Bag', '1.jpg', 110, 41.00, N'Túi phong cách thành thị.', 6),
(N'Flexible Shoulder Bag', '19.jpg', 100, 47.00, N'Túi vai linh hoạt nhiều ngăn.', 6),
(N'Compact Travel Tote', '11.jpg', 70, 53.00, N'Túi tote du lịch nhỏ gọn.', 6),
(N'Classic Work Bag', '9.jpg', 65, 72.00, N'Túi đi làm thiết kế cổ điển.', 6),
(N'Smart Casual Bag', '8.jpg', 125, 36.00, N'Túi casual thông minh, dễ phối đồ.', 6),

-- ===================== Backpacks (7) =====================
(N'Office Backpack Slim', '18.jpg', 150, 42.00, N'Balo văn phòng mỏng nhẹ.', 7),
(N'Anti Theft Backpack', '10.jpg', 90, 82.00, N'Balo chống trộm an toàn.', 7),
(N'Travel Backpack Pro', '7.jpg', 70, 105.00, N'Balo du lịch chuyên nghiệp.', 7),
(N'School Backpack Plus', '18.jpg', 180, 29.00, N'Balo đi học giá tốt.', 7),
(N'Laptop Pack 15.6', '10.jpg', 120, 61.00, N'Balo laptop 15.6 inch.', 7),
(N'Urban Daypack', '7.jpg', 95, 48.00, N'Balo đi phố gọn gàng.', 7),
(N'Hiking Pack Lite', '18.jpg', 60, 88.00, N'Balo leo núi nhẹ.', 7),
(N'Water Resistant Pack', '10.jpg', 85, 74.00, N'Balo chống nước hiệu quả.', 7),
(N'Minimal Backpack', '7.jpg', 140, 35.00, N'Balo tối giản cho hằng ngày.', 7),
(N'Adventure Backpack XL', '18.jpg', 50, 110.00, N'Balo phiêu lưu dung tích lớn.', 7),
(N'Student Pro Backpack', '10.jpg', 160, 37.00, N'Balo sinh viên bền bỉ.', 7),
(N'Outdoor Explorer Pack', '7.jpg', 65, 98.00, N'Balo thám hiểm ngoài trời.', 7),
(N'Laptop Travel Pack', '18.jpg', 90, 69.00, N'Balo laptop kết hợp du lịch.', 7),
(N'Rolltop City Backpack', '10.jpg', 75, 83.00, N'Balo rolltop phong cách thành thị.', 7),
(N'Smart Work Backpack', '7.jpg', 100, 76.00, N'Balo thông minh cho công việc.', 7),
(N'Ultra Light Backpack', '18.jpg', 130, 31.00, N'Balo siêu nhẹ.', 7),
(N'Professional Pack', '10.jpg', 55, 102.00, N'Balo chuyên nghiệp cao cấp.', 7),
(N'Compact Urban Pack', '7.jpg', 115, 44.00, N'Balo đô thị nhỏ gọn.', 7),
(N'Outdoor Trekking Pack', '18.jpg', 45, 120.00, N'Balo trekking chịu tải cao.', 7),
(N'Everyday Carry Pack', '10.jpg', 170, 33.00, N'Balo dùng hằng ngày.', 7),

-- ===================== Accessories (8) =====================
(N'Workout Gloves', '3.jpg', 200, 21.00, N'Găng tay tập gym bảo vệ tay.', 8),
(N'Sport Bottle Pro', '5.jpg', 260, 14.00, N'Bình nước thể thao cao cấp.', 8),
(N'Yoga Support Strap', '3.jpg', 180, 17.00, N'Dây hỗ trợ tập yoga.', 8),
(N'Fitness Cap', '5.jpg', 220, 13.00, N'Mũ tập thể thao nhẹ.', 8),
(N'Running Socks', '3.jpg', 300, 7.50, N'Tất chạy bộ êm ái.', 8),
(N'Gym Hand Towel', '5.jpg', 190, 10.50, N'Khăn tay tập gym.', 8),
(N'Sport Arm Band', '3.jpg', 210, 9.00, N'Băng tay thể thao co giãn.', 8),
(N'Yoga Mat Carry Strap', '5.jpg', 160, 15.00, N'Dây mang thảm yoga.', 8),
(N'Outdoor Neck Gaiter', '3.jpg', 140, 18.00, N'Khăn ống cổ chống nắng.', 8),
(N'Light Fitness Hoodie', '5.jpg', 95, 57.00, N'Áo hoodie thể thao nhẹ.', 8);
