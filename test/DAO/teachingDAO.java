/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import dal.TeachingDAO;
import java.util.List;
import model.Teaching;

/**
 *
 * @author trant
 */
public class teachingDAO {
    public static void main(String[] args) {
        TeachingDAO d = new TeachingDAO();
        List<Teaching> list = d.getAllTeaching();
        for(Teaching o:list) {
            System.out.println(o);
        }
    }
}
