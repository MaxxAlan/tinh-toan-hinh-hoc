package model;

/**
 * Model hình bình hành với suy luận đa chiều.
 * Tất cả trường Optional (null = chưa biết).
 * Constructor tự suy luận từ những gì đã có:
 *   h  = b * sin(α)
 *   b  = h / sin(α)
 *   α  = arcsin(h / b)
 */
public class Parallelogram {

    private Double a, b, h, alpha; // alpha = goc (do)

    // ===== kết quả tính =====
    private Double perimeter;
    private Double areaByHeight;
    private Double areaByAngle;

    // ===== flags suy luận ngược =====
    private boolean deducedH     = false;
    private boolean deducedB     = false;
    private boolean deducedAlpha = false;

    public Parallelogram() {}

    public Parallelogram(Double a, Double b, Double h, Double alpha) {
        this.a     = pos(a);
        this.b     = pos(b);
        this.h     = pos(h);
        this.alpha = validAngle(alpha);
        deduce();
        compute();
    }

    private Double pos(Double v)         { return (v != null && v > 0) ? v : null; }
    private Double validAngle(Double v)  { return (v != null && v > 0 && v < 180) ? v : null; }

    private void deduce() {
        // h = b * sin(alpha)
        if (h == null && b != null && alpha != null) {
            h = b * Math.sin(Math.toRadians(alpha));
            deducedH = true;
        }
        // b = h / sin(alpha)
        if (b == null && h != null && alpha != null) {
            double sinA = Math.sin(Math.toRadians(alpha));
            if (sinA > 0.001) { b = h / sinA; deducedB = true; }
        }
        // alpha = arcsin(h / b)
        if (alpha == null && h != null && b != null && h <= b) {
            alpha = Math.toDegrees(Math.asin(h / b));
            deducedAlpha = true;
        }
    }

    private void compute() {
        if (a != null && b != null)              perimeter    = 2.0 * (a + b);
        if (a != null && h != null)              areaByHeight = a * h;
        if (a != null && b != null && alpha != null) areaByAngle = a * b * Math.sin(Math.toRadians(alpha));
    }

    // Getters
    public Double getA()     { return a; }
    public Double getB()     { return b; }
    public Double getH()     { return h; }
    public Double getAlpha() { return alpha; }

    public Double getPerimeter()    { return perimeter; }
    public Double getAreaByHeight() { return areaByHeight; }
    public Double getAreaByAngle()  { return areaByAngle; }

    public boolean isDeducedH()     { return deducedH; }
    public boolean isDeducedB()     { return deducedB; }
    public boolean isDeducedAlpha() { return deducedAlpha; }

    public boolean hasAnyResult() {
        return perimeter != null || areaByHeight != null || areaByAngle != null;
    }
}

