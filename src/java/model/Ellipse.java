package model;

/**
 * Model hình Elip với suy luận đa chiều.
 * Phương trình chính tắc: x^2/a^2 + y^2/b^2 = 1 (a >= b > 0).
 * Cho phép nhập:
 * 1. Bán trục lớn a và bán trục bé b (hoặc trục lớn 2a, trục bé 2b)
 * 2. Bán trục a và bán tiêu cự c (hoặc tiêu cự 2c)
 * 3. Bán trục b và bán tiêu cự c
 * 4. Bán trục a và diện tích S
 * 5. Bán trục a và tâm sai e
 */
public class Ellipse {
    private double a = 0; // bán trục lớn
    private double b = 0; // bán trục bé
    private double c = 0; // bán tiêu cự
    private double e = 0; // tâm sai
    private double area = 0; // diện tích S = pi*a*b
    private double perimeter = 0; // chu vi Ramanujan

    private boolean deduced = false;
    private String calculationType = "A_AND_B";

    public Ellipse() {}

    public Ellipse(Double inA, Double inB, Double inC, Double inE, Double inS, Double in2A, Double in2B, Double in2C) {
        // Chuẩn hóa trục lớn / bé nếu nhập dạng 2a, 2b, 2c
        double valA = (inA != null && inA > 0) ? inA : ((in2A != null && in2A > 0) ? in2A / 2.0 : 0);
        double valB = (inB != null && inB > 0) ? inB : ((in2B != null && in2B > 0) ? in2B / 2.0 : 0);
        double valC = (inC != null && inC > 0) ? inC : ((in2C != null && in2C > 0) ? in2C / 2.0 : 0);
        double valE = (inE != null && inE > 0 && inE < 1.0) ? inE : 0;
        double valS = (inS != null && inS > 0) ? inS : 0;

        // Hoán đổi nếu valA < valB để quy ước a là bán trục lớn
        if (valA > 0 && valB > 0 && valA < valB) {
            double temp = valA;
            valA = valB;
            valB = temp;
        }

        if (valA > 0 && valB > 0) {
            this.a = valA;
            this.b = valB;
            this.c = Math.sqrt(Math.max(0, this.a * this.a - this.b * this.b));
            this.calculationType = "Bán trục a & b";
        } else if (valA > 0 && valC > 0 && valA > valC) {
            this.a = valA;
            this.c = valC;
            this.b = Math.sqrt(this.a * this.a - this.c * this.c);
            this.calculationType = "Bán trục a & Tiêu cự c";
            this.deduced = true;
        } else if (valB > 0 && valC > 0) {
            this.b = valB;
            this.c = valC;
            this.a = Math.sqrt(this.b * this.b + this.c * this.c);
            this.calculationType = "Bán trục b & Tiêu cự c";
            this.deduced = true;
        } else if (valA > 0 && valS > 0) {
            this.a = valA;
            this.b = valS / (Math.PI * this.a);
            this.c = Math.sqrt(Math.max(0, this.a * this.a - this.b * this.b));
            this.calculationType = "Bán trục a & Diện tích S";
            this.deduced = true;
        } else if (valA > 0 && valE > 0) {
            this.a = valA;
            this.e = valE;
            this.c = this.e * this.a;
            this.b = Math.sqrt(Math.max(0, this.a * this.a - this.c * this.c));
            this.calculationType = "Bán trục a & Tâm sai e";
            this.deduced = true;
        }

        if (this.a > 0 && this.b > 0) {
            calculate();
        }
    }

    private void calculate() {
        this.area = Math.PI * this.a * this.b;
        if (this.a > 0) {
            this.c = Math.sqrt(Math.max(0, this.a * this.a - this.b * this.b));
            this.e = this.c / this.a;
        }
        // Công thức Ramanujan cho chu vi elip: C ≈ π [ 3(a+b) - sqrt((3a+b)(a+3b)) ]
        double sum = this.a + this.b;
        double term = (3.0 * this.a + this.b) * (this.a + 3.0 * this.b);
        this.perimeter = Math.PI * (3.0 * sum - Math.sqrt(term));
    }

    public double getA() { return a; }
    public double getB() { return b; }
    public double getC() { return c; }
    public double getE() { return e; }
    public double getArea() { return area; }
    public double getPerimeter() { return perimeter; }
    public double getMajorAxis() { return 2.0 * a; }
    public double getMinorAxis() { return 2.0 * b; }
    public double getFocalDistance() { return 2.0 * c; }
    public String getCalculationType() { return calculationType; }
    public boolean isDeduced() { return deduced; }

    public double getRoundedA() { return Math.round(a * 10000.0) / 10000.0; }
    public double getRoundedB() { return Math.round(b * 10000.0) / 10000.0; }
    public double getRoundedC() { return Math.round(c * 10000.0) / 10000.0; }
    public double getRoundedE() { return Math.round(e * 10000.0) / 10000.0; }
    public double getRoundedArea() { return Math.round(area * 10000.0) / 10000.0; }
    public double getRoundedPerimeter() { return Math.round(perimeter * 10000.0) / 10000.0; }
    public double getRoundedMajorAxis() { return Math.round(2.0 * a * 10000.0) / 10000.0; }
    public double getRoundedMinorAxis() { return Math.round(2.0 * b * 10000.0) / 10000.0; }
    public double getRoundedFocalDistance() { return Math.round(2.0 * c * 10000.0) / 10000.0; }
}
