package model;

public class Trapezoid {
    private double a, b, h; // a, b = 2 day; h = chieu cao

    public Trapezoid() {}
    public Trapezoid(double a, double b, double h) {
        this.a = a; this.b = b; this.h = h;
    }

    public double getA() { return a; }
    public void setA(double a) { this.a = a; }
    public double getB() { return b; }
    public void setB(double b) { this.b = b; }
    public double getH() { return h; }
    public void setH(double h) { this.h = h; }

    // S = (a + b) * h / 2
    public double getArea() { return (a + b) * h / 2.0; }

    // Duong trung binh
    public double getMedian() { return (a + b) / 2.0; }


    public double getMidline() {
        return (a + b) / 2;
    }

}
