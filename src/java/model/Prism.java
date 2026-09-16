package model;

public class Prism {
    private double baseArea, h;

    public Prism() {}
    public Prism(double baseArea, double h) {
        this.baseArea = baseArea; this.h = h;
    }

    public double getBaseArea() { return baseArea; }
    public void setBaseArea(double baseArea) { this.baseArea = baseArea; }
    public double getH() { return h; }
    public void setH(double h) { this.h = h; }

    // V = B * h
    public double getVolume() { return baseArea * h; }
}
