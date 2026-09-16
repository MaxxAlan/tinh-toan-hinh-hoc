<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Hình Vuông</title>
    <link rel="icon" type="image/svg+xml" href="favicon.svg">
    <link rel="stylesheet" href="css/style.css">
    <script>
        MathJax = { tex: { inlineMath: [['\\(','\\)']] }, svg: { fontCache: 'global' } };
    </script>
    <script src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-svg.js" async></script>
</head>
<body>
    <div class="container">
        <h1>Hình Vuông</h1>

        <div class="svg-wrap">
            <svg id="sqSvg" viewBox="0 0 240 220" xmlns="http://www.w3.org/2000/svg">
                <rect id="svgSq" x="40" y="40" width="140" height="140" fill="#ebf8ff" stroke="#2b6cb0" stroke-width="2" rx="3"/>
                <line id="svgDiag" x1="40" y1="40" x2="180" y2="180" stroke="#e53e3e" stroke-width="1.5" stroke-dasharray="4,4"/>
                <circle id="svgInc" cx="110" cy="110" r="70" fill="none" stroke="#38a169" stroke-width="1" stroke-dasharray="3,3"/>
                <text id="svgLabelA" x="110" y="28" text-anchor="middle" font-size="13" font-weight="600" fill="#2b6cb0">a</text>
                <text id="svgLabelD" x="115" y="105" font-size="11" fill="#e53e3e">d</text>
            </svg>
        </div>

        <div class="formula-box">
            <h2>📐 Công thức</h2>
            <ul>
                <li>Chu vi: \(C = 4a\)</li>
                <li>Diện tích: \(S = a^2\)</li>
                <li>Đường chéo: \(d = a\sqrt{2}\)</li>
                <li>Bán kính ngoại tiếp: \(R = \dfrac{a\sqrt{2}}{2}\)</li>
                <li>Bán kính nội tiếp: \(r = \dfrac{a}{2}\)</li>
            </ul>
        </div>

        <% if (request.getAttribute("error") != null) { %>
            <div style="color: #b91c1c; margin-bottom: 15px; padding: 12px; background: #fee2e2; border-radius: 6px; border: 1px solid #f87171;">
                <strong>Lỗi:</strong> ${requestScope.error}
            </div>
        <% } %>
        <form class="calc-form" method="post" action="${pageContext.request.contextPath}/hinh-vuong">
            <div class="form-row">
                <label>Cạnh (a):</label>
                <input type="number" id="inputA" step="any" name="a" required value="${param.a}" placeholder="Nhập cạnh a">
            </div>
            <div class="form-row">
                <input type="submit" value="Tính toán" class="btn-calc">
                <button type="reset" class="btn-calc" style="margin-left: 10px; background-color: #718096;" onclick="window.location.href=window.location.pathname">Làm mới</button>
            </div>
        </form>

        <% if (request.getAttribute("hv") != null) { %>
        <div class="result-box">
            <h2>📊 Kết quả & Các bước giải chi tiết</h2>
            <div class="step-detail">
                <p><strong>1. Chu vi (C):</strong></p>
                <p>\(C = 4 \times a = 4 \times ${param.a} = \) <strong><fmt:formatNumber value="${requestScope.hv.getPerimeter()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị dài</span></p>
            </div>
            <div class="step-detail">
                <p><strong>2. Diện tích (S):</strong></p>
                <p>\(S = a^2 = ${param.a}^2 = \) <strong><fmt:formatNumber value="${requestScope.hv.getArea()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị diện tích</span></p>
            </div>
            <div class="step-detail">
                <p><strong>3. Đường chéo (d):</strong></p>
                <p>\(d = a\sqrt{2} = ${param.a}\sqrt{2} \approx \) <strong><fmt:formatNumber value="${requestScope.hv.getDiagonal()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị dài</span></p>
            </div>
            <div class="step-detail">
                <p><strong>4. Bán kính ngoại tiếp (R):</strong></p>
                <p>\(R = \dfrac{a\sqrt{2}}{2} = \dfrac{${param.a}\sqrt{2}}{2} \approx \) <strong><fmt:formatNumber value="${requestScope.hv.getCircumradius()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị dài</span></p>
            </div>
            <div class="step-detail">
                <p><strong>5. Bán kính nội tiếp (r):</strong></p>
                <p>\(r = \dfrac{a}{2} = \dfrac{${param.a}}{2} = \) <strong><fmt:formatNumber value="${requestScope.hv.getInradius()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị dài</span></p>
            </div>
        </div>
        <% } %>

        <a href="tinh-toan-hinh-hoc" class="btn-home">🏠 Về trang chủ</a>
    </div>

    <script>
        function updateSvgShape() {
            var valA = document.getElementById('inputA').value.trim();
            var inA = parseFloat(valA);
            var side = (!isNaN(inA) && inA > 0) ? inA : 10;
            // chuẩn hóa scale trong hộp 150x150
            var s = 140;
            var rect = document.getElementById('svgSq');
            var diag = document.getElementById('svgDiag');
            var inc = document.getElementById('svgInc');
            var labelA = document.getElementById('svgLabelA');
            labelA.textContent = (!isNaN(inA) && inA > 0) ? ("a = " + inA) : "a";
        }
        window.addEventListener('DOMContentLoaded', updateSvgShape);
        document.getElementById('inputA').addEventListener('input', updateSvgShape);
    </script>
</body>
</html>
