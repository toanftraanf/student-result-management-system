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
import model.Teaching;

/**
 *
 * @author trant
 */
public class TeachingDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;
    List<Teaching> list = new ArrayList<>();

    public int getTeachingId(int teacherId, int courseId, int classId) {
        String sql = "SELECT id FROM teaching WHERE teacherId = ? AND courseId = ? AND classId = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, teacherId);
            stm.setInt(2, courseId);
            stm.setInt(3, classId);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt("id");
            }
        } catch (SQLException ex) {
            Logger.getLogger(TeachingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public int getCourseIdByTeachingId(int id) {
        String sql = "SELECT [courseId]\n"
                + "  FROM [dbo].[teaching]\n"
                + "  WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt("courseId");
            }
        } catch (SQLException ex) {
            Logger.getLogger(TeachingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
    
    public int getClassIdByTeachingId(int id) {
        String sql = "SELECT [classId]\n"
                + "  FROM [dbo].[teaching]\n"
                + "  WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt("classId");
            }
        } catch (SQLException ex) {
            Logger.getLogger(TeachingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

}
