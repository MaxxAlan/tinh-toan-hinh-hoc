<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Hình Chóp</title>
    <link rel="icon" type="image/svg+xml" href="favicon.svg">
    <link rel="stylesheet" href="css/style.css">
    <script>
        MathJax = { tex: { inlineMath: [['\\(','\\)']] }, svg: { fontCache: 'global' } };
    </script>
    <script src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-svg.js" async></script>
</head>
<body>
    <div class="container">
        <h1>Hình Chóp</h1>

        <div class="calc-layout">
            <div class="calc-col-left">
                <div class="svg-wrap">
            <svg viewBox="0 0 240 220" xmlns="http://www.w3.org/2000/svg">
                <polygon points="35,180 185,180 155,140" fill="#ebf8ff" stroke="#2b6cb0" stroke-width="2"/>
                <line x1="110" y1="35" x2="35" y2="180" stroke="#2b6cb0" stroke-width="2"/>
                <line x1="110" y1="35" x2="185" y2="180" stroke="#2b6cb0" stroke-width="2"/>
                <line x1="110" y1="35" x2="155" y2="140" stroke="#2b6cb0" stroke-width="2"/>
                <line x1="110" y1="35" x2="110" y2="165" stroke="#e53e3e" stroke-width="1.5" stroke-dasharray="4,3"/>
                <text x="110" y="28" text-anchor="middle" font-size="12" font-weight="600" fill="#2b6cb0">S</text>
                <text id="svgLabelH" x="115" y="105" font-size="11" font-weight="600" fill="#e53e3e">h</text>
                <text id="svgLabelB" x="110" y="195" text-anchor="middle" font-size="11" font-weight="600" fill="#2b6cb0">B (đáy)</text>
            </svg>
        </div>

        <div class="formula-box">
            <h2>📐 Công thức</h2>
            <ul>
                <li>Thể tích: \(V = \dfrac{1}{3}\cdot B \cdot h\)</li>
                <li>(B = diện tích đáy, h = chiều cao)</li>
            </ul>
        </div>
            </div>
            <div class="calc-col-right">
                <% if (request.getAttribute("error") != null) { %>
            <div style="color: #b91c1c; margin-bottom: 15px; padding: 12px; background: #fee2e2; border-radius: 6px; border: 1px solid #f87171;">
                <strong>Lỗi:</strong> ${requestScope.error}
            </div>
        <% } %>
        <form class="calc-form" method="post" action="${pageContext.request.contextPath}/hinh-chop">
            <div class="form-row">
                <label>Diện tích đáy (B):</label>
                <input type="number" id="inputB" step="any" name="baseArea" required value="${param.baseArea}" placeholder="Diện tích đáy B">
            </div>
            <div class="form-row">
                <label>Chiều cao (h):</label>
                <input type="number" id="inputH" step="any" name="h" required value="${param.h}" placeholder="Chiều cao h">
            </div>
            <div class="form-row">
                <input type="submit" value="Tính toán" class="btn-calc">
                <button type="reset" class="btn-calc" style="margin-left: 10px; background-color: #718096;" onclick="window.location.href=window.location.pathname">Làm mới</button>
            </div>
        </form>

        <% if (request.getAttribute("chop") != null) { %>
        <div class="result-box">
            <h2>📊 Kết quả & Các bước giải chi tiết</h2>
            <div class="step-detail">
                <p><strong>1. Thể tích (V):</strong></p>
                <p>\(V = \dfrac{1}{3} \times B \times h = \dfrac{1}{3} \times ${param.baseArea} \times ${param.h} = \) <strong><fmt:formatNumber value="${requestScope.chop.getVolume()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị thể tích</span></p>
            </div>
        </div>
        <% } %>
                <a href="tinh-toan-hinh-hoc" class="btn-home">🏠 Về trang chủ</a>
            </div>
        </div>
    </div>

    <script>
        function updateSvgShape() {
            var inB = parseFloat(document.getElementById('inputB').value);
            var inH = parseFloat(document.getElementById('inputH').value);
            document.getElementById('svgLabelB').textContent = (!isNaN(inB) && inB > 0) ? ('B = ' + inB) : 'B (đáy)';
            document.getElementById('svgLabelH').textContent = (!isNaN(inH) && inH > 0) ? ('h = ' + inH) : 'h';
        }
        window.addEventListener('DOMContentLoaded', updateSvgShape);
        document.getElementById('inputB').addEventListener('input', updateSvgShape);
        document.getElementById('inputH').addEventListener('input', updateSvgShape);
    </script>
</body>
</html>
