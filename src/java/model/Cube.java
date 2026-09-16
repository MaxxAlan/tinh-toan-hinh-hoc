package model;

public class Cube {
    private double a;

    public Cube() {}
    public Cube(double a) { this.a = a; }

    public double getA() { return a; }
    public void setA(double a) { this.a = a; }

    // V = a^3
    public double getVolume() { return a * a * a; }

    // Stp = 6a^2
    public double getSurfaceArea() { return 6 * a * a; }

    // d = a*sqrt(3)
    public double getDiagonal() { return a * Math.sqrt(3); }

    // R ngoai tiep cau = a*sqrt(3)/2
    public double getCircumsphereRadius() { return a * Math.sqrt(3) / 2.0; }
    public double getInradius() {
        return a / 2.0;
    }
}