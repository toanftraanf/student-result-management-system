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
import model.Classes;

/**
 *
 * @author trant
 */
public class ClassesDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;
    List<Classes> list = new ArrayList<>();

    public List<Classes> getClasses(int teacherId, int courseId) {
        String sql = "select * from classes where id in (select t.classId\n"
                + "from teaching t join courses c \n"
                + "on t.courseId = c.id \n"
                + "where teacherId = ? and courseId = ?)";
        try {

            stm = connection.prepareStatement(sql);
            stm.setInt(1, teacherId);
            stm.setInt(2, courseId);
            rs = stm.executeQuery();
            while (rs.next()) {
                Classes em = new Classes(rs.getInt("id"), rs.getString("name"));
                list.add(em);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
