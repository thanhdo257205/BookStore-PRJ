/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;
import model.Constant;

/**
 *
 * @author dotha
 */
public class ProductDAO extends DBContext {

    public List<Product> findAll(int page) throws SQLException {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[image]\n"
                + "      ,[quantity]\n"
                + "      ,[price]\n"
                + "      ,[description]\n"
                + "      ,[categoryId]\n"
                + "  FROM [dbo].[Product] ORDER BY id\n"
                + "OFFSET ? ROW\n"
                + "FETCH NEXT ? ROWS ONLY";
        statement = getConnection().prepareStatement(sql);
        statement.setInt(1, (page - 1) * Constant.NUMBER_RECORD_PER_PAGE);
        statement.setInt(2, Constant.NUMBER_RECORD_PER_PAGE);
        resultSet = statement.executeQuery();
        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String name = resultSet.getString("name");
            String image = resultSet.getString("image");
            int quantity = resultSet.getInt("quantity");
            float price = resultSet.getFloat("price");
            String des = resultSet.getString("description");
            int categoryId = resultSet.getInt("categoryId");

            Product p = Product.builder()
                    .id(id)
                    .name(name)
                    .image(image)
                    .quantity(quantity)
                    .description(des)
                    .categoryId(categoryId)
                    .price(price)
                    .build();
            list.add(p);
        }
        return list;
    }

    public List<Product> findAllNoPagination() throws SQLException {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[image]\n"
                + "      ,[quantity]\n"
                + "      ,[price]\n"
                + "      ,[description]\n"
                + "      ,[categoryId]\n"
                + "  FROM [dbo].[Product]\n";
        statement = getConnection().prepareStatement(sql);
        resultSet = statement.executeQuery();
        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String name = resultSet.getString("name");
            String image = resultSet.getString("image");
            int quantity = resultSet.getInt("quantity");
            float price = resultSet.getFloat("price");
            String des = resultSet.getString("description");
            int categoryId = resultSet.getInt("categoryId");

            Product p = Product.builder()
                    .id(id)
                    .name(name)
                    .image(image)
                    .quantity(quantity)
                    .description(des)
                    .categoryId(categoryId)
                    .price(price)
                    .build();
            list.add(p);
        }
        return list;
    }

    public Product findById(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[image]\n"
                + "      ,[quantity]\n"
                + "      ,[price]\n"
                + "      ,[description]\n"
                + "      ,[categoryId]\n"
                + "  FROM [dbo].[Product]\n"
                + "  WHERE id = ?";
        try {
            statement = getConnection().prepareStatement(sql);
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String name = resultSet.getString("name");
                String image = resultSet.getString("image");
                int quantity = resultSet.getInt("quantity");
                float price = resultSet.getFloat("price");
                String description = resultSet.getString("description");
                int categoryId = resultSet.getInt("categoryId");
                Product p = Product.builder()
                        .id(id)
                        .name(name)
                        .image(image)
                        .description(description)
                        .quantity(quantity)
                        .categoryId(categoryId)
                        .price(price)
                        .build();
                return p;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Product> findProductByName(String name) {
        List<Product> listProduct = new ArrayList<>();
        String sql = "SELECT * FROM Product\n"
                + "WHERE name LIKE ?";
        try {
            statement = getConnection().prepareStatement(sql);
            statement.setString(1, "%" + name + "%");
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String namemain = resultSet.getString("name");
                int id = resultSet.getInt("id");
                String image = resultSet.getString("image");
                int quantity = resultSet.getInt("quantity");
                float price = resultSet.getFloat("price");
                String description = resultSet.getString("description");
                int categoryId = resultSet.getInt("categoryId");
                Product p = Product.builder()
                        .id(id)
                        .name(namemain)
                        .image(image)
                        .description(description)
                        .quantity(quantity)
                        .categoryId(categoryId)
                        .price(price)
                        .build();
                listProduct.add(p);
            }
            return listProduct;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Product> findByCategory(String categoryName, int page) {
        List<Product> listProduct = new ArrayList<>();
        String sql = "SELECT * FROM Product p\n"
                + "join Category c on c.id = p.categoryId\n"
                + "WHERE C.name = ? ORDER BY p.id\n"
                + "OFFSET ? ROWS\n"
                + "FETCH NEXT ? ROWS ONLY";
        try {
            statement = getConnection().prepareStatement(sql);
            statement.setString(1, categoryName);
            statement.setInt(2, (page - 1) * Constant.NUMBER_RECORD_PER_PAGE);
            statement.setInt(3, Constant.NUMBER_RECORD_PER_PAGE);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String image = resultSet.getString("image");
                int quantity = resultSet.getInt("quantity");
                float price = resultSet.getFloat("price");
                String description = resultSet.getString("description");
                int categoryId = resultSet.getInt("categoryId");
                Product p = Product.builder()
                        .id(id)
                        .name(name)
                        .image(image)
                        .description(description)
                        .quantity(quantity)
                        .categoryId(categoryId)
                        .price(price)
                        .build();
                listProduct.add(p);
            }
            return listProduct;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int getTotalRecordByCategory(String name) {
        String sql = "SELECT COUNT(*) AS countRecord FROM Product p\n"
                + "join Category c on c.id = p.categoryId\n"
                + "WHERE C.name = ?";
        try {
            statement = getConnection().prepareStatement(sql);
            statement.setString(1, name);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt("countRecord");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 1;
    }

    public int countTotalrecord(String sql) {
        int totalRecord = 0;
        try {
            statement = getConnection().prepareStatement(sql);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                totalRecord = resultSet.getInt("CountProduct");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return totalRecord;
    }

    public static void main(String[] args) {
        try {
            for (Product p : new ProductDAO().findAll(1)) {
                System.out.println(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void insertProduct(Product p) {
        String sql = "INSERT INTO [dbo].[Product]\n"
                + "           ([name]\n"
                + "           ,[image]\n"
                + "           ,[quantity]\n"
                + "           ,[price]\n"
                + "           ,[description]\n"
                + "           ,[categoryId])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            statement = getConnection().prepareStatement(sql);
            statement.setObject(1, p.getName());
            statement.setObject(2, p.getImage());
            statement.setObject(3, p.getQuantity());
            statement.setObject(4, p.getPrice());
            statement.setObject(5, p.getDescription());
            statement.setObject(6, p.getCategoryId());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteProduct(int id) {
        String sql = "DELETE FROM [dbo].[Product]\n"
                + "      WHERE id = ?";
        try {
            statement = getConnection().prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
