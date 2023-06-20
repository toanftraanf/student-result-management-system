/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author trant
 */
public class Results {
    private int id;
    private Float result1;
    private Float result2;
    private Float result3;
    private Float result4;
    private Students students;
    private Courses courses;

    public Results() {
    }

    public Results(int id, Float result1, Float result2, Float result3, Float result4, Students students, Courses courses) {
        this.id = id;
        this.result1 = result1;
        this.result2 = result2;
        this.result3 = result3;
        this.result4 = result4;
        this.students = students;
        this.courses = courses;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Float getResult1() {
        return result1;
    }

    public void setResult1(Float result1) {
        this.result1 = result1;
    }

    public Float getResult2() {
        return result2;
    }

    public void setResult2(Float result2) {
        this.result2 = result2;
    }

    public Float getResult3() {
        return result3;
    }

    public void setResult3(Float result3) {
        this.result3 = result3;
    }

    public Float getResult4() {
        return result4;
    }

    public void setResult4(Float result4) {
        this.result4 = result4;
    }

    public Students getStudents() {
        return students;
    }

    public void setStudents(Students students) {
        this.students = students;
    }

    public Courses getCourses() {
        return courses;
    }

    public void setCourses(Courses courses) {
        this.courses = courses;
    }

    @Override
    public String toString() {
        return "Results{" + "id=" + id + ", result1=" + result1 + ", result2=" + result2 + ", result3=" + result3 + ", result4=" + result4 + ", students=" + students + ", courses=" + courses + '}';
    }
    
    
}
