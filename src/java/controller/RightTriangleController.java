package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.RightTriangle;

public class RightTriangleController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/jsp/tam-giac-vuong.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
    
            double c1 = Double.parseDouble(request.getParameter("c1"));
            double c2 = Double.parseDouble(request.getParameter("c2"));
            if (c1 <= 0 || c2 <= 0) {
                request.setAttribute("error", "Vui lòng nhập các kích thước lớn hơn 0 và hợp lệ.");
                request.getRequestDispatcher("/jsp/tam-giac-vuong.jsp").forward(request, response);
                return;
            }
            RightTriangle x = new RightTriangle(c1, c2);
            request.setAttribute("tgv", x);
            request.getRequestDispatcher("/jsp/tam-giac-vuong.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Vui lòng nhập số hợp lệ.");
            request.getRequestDispatcher("/jsp/tam-giac-vuong.jsp").forward(request, response);
        }
    }
}
