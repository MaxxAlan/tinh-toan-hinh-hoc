package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cube;

public class CubeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("hinh-lap-phuong.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
    
            double a = Double.parseDouble(request.getParameter("a"));
            if (a <= 0) {
                request.setAttribute("error", "Vui lòng nhập các kích thước lớn hơn 0 và hợp lệ.");
                request.getRequestDispatcher("hinh-lap-phuong.jsp").forward(request, response);
                return;
            }
            Cube x = new Cube(a);
            request.setAttribute("lp", x);
            request.getRequestDispatcher("hinh-lap-phuong.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Vui lòng nhập số hợp lệ.");
            request.getRequestDispatcher("hinh-lap-phuong.jsp").forward(request, response);
        }
    }
}
