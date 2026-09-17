package model;

public class Icosahedron {
    private double a;

    public Icosahedron() {}
    public Icosahedron(double a) { this.a = a; }

    public double getA() { return a; }
    public void setA(double a) { this.a = a; }

    // V = 5 * a^3 * (3 + sqrt(5)) / 12
    public double getVolume() {
        return (5.0 * a * a * a * (3.0 + Math.sqrt(5))) / 12.0;
    }

    // S = 5 * a^2 * sqrt(3)
    public double getSurfaceArea() {
        return 5.0 * a * a * Math.sqrt(3);
    }
}
