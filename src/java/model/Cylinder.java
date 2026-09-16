package model;

public class Cylinder {
    private double r, h;

    public Cylinder() {}
    public Cylinder(double r, double h) {
        this.r = r; this.h = h;
    }

    public double getR() { return r; }
    public void setR(double r) { this.r = r; }
    public double getH() { return h; }
    public void setH(double h) { this.h = h; }

    // V = pi*r^2*h
    public double getVolume() { return Math.PI * r * r * h; }

    // Sxq = 2*pi*r*h
    public double getLateralArea() { return 2 * Math.PI * r * h; }

    // Stp = 2*pi*r*(h + r)
    public double getSurfaceArea() { return 2 * Math.PI * r * (h + r); }
}
