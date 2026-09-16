package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Parallelogram;

public class ParallelogramController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/jsp/hinh-binh-hanh.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
    
            double a = Double.parseDouble(request.getParameter("a"));
            double b = Double.parseDouble(request.getParameter("b"));
            double h = Double.parseDouble(request.getParameter("h"));
            double alpha = Double.parseDouble(request.getParameter("alpha"));
            if (a <= 0 || b <= 0 || h <= 0 || alpha <= 0) {
                request.setAttribute("error", "Vui lòng nhập các kích thước lớn hơn 0 và hợp lệ.");
                request.getRequestDispatcher("/jsp/hinh-binh-hanh.jsp").forward(request, response);
                return;
            }
            Parallelogram x = new Parallelogram(a, b, h, alpha);
            request.setAttribute("hbh", x);
            request.getRequestDispatcher("/jsp/hinh-binh-hanh.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Vui lòng nhập số hợp lệ.");
            request.getRequestDispatcher("/jsp/hinh-binh-hanh.jsp").forward(request, response);
        }
    }
}
