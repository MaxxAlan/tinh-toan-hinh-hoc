package model;

public class Triangle {
    private double a, b, c, h; // h = chieu cao ung voi canh a

    public Triangle() {}
    public Triangle(double a, double b, double c, double h) {
        this.a = a; this.b = b; this.c = c; this.h = h;
    }

    public double getA() { return a; }
    public void setA(double a) { this.a = a; }
    public double getB() { return b; }
    public void setB(double b) { this.b = b; }
    public double getC() { return c; }
    public void setC(double c) { this.c = c; }
    public double getH() { return h; }
    public void setH(double h) { this.h = h; }

    public double getPerimeter() { return a + b + c; }

    // S = 1/2 * a * h
    public double getArea() { return 0.5 * a * h; }

    // Heron: S = sqrt(p*(p-a)*(p-b)*(p-c))
    public double getAreaHeron() {
        double p = getPerimeter() / 2.0;
        return Math.sqrt(p * (p - a) * (p - b) * (p - c));
    }
    public double getCircumradius() {
        return (a * b * c) / (4.0 * getAreaHeron());
    }
    public double getInradius() {
        return getAreaHeron() / (getPerimeter() / 2.0);
    }
}