/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author HoangManh
 */
public class Rectangle {
    private double shortLength;
    private double longLength;

    public Rectangle() {
    }

    public Rectangle(double shortLength, double longLength) {
        this.shortLength = shortLength;
        this.longLength = longLength;
    }

    public double getShortLength() {
        return shortLength;
    }

    public void setShortLength(double shortLength) {
        this.shortLength = shortLength;
    }

    public double getLongLength() {
        return longLength;
    }

    public void setLongLength(double longLength) {
        this.longLength = longLength;
    }
    public double getArea(){
        return this.shortLength*this.longLength;
    }
    public double getPerimeter(){
        return (this.shortLength+this.longLength)*2;
    }


    public double getDiagonal() {
        return Math.sqrt(shortLength * shortLength + longLength * longLength);
    }
    public double getCircumradius() {
        return getDiagonal() / 2;
    }

}
