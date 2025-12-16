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
import lombok.Builder;

/**
 *
 * @author dotha
 */
public class ProductDAO extends DBContext {

    public List<Product> findAll() throws SQLException {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[image]\n"
                + "      ,[quantity]\n"
                + "      ,[price]\n"
                + "      ,[description]\n"
                + "      ,[categoryId]\n"
                + "  FROM [dbo].[Product]";
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

    public static void main(String[] args) {
        try {
            for (Product p : new ProductDAO().findAll()) {
                System.out.println(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
