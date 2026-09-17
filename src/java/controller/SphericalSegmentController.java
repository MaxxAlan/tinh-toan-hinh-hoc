package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.SphericalSegment;

public class SphericalSegmentController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/jsp/doi-cau.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            double r1 = Double.parseDouble(request.getParameter("r1"));
            double r2 = Double.parseDouble(request.getParameter("r2"));
            double h = Double.parseDouble(request.getParameter("h"));
            if (r1 <= 0 || r2 <= 0 || h <= 0) {
                request.setAttribute("error", "Kích thước không hợp lệ.");
                request.getRequestDispatcher("/jsp/doi-cau.jsp").forward(request, response);
                return;
            }
            SphericalSegment x = new SphericalSegment(r1, r2, h);
            request.setAttribute("shape", x);
            request.getRequestDispatcher("/jsp/doi-cau.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Vui lòng nhập số hợp lệ.");
            request.getRequestDispatcher("/jsp/doi-cau.jsp").forward(request, response);
        }
    }
}
