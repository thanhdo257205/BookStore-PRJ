/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;

/**
 *
 * @author dotha
 */
public class CategoryDAO extends DBContext {

    public List<Category> findAll() {
        List<Category> list = new ArrayList<>();
        connection = getConnection();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[Category]";
        try {
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                Category category = Category.builder()
                        .id(id)
                        .name(name)
                        .build();
                list.add(category);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Map<String, Integer> findCategoryQuantity() {
        Map<String, Integer> map = new HashMap<>();
        connection = getConnection();
        String sql = "select p.categoryId, c.name, sum(p.quantity) as sum_quantity from Product p\n"
                + "join Category c on c.id = p.categoryId\n"
                + "group by p.categoryId, c.name";

        try {
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                int quantity = resultSet.getInt("sum_quantity");
                map.put(name, quantity);
            }
            return map;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void main(String[] args) {
        for (Category c : new CategoryDAO().findAll()) {
            System.out.println(c);
        }
    }

}
