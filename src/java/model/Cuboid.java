package model;

public class Cuboid {
    private double a, b, c;

    public Cuboid() {}
    public Cuboid(double a, double b, double c) {
        this.a = a; this.b = b; this.c = c;
    }

    public double getA() { return a; }
    public void setA(double a) { this.a = a; }
    public double getB() { return b; }
    public void setB(double b) { this.b = b; }
    public double getC() { return c; }
    public void setC(double c) { this.c = c; }

    // V = a*b*c
    public double getVolume() { return a * b * c; }

    // Stp = 2(ab + bc + ca)
    public double getSurfaceArea() { return 2 * (a*b + b*c + c*a); }

    // d = sqrt(a^2 + b^2 + c^2)
    public double getDiagonal() { return Math.sqrt(a*a + b*b + c*c); }
    public double getCircumradius() {
        return getDiagonal() / 2.0;
    }
}