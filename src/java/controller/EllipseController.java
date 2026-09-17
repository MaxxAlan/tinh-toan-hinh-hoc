package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Ellipse;

public class EllipseController extends HttpServlet {

    private Double parseOptional(String param) {
        if (param == null || param.trim().isEmpty()) {
            return null;
        }
        try {
            double val = Double.parseDouble(param.trim());
            return val > 0 ? val : null;
        } catch (NumberFormatException e) {
            return null;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/jsp/hinh-elip.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Double a = parseOptional(request.getParameter("a"));
        Double b = parseOptional(request.getParameter("b"));
        Double c = parseOptional(request.getParameter("c"));
        Double e = parseOptional(request.getParameter("e"));
        Double s = parseOptional(request.getParameter("s"));
        Double twoA = parseOptional(request.getParameter("twoA"));
        Double twoB = parseOptional(request.getParameter("twoB"));
        Double twoC = parseOptional(request.getParameter("twoC"));

        // Kiểm tra xem có đủ dữ kiện hợp lệ:
        // Cần ít nhất 2 thông số trong nhóm (a, b), (twoA, twoB), (a, c), (b, c), (a, s), (a, e)
        boolean valid = (a != null && b != null)
                || (twoA != null && twoB != null)
                || (a != null && c != null)
                || (b != null && c != null)
                || (a != null && s != null)
                || (a != null && e != null);

        if (!valid) {
            request.setAttribute("error", "Vui lòng nhập đủ cặp thông số (ví dụ: bán trục a & b, hoặc trục 2a & 2b, hoặc a & c, hoặc a & diện tích S).");
            request.getRequestDispatcher("/jsp/hinh-elip.jsp").forward(request, response);
            return;
        }

        // Kiểm tra điều kiện hình học nếu có cả a và c: a > c
        double effA = (a != null) ? a : ((twoA != null) ? twoA / 2.0 : 0);
        double effC = (c != null) ? c : ((twoC != null) ? twoC / 2.0 : 0);
        if (effA > 0 && effC > 0 && effA <= effC) {
            request.setAttribute("error", "Bán trục lớn a (" + effA + ") phải lớn hơn bán tiêu cự c (" + effC + ").");
            request.getRequestDispatcher("/jsp/hinh-elip.jsp").forward(request, response);
            return;
        }

        Ellipse el = new Ellipse(a, b, c, e, s, twoA, twoB, twoC);
        request.setAttribute("el", el);
        request.getRequestDispatcher("/jsp/hinh-elip.jsp").forward(request, response);
    }
}
