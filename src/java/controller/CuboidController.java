package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cuboid;

public class CuboidController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("hop-chu-nhat.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
    
            double a = Double.parseDouble(request.getParameter("a"));
            double b = Double.parseDouble(request.getParameter("b"));
            double c = Double.parseDouble(request.getParameter("c"));
            if (a <= 0 || b <= 0 || c <= 0) {
                request.setAttribute("error", "Vui lòng nhập các kích thước lớn hơn 0 và hợp lệ.");
                request.getRequestDispatcher("hop-chu-nhat.jsp").forward(request, response);
                return;
            }
            Cuboid x = new Cuboid(a, b, c);
            request.setAttribute("hcn3d", x);
            request.getRequestDispatcher("hop-chu-nhat.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Vui lòng nhập số hợp lệ.");
            request.getRequestDispatcher("hop-chu-nhat.jsp").forward(request, response);
        }
    }
}
