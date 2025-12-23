/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Statement;
import java.sql.Timestamp;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Cart;
import model.CartItem;

/**
 *
 * @author dotha
 */
public class CartDAO extends DBContext {

    public Cart getCartByAccountId(int id) {
        String sql = "SELECT * FROM Cart WHERE accountId = ?";
        try {
            statement = getConnection().prepareStatement(sql);
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                int idd = resultSet.getInt("id");
                Timestamp createAt = resultSet.getTimestamp("createdAt");
                Cart cart = Cart.builder()
                        .id(idd)
                        .accountId(id)
                        .createAt(createAt)
                        .build();
                return cart;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Cart getCartById(int id) {
        String sql = "SELECT * FROM Cart WHERE id = ?";
        try {
            statement = getConnection().prepareStatement(sql);
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                int accountId = resultSet.getInt("accountId");
                Timestamp createAt = resultSet.getTimestamp("createAt");
                Cart cart = Cart.builder()
                        .id(id)
                        .accountId(accountId)
                        .createAt(createAt)
                        .build();
                return cart;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int createCart(Account account) {
        String sql = "INSERT INTO [dbo].[Cart]\n"
                + "           ([accountId])\n"
                + "     VALUES\n"
                + "           (?)";
        try {
            statement = getConnection().prepareStatement(sql,  Statement.RETURN_GENERATED_KEYS);
            statement.setObject(1, account.getId());
            statement.executeUpdate();
            resultSet = statement.getGeneratedKeys();
            if (resultSet.next()) {
                int id = resultSet.getInt(1);
                return id;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public List<CartItem> getCartByCardId(int cartid) {
        String sql = "SELECT * FROM Cart WHERE accountId = ?";
        List<CartItem> listCart = new ArrayList<>();
        try {
            statement = getConnection().prepareStatement(sql);
            statement.setInt(1, cartid);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int productId = resultSet.getInt("productId");
                int quantity = resultSet.getInt("quantity");
                CartItem cartItem = new CartItem(id, cartid, productId, quantity);
                cartItem.setProduct(new ProductDAO().findById(productId));
                listCart.add(cartItem);
            }
            return listCart;
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
