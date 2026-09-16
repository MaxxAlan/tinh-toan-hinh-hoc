package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Prism;

public class PrismController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/jsp/lang-tru.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
    
            double baseArea = Double.parseDouble(request.getParameter("baseArea"));
            double h = Double.parseDouble(request.getParameter("h"));
            if (baseArea <= 0 || h <= 0) {
                request.setAttribute("error", "Vui lòng nhập các kích thước lớn hơn 0 và hợp lệ.");
                request.getRequestDispatcher("/jsp/lang-tru.jsp").forward(request, response);
                return;
            }
            Prism x = new Prism(baseArea, h);
            request.setAttribute("langtru", x);
            request.getRequestDispatcher("/jsp/lang-tru.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Vui lòng nhập số hợp lệ.");
            request.getRequestDispatcher("/jsp/lang-tru.jsp").forward(request, response);
        }
    }
}
