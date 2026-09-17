package model;

public class Rhombus {
    private double a = 0;
    private double d1 = 0;
    private double d2 = 0;
    private double alpha = 0;

    private double area = 0;
    private double perimeter = 0;
    private double inradius = 0;

    private String mode = "UNKNOWN";
    private boolean deducedA = false;
    private boolean deducedD1 = false;
    private boolean deducedD2 = false;
    private boolean deducedAlpha = false;
    private boolean hasArea = false;
    private boolean hasInradius = false;

    public Rhombus() {}

    public Rhombus(Double inA, Double inD1, Double inD2, Double inAlpha) {
        double valA = (inA != null && inA > 0) ? inA : 0;
        double valD1 = (inD1 != null && inD1 > 0) ? inD1 : 0;
        double valD2 = (inD2 != null && inD2 > 0) ? inD2 : 0;
        double valAlpha = (inAlpha != null && inAlpha > 0 && inAlpha < 180) ? inAlpha : 0;

        this.a = valA;
        this.d1 = valD1;
        this.d2 = valD2;
        this.alpha = valAlpha;

        calculate();
    }

    private void calculate() {
        // Trường hợp 1: Có cả 2 đường chéo d1 và d2 (Phổ biến nhất, chuẩn SGK)
        if (d1 > 0 && d2 > 0) {
            this.area = 0.5 * d1 * d2;
            this.hasArea = true;
            this.mode = "DIAGONALS";

            // Suy luận ngược cạnh a theo định lý Pythagoras
            if (a <= 0) {
                this.a = Math.sqrt(Math.pow(d1 / 2.0, 2) + Math.pow(d2 / 2.0, 2));
                this.deducedA = true;
            }
            this.perimeter = 4.0 * this.a;
            this.inradius = (d1 * d2) / (4.0 * this.a);
            this.hasInradius = true;

            // Suy luận ngược góc alpha nếu chưa có
            if (alpha <= 0 && this.a > 0) {
                double sinVal = this.area / (this.a * this.a);
                if (sinVal > 1.0) sinVal = 1.0;
                this.alpha = Math.toDegrees(Math.asin(sinVal));
                this.deducedAlpha = true;
            }
            return;
        }

        // Trường hợp 2: Có cạnh a và góc alpha
        if (a > 0 && alpha > 0) {
            this.perimeter = 4.0 * a;
            this.area = a * a * Math.sin(Math.toRadians(alpha));
            this.hasArea = true;
            this.mode = "SIDE_ANGLE";
            return;
        }

        // Trường hợp 3: Có cạnh a và đường chéo d1 (với d1 < 2a)
        if (a > 0 && d1 > 0 && d1 < 2.0 * a) {
            this.perimeter = 4.0 * a;
            this.d2 = 2.0 * Math.sqrt(a * a - Math.pow(d1 / 2.0, 2));
            this.deducedD2 = true;
            this.area = 0.5 * d1 * this.d2;
            this.hasArea = true;
            this.inradius = (d1 * this.d2) / (4.0 * a);
            this.hasInradius = true;
            double sinVal = this.area / (a * a);
            if (sinVal > 1.0) sinVal = 1.0;
            this.alpha = Math.toDegrees(Math.asin(sinVal));
            this.deducedAlpha = true;
            this.mode = "SIDE_DIAG1";
            return;
        }

        // Trường hợp 4: Có cạnh a và đường chéo d2 (với d2 < 2a)
        if (a > 0 && d2 > 0 && d2 < 2.0 * a) {
            this.perimeter = 4.0 * a;
            this.d1 = 2.0 * Math.sqrt(a * a - Math.pow(d2 / 2.0, 2));
            this.deducedD1 = true;
            this.area = 0.5 * this.d1 * d2;
            this.hasArea = true;
            this.inradius = (this.d1 * d2) / (4.0 * a);
            this.hasInradius = true;
            double sinVal = this.area / (a * a);
            if (sinVal > 1.0) sinVal = 1.0;
            this.alpha = Math.toDegrees(Math.asin(sinVal));
            this.deducedAlpha = true;
            this.mode = "SIDE_DIAG2";
            return;
        }

        // Trường hợp 5: Chỉ có cạnh a
        if (a > 0) {
            this.perimeter = 4.0 * a;
            this.mode = "SIDE_ONLY";
            return;
        }
    }

    public double getA() { return a; }
    public double getD1() { return d1; }
    public double getD2() { return d2; }
    public double getAlpha() { return alpha; }

    public double getPerimeter() { return perimeter; }
    public double getArea() { return area; }
    public double getAreaByDiag() { return area; }
    public double getAreaByAngle() { return area; }
    public double getInradius() { return inradius; }

    public String getMode() { return mode; }
    public boolean isDeducedA() { return deducedA; }
    public boolean isDeducedD1() { return deducedD1; }
    public boolean isDeducedD2() { return deducedD2; }
    public boolean isDeducedAlpha() { return deducedAlpha; }
    public boolean hasArea() { return hasArea; }
    public boolean hasInradius() { return hasInradius; }
}