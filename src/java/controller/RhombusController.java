package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Rhombus;

public class RhombusController extends HttpServlet {

    private Double parseOptional(String param) {
        if (param == null || param.trim().isEmpty()) {
            return null;
        }
        try {
            double val = Double.parseDouble(param.trim());
            return val > 0 ? val : null;
        } catch (NumberFormatException e) {
            return null;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/jsp/hinh-thoi.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Double a = parseOptional(request.getParameter("a"));
        Double d1 = parseOptional(request.getParameter("d1"));
        Double d2 = parseOptional(request.getParameter("d2"));
        Double alpha = parseOptional(request.getParameter("alpha"));

        // Kiểm tra xem có đủ dữ kiện cho ít nhất một công thức không:
        // 1. (d1 > 0 && d2 > 0)
        // 2. (a > 0 && alpha > 0)
        // 3. (a > 0 && (d1 > 0 || d2 > 0))
        // 4. (a > 0)
        boolean hasValidPath = (d1 != null && d2 != null)
                || (a != null && alpha != null)
                || (a != null && (d1 != null || d2 != null))
                || (a != null);

        if (!hasValidPath) {
            request.setAttribute("error", "Vui lòng nhập đủ dữ kiện cho ít nhất 1 công thức (ví dụ: chỉ cần 2 đường chéo d1, d2; hoặc cạnh a và góc α; hoặc cạnh a và 1 đường chéo).");
            request.getRequestDispatcher("/jsp/hinh-thoi.jsp").forward(request, response);
            return;
        }

        // Kiểm tra điều kiện hình học: nếu có cả a và d1 thì d1 < 2a
        if (a != null && d1 != null && d1 >= 2.0 * a) {
            request.setAttribute("error", "Độ dài đường chéo d1 phải nhỏ hơn 2 lần cạnh a (d1 < 2a) để tạo thành hình thoi hợp lệ.");
            request.getRequestDispatcher("/jsp/hinh-thoi.jsp").forward(request, response);
            return;
        }
        if (a != null && d2 != null && d2 >= 2.0 * a) {
            request.setAttribute("error", "Độ dài đường chéo d2 phải nhỏ hơn 2 lần cạnh a (d2 < 2a) để tạo thành hình thoi hợp lệ.");
            request.getRequestDispatcher("/jsp/hinh-thoi.jsp").forward(request, response);
            return;
        }

        Rhombus x = new Rhombus(a, d1, d2, alpha);
        request.setAttribute("hthi", x);
        request.getRequestDispatcher("/jsp/hinh-thoi.jsp").forward(request, response);
    }
}
