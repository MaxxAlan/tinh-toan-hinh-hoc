package model;

public class SphericalSegment {
    private double r1;
    private double r2;
    private double h;

    public SphericalSegment() {}
    public SphericalSegment(double r1, double r2, double h) {
        this.r1 = r1;
        this.r2 = r2;
        this.h = h;
    }

    public double getR1() { return r1; }
    public void setR1(double r1) { this.r1 = r1; }

    public double getR2() { return r2; }
    public void setR2(double r2) { this.r2 = r2; }

    public double getH() { return h; }
    public void setH(double h) { this.h = h; }

    // V = (1/6) * pi * h * (3*r1^2 + 3*r2^2 + h^2)
    public double getVolume() {
        return (1.0 / 6.0) * Math.PI * h * (3.0 * r1 * r1 + 3.0 * r2 * r2 + h * h);
    }
}
