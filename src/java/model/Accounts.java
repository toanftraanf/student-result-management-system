/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author trant
 */
public class Accounts {
    private int id;
    private String username;
    private String password;
    private int role;
    private Teachers teachers;

    public Accounts() {
    }

    public Accounts(int id, String username, String password, int role, Teachers teachers) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.role = role;
        this.teachers = teachers;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public Teachers getTeachers() {
        return teachers;
    }

    public void setTeachers(Teachers teachers) {
        this.teachers = teachers;
    }

    @Override
    public String toString() {
        return "Accounts{" + "id=" + id + ", username=" + username + ", password=" + password + ", role=" + role + ", teachers=" + teachers + '}';
    }

  
    
}
