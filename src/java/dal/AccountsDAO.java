/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Accounts;

/**
 *
 * @author trant
 */
public class AccountsDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;
    List<Accounts> list = new ArrayList<>();

    public boolean checkLogin(String username, String password) {
        String sql = "SELECT COUNT(*)\n"
                + "  FROM [dbo].[accounts]\n"
                + "  WHERE [username] = ? and [password] = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            rs = stm.executeQuery();
            while (rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    //get role of account, if valid returns role number, otherwise returns -1
    public int getRole(String username) {
        String sql = "SELECT role FROM accounts WHERE username = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt("role");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public int getTeacherId(String username) {
        String sql = "SELECT teacherId FROM accounts WHERE username = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt("teacherId");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public Accounts getAccounts(String username, String password) {
        String sql = "SELECT * FROM accounts WHERE username = ? AND password = ?";
        TeachersDAO tdao = new TeachersDAO();
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Accounts(rs.getInt("id"), rs.getString("username"), rs.getString("password"), rs.getInt("role"), tdao.getTeacherById(rs.getInt("teacherId")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
