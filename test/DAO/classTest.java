/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import dal.ClassesDAO;
import java.util.List;
import model.Classes;

/**
 *
 * @author trant
 */
public class classTest {
    public static void main(String[] args) {
        ClassesDAO c = new ClassesDAO();
//        List<Classes> list = c.getAllClasses();
//        for(Classes o : list) {
//            System.out.println(o);
//        }
    c.deleteClass(7);
    }
}
