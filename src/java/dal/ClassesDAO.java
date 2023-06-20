/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
    
//    public List<Classes> getClassesByTeachingId(int id) {
//        
//    }
}
