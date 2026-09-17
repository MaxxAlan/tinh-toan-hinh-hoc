package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Octahedron;

public class OctahedronController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/jsp/bat-dien-deu.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            double a = Double.parseDouble(request.getParameter("a"));
            if (a <= 0) {
                request.setAttribute("error", "Vui lòng nhập kích thước lớn hơn 0.");
                request.getRequestDispatcher("/jsp/bat-dien-deu.jsp").forward(request, response);
                return;
            }
            Octahedron x = new Octahedron(a);
            request.setAttribute("shape", x);
            request.getRequestDispatcher("/jsp/bat-dien-deu.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Vui lòng nhập số hợp lệ.");
            request.getRequestDispatcher("/jsp/bat-dien-deu.jsp").forward(request, response);
        }
    }
}
