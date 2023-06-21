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
        List<Classes> list = c.getClasses(1, 1);
        for(Classes l : list) {
            System.out.println(l);
        }
    }
}
