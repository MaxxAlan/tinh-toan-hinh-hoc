package model;

public class Dodecahedron {
    private double a;

    public Dodecahedron() {}
    public Dodecahedron(double a) { this.a = a; }

    public double getA() { return a; }
    public void setA(double a) { this.a = a; }

    // V = a^3 * (15 + 7 * sqrt(5)) / 4
    public double getVolume() {
        return (a * a * a * (15.0 + 7.0 * Math.sqrt(5))) / 4.0;
    }

    // S = 3 * sqrt(25 + 10*sqrt(5)) * a^2
    public double getSurfaceArea() {
        return 3.0 * Math.sqrt(25.0 + 10.0 * Math.sqrt(5)) * a * a;
    }
}
