/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

/**
 *
 * @author dotha
 */
public class AccountDAO extends DBContext {

    public Account findUserByNameAndPassword(String userName, String password) {
        String sql = "SELECT [id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[email]\n"
                + "      ,[address]\n"
                + "      ,[roleid]\n"
                + "  FROM [dbo].[Account]\n"
                + "  WHERE username = ? AND password = ?";
        try {
            statement = getConnection().prepareStatement(sql);
            statement.setString(1, userName);
            statement.setString(2, password);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                int id = resultSet.getInt("id");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                int roleId = resultSet.getInt("roleid");
                Account a = new Account(id, userName, password, email, address, roleId);
                return a;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean checkUserNameExist(String userName) {
        String sql = "SELECT * FROM Account WHERE username = ?";
        try {
            statement = getConnection().prepareStatement(sql);
            statement.setString(1, userName);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public void createNewUser(String userName, String password) {
        String sql = "INSERT INTO Account(username, password) VALUES (?, ?)";
        
        try {
            statement = getConnection().prepareStatement(sql);
            statement.setString(1, userName);
            statement.setString(2, password);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
