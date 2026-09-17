package model;

public class Octahedron {
    private double a;

    public Octahedron() {}
    public Octahedron(double a) { this.a = a; }

    public double getA() { return a; }
    public void setA(double a) { this.a = a; }

    // V = a^3 * sqrt(2) / 3
    public double getVolume() {
        return a * a * a * Math.sqrt(2) / 3.0;
    }

    // S toan phan = 2 * a^2 * sqrt(3)
    public double getSurfaceArea() {
        return 2.0 * a * a * Math.sqrt(3);
    }
}
