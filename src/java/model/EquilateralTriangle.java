package model;

public class EquilateralTriangle {
    private double a; // canh

    public EquilateralTriangle() {}
    public EquilateralTriangle(double a) { this.a = a; }

    public double getA() { return a; }
    public void setA(double a) { this.a = a; }

    public double getPerimeter() { return 3 * a; }

    // S = a^2 * sqrt(3) / 4
    public double getArea() { return a * a * Math.sqrt(3) / 4.0; }

    // h = a * sqrt(3) / 2
    public double getHeight() { return a * Math.sqrt(3) / 2.0; }

    // R (ban kinh ngoai tiep) = a * sqrt(3) / 3
    public double getCircumRadius() { return a * Math.sqrt(3) / 3.0; }

    // r (ban kinh noi tiep) = a * sqrt(3) / 6
    public double getInRadius() { return a * Math.sqrt(3) / 6.0; }


    public double getCircumradius() {
        return a * Math.sqrt(3) / 3;
    }
    public double getInradius() {
        return a * Math.sqrt(3) / 6;
    }

}
