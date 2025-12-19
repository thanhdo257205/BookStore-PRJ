USE BookStore

-- SỐ BẢN GHI TRÊN 1 TRANG
-- TỔNG SỐ BẢN GHI
-- TÍNH RA TỔNG SỐ TRANG

SELECT * FROM Product
ORDER BY id
OFFSET X ROWS
FETCH NEXT Y ROWS ONLY

--X: LÀ SỐ BẢN GHI TIẾP THEO (PAGE - 1) * Y
--Y: SỐ BẢN GHI MỖI TRANG

SELECT * FROM Product


SELECT COUNT(*) AS countRecord FROM Product p join Category c on c.id = p.categoryId
WHERE C.name = 'bags'