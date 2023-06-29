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
    TeachersDAO tdao = new TeachersDAO();
    CoursesDAO cdao = new CoursesDAO();
    ClassesDAO classDao = new ClassesDAO();

    public List<Teaching> getAllTeaching() {
        String sql = "SELECT * FROM teaching";
        try {

            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Teaching em = new Teaching(rs.getInt(1),
                         tdao.getTeacherById(rs.getInt(2)),
                         cdao.getCourseById(rs.getInt(3)),
                         classDao.getClassById(rs.getInt(4)));
                list.add(em);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TeachingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Teaching> getTeachingByCourseAndTeacher(int cid, int tid) {
        String sql = "SELECT * FROM teaching WHERE courseId = ? AND teacherId = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            stm.setInt(2, tid);
            rs = stm.executeQuery();
            while (rs.next()) {
                Teaching em = new Teaching(rs.getInt(1),
                         tdao.getTeacherById(rs.getInt(2)),
                         cdao.getCourseById(rs.getInt(3)),
                         classDao.getClassById(rs.getInt(4)));
                list.add(em);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TeachingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
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

    public int getTeachingIdByCourseAndStudent(int courseId, int studentId) {
        String sql = "SELECT [id]\n"
                + "  FROM [dbo].[teaching]\n"
                + "  WHERE [courseId] = ?\n"
                + "  AND [classId] = (SELECT [classId] FROM students WHERE id = ?)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, courseId);
            stm.setInt(2, studentId);
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

    public static void main(String[] args) {
        TeachingDAO d = new TeachingDAO();
        System.out.println(d.getTeachingIdByCourseAndStudent(1, 1));
    }
}
