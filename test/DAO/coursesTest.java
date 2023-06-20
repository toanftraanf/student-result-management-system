/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import dal.CoursesDAO;
import java.util.List;
import model.Courses;

/**
 *
 * @author trant
 */
public class coursesTest {
    public static void main(String[] args) {
        CoursesDAO d = new CoursesDAO();
        List<Courses> list = d.getCoursesByTeacherId(1);
        for(Courses c: list) {
            System.out.println(c);
        }
    }
}
