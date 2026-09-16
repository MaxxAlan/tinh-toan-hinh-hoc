<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Hình Lập Phương</title>
    <link rel="icon" type="image/svg+xml" href="favicon.svg">
    <link rel="stylesheet" href="css/style.css">
    <script>
        MathJax = { tex: { inlineMath: [['\\(','\\)']] }, svg: { fontCache: 'global' } };
    </script>
    <script src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-svg.js" async></script>
</head>
<body>
    <div class="container">
        <h1>Hình Lập Phương</h1>

        <div class="svg-wrap">
            <svg viewBox="0 0 220 220" xmlns="http://www.w3.org/2000/svg">
                <polygon points="35,75 135,75 135,175 35,175" fill="#ebf8ff" stroke="#2b6cb0" stroke-width="2"/>
                <polygon points="35,75 75,35 175,35 135,75" fill="#dbeafe" stroke="#2b6cb0" stroke-width="2"/>
                <polygon points="135,75 175,35 175,135 135,175" fill="#bfdbfe" stroke="#2b6cb0" stroke-width="2"/>
                <line x1="35" y1="175" x2="175" y2="35" stroke="#e53e3e" stroke-width="1.5" stroke-dasharray="5,3"/>
                <text id="svgLabelA" x="85" y="192" text-anchor="middle" font-size="12" font-weight="600" fill="#2b6cb0">a</text>
                <text x="105" y="100" font-size="11" fill="#e53e3e">d=a√3</text>
            </svg>
        </div>

        <div class="formula-box">
            <h2>📐 Công thức</h2>
            <ul>
                <li>Thể tích: \(V = a^3\)</li>
                <li>Diện tích toàn phần: \(S = 6a^2\)</li>
                <li>Đường chéo: \(d = a\sqrt{3}\)</li>
                <li>Bán kính mặt cầu ngoại tiếp: \(R = \dfrac{a\sqrt{3}}{2}\)</li>
                <li>Bán kính mặt cầu nội tiếp: \(r = \dfrac{a}{2}\)</li>
            </ul>
        </div>

        <% if (request.getAttribute("error") != null) { %>
            <div style="color: #b91c1c; margin-bottom: 15px; padding: 12px; background: #fee2e2; border-radius: 6px; border: 1px solid #f87171;">
                <strong>Lỗi:</strong> ${requestScope.error}
            </div>
        <% } %>
        <form class="calc-form" method="post" action="${pageContext.request.contextPath}/CubeController">
            <div class="form-row">
                <label>Cạnh (a):</label>
                <input type="number" id="inputA" step="any" name="a" required value="${param.a}" placeholder="Cạnh a">
            </div>
            <div class="form-row">
                <input type="submit" value="Tính toán" class="btn-calc">
                <button type="reset" class="btn-calc" style="margin-left: 10px; background-color: #718096;" onclick="window.location.href=window.location.pathname">Làm mới</button>
            </div>
        </form>

        <% if (request.getAttribute("lp") != null) { %>
        <div class="result-box">
            <h2>📊 Kết quả & Các bước giải chi tiết</h2>
            <div class="step-detail">
                <p><strong>1. Thể tích (V):</strong></p>
                <p>\(V = a^3 = ${param.a}^3 = \) <strong><fmt:formatNumber value="${requestScope.lp.getVolume()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị thể tích</span></p>
            </div>
            <div class="step-detail">
                <p><strong>2. Diện tích toàn phần (S):</strong></p>
                <p>\(S_{tp} = 6a^2 = 6 \times ${param.a}^2 = \) <strong><fmt:formatNumber value="${requestScope.lp.getSurfaceArea()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị diện tích</span></p>
            </div>
            <div class="step-detail">
                <p><strong>3. Đường chéo (d):</strong></p>
                <p>\(d = a\sqrt{3} = ${param.a}\sqrt{3} \approx \) <strong><fmt:formatNumber value="${requestScope.lp.getDiagonal()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị dài</span></p>
            </div>
            <div class="step-detail">
                <p><strong>4. Bán kính cầu ngoại tiếp (R):</strong></p>
                <p>\(R = \dfrac{a\sqrt{3}}{2} = \dfrac{${param.a}\sqrt{3}}{2} \approx \) <strong><fmt:formatNumber value="${requestScope.lp.getCircumsphereRadius()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị dài</span></p>
            </div>
            <div class="step-detail">
                <p><strong>5. Bán kính cầu nội tiếp (r):</strong></p>
                <p>\(r = \dfrac{a}{2} = \dfrac{${param.a}}{2} = \) <strong><fmt:formatNumber value="${requestScope.lp.getInradius()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị dài</span></p>
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
