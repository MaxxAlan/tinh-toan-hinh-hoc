/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author HoangManh
 */
public class Circle {
    private double radius;
    public Circle(){
        
    }
    public Circle(double radius){
        this.radius= radius;
    }

    public double getRadius() {
        return radius;
    }

    public void setRadius(double radius) {
        this.radius = radius;
    }
    public double getPerimeter(){
        return Math.PI*2*this.radius;
    }
    public double getArea(){
        return Math.PI*this.radius*this.radius;
    }


    public double getDiameter() {
        return 2 * radius;
    }

}
