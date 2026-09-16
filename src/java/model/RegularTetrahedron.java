package model;

public class RegularTetrahedron {
    private double a;

    public RegularTetrahedron() {}
    public RegularTetrahedron(double a) { this.a = a; }

    public double getA() { return a; }
    public void setA(double a) { this.a = a; }

    // V = a^3 * sqrt(2) / 12
    public double getVolume() {
        return a * a * a * Math.sqrt(2) / 12.0;
    }

    // S toan phan = a^2 * sqrt(3)
    public double getSurfaceArea() {
        return a * a * Math.sqrt(3);
    }

    // Chieu cao h = a * sqrt(6) / 3
    public double getHeight() {
        return a * Math.sqrt(6) / 3.0;
    }

    // Dien tich 1 mat = a^2 * sqrt(3) / 4
    public double getFaceArea() {
        return a * a * Math.sqrt(3) / 4.0;
    }


    public double getCircumradius() {
        return a * Math.sqrt(6) / 4;
    }
    public double getInradius() {
        return a * Math.sqrt(6) / 12;
    }

}
