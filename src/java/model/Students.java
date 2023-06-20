/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author trant
 */
public class Students {
    private int id;
    private String rollId;
    private String name;
    private Date dob;
    private int sex;
    private String address;
    private Classes classes;

    public Students() {
    }

    public Students(int id, String rollId, String name, Date dob, int sex, String address, Classes classes) {
        this.id = id;
        this.rollId = rollId;
        this.name = name;
        this.dob = dob;
        this.sex = sex;
        this.address = address;
        this.classes = classes;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRollId() {
        return rollId;
    }

    public void setRollId(String rollId) {
        this.rollId = rollId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Classes getClasses() {
        return classes;
    }

    public void setClasses(Classes classes) {
        this.classes = classes;
    }

    @Override
    public String toString() {
        return "Students{" + "id=" + id + ", rollId=" + rollId + ", name=" + name + ", dob=" + dob + ", sex=" + sex + ", address=" + address + ", classes=" + classes + '}';
    }
    
    
}
