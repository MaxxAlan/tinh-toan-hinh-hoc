<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Hình Chóp Cụt</title>
    <link rel="icon" type="image/svg+xml" href="favicon.svg">
    <link rel="stylesheet" href="css/style.css">
    <script>
        MathJax = { tex: { inlineMath: [['\\(','\\)']] }, svg: { fontCache: 'global' } };
    </script>
    <script src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-svg.js" async></script>
</head>
<body>
    <div class="container">
        <h1>Hình Chóp Cụt</h1>

        <div class="svg-wrap">
            <svg viewBox="0 0 240 200" xmlns="http://www.w3.org/2000/svg">
                <polygon points="25,170 215,170 185,135" fill="#ebf8ff" stroke="#2b6cb0" stroke-width="2"/>
                <polygon points="75,55 160,55 145,35" fill="#dbeafe" stroke="#2b6cb0" stroke-width="2"/>
                <line x1="75" y1="55" x2="25" y2="170" stroke="#2b6cb0" stroke-width="2"/>
                <line x1="160" y1="55" x2="215" y2="170" stroke="#2b6cb0" stroke-width="2"/>
                <line x1="145" y1="35" x2="185" y2="135" stroke="#2b6cb0" stroke-width="2"/>
                <line x1="120" y1="55" x2="120" y2="165" stroke="#e53e3e" stroke-width="1.5" stroke-dasharray="4,3"/>
                <text id="svgLabelH" x="126" y="115" font-size="11" font-weight="600" fill="#e53e3e">h</text>
                <text id="svgLabelSp" x="120" y="30" text-anchor="middle" font-size="11" font-weight="600" fill="#2b6cb0">S' (đáy nhỏ)</text>
                <text id="svgLabelS" x="120" y="185" text-anchor="middle" font-size="11" font-weight="600" fill="#2b6cb0">S (đáy lớn)</text>
            </svg>
        </div>

        <div class="formula-box">
            <h2>📐 Công thức</h2>
            <ul>
                <li>Thể tích: \(V = \dfrac{h}{3}\left(S + S' + \sqrt{S \cdot S'}\right)\)</li>
                <li>(S = dt đáy lớn, S' = dt đáy nhỏ, h = chiều cao)</li>
            </ul>
        </div>

        <% if (request.getAttribute("error") != null) { %>
            <div style="color: #b91c1c; margin-bottom: 15px; padding: 12px; background: #fee2e2; border-radius: 6px; border: 1px solid #f87171;">
                <strong>Lỗi:</strong> ${requestScope.error}
            </div>
        <% } %>
        <form class="calc-form" method="post" action="${pageContext.request.contextPath}/hinh-chop-cut">
            <div class="form-row">
                <label>Diện tích đáy lớn (S):</label>
                <input type="number" id="inputS" step="any" name="s" required value="${param.s}" placeholder="Diện tích đáy lớn S">
            </div>
            <div class="form-row">
                <label>Diện tích đáy nhỏ (S'):</label>
                <input type="number" id="inputSp" step="any" name="sp" required value="${param.sp}" placeholder="Diện tích đáy nhỏ S'">
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

        <% if (request.getAttribute("chopcut") != null) { %>
        <div class="result-box">
            <h2>📊 Kết quả & Các bước giải chi tiết</h2>
            <div class="step-detail">
                <p><strong>1. Thể tích (V):</strong></p>
                <p>\(V = \dfrac{h}{3}(S + S' + \sqrt{S \cdot S'}) = \dfrac{${param.h}}{3}(${param.s} + ${param.sp} + \sqrt{${param.s} \times ${param.sp}}) = \) <strong><fmt:formatNumber value="${requestScope.chopcut.getVolume()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị thể tích</span></p>
            </div>
        </div>
        <% } %>

        <a href="tinh-toan-hinh-hoc" class="btn-home">🏠 Về trang chủ</a>
    </div>

    <script>
        function updateSvgShape() {
            var inS = parseFloat(document.getElementById('inputS').value);
            var inSp = parseFloat(document.getElementById('inputSp').value);
            var inH = parseFloat(document.getElementById('inputH').value);
            document.getElementById('svgLabelS').textContent = (!isNaN(inS) && inS > 0) ? ('S = ' + inS) : 'S (đáy lớn)';
            document.getElementById('svgLabelSp').textContent = (!isNaN(inSp) && inSp > 0) ? ("S' = " + inSp) : "S' (đáy nhỏ)";
            document.getElementById('svgLabelH').textContent = (!isNaN(inH) && inH > 0) ? ('h = ' + inH) : 'h';
        }
        window.addEventListener('DOMContentLoaded', updateSvgShape);
        document.getElementById('inputS').addEventListener('input', updateSvgShape);
        document.getElementById('inputSp').addEventListener('input', updateSvgShape);
        document.getElementById('inputH').addEventListener('input', updateSvgShape);
    </script>
</body>
</html>
