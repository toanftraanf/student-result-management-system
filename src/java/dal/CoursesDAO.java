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
import model.Teaching;

/**
 *
 * @author trant
 */
public class CoursesDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;

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
        List<Courses> list = new ArrayList<>();
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

    public List<Courses> getAllCourses() {
        List<Courses> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "  FROM [dbo].[courses]";
        try {
            stm = connection.prepareStatement(sql);
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

    public void deleteCourse(int courseId) {
        String sql = "DELETE FROM [dbo].[courses]\n"
                + "      WHERE [id] = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, courseId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CoursesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addCourse(String rollId, String courseName) {
        String sql = "INSERT INTO [dbo].[courses]\n"
                + "           ([rollId], [name])\n"
                + "     VALUES\n"
                + "           (?, ?)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, rollId);
            stm.setString(2, courseName);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CoursesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateCouse(String rollId, String name, int id) {
        String sql = "UPDATE [dbo].[courses]\n"
                + "   SET [rollId] = ?\n"
                + "      ,[name] = ?\n"
                + " WHERE [id] = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, rollId);
            stm.setString(2, name);
            stm.setInt(3, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CoursesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        CoursesDAO c = new CoursesDAO();
        TeachingDAO t = new TeachingDAO();
//        List<Courses> list = c.getAllCourses();
//
//        for (Courses o : list) {
//            System.out.println(o);
//        }
        c.addCourse("WED201", "Web Design");
    }
}
