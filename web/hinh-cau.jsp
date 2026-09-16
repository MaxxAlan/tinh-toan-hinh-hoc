<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Hình Cầu</title>
    <link rel="icon" type="image/svg+xml" href="favicon.svg">
    <link rel="stylesheet" href="css/style.css">
    <script>
        MathJax = { tex: { inlineMath: [['\\(','\\)']] }, svg: { fontCache: 'global' } };
    </script>
    <script src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-svg.js" async></script>
</head>
<body>
    <div class="container">
        <h1>Hình Cầu</h1>

        <div class="svg-wrap">
            <svg viewBox="0 0 240 220" xmlns="http://www.w3.org/2000/svg">
                <circle cx="120" cy="110" r="75" fill="#ebf8ff" stroke="#2b6cb0" stroke-width="2"/>
                <ellipse cx="120" cy="110" rx="75" ry="25" fill="none" stroke="#2b6cb0" stroke-width="1.5" stroke-dasharray="4,4"/>
                <line x1="120" y1="110" x2="195" y2="110" stroke="#e53e3e" stroke-width="1.5" stroke-dasharray="4,3"/>
                <text id="svgLabelR" x="155" y="103" font-size="12" font-weight="600" fill="#e53e3e">R</text>
                <circle cx="120" cy="110" r="3" fill="#2b6cb0"/>
            </svg>
        </div>

        <div class="formula-box">
            <h2>📐 Công thức</h2>
            <ul>
                <li>Thể tích: \(V = \dfrac{4}{3}\pi R^3\)</li>
                <li>Diện tích mặt cầu: \(S = 4\pi R^2\)</li>
            </ul>
        </div>

        <% if (request.getAttribute("error") != null) { %>
            <div style="color: #b91c1c; margin-bottom: 15px; padding: 12px; background: #fee2e2; border-radius: 6px; border: 1px solid #f87171;">
                <strong>Lỗi:</strong> ${requestScope.error}
            </div>
        <% } %>
        <form class="calc-form" method="post" action="${pageContext.request.contextPath}/SphereController">
            <div class="form-row">
                <label>Bán kính (R):</label>
                <input type="number" id="inputR" step="any" name="r" required value="${param.r}" placeholder="Bán kính R">
            </div>
            <div class="form-row">
                <input type="submit" value="Tính toán" class="btn-calc">
                <button type="reset" class="btn-calc" style="margin-left: 10px; background-color: #718096;" onclick="window.location.href=window.location.pathname">Làm mới</button>
            </div>
        </form>

        <% if (request.getAttribute("cau") != null) { %>
        <div class="result-box">
            <h2>📊 Kết quả & Các bước giải chi tiết</h2>
            <div class="step-detail">
                <p><strong>1. Thể tích (V):</strong></p>
                <p>\(V = \dfrac{4}{3}\pi R^3 = \dfrac{4}{3} \times \pi \times ${param.r}^3 \approx \) <strong><fmt:formatNumber value="${requestScope.cau.getVolume()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị thể tích</span></p>
            </div>
            <div class="step-detail">
                <p><strong>2. Diện tích mặt cầu (S):</strong></p>
                <p>\(S = 4\pi R^2 = 4 \times \pi \times ${param.r}^2 \approx \) <strong><fmt:formatNumber value="${requestScope.cau.getSurfaceArea()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị diện tích</span></p>
            </div>
        </div>
        <% } %>

        <a href="tinh-toan-hinh-hoc.html" class="btn-home">🏠 Về trang chủ</a>
    </div>

    <script>
        function updateSvgShape() {
            var inR = parseFloat(document.getElementById('inputR').value);
            document.getElementById('svgLabelR').textContent = (!isNaN(inR) && inR > 0) ? ('R = ' + inR) : 'R';
        }
        window.addEventListener('DOMContentLoaded', updateSvgShape);
        document.getElementById('inputR').addEventListener('input', updateSvgShape);
    </script>
</body>
</html>
