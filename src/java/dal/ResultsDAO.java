/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Courses;
import model.Results;
import model.Students;

/**
 *
 * @author trant
 */
public class ResultsDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;

    private void setNullableFloat(PreparedStatement stm, int index, Float value) throws SQLException {
        if (value != null) {
            stm.setFloat(index, value);
        } else {
            stm.setNull(index, Types.FLOAT);
        }
    }

    public List<Results> getResults(int courseId, int classId) {
        List<Results> list = new ArrayList<>();
        StudentsDAO sdao = new StudentsDAO();
        CoursesDAO cdao = new CoursesDAO();
        try {
            String strSelect = "SELECT [id]\n"
                    + "      ,[result1]\n"
                    + "      ,[result2]\n"
                    + "      ,[result3]\n"
                    + "      ,[result4]\n"
                    + "      ,[studentId]\n"
                    + "      ,[courseid]\n"
                    + "  FROM [dbo].[results] \n"
                    + "  where [courseid] = ? and\n"
                    + "  [studentId] in (select id from students where classId = ?)";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, courseId);
            stm.setInt(2, classId);
            rs = stm.executeQuery();
            while (rs.next()) {
                Results em = new Results();
                em.setId(rs.getInt("id"));

                Float result1 = rs.getObject("result1") != null ? rs.getFloat("result1") : null;
                em.setResult1(result1);

                Float result2 = rs.getObject("result2") != null ? rs.getFloat("result2") : null;
                em.setResult2(result2);

                Float result3 = rs.getObject("result3") != null ? rs.getFloat("result3") : null;
                em.setResult3(result3);

                Float result4 = rs.getObject("result4") != null ? rs.getFloat("result4") : null;
                em.setResult4(result4);

                Students s = sdao.getStudentById(rs.getInt("studentId"));
                em.setStudents(s);
                Courses c = cdao.getCourseById(rs.getInt("courseId"));
                em.setCourses(c);
                list.add(em);

            }
        } catch (SQLException ex) {
            Logger.getLogger(ResultsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void deleteResult(int id) {
        String sql = "UPDATE [dbo].[results]\n"
                + "   SET [result1] = null\n"
                + "      ,[result2] = null\n"
                + "      ,[result3] = null\n"
                + "      ,[result4] = null\n"
                + " WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ResultsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateResult(Float rs1, Float rs2, Float rs3, Float rs4, int id) {
        String sql = "UPDATE [dbo].[results]\n"
                + "   SET [result1] = ?\n"
                + "      ,[result2] = ?\n"
                + "      ,[result3] = ?\n"
                + "      ,[result4] = ?\n"
                + " WHERE id = ?";
        try {
            stm = connection.prepareStatement(sql);
            setNullableFloat(stm, 1, rs1);
            setNullableFloat(stm, 2, rs2);
            setNullableFloat(stm, 3, rs3);
            setNullableFloat(stm, 4, rs4);
            stm.setInt(5, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ResultsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Results> getResultsByStudentRollId(String rollId) {
        List<Results> list = new ArrayList<>();
        StudentsDAO sdao = new StudentsDAO();
        CoursesDAO cdao = new CoursesDAO();
        try {
            String strSelect = "SELECT        dbo.results.*\n"
                    + "FROM            dbo.results INNER JOIN\n"
                    + "                         dbo.students ON dbo.results.studentId = dbo.students.id\n"
                    + "WHERE dbo.students.rollId = ?";
            stm = connection.prepareStatement(strSelect);
            stm.setString(1, rollId);
            rs = stm.executeQuery();
            while (rs.next()) {
                Results em = new Results();
                em.setId(rs.getInt("id"));

                Float result1 = rs.getObject("result1") != null ? rs.getFloat("result1") : null;
                em.setResult1(result1);

                Float result2 = rs.getObject("result2") != null ? rs.getFloat("result2") : null;
                em.setResult2(result2);

                Float result3 = rs.getObject("result3") != null ? rs.getFloat("result3") : null;
                em.setResult3(result3);

                Float result4 = rs.getObject("result4") != null ? rs.getFloat("result4") : null;
                em.setResult4(result4);

                Students s = sdao.getStudentById(rs.getInt("studentId"));
                em.setStudents(s);
                Courses c = cdao.getCourseById(rs.getInt("courseId"));
                em.setCourses(c);
                list.add(em);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ResultsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

}
