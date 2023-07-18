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
import model.Students;

/**
 *
 * @author trant
 */
public class StudentsDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;
    List<Students> list = new ArrayList<>();

    public int getStudentAmountByClass(int classId) {
        String sql = "SELECT COUNT(*)\n"
                + "  FROM [dbo].[students]\n"
                + "  WHERE [classId] = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, classId);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public Students getStudentById(int id) {
        ClassesDAO cdao = new ClassesDAO();
        String sql = "SELECT *\n"
                + "  FROM [dbo].[students]\n"
                + "  where [id] = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Students(rs.getInt("id"),
                         rs.getString("rollId"),
                         rs.getString("name"),
                         rs.getDate("dob"),
                         rs.getInt("sex"),
                         rs.getString("address"),
                         cdao.getClassById(rs.getInt("classId")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Students getStudentByRollId(String rollId) {
        ClassesDAO cdao = new ClassesDAO();
        String sql = "SELECT *\n"
                + "  FROM [dbo].[students]\n"
                + "  where [rollId] = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, rollId.toUpperCase());
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Students(rs.getInt("id"),
                         rs.getString("rollId"),
                         rs.getString("name"),
                         rs.getDate("dob"),
                         rs.getInt("sex"),
                         rs.getString("address"),
                         cdao.getClassById(rs.getInt("classId")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
