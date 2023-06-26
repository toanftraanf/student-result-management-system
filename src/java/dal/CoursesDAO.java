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
import model.Courses;

/**
 *
 * @author trant
 */
public class CoursesDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;
    List<Courses> list = new ArrayList<>();
    
    public Courses getCourseById(int id) {
        String sql = "SELECT *\n"
                + "  FROM [dbo].[courses]\n"
                + "  where [id] = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Courses(rs.getInt("id"), rs.getString("rollId"), rs.getString("name"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CoursesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Courses> getCoursesByTeacherId(int id) {
        String sql = "SELECT DISTINCT c.*\n"
                + "  FROM [dbo].[teaching] t join [dbo].[courses] c\n"
                + "  ON  t.courseId = c.id\n"
                + "  WHERE [teacherId] = ?";
        try {

            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                Courses em = new Courses(rs.getInt("id"), rs.getString("rollId"), rs.getString("name"));
                list.add(em);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CoursesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
