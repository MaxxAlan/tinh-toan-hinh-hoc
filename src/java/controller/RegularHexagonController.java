package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.RegularHexagon;

public class RegularHexagonController extends HttpServlet {

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
        request.getRequestDispatcher("/jsp/hinh-luc-giac-deu.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Double a = parseOptional(request.getParameter("a"));
        Double p = parseOptional(request.getParameter("p"));
        Double s = parseOptional(request.getParameter("s"));
        Double r = parseOptional(request.getParameter("r"));
        Double rIn = parseOptional(request.getParameter("rIn"));
        Double d1 = parseOptional(request.getParameter("d1"));
        Double d2 = parseOptional(request.getParameter("d2"));

        if (a == null && p == null && s == null && r == null && rIn == null && d1 == null && d2 == null) {
            request.setAttribute("error", "Vui lòng nhập ít nhất 1 thông số (cạnh a, chu vi P, diện tích S, bán kính R/r hoặc đường chéo).");
            request.getRequestDispatcher("/jsp/hinh-luc-giac-deu.jsp").forward(request, response);
            return;
        }

        RegularHexagon hex = new RegularHexagon(a, p, s, r, rIn, d1, d2);
        request.setAttribute("hex", hex);
        request.getRequestDispatcher("/jsp/hinh-luc-giac-deu.jsp").forward(request, response);
    }
}
