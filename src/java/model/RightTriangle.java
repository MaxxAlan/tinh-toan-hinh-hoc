package model;

public class RightTriangle {
    private double cathetus1, cathetus2;

    public RightTriangle() {}
    public RightTriangle(double cathetus1, double cathetus2) {
        this.cathetus1 = cathetus1;
        this.cathetus2 = cathetus2;
    }

    public double getCathetus1() { return cathetus1; }
    public void setCathetus1(double cathetus1) { this.cathetus1 = cathetus1; }
    public double getCathetus2() { return cathetus2; }
    public void setCathetus2(double cathetus2) { this.cathetus2 = cathetus2; }

    public double getHypotenuse() {
        return Math.sqrt(cathetus1 * cathetus1 + cathetus2 * cathetus2);
    }

    public double getPerimeter() {
        return cathetus1 + cathetus2 + getHypotenuse();
    }

    // S = 1/2 * cat1 * cat2
    public double getArea() {
        return 0.5 * cathetus1 * cathetus2;
    }

    // Duong cao ha tu dinh goc vuong: h = cat1*cat2 / hyp
    public double getAltitude() {
        return cathetus1 * cathetus2 / getHypotenuse();
    }
    public double getCircumradius() {
        return getHypotenuse() / 2.0;
    }
    public double getInradius() {
        return (cathetus1 + cathetus2 - getHypotenuse()) / 2.0;
    }
}