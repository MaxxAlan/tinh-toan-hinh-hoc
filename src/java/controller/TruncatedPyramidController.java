package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.TruncatedPyramid;

public class TruncatedPyramidController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("hinh-chop-cut.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
    
            double s = Double.parseDouble(request.getParameter("s"));
            double sp = Double.parseDouble(request.getParameter("sp"));
            double h = Double.parseDouble(request.getParameter("h"));
            if (s <= 0 || sp <= 0 || h <= 0) {
                request.setAttribute("error", "Vui lòng nhập các kích thước lớn hơn 0 và hợp lệ.");
                request.getRequestDispatcher("hinh-chop-cut.jsp").forward(request, response);
                return;
            }
            TruncatedPyramid x = new TruncatedPyramid(s, sp, h);
            request.setAttribute("chopcut", x);
            request.getRequestDispatcher("hinh-chop-cut.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Vui lòng nhập số hợp lệ.");
            request.getRequestDispatcher("hinh-chop-cut.jsp").forward(request, response);
        }
    }
}
