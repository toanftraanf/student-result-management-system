/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import dal.StudentsDAO;

/**
 *
 * @author trant
 */
public class studentDAO {
    public static void main(String[] args) {
        StudentsDAO d = new StudentsDAO();
        System.out.println(d.getStudentByRollId("he170909"));
    }
}
