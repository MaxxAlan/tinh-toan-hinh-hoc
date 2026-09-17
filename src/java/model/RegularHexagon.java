package model;

/**
 * Model hình lục giác đều với suy luận đa chiều.
 * Cho phép nhập 1 trong các thông số: cạnh a, chu vi P, diện tích S,
 * bán kính ngoại tiếp R, bán kính nội tiếp r, đường chéo chính d1, đường chéo phụ d2.
 */
public class RegularHexagon {
    private double a = 0;
    private double perimeter = 0;
    private double area = 0;
    private double circumradius = 0;
    private double inradius = 0;
    private double majorDiagonal = 0;
    private double minorDiagonal = 0;

    private String inputMode = "SIDE";
    private boolean deducedFromOther = false;

    public RegularHexagon() {}

    public RegularHexagon(Double inA, Double inP, Double inS, Double inR, Double inRIn, Double inD1, Double inD2) {
        if (inA != null && inA > 0) {
            this.a = inA;
            this.inputMode = "Cạnh a";
        } else if (inP != null && inP > 0) {
            this.a = inP / 6.0;
            this.deducedFromOther = true;
            this.inputMode = "Chu vi P";
        } else if (inS != null && inS > 0) {
            this.a = Math.sqrt((2.0 * inS) / (3.0 * Math.sqrt(3.0)));
            this.deducedFromOther = true;
            this.inputMode = "Diện tích S";
        } else if (inR != null && inR > 0) {
            this.a = inR;
            this.deducedFromOther = true;
            this.inputMode = "Bán kính ngoại tiếp R";
        } else if (inRIn != null && inRIn > 0) {
            this.a = (2.0 * inRIn) / Math.sqrt(3.0);
            this.deducedFromOther = true;
            this.inputMode = "Bán kính nội tiếp r";
        } else if (inD1 != null && inD1 > 0) {
            this.a = inD1 / 2.0;
            this.deducedFromOther = true;
            this.inputMode = "Đường chéo chính d₁";
        } else if (inD2 != null && inD2 > 0) {
            this.a = inD2 / Math.sqrt(3.0);
            this.deducedFromOther = true;
            this.inputMode = "Đường chéo phụ d₂";
        }

        if (this.a > 0) {
            calculate();
        }
    }

    private void calculate() {
        this.perimeter = 6.0 * this.a;
        this.area = (3.0 * Math.sqrt(3.0) / 2.0) * this.a * this.a;
        this.circumradius = this.a;
        this.inradius = (this.a * Math.sqrt(3.0)) / 2.0;
        this.majorDiagonal = 2.0 * this.a;
        this.minorDiagonal = this.a * Math.sqrt(3.0);
    }

    public double getA() { return a; }
    public double getPerimeter() { return perimeter; }
    public double getArea() { return area; }
    public double getCircumradius() { return circumradius; }
    public double getInradius() { return inradius; }
    public double getMajorDiagonal() { return majorDiagonal; }
    public double getMinorDiagonal() { return minorDiagonal; }
    public String getInputMode() { return inputMode; }
    public boolean isDeducedFromOther() { return deducedFromOther; }

    public double getRoundedA() { return Math.round(a * 10000.0) / 10000.0; }
    public double getRoundedPerimeter() { return Math.round(perimeter * 10000.0) / 10000.0; }
    public double getRoundedArea() { return Math.round(area * 10000.0) / 10000.0; }
    public double getRoundedCircumradius() { return Math.round(circumradius * 10000.0) / 10000.0; }
    public double getRoundedInradius() { return Math.round(inradius * 10000.0) / 10000.0; }
    public double getRoundedMajorDiagonal() { return Math.round(majorDiagonal * 10000.0) / 10000.0; }
    public double getRoundedMinorDiagonal() { return Math.round(minorDiagonal * 10000.0) / 10000.0; }
}
