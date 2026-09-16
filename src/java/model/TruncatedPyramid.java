package model;

public class TruncatedPyramid {
    private double s, sPrime, h; // S = dt day lon, S' = dt day nho, h = chieu cao

    public TruncatedPyramid() {}
    public TruncatedPyramid(double s, double sPrime, double h) {
        this.s = s; this.sPrime = sPrime; this.h = h;
    }

    public double getS() { return s; }
    public void setS(double s) { this.s = s; }
    public double getSPrime() { return sPrime; }
    public void setSPrime(double sPrime) { this.sPrime = sPrime; }
    public double getH() { return h; }
    public void setH(double h) { this.h = h; }

    // V = h/3 * (S + S' + sqrt(S*S'))
    public double getVolume() {
        return h / 3.0 * (s + sPrime + Math.sqrt(s * sPrime));
    }
}
