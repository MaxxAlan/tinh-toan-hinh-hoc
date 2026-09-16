package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Rhombus;

public class RhombusController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("hinh-thoi.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
    
            double a = Double.parseDouble(request.getParameter("a"));
            double d1 = Double.parseDouble(request.getParameter("d1"));
            double d2 = Double.parseDouble(request.getParameter("d2"));
            double alpha = Double.parseDouble(request.getParameter("alpha"));
            if (a <= 0 || d1 <= 0 || d2 <= 0 || alpha <= 0) {
                request.setAttribute("error", "Vui lòng nhập các kích thước lớn hơn 0 và hợp lệ.");
                request.getRequestDispatcher("hinh-thoi.jsp").forward(request, response);
                return;
            }
            Rhombus x = new Rhombus(a, d1, d2, alpha);
            request.setAttribute("hthi", x);
            request.getRequestDispatcher("hinh-thoi.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Vui lòng nhập số hợp lệ.");
            request.getRequestDispatcher("hinh-thoi.jsp").forward(request, response);
        }
    }
}
