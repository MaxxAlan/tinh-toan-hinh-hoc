<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Primary Meta Tags -->
    <title>Hình Nón Cụt - Công Thức, Tính Toán & Lời Giải Chi Tiết</title>
    <meta name="title" content="Hình Nón Cụt - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta name="description" content="Tính thể tích và diện tích xung quanh hình nón cụt từ bán kính 2 đáy và chiều cao.">
    <meta name="author" content="MaxxAlan">
    <meta name="robots" content="index, follow">
    <meta name="theme-color" content="#2b6cb0">

    <!-- Open Graph / Facebook / Zalo -->
    <meta property="og:type" content="article">
    <meta property="og:url" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/hinh-non-cut">
    <meta property="og:title" content="Hình Nón Cụt - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta property="og:description" content="Tính thể tích và diện tích xung quanh hình nón cụt từ bán kính 2 đáy và chiều cao.">
    <meta property="og:image" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/og-image.jpg">
    <meta property="og:image:width" content="1200">
    <meta property="og:image:height" content="630">
    <meta property="og:locale" content="vi_VN">
    <meta property="og:site_name" content="Tính Toán Hình Học Online">

    <!-- Twitter -->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:url" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/hinh-non-cut">
    <meta property="twitter:title" content="Hình Nón Cụt - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta property="twitter:description" content="Tính thể tích và diện tích xung quanh hình nón cụt từ bán kính 2 đáy và chiều cao.">
    <meta property="twitter:image" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/og-image.jpg">
    <link rel="icon" type="image/svg+xml" href="favicon.svg">
    <link rel="stylesheet" href="css/style.css">
    <script>
        MathJax = { tex: { inlineMath: [['\\(','\\)']] }, svg: { fontCache: 'global' } };
    </script>
    <script src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-svg.js" async></script>
</head>
<body>
    <div class="container">
        <h1>Hình Nón Cụt</h1>

        <div class="calc-layout">
            <div class="calc-col-left">
                <div class="svg-wrap">
            <svg viewBox="0 0 240 220" xmlns="http://www.w3.org/2000/svg">
                <ellipse cx="120" cy="180" rx="80" ry="20" fill="#ebf8ff" stroke="#2b6cb0" stroke-width="2"/>
                <ellipse cx="120" cy="55" rx="40" ry="12" fill="#dbeafe" stroke="#2b6cb0" stroke-width="2"/>
                <line x1="80" y1="55" x2="40" y2="180" stroke="#2b6cb0" stroke-width="2"/>
                <line x1="160" y1="55" x2="200" y2="180" stroke="#2b6cb0" stroke-width="2"/>
                <line x1="120" y1="55" x2="120" y2="180" stroke="#e53e3e" stroke-width="1.5" stroke-dasharray="4,3"/>
                <text id="svgLabelH" x="126" y="120" font-size="11" font-weight="600" fill="#e53e3e">h</text>
                <text id="svgLabelR" x="165" y="192" font-size="11" font-weight="600" fill="#2b6cb0">r</text>
                <text id="svgLabelRp" x="140" y="48" font-size="11" font-weight="600" fill="#2b6cb0">r'</text>
                <text x="170" y="115" font-size="11" font-weight="600" fill="#2b6cb0">l</text>
            </svg>
        </div>

        <div class="formula-box">
            <h2>📐 Công thức</h2>
            <ul>
                <li>Đường sinh: \(l = \sqrt{h^2 + (r - r')^2}\)</li>
                <li>Thể tích: \(V = \dfrac{\pi h}{3}\left(r^2 + rr' + r'^2\right)\)</li>
                <li>Diện tích xung quanh: \(S_{xq} = \pi(r + r')\cdot l\)</li>
            </ul>
        </div>
            </div>
            <div class="calc-col-right">
                <% if (request.getAttribute("error") != null) { %>
            <div style="color: #b91c1c; margin-bottom: 15px; padding: 12px; background: #fee2e2; border-radius: 6px; border: 1px solid #f87171;">
                <strong>Lỗi:</strong> ${requestScope.error}
            </div>
        <% } %>
        <form class="calc-form" method="post" action="${pageContext.request.contextPath}/hinh-non-cut">
            <div class="form-row">
                <label>Bán kính đáy lớn (r):</label>
                <input type="number" id="inputR" step="any" name="r" required value="${param.r}" placeholder="Bán kính đáy lớn r">
            </div>
            <div class="form-row">
                <label>Bán kính đáy nhỏ (r'):</label>
                <input type="number" id="inputRp" step="any" name="rp" required value="${param.rp}" placeholder="Bán kính đáy nhỏ r'">
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

        <% if (request.getAttribute("noncut") != null) { %>
        <div class="result-box">
            <h2>📊 Kết quả & Các bước giải chi tiết</h2>
            <div class="step-detail">
                <p><strong>1. Đường sinh (l):</strong></p>
                <p>\(l = \sqrt{h^2 + (r - r')^2} = \sqrt{${param.h}^2 + (${param.r} - ${param.rp})^2} \approx \) <strong><fmt:formatNumber value="${requestScope.noncut.getSlantHeight()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị dài</span></p>
            </div>
            <div class="step-detail">
                <p><strong>2. Thể tích (V):</strong></p>
                <p>\(V = \dfrac{\pi h}{3}(r^2 + r\cdot r' + r'^2) = \dfrac{\pi \times ${param.h}}{3}(${param.r}^2 + ${param.r}\times${param.rp} + ${param.rp}^2) \approx \) <strong><fmt:formatNumber value="${requestScope.noncut.getVolume()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị thể tích</span></p>
            </div>
            <div class="step-detail">
                <p><strong>3. Diện tích xung quanh (S_xq):</strong></p>
                <p>\(S_{xq} = \pi (r + r') l = \pi \times (${param.r} + ${param.rp}) \times <fmt:formatNumber value="${requestScope.noncut.getSlantHeight()}" pattern="#,##0.####"/> \approx \) <strong><fmt:formatNumber value="${requestScope.noncut.getLateralArea()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị diện tích</span></p>
            </div>
        </div>
        <% } %>
                <a href="tinh-toan-hinh-hoc" class="btn-home">🏠 Về trang chủ</a>
            </div>
        </div>
    </div>

    <script>
        function updateSvgShape() {
            var inR = parseFloat(document.getElementById('inputR').value);
            var inRp = parseFloat(document.getElementById('inputRp').value);
            var inH = parseFloat(document.getElementById('inputH').value);
            document.getElementById('svgLabelR').textContent = (!isNaN(inR) && inR > 0) ? ('r = ' + inR) : 'r';
            document.getElementById('svgLabelRp').textContent = (!isNaN(inRp) && inRp > 0) ? ("r' = " + inRp) : "r'";
            document.getElementById('svgLabelH').textContent = (!isNaN(inH) && inH > 0) ? ('h = ' + inH) : 'h';
        }
        window.addEventListener('DOMContentLoaded', updateSvgShape);
        document.getElementById('inputR').addEventListener('input', updateSvgShape);
        document.getElementById('inputRp').addEventListener('input', updateSvgShape);
        document.getElementById('inputH').addEventListener('input', updateSvgShape);
    </script>
</body>
</html>
