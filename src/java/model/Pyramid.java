package model;

public class Pyramid {
    private double baseArea, h;

    public Pyramid() {}
    public Pyramid(double baseArea, double h) {
        this.baseArea = baseArea; this.h = h;
    }

    public double getBaseArea() { return baseArea; }
    public void setBaseArea(double baseArea) { this.baseArea = baseArea; }
    public double getH() { return h; }
    public void setH(double h) { this.h = h; }

    // V = 1/3 * B * h
    public double getVolume() { return baseArea * h / 3.0; }
}
