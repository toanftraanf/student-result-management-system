/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author trant
 */
public class Teaching {
    private int id;
    private Teachers teachers;
    private Courses courses;
    private Classes classes;

    public Teaching() {
    }

    public Teaching(int id, Teachers teachers, Courses courses, Classes classes) {
        this.id = id;
        this.teachers = teachers;
        this.courses = courses;
        this.classes = classes;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Teachers getTeachers() {
        return teachers;
    }

    public void setTeachers(Teachers teachers) {
        this.teachers = teachers;
    }

    public Courses getCourses() {
        return courses;
    }

    public void setCourses(Courses courses) {
        this.courses = courses;
    }

    public Classes getClasses() {
        return classes;
    }

    public void setClasses(Classes classes) {
        this.classes = classes;
    }

    @Override
    public String toString() {
        return "Teaching{" + "id=" + id + ", teachers=" + teachers + ", courses=" + courses + ", classes=" + classes + '}';
    }
    
    
}
