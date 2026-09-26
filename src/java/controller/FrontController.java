package controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;

/**
 * FrontController duy nhat cho ung dung.
 * URL chuan: /app?page=hinh-cau (khong bao gio lo .jsp/.html).
 * Giu backward-compat: /tinh-toan-hinh-hoc, /home, /trang-chu -> page=home.
 */
public class FrontController extends HttpServlet {

    private static final Set<String> VALID_PAGES = new HashSet<>(Arrays.asList(
        "home",
        "hinh-vuong", "hinh-chu-nhat", "hinh-tron", "hinh-tam-giac",
        "tam-giac-deu", "tam-giac-vuong", "hinh-thang", "hinh-binh-hanh",
        "hinh-thoi", "hinh-luc-giac-deu", "hinh-elip",
        "hop-chu-nhat", "hinh-lap-phuong", "lang-tru", "hinh-chop",
        "hinh-chop-cut", "hinh-tru", "hinh-non", "hinh-non-cut",
        "hinh-cau", "tu-dien-deu", "bat-dien-deu", "muoi-hai-mat-deu",
        "hai-muoi-mat-deu", "chom-cau", "doi-cau", "cong-thuc-nang-cao"
    ));

    private String normalize(String page) {
        if (page == null || page.trim().isEmpty()) return "home";
        page = page.trim();
        return VALID_PAGES.contains(page) ? page : "home";
    }

