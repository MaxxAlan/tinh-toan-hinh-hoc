<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tam Giác Đều</title>
    <link rel="icon" type="image/svg+xml" href="favicon.svg">
    <link rel="stylesheet" href="css/style.css">
    <script>
        MathJax = { tex: { inlineMath: [['\\(','\\)']] }, svg: { fontCache: 'global' } };
    </script>
    <script src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-svg.js" async></script>
</head>
<body>
    <div class="container">
        <h1>Tam Giác Đều</h1>

        <div class="calc-layout">
            <div class="calc-col-left">
                <div class="svg-wrap">
            <svg viewBox="0 0 240 200" xmlns="http://www.w3.org/2000/svg">
                <polygon points="120,25 25,175 215,175" fill="#ebf8ff" stroke="#2b6cb0" stroke-width="2"/>
                <line x1="120" y1="25" x2="120" y2="175" stroke="#e53e3e" stroke-width="1.5" stroke-dasharray="4,3"/>
                <circle cx="120" cy="95" r="50" fill="none" stroke="#38a169" stroke-width="1" stroke-dasharray="3,3"/>
                <circle cx="120" cy="125" r="28" fill="none" stroke="#d69e2e" stroke-width="1" stroke-dasharray="3,3"/>
                <text id="svgLabelA" x="120" y="192" text-anchor="middle" font-size="12" font-weight="600" fill="#2b6cb0">a</text>
                <text x="125" y="105" font-size="11" fill="#e53e3e">h</text>
            </svg>
        </div>

        <div class="formula-box">
            <h2>📐 Công thức</h2>
            <ul>
                <li>Chu vi: \(C = 3a\)</li>
                <li>Diện tích: \(S = \dfrac{a^2\sqrt{3}}{4}\)</li>
                <li>Chiều cao: \(h = \dfrac{a\sqrt{3}}{2}\)</li>
                <li>Bán kính ngoại tiếp: \(R = \dfrac{a\sqrt{3}}{3}\)</li>
                <li>Bán kính nội tiếp: \(r = \dfrac{a\sqrt{3}}{6}\)</li>
            </ul>
        </div>
            </div>
            <div class="calc-col-right">
                <% if (request.getAttribute("error") != null) { %>
            <div style="color: #b91c1c; margin-bottom: 15px; padding: 12px; background: #fee2e2; border-radius: 6px; border: 1px solid #f87171;">
                <strong>Lỗi:</strong> ${requestScope.error}
            </div>
        <% } %>
        <form class="calc-form" method="post" action="${pageContext.request.contextPath}/tam-giac-deu">
            <div class="form-row">
                <label>Cạnh (a):</label>
                <input type="number" id="inputA" step="any" name="a" required value="${param.a}" placeholder="Nhập cạnh a">
            </div>
            <div class="form-row">
                <input type="submit" value="Tính toán" class="btn-calc">
                <button type="reset" class="btn-calc" style="margin-left: 10px; background-color: #718096;" onclick="window.location.href=window.location.pathname">Làm mới</button>
            </div>
        </form>

        <% if (request.getAttribute("tgd") != null) { %>
        <div class="result-box">
            <h2>📊 Kết quả & Các bước giải chi tiết</h2>
            <div class="step-detail">
                <p><strong>1. Chu vi (C):</strong></p>
                <p>\(C = 3 \times a = 3 \times ${param.a} = \) <strong><fmt:formatNumber value="${requestScope.tgd.getPerimeter()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị dài</span></p>
            </div>
            <div class="step-detail">
                <p><strong>2. Diện tích (S):</strong></p>
                <p>\(S = \dfrac{a^2\sqrt{3}}{4} = \dfrac{${param.a}^2 \times \sqrt{3}}{4} \approx \) <strong><fmt:formatNumber value="${requestScope.tgd.getArea()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị diện tích</span></p>
            </div>
            <div class="step-detail">
                <p><strong>3. Chiều cao (h):</strong></p>
                <p>\(h = \dfrac{a\sqrt{3}}{2} = \dfrac{${param.a}\sqrt{3}}{2} \approx \) <strong><fmt:formatNumber value="${requestScope.tgd.getHeight()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị dài</span></p>
            </div>
            <div class="step-detail">
                <p><strong>4. Bán kính ngoại tiếp (R):</strong></p>
                <p>\(R = \dfrac{a\sqrt{3}}{3} = \dfrac{${param.a}\sqrt{3}}{3} \approx \) <strong><fmt:formatNumber value="${requestScope.tgd.getCircumRadius()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị dài</span></p>
            </div>
            <div class="step-detail">
                <p><strong>5. Bán kính nội tiếp (r):</strong></p>
                <p>\(r = \dfrac{a\sqrt{3}}{6} = \dfrac{${param.a}\sqrt{3}}{6} \approx \) <strong><fmt:formatNumber value="${requestScope.tgd.getInRadius()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị dài</span></p>
            </div>
        </div>
        <% } %>
                <a href="tinh-toan-hinh-hoc" class="btn-home">🏠 Về trang chủ</a>
            </div>
        </div>
    </div>

    <script>
        function updateSvgShape() {
            var inA = parseFloat(document.getElementById('inputA').value);
            document.getElementById('svgLabelA').textContent = (!isNaN(inA) && inA > 0) ? ('a = ' + inA) : 'a';
        }
        window.addEventListener('DOMContentLoaded', updateSvgShape);
        document.getElementById('inputA').addEventListener('input', updateSvgShape);
    </script>
</body>
</html>
