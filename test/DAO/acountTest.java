/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import dal.AccountsDAO;

/**
 *
 * @author trant
 */
public class acountTest {
    public static void main(String[] args) {
        AccountsDAO a = new AccountsDAO();
        System.out.println(a.getAccountByTeacherId(1).getUsername());
    }
}
