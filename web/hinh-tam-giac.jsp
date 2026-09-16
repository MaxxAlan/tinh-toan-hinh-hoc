<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Hình Tam Giác</title>
    <link rel="icon" type="image/svg+xml" href="favicon.svg">
    <link rel="stylesheet" href="css/style.css">
    <script>
        MathJax = { tex: { inlineMath: [['\\(','\\)']] }, svg: { fontCache: 'global' } };
    </script>
    <script src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-svg.js" async></script>
</head>
<body>
    <div class="container">
        <h1>Hình Tam Giác</h1>

        <div class="svg-wrap">
            <svg viewBox="0 0 240 180" xmlns="http://www.w3.org/2000/svg">
                <polygon points="90,30 25,145 215,145" fill="#ebf8ff" stroke="#2b6cb0" stroke-width="2"/>
                <line x1="90" y1="30" x2="90" y2="145" stroke="#e53e3e" stroke-width="1.5" stroke-dasharray="4,3"/>
                <text id="svgLabelA" x="120" y="162" text-anchor="middle" font-size="12" font-weight="600" fill="#2b6cb0">a (đáy)</text>
                <text id="svgLabelB" x="42" y="85" font-size="12" font-weight="600" fill="#2b6cb0">b</text>
                <text id="svgLabelC" x="160" y="85" font-size="12" font-weight="600" fill="#2b6cb0">c</text>
                <text id="svgLabelH" x="97" y="90" font-size="11" font-weight="600" fill="#e53e3e">h</text>
            </svg>
        </div>

        <div class="formula-box">
            <h2>📐 Công thức</h2>
            <ul>
                <li>Chu vi: \(C = a + b + c\)</li>
                <li>Diện tích cơ bản: \(S = \dfrac{1}{2}\cdot a \cdot h\)</li>
                <li>Công thức Heron: \(S = \sqrt{p(p-a)(p-b)(p-c)},\quad p = \dfrac{a+b+c}{2}\)</li>
                <li>Bán kính ngoại tiếp: \(R = \dfrac{abc}{4S}\) | Bán kính nội tiếp: \(r = \dfrac{S}{p}\)</li>
            </ul>
        </div>

        <% if (request.getAttribute("error") != null) { %>
            <div style="color: #b91c1c; margin-bottom: 15px; padding: 12px; background: #fee2e2; border-radius: 6px; border: 1px solid #f87171;">
                <strong>Lỗi:</strong> ${requestScope.error}
            </div>
        <% } %>
        <form class="calc-form" method="post" action="${pageContext.request.contextPath}/TriangleController">
            <div class="form-row">
                <label>Cạnh đáy (a):</label>
                <input type="number" id="inputA" step="any" name="a" required value="${param.a}" placeholder="Cạnh a">
            </div>
            <div class="form-row">
                <label>Cạnh bên 1 (b):</label>
                <input type="number" id="inputB" step="any" name="b" required value="${param.b}" placeholder="Cạnh b">
            </div>
            <div class="form-row">
                <label>Cạnh bên 2 (c):</label>
                <input type="number" id="inputC" step="any" name="c" required value="${param.c}" placeholder="Cạnh c">
            </div>
            <div class="form-row">
                <label>Chiều cao (h) ứng với a:</label>
                <input type="number" id="inputH" step="any" name="h" required value="${param.h}" placeholder="Chiều cao h">
            </div>
            <div class="form-row">
                <input type="submit" value="Tính toán" class="btn-calc">
                <button type="reset" class="btn-calc" style="margin-left: 10px; background-color: #718096;" onclick="window.location.href=window.location.pathname">Làm mới</button>
            </div>
        </form>

        <% if (request.getAttribute("tg") != null) { %>
        <div class="result-box">
            <h2>📊 Kết quả & Các bước giải chi tiết</h2>
            <div class="step-detail">
                <p><strong>1. Chu vi (C):</strong></p>
                <p>\(C = a + b + c = ${param.a} + ${param.b} + ${param.c} = \) <strong><fmt:formatNumber value="${requestScope.tg.getPerimeter()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị dài</span></p>
            </div>
            <div class="step-detail">
                <p><strong>2. Diện tích cơ bản (½·a·h):</strong></p>
                <p>\(S = \dfrac{1}{2} \times a \times h = \dfrac{1}{2} \times ${param.a} \times ${param.h} = \) <strong><fmt:formatNumber value="${requestScope.tg.getArea()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị diện tích</span></p>
            </div>
            <div class="step-detail">
                <p><strong>3. Diện tích theo công thức Heron:</strong></p>
                <p>\(p = \dfrac{${param.a} + ${param.b} + ${param.c}}{2}\) | \(S = \sqrt{p(p-a)(p-b)(p-c)} = \) <strong><fmt:formatNumber value="${requestScope.tg.getAreaHeron()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị diện tích</span></p>
            </div>
            <div class="step-detail">
                <p><strong>4. Bán kính ngoại tiếp (R):</strong></p>
                <p>\(R = \dfrac{a \times b \times c}{4S} \approx \) <strong><fmt:formatNumber value="${requestScope.tg.getCircumradius()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị dài</span></p>
            </div>
            <div class="step-detail">
                <p><strong>5. Bán kính nội tiếp (r):</strong></p>
                <p>\(r = \dfrac{S}{p} \approx \) <strong><fmt:formatNumber value="${requestScope.tg.getInradius()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị dài</span></p>
            </div>
        </div>
        <% } %>

        <a href="tinh-toan-hinh-hoc.html" class="btn-home">🏠 Về trang chủ</a>
    </div>

    <script>
        function updateSvgShape() {
            var inA = parseFloat(document.getElementById('inputA').value);
            var inB = parseFloat(document.getElementById('inputB').value);
            var inC = parseFloat(document.getElementById('inputC').value);
            var inH = parseFloat(document.getElementById('inputH').value);
            document.getElementById('svgLabelA').textContent = (!isNaN(inA) && inA > 0) ? ('a = ' + inA) : 'a (đáy)';
            document.getElementById('svgLabelB').textContent = (!isNaN(inB) && inB > 0) ? ('b = ' + inB) : 'b';
            document.getElementById('svgLabelC').textContent = (!isNaN(inC) && inC > 0) ? ('c = ' + inC) : 'c';
            document.getElementById('svgLabelH').textContent = (!isNaN(inH) && inH > 0) ? ('h = ' + inH) : 'h';
        }
        window.addEventListener('DOMContentLoaded', updateSvgShape);
        document.getElementById('inputA').addEventListener('input', updateSvgShape);
        document.getElementById('inputB').addEventListener('input', updateSvgShape);
        document.getElementById('inputC').addEventListener('input', updateSvgShape);
        document.getElementById('inputH').addEventListener('input', updateSvgShape);
    </script>
</body>
</html>
