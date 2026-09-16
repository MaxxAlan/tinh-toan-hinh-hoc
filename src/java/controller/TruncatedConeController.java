package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.TruncatedCone;

public class TruncatedConeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("hinh-non-cut.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
    
            double r = Double.parseDouble(request.getParameter("r"));
            double rp = Double.parseDouble(request.getParameter("rp"));
            double h = Double.parseDouble(request.getParameter("h"));
            if (r <= 0 || rp <= 0 || h <= 0) {
                request.setAttribute("error", "Vui lòng nhập các kích thước lớn hơn 0 và hợp lệ.");
                request.getRequestDispatcher("hinh-non-cut.jsp").forward(request, response);
                return;
            }
            TruncatedCone x = new TruncatedCone(r, rp, h);
            request.setAttribute("noncut", x);
            request.getRequestDispatcher("hinh-non-cut.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Vui lòng nhập số hợp lệ.");
            request.getRequestDispatcher("hinh-non-cut.jsp").forward(request, response);
        }
    }
}
