package model;

public class Square {
    private double side;

    public Square() {}

    public Square(double side) {
        this.side = side;
    }

    public double getSide() { return side; }
    public void setSide(double side) { this.side = side; }

    public double getPerimeter() { return 4 * side; }
    public double getArea() { return side * side; }
    public double getDiagonal() { return side * Math.sqrt(2); }
    public double getCircumradius() { return getDiagonal() / 2.0; }
    public double getInradius() { return side / 2.0; }
}
