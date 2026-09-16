package model;

public class Cone {
    private double r, h;

    public Cone() {}
    public Cone(double r, double h) {
        this.r = r; this.h = h;
    }

    public double getR() { return r; }
    public void setR(double r) { this.r = r; }
    public double getH() { return h; }
    public void setH(double h) { this.h = h; }

    // l = sqrt(r^2 + h^2)
    public double getSlantHeight() {
        return Math.sqrt(r * r + h * h);
    }

    // V = 1/3 * pi * r^2 * h
    public double getVolume() { return Math.PI * r * r * h / 3.0; }

    // Sxq = pi * r * l
    public double getLateralArea() { return Math.PI * r * getSlantHeight(); }

    // Stp = pi * r * (l + r)
    public double getSurfaceArea() { return Math.PI * r * (getSlantHeight() + r); }
}
