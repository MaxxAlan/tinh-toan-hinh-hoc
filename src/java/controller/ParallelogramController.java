package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Parallelogram;

public class ParallelogramController extends HttpServlet {

    private Double parseOptional(String param) {
        if (param == null || param.trim().isEmpty()) return null;
        try {
            double v = Double.parseDouble(param.trim());
            return v > 0 ? v : null;
        } catch (NumberFormatException e) {
            return null;
        }
    }

    private Double parseAngle(String param) {
        if (param == null || param.trim().isEmpty()) return null;
        try {
            double v = Double.parseDouble(param.trim());
            return (v > 0 && v < 180) ? v : null;
        } catch (NumberFormatException e) {
            return null;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/jsp/hinh-binh-hanh.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Double a     = parseOptional(request.getParameter("a"));
        Double b     = parseOptional(request.getParameter("b"));
        Double h     = parseOptional(request.getParameter("h"));
        Double alpha = parseAngle(request.getParameter("alpha"));

        // Kiểm tra có đủ dữ kiện cho ÍT NHẤT 1 công thức:
        //  - C = 2(a+b)                  → cần a, b
        //  - S = a*h                     → cần a, h
        //  - S = a*b*sin(α)              → cần a, b, alpha
        //  - h = b*sin(α) (suy luận)     → cần b, alpha → sau đó tính S nếu có a
        //  - b = h/sin(α) (suy luận)     → cần h, alpha → sau đó tính C,S nếu có a
        //  - α = arcsin(h/b) (suy luận) → cần h, b
        boolean ok = (a != null && b != null)            // tính được C (và S nếu có h/alpha)
                  || (a != null && h != null)            // tính S=a*h
                  || (b != null && alpha != null)        // suy luận h → nếu có a tính S
                  || (h != null && alpha != null)        // suy luận b → nếu có a tính C,S
                  || (h != null && b != null);           // suy luận alpha

        if (!ok) {
            request.setAttribute("error",
                "Vui lòng nhập đủ dữ kiện cho ít nhất 1 công thức. Ví dụ: " +
                "chỉ cần (a, h) hoặc (a, b) hoặc (b, α) hoặc (h, α) hoặc (h, b).");
            request.getRequestDispatcher("/jsp/hinh-binh-hanh.jsp").forward(request, response);
            return;
        }

        Parallelogram hbh = new Parallelogram(a, b, h, alpha);

        if (!hbh.hasAnyResult()) {
            request.setAttribute("error",
                "Không thể tính toán từ các dữ kiện đã nhập. Vui lòng kiểm tra lại.");
            request.getRequestDispatcher("/jsp/hinh-binh-hanh.jsp").forward(request, response);
            return;
        }

        request.setAttribute("hbh", hbh);
        request.getRequestDispatcher("/jsp/hinh-binh-hanh.jsp").forward(request, response);
    }
}

