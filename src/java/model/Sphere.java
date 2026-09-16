package model;

public class Sphere {
    private double radius;

    public Sphere() {}
    public Sphere(double radius) { this.radius = radius; }

    public double getRadius() { return radius; }
    public void setRadius(double radius) { this.radius = radius; }

    // V = 4/3 * pi * R^3
    public double getVolume() {
        return 4.0 / 3.0 * Math.PI * radius * radius * radius;
    }

    // S = 4 * pi * R^2
    public double getSurfaceArea() {
        return 4 * Math.PI * radius * radius;
    }
}
