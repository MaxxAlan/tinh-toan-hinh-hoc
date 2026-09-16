package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cone;

public class ConeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/jsp/hinh-non.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
    
            double r = Double.parseDouble(request.getParameter("r"));
            double h = Double.parseDouble(request.getParameter("h"));
            if (r <= 0 || h <= 0) {
                request.setAttribute("error", "Vui lòng nhập các kích thước lớn hơn 0 và hợp lệ.");
                request.getRequestDispatcher("/jsp/hinh-non.jsp").forward(request, response);
                return;
            }
            Cone x = new Cone(r, h);
            request.setAttribute("non", x);
            request.getRequestDispatcher("/jsp/hinh-non.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Vui lòng nhập số hợp lệ.");
            request.getRequestDispatcher("/jsp/hinh-non.jsp").forward(request, response);
        }
    }
}
