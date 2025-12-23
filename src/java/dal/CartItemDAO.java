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
import model.CartItem;
import model.Product;

/**
 *
 * @author dotha
 */
public class CartItemDAO extends DBContext {

    public List<CartItem> getCartItemsByCartId(int Cartid) {
        List<CartItem> listCartItem = new ArrayList<>();
        String sql = "SELECT * FROM CartItem WHERE cartId = ?";
        try {
            statement = getConnection().prepareStatement(sql);
            statement.setInt(1, Cartid);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int productId = resultSet.getInt("productId");
                int quantity = resultSet.getInt("quantity");
                CartItem cartItem = CartItem.builder()
                        .id(id)
                        .cartId(Cartid)
                        .productId(productId)
                        .quantity(quantity)
                        .build();
                cartItem.setProduct(new ProductDAO().findById(productId));
                listCartItem.add(cartItem);
            }
            return listCartItem;
        } catch (SQLException ex) {
            Logger.getLogger(CartItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void addProducttoCart(int cartId, int productId, int quantity) {
        String sql = "INSERT INTO [dbo].[CartItem]\n"
                + "           ([cartId]\n"
                + "           ,[productId]\n"
                + "           ,[quantity])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            statement = getConnection().prepareStatement(sql);
            statement.setObject(1, cartId);
            statement.setObject(2, productId);
            statement.setObject(3, quantity);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean checkUniquekey(int cartId, int productId) {
        String sql = "SELECT * FROM CartItem WHERE cartId = ? AND productId = ?";
        try {
            statement = getConnection().prepareStatement(sql);
            statement.setObject(1, cartId);
            statement.setObject(2, productId);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public void updateCartQuantity(int cartId, int productId, int quantity) {
        String sql = "UPDATE [dbo].[CartItem]\n"
                + "   SET [quantity] = quantity + ?\n"
                + " WHERE cartId = ? and productId = ?";
        try {
            statement = getConnection().prepareStatement(sql);
            statement.setObject(1, quantity);
            statement.setObject(2, cartId);
            statement.setObject(3, productId);
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void removeProduct(int cartid, int productid) {
        String sql = "DELETE FROM [dbo].[CartItem]\n"
                + "      WHERE cartId = ? AND productId = ?";
        try {
            statement = getConnection().prepareStatement(sql);
            statement.setObject(1, cartid);
            statement.setObject(2, productid);
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
