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
import model.Courses;

/**
 *
 * @author trant
 */
public class CoursesDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;
    List<Courses> list = new ArrayList<>();

    public List<Courses> getCoursesByTeacherId(int id) {
        String sql = "SELECT c.*\n"
                + "  FROM [dbo].[teaching] t join [dbo].[courses] c\n"
                + "  ON  t.courseId = c.id\n"
                + "  WHERE [teacherId] = ?\n"
                + "  GROUP BY c.id, c.rollId, c.name";
        try {

            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                Courses em = new Courses(rs.getInt("id"), rs.getString("rollId"), rs.getString("name"));
                list.add(em);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
