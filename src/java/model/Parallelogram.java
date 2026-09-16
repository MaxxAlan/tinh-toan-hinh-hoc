package model;

public class Parallelogram {
    private double a, b, h, alpha; // a,b = canh; h = chieu cao ung voi a; alpha = goc (do)

    public Parallelogram() {}
    public Parallelogram(double a, double b, double h, double alpha) {
        this.a = a; this.b = b; this.h = h; this.alpha = alpha;
    }

    public double getA() { return a; }
    public void setA(double a) { this.a = a; }
    public double getB() { return b; }
    public void setB(double b) { this.b = b; }
    public double getH() { return h; }
    public void setH(double h) { this.h = h; }
    public double getAlpha() { return alpha; }
    public void setAlpha(double alpha) { this.alpha = alpha; }

    public double getPerimeter() { return 2 * (a + b); }

    // S = a * h
    public double getAreaByHeight() { return a * h; }

    // S = a * b * sin(alpha)
    public double getAreaByAngle() {
        return a * b * Math.sin(Math.toRadians(alpha));
    }
}
