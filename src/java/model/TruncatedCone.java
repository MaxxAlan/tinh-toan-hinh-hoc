package model;

public class TruncatedCone {
    private double r, rPrime, h; // r = ban kinh day lon, r' = ban kinh day nho

    public TruncatedCone() {}
    public TruncatedCone(double r, double rPrime, double h) {
        this.r = r; this.rPrime = rPrime; this.h = h;
    }

    public double getR() { return r; }
    public void setR(double r) { this.r = r; }
    public double getRPrime() { return rPrime; }
    public void setRPrime(double rPrime) { this.rPrime = rPrime; }
    public double getH() { return h; }
    public void setH(double h) { this.h = h; }

    // l = sqrt(h^2 + (r - r')^2)
    public double getSlantHeight() {
        return Math.sqrt(h * h + (r - rPrime) * (r - rPrime));
    }

    // V = 1/3 * pi * h * (r^2 + r*r' + r'^2)
    public double getVolume() {
        return Math.PI * h / 3.0 * (r*r + r*rPrime + rPrime*rPrime);
    }

    // Sxq = pi * (r + r') * l
    public double getLateralArea() {
        return Math.PI * (r + rPrime) * getSlantHeight();
    }
}
