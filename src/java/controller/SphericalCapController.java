package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.SphericalCap;

public class SphericalCapController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/jsp/chom-cau.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            double r = Double.parseDouble(request.getParameter("r"));
            double h = Double.parseDouble(request.getParameter("h"));
            if (r <= 0 || h <= 0 || h > 2 * r) {
                request.setAttribute("error", "Kích thước không hợp lệ. h phải <= 2*r.");
                request.getRequestDispatcher("/jsp/chom-cau.jsp").forward(request, response);
                return;
            }
            SphericalCap x = new SphericalCap(r, h);
            request.setAttribute("shape", x);
            request.getRequestDispatcher("/jsp/chom-cau.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Vui lòng nhập số hợp lệ.");
            request.getRequestDispatcher("/jsp/chom-cau.jsp").forward(request, response);
        }
    }
}
