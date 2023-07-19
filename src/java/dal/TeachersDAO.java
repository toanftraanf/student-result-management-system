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
import model.Teachers;

/**
 *
 * @author trant
 */
public class TeachersDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;

    public Teachers getTeacherById(int id) {
        List<Teachers> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[teachers]\n"
                + "  where [id] = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Teachers(rs.getInt("id"), rs.getString("name"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(TeachersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public List<Teachers> getAllTeachers() {
        List<Teachers> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "  FROM [dbo].[teachers]";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Teachers em = new Teachers(rs.getInt("id"), rs.getString("name"));
                list.add(em);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TeachersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public static void main(String[] args) {
        TeachersDAO t = new TeachersDAO();
        List<Teachers> list = t.getAllTeachers();
        for(Teachers o:list) {
            System.out.println(o);
        }
    }
}