    private String viewOf(String page) {
        if ("home".equals(page)) return "/WEB-INF/views/home.jsp";
        return "/WEB-INF/views/" + page + ".jsp";
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String page = normalize(request.getParameter("page"));
        // Neu vao bang clean URL cu /hinh-cau ma khong co ?page= -> suy tu servletPath
        if (request.getParameter("page") == null) {
            String sp = request.getServletPath(); // vd /hinh-cau
            if (sp != null && sp.length() > 1) {
                String guess = sp.substring(1);
                if (VALID_PAGES.contains(guess)) page = guess;
            }
            if ("/tinh-toan-hinh-hoc".equals(sp) || "/home".equals(sp) || "/trang-chu".equals(sp)) page = "home";
        }
        request.getRequestDispatcher(viewOf(page)).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String page = normalize(request.getParameter("page"));
        try {
            switch (page) {
                case "hinh-vuong": handleVuong(request); break;
                case "hinh-chu-nhat": handleChuNhat(request); break;
                case "hinh-tron": handleTron(request); break;
                case "hinh-tam-giac": handleTamGiac(request); break;
                case "tam-giac-deu": handleTamGiacDeu(request); break;
                case "tam-giac-vuong": handleTamGiacVuong(request); break;
                case "hinh-thang": handleThang(request); break;
                case "hinh-binh-hanh": handleBinhHanh(request); break;
                case "hinh-thoi": handleThoi(request); break;
                case "hinh-luc-giac-deu": handleLucGiac(request); break;
                case "hinh-elip": handleElip(request); break;
                case "hop-chu-nhat": handleHop(request); break;
                case "hinh-lap-phuong": handleLapPhuong(request); break;
                case "lang-tru": handleLangTru(request); break;
                case "hinh-chop": handleChop(request); break;
                case "hinh-chop-cut": handleChopCut(request); break;
                case "hinh-tru": handleTru(request); break;
                case "hinh-non": handleNon(request); break;
                case "hinh-non-cut": handleNonCut(request); break;
                case "hinh-cau": handleCau(request); break;
                case "tu-dien-deu": handleTuDienDeu(request); break;
                case "bat-dien-deu": handleBatDienDeu(request); break;
                case "muoi-hai-mat-deu": handleMuoiHai(request); break;
                case "hai-muoi-mat-deu": handleHaiMuoi(request); break;
                case "chom-cau": handleChomCau(request); break;
                case "doi-cau": handleDoiCau(request); break;
                default: break; // home, cong-thuc-nang-cao: khong co form
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Vui lòng nhập số hợp lệ.");
        }
        request.getRequestDispatcher(viewOf(page)).forward(request, response);
    }

    // ---- helpers ----
    private double req(HttpServletRequest r, String name) {
        double v = Double.parseDouble(r.getParameter(name));
        if (v <= 0) throw new NumberFormatException("non-positive:" + name);
        return v;
    }

    private Double opt(HttpServletRequest r, String name) {
        String p = r.getParameter(name);
        if (p == null || p.trim().isEmpty()) return null;
        double v = Double.parseDouble(p.trim());
        return v > 0 ? v : null;
    }

    private Double optAngle(HttpServletRequest r, String name) {
        String p = r.getParameter(name);
        if (p == null || p.trim().isEmpty()) return null;
        double v = Double.parseDouble(p.trim());
        return (v > 0 && v < 180) ? v : null;
    }

    private void need(boolean ok, HttpServletRequest r, String msg) {
        if (!ok) { r.setAttribute("error", msg); throw new DoneException(); }
    }

    private static class DoneException extends RuntimeException {}

    // ---- handlers (logic giu nguyen tu controller cu) ----
    private void handleVuong(HttpServletRequest r) {
        try { double a = req(r, "a"); r.setAttribute("hv", new Square(a)); }
        catch (NumberFormatException e) { r.setAttribute("error", e.getMessage() != null && e.getMessage().startsWith("non-positive") ? "Vui lòng nhập các kích thước lớn hơn 0 và hợp lệ." : "Vui lòng nhập số hợp lệ."); throw new DoneException(); }
    }

    private void handleChuNhat(HttpServletRequest r) {
        try {
            double s = req(r, "s"), l = req(r, "l");
            r.setAttribute("hcn", new Rectangle(s, l));
        } catch (NumberFormatException e) { r.setAttribute("error", "Vui lòng nhập các kích thước lớn hơn 0 và hợp lệ."); throw new DoneException(); }
    }

    private void handleTron(HttpServletRequest r) {
        try { double v = req(r, "r"); r.setAttribute("ht", new Circle(v)); }
        catch (NumberFormatException e) { r.setAttribute("error", "Vui lòng nhập các kích thước lớn hơn 0 và hợp lệ."); throw new DoneException(); }
    }

    private void handleTamGiac(HttpServletRequest r) {
        double a = req(r, "a"), b = req(r, "b"), c = req(r, "c"), h = req(r, "h");
        if ((a + b <= c) || (a + c <= b) || (b + c <= a)) {
            r.setAttribute("error", "Vui lòng nhập các kích thước lớn hơn 0 và hợp lệ.");
            throw new DoneException();
        }
        r.setAttribute("tg", new Triangle(a, b, c, h));
    }

    private void handleTamGiacDeu(HttpServletRequest r) {
        double a = req(r, "a");
        r.setAttribute("tgd", new EquilateralTriangle(a));
    }

    private void handleTamGiacVuong(HttpServletRequest r) {
        double c1 = req(r, "c1"), c2 = req(r, "c2");
        r.setAttribute("tgv", new RightTriangle(c1, c2));
    }

    private void handleThang(HttpServletRequest r) {
        double a = req(r, "a"), b = req(r, "b"), h = req(r, "h");
        r.setAttribute("thang", new Trapezoid(a, b, h));
    }

    private void handleBinhHanh(HttpServletRequest r) {
        Double a = opt(r, "a"), b = opt(r, "b"), h = opt(r, "h"), alpha = optAngle(r, "alpha");
        boolean ok = (a != null && b != null) || (a != null && h != null)
                || (b != null && alpha != null) || (h != null && alpha != null) || (h != null && b != null);
        if (!ok) { r.setAttribute("error", "Vui lòng nhập đủ dữ kiện cho ít nhất 1 công thức. Ví dụ: chỉ cần (a, h) hoặc (a, b) hoặc (b, α) hoặc (h, α) hoặc (h, b)."); throw new DoneException(); }
        Parallelogram hbh = new Parallelogram(a, b, h, alpha);
        if (!hbh.hasAnyResult()) { r.setAttribute("error", "Không thể tính toán từ các dữ kiện đã nhập. Vui lòng kiểm tra lại."); throw new DoneException(); }
        r.setAttribute("hbh", hbh);
    }

    private void handleThoi(HttpServletRequest r) {
        Double a = opt(r, "a"), d1 = opt(r, "d1"), d2 = opt(r, "d2"), alpha = opt(r, "alpha");
        boolean ok = (d1 != null && d2 != null) || (a != null && alpha != null)
                || (a != null && (d1 != null || d2 != null)) || (a != null);
        if (!ok) { r.setAttribute("error", "Vui lòng nhập đủ dữ kiện cho ít nhất 1 công thức (ví dụ: chỉ cần 2 đường chéo d1, d2; hoặc cạnh a và góc α; hoặc cạnh a và 1 đường chéo)."); throw new DoneException(); }
        if (a != null && d1 != null && d1 >= 2.0 * a) { r.setAttribute("error", "Độ dài đường chéo d1 phải nhỏ hơn 2 lần cạnh a (d1 < 2a) để tạo thành hình thoi hợp lệ."); throw new DoneException(); }
        if (a != null && d2 != null && d2 >= 2.0 * a) { r.setAttribute("error", "Độ dài đường chéo d2 phải nhỏ hơn 2 lần cạnh a (d2 < 2a) để tạo thành hình thoi hợp lệ."); throw new DoneException(); }
        r.setAttribute("hthi", new Rhombus(a, d1, d2, alpha));
    }

    private void handleLucGiac(HttpServletRequest r) {
        Double a = opt(r, "a"), p = opt(r, "p"), s = opt(r, "s"), rr = opt(r, "r"),
               rIn = opt(r, "rIn"), d1 = opt(r, "d1"), d2 = opt(r, "d2");
        if (a == null && p == null && s == null && rr == null && rIn == null && d1 == null && d2 == null) {
            r.setAttribute("error", "Vui lòng nhập ít nhất 1 thông số (cạnh a, chu vi P, diện tích S, bán kính R/r hoặc đường chéo).");
            throw new DoneException();
        }
        r.setAttribute("hex", new RegularHexagon(a, p, s, rr, rIn, d1, d2));
    }

    private void handleElip(HttpServletRequest r) {
        Double a = opt(r, "a"), b = opt(r, "b"), c = opt(r, "c"), e = opt(r, "e"),
               s = opt(r, "s"), twoA = opt(r, "twoA"), twoB = opt(r, "twoB"), twoC = opt(r, "twoC");
        boolean valid = (a != null && b != null) || (twoA != null && twoB != null)
                || (a != null && c != null) || (b != null && c != null)
                || (a != null && s != null) || (a != null && e != null);
        if (!valid) { r.setAttribute("error", "Vui lòng nhập đủ cặp thông số (ví dụ: bán trục a & b, hoặc trục 2a & 2b, hoặc a & c, hoặc a & diện tích S)."); throw new DoneException(); }
        double effA = (a != null) ? a : ((twoA != null) ? twoA / 2.0 : 0);
        double effC = (c != null) ? c : ((twoC != null) ? twoC / 2.0 : 0);
        if (effA > 0 && effC > 0 && effA <= effC) { r.setAttribute("error", "Bán trục lớn a (" + effA + ") phải lớn hơn bán tiêu cự c (" + effC + ")."); throw new DoneException(); }
        r.setAttribute("el", new Ellipse(a, b, c, e, s, twoA, twoB, twoC));
    }

    private void handleHop(HttpServletRequest r) {
        double a = req(r, "a"), b = req(r, "b"), c = req(r, "c");
        r.setAttribute("hcn3d", new Cuboid(a, b, c));
    }

    private void handleLapPhuong(HttpServletRequest r) {
        r.setAttribute("lp", new Cube(req(r, "a")));
    }

    private void handleLangTru(HttpServletRequest r) {
        r.setAttribute("langtru", new Prism(req(r, "baseArea"), req(r, "h")));
    }

    private void handleChop(HttpServletRequest r) {
        r.setAttribute("chop", new Pyramid(req(r, "baseArea"), req(r, "h")));
    }

    private void handleChopCut(HttpServletRequest r) {
        r.setAttribute("chopcut", new TruncatedPyramid(req(r, "s"), req(r, "sp"), req(r, "h")));
    }

    private void handleTru(HttpServletRequest r) {
        r.setAttribute("tru", new Cylinder(req(r, "r"), req(r, "h")));
    }

    private void handleNon(HttpServletRequest r) {
        r.setAttribute("non", new Cone(req(r, "r"), req(r, "h")));
    }

    private void handleNonCut(HttpServletRequest r) {
        r.setAttribute("noncut", new TruncatedCone(req(r, "r"), req(r, "rp"), req(r, "h")));
    }

    private void handleCau(HttpServletRequest r) {
        r.setAttribute("cau", new Sphere(req(r, "r")));
    }

    private void handleTuDienDeu(HttpServletRequest r) {
        r.setAttribute("tdd", new RegularTetrahedron(req(r, "a")));
    }

    private void handleBatDienDeu(HttpServletRequest r) {
        r.setAttribute("shape", new Octahedron(req(r, "a")));
    }

    private void handleMuoiHai(HttpServletRequest r) {
        r.setAttribute("shape", new Dodecahedron(req(r, "a")));
    }

    private void handleHaiMuoi(HttpServletRequest r) {
        r.setAttribute("shape", new Icosahedron(req(r, "a")));
    }

    private void handleChomCau(HttpServletRequest r) {
        r.setAttribute("shape", new SphericalCap(req(r, "r"), req(r, "h")));
    }

    private void handleDoiCau(HttpServletRequest r) {
        r.setAttribute("shape", new SphericalSegment(req(r, "r1"), req(r, "r2"), req(r, "h")));
    }
}
