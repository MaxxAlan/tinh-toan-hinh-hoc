package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Triangle;

public class TriangleController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/jsp/hinh-tam-giac.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
    
            double a = Double.parseDouble(request.getParameter("a"));
            double b = Double.parseDouble(request.getParameter("b"));
            double c = Double.parseDouble(request.getParameter("c"));
            double h = Double.parseDouble(request.getParameter("h"));
            if (a <= 0 || b <= 0 || c <= 0 || h <= 0 || (a+b<=c) || (a+c<=b) || (b+c<=a)) {
                request.setAttribute("error", "Vui lòng nhập các kích thước lớn hơn 0 và hợp lệ.");
                request.getRequestDispatcher("/jsp/hinh-tam-giac.jsp").forward(request, response);
                return;
            }
            Triangle x = new Triangle(a, b, c, h);
            request.setAttribute("tg", x);
            request.getRequestDispatcher("/jsp/hinh-tam-giac.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Vui lòng nhập số hợp lệ.");
            request.getRequestDispatcher("/jsp/hinh-tam-giac.jsp").forward(request, response);
        }
    }
}
