package model;

public class SphericalCap {
    private double r; // Radius of the sphere
    private double h; // Height of the cap

    public SphericalCap() {}
    public SphericalCap(double r, double h) {
        this.r = r;
        this.h = h;
    }

    public double getR() { return r; }
    public void setR(double r) { this.r = r; }

    public double getH() { return h; }
    public void setH(double h) { this.h = h; }

    // Sxq = 2 * pi * r * h
    public double getSurfaceArea() {
        return 2.0 * Math.PI * r * h;
    }

    // V = pi * h^2 * (r - h/3)
    public double getVolume() {
        return Math.PI * h * h * (r - h / 3.0);
    }
}
