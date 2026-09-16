<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Hình Tròn</title>
    <link rel="icon" type="image/svg+xml" href="favicon.svg">
    <link rel="stylesheet" href="css/style.css">
    <script>
        MathJax = { tex: { inlineMath: [['\\(','\\)']] }, svg: { fontCache: 'global' } };
    </script>
    <script src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-svg.js" async></script>
</head>
<body>
    <div class="container">
        <h1>Hình Tròn</h1>

        <div class="svg-wrap">
            <svg id="circleSvg" viewBox="0 0 240 220" xmlns="http://www.w3.org/2000/svg">
                <circle id="svgCircle" cx="120" cy="110" r="75" fill="#ebf8ff" stroke="#2b6cb0" stroke-width="2"/>
                <line id="svgRadiusLine" x1="120" y1="110" x2="195" y2="110" stroke="#e53e3e" stroke-width="2" stroke-dasharray="4,3"/>
                <text id="svgLabelR" x="155" y="103" font-size="12" font-weight="600" fill="#e53e3e">r</text>
                <circle id="svgCenter" cx="120" cy="110" r="3.5" fill="#2b6cb0"/>
            </svg>
        </div>

        <div class="formula-box">
            <h2>📐 Công thức</h2>
            <ul>
                <li>Chu vi (Độ dài đường tròn): \(C = 2\pi r\)</li>
                <li>Diện tích: \(S = \pi r^2\)</li>
                <li>Đường kính: \(d = 2r\)</li>
            </ul>
        </div>

        <% if (request.getAttribute("error") != null) { %>
            <div style="color: #b91c1c; margin-bottom: 15px; padding: 12px; background: #fee2e2; border-radius: 6px; border: 1px solid #f87171;">
                <strong>Lỗi:</strong> ${requestScope.error}
            </div>
        <% } %>
        <form class="calc-form" method="post" action="${pageContext.request.contextPath}/hinh-tron">
            <div class="form-row">
                <label>Bán kính (r):</label>
                <input type="number" id="inputR" step="any" name="r" required value="${param.r}" placeholder="Nhập bán kính r">
            </div>
            <div class="form-row">
                <input type="submit" value="Tính toán" class="btn-calc">
                <button type="reset" class="btn-calc" style="margin-left: 10px; background-color: #718096;" onclick="window.location.href=window.location.pathname">Làm mới</button>
            </div>
        </form>

        <% if (request.getAttribute("ht") != null) { %>
        <div class="result-box">
            <h2>📊 Kết quả & Các bước giải chi tiết</h2>
            <div class="step-detail">
                <p><strong>1. Chu vi (C):</strong></p>
                <p>\(C = 2\pi r = 2 \times \pi \times ${param.r} \approx \) <strong><fmt:formatNumber value="${requestScope.ht.getPerimeter()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị dài</span></p>
            </div>
            <div class="step-detail">
                <p><strong>2. Diện tích (S):</strong></p>
                <p>\(S = \pi r^2 = \pi \times ${param.r}^2 \approx \) <strong><fmt:formatNumber value="${requestScope.ht.getArea()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị diện tích</span></p>
            </div>
            <div class="step-detail">
                <p><strong>3. Đường kính (d):</strong></p>
                <p>\(d = 2r = 2 \times ${param.r} = \) <strong><fmt:formatNumber value="${requestScope.ht.getDiameter()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị dài</span></p>
            </div>
        </div>
        <% } %>

        <a href="tinh-toan-hinh-hoc" class="btn-home">🏠 Về trang chủ</a>
    </div>

    <script>
        function updateSvgShape() {
            var valR = document.getElementById('inputR').value.trim();
            var inR = parseFloat(valR);
            var labelR = document.getElementById('svgLabelR');
            labelR.textContent = (!isNaN(inR) && inR > 0) ? ("r = " + inR) : "r";
        }
        window.addEventListener('DOMContentLoaded', updateSvgShape);
        document.getElementById('inputR').addEventListener('input', updateSvgShape);
    </script>
</body>
</html>
