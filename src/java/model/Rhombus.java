package model;

public class Rhombus {
    private double a, d1, d2, alpha; // a = canh; d1,d2 = duong cheo; alpha = goc (do)

    public Rhombus() {}
    public Rhombus(double a, double d1, double d2, double alpha) {
        this.a = a; this.d1 = d1; this.d2 = d2; this.alpha = alpha;
    }

    public double getA() { return a; }
    public void setA(double a) { this.a = a; }
    public double getD1() { return d1; }
    public void setD1(double d1) { this.d1 = d1; }
    public double getD2() { return d2; }
    public void setD2(double d2) { this.d2 = d2; }
    public double getAlpha() { return alpha; }
    public void setAlpha(double alpha) { this.alpha = alpha; }

    public double getPerimeter() { return 4 * a; }

    // S = 1/2 * d1 * d2
    public double getAreaByDiag() { return 0.5 * d1 * d2; }

    // S = a^2 * sin(alpha)
    public double getAreaByAngle() {
        return a * a * Math.sin(Math.toRadians(alpha));
    }
    public double getInradius() {
        return (d1 * d2) / (4.0 * a);
    }
}