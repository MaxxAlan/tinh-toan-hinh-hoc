<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tứ Diện Đều</title>
    <link rel="icon" type="image/svg+xml" href="favicon.svg">
    <link rel="stylesheet" href="css/style.css">
    <script>
        MathJax = { tex: { inlineMath: [['\\(','\\)']] }, svg: { fontCache: 'global' } };
    </script>
    <script src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-svg.js" async></script>
</head>
<body>
    <div class="container">
        <h1>Tứ Diện Đều</h1>

        <div class="svg-wrap">
            <svg viewBox="0 0 240 220" xmlns="http://www.w3.org/2000/svg">
                <polygon points="35,180 185,180 145,140" fill="#ebf8ff" stroke="#2b6cb0" stroke-width="2"/>
                <line x1="110" y1="35" x2="35" y2="180" stroke="#2b6cb0" stroke-width="2"/>
                <line x1="110" y1="35" x2="185" y2="180" stroke="#2b6cb0" stroke-width="2"/>
                <line x1="110" y1="35" x2="145" y2="140" stroke="#2b6cb0" stroke-width="2" stroke-dasharray="5,3"/>
                <line x1="110" y1="35" x2="110" y2="165" stroke="#e53e3e" stroke-width="1.5" stroke-dasharray="4,3"/>
                <text id="svgLabelH" x="116" y="105" font-size="11" font-weight="600" fill="#e53e3e">h</text>
                <text id="svgLabelA" x="110" y="195" text-anchor="middle" font-size="12" font-weight="600" fill="#2b6cb0">a</text>
            </svg>
        </div>

        <div class="formula-box">
            <h2>📐 Công thức</h2>
            <ul>
                <li>Thể tích: \(V = \dfrac{a^3\sqrt{2}}{12}\)</li>
                <li>Diện tích toàn phần: \(S_{tp} = a^2\sqrt{3}\)</li>
                <li>Diện tích 1 mặt: \(S_1 = \dfrac{a^2\sqrt{3}}{4}\)</li>
                <li>Chiều cao: \(h = \dfrac{a\sqrt{6}}{3}\)</li>
                <li>Bán kính cầu ngoại tiếp: \(R = \dfrac{a\sqrt{6}}{4}\) | Cầu nội tiếp: \(r = \dfrac{a\sqrt{6}}{12}\)</li>
            </ul>
        </div>

        <% if (request.getAttribute("error") != null) { %>
            <div style="color: #b91c1c; margin-bottom: 15px; padding: 12px; background: #fee2e2; border-radius: 6px; border: 1px solid #f87171;">
                <strong>Lỗi:</strong> ${requestScope.error}
            </div>
        <% } %>
        <form class="calc-form" method="post" action="${pageContext.request.contextPath}/RegularTetrahedronController">
            <div class="form-row">
                <label>Cạnh (a):</label>
                <input type="number" id="inputA" step="any" name="a" required value="${param.a}" placeholder="Cạnh a">
            </div>
            <div class="form-row">
                <input type="submit" value="Tính toán" class="btn-calc">
                <button type="reset" class="btn-calc" style="margin-left: 10px; background-color: #718096;" onclick="window.location.href=window.location.pathname">Làm mới</button>
            </div>
        </form>

        <% if (request.getAttribute("tdd") != null) { %>
        <div class="result-box">
            <h2>📊 Kết quả & Các bước giải chi tiết</h2>
            <div class="step-detail">
                <p><strong>1. Thể tích (V):</strong></p>
                <p>\(V = \dfrac{a^3\sqrt{2}}{12} = \dfrac{${param.a}^3\sqrt{2}}{12} \approx \) <strong><fmt:formatNumber value="${requestScope.tdd.getVolume()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị thể tích</span></p>
            </div>
            <div class="step-detail">
                <p><strong>2. Diện tích toàn phần (S_tp):</strong></p>
                <p>\(S_{tp} = a^2\sqrt{3} = ${param.a}^2\sqrt{3} \approx \) <strong><fmt:formatNumber value="${requestScope.tdd.getSurfaceArea()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị diện tích</span></p>
            </div>
            <div class="step-detail">
                <p><strong>3. Diện tích 1 mặt:</strong></p>
                <p>\(S_1 = \dfrac{a^2\sqrt{3}}{4} = \dfrac{${param.a}^2\sqrt{3}}{4} \approx \) <strong><fmt:formatNumber value="${requestScope.tdd.getFaceArea()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị diện tích</span></p>
            </div>
            <div class="step-detail">
                <p><strong>4. Chiều cao (h):</strong></p>
                <p>\(h = \dfrac{a\sqrt{6}}{3} = \dfrac{${param.a}\sqrt{6}}{3} \approx \) <strong><fmt:formatNumber value="${requestScope.tdd.getHeight()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị dài</span></p>
            </div>
            <div class="step-detail">
                <p><strong>5. Bán kính cầu ngoại tiếp (R):</strong></p>
                <p>\(R = \dfrac{a\sqrt{6}}{4} = \dfrac{${param.a}\sqrt{6}}{4} \approx \) <strong><fmt:formatNumber value="${requestScope.tdd.getCircumradius()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị dài</span></p>
            </div>
            <div class="step-detail">
                <p><strong>6. Bán kính cầu nội tiếp (r):</strong></p>
                <p>\(r = \dfrac{a\sqrt{6}}{12} = \dfrac{${param.a}\sqrt{6}}{12} \approx \) <strong><fmt:formatNumber value="${requestScope.tdd.getInradius()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị dài</span></p>
            </div>
        </div>
        <% } %>

        <a href="tinh-toan-hinh-hoc.html" class="btn-home">🏠 Về trang chủ</a>
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
