<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Primary Meta Tags -->
    <title>Hình Lăng Trụ Đứng - Công Thức, Tính Toán & Lời Giải Chi Tiết</title>
    <meta name="title" content="Hình Lăng Trụ Đứng - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta name="description" content="Tính thể tích và diện tích hình lăng trụ đứng từ diện tích đáy và chiều cao.">
    <meta name="author" content="MaxxAlan">
    <meta name="robots" content="index, follow">
    <meta name="theme-color" content="#2b6cb0">

    <!-- Open Graph / Facebook / Zalo -->
    <meta property="og:type" content="article">
    <meta property="og:url" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/lang-tru">
    <meta property="og:title" content="Hình Lăng Trụ Đứng - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta property="og:description" content="Tính thể tích và diện tích hình lăng trụ đứng từ diện tích đáy và chiều cao.">
    <meta property="og:image" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/og-image.jpg">
    <meta property="og:image:width" content="1200">
    <meta property="og:image:height" content="630">
    <meta property="og:locale" content="vi_VN">
    <meta property="og:site_name" content="Tính Toán Hình Học Online">

    <!-- Twitter -->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:url" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/lang-tru">
    <meta property="twitter:title" content="Hình Lăng Trụ Đứng - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta property="twitter:description" content="Tính thể tích và diện tích hình lăng trụ đứng từ diện tích đáy và chiều cao.">
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
        <h1>Lăng Trụ</h1>

        <div class="calc-layout">
            <div class="calc-col-left">
                <div class="svg-wrap">
            <svg viewBox="0 0 240 220" xmlns="http://www.w3.org/2000/svg">
                <polygon points="45,170 175,170 145,135" fill="#ebf8ff" stroke="#2b6cb0" stroke-width="2"/>
                <polygon points="45,65 175,65 145,30" fill="#dbeafe" stroke="#2b6cb0" stroke-width="2"/>
                <line x1="45" y1="65" x2="45" y2="170" stroke="#2b6cb0" stroke-width="2"/>
                <line x1="175" y1="65" x2="175" y2="170" stroke="#2b6cb0" stroke-width="2"/>
                <line x1="145" y1="30" x2="145" y2="135" stroke="#2b6cb0" stroke-width="2"/>
                <line x1="185" y1="65" x2="185" y2="170" stroke="#e53e3e" stroke-width="1.5" stroke-dasharray="5,3"/>
                <text id="svgLabelH" x="192" y="120" font-size="11" font-weight="600" fill="#e53e3e">h</text>
                <text id="svgLabelB" x="110" y="58" font-size="11" font-weight="600" fill="#2b6cb0">B (đáy)</text>
            </svg>
        </div>

        <div class="formula-box">
            <h2>📐 Công thức</h2>
            <ul>
                <li>Thể tích: \(V = B \cdot h\)</li>
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
        <form class="calc-form" method="post" action="${pageContext.request.contextPath}/lang-tru">
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

        <% if (request.getAttribute("langtru") != null) { %>
        <div class="result-box">
            <h2>📊 Kết quả & Các bước giải chi tiết</h2>
            <div class="step-detail">
                <p><strong>1. Thể tích (V):</strong></p>
                <p>\(V = B \times h = ${param.baseArea} \times ${param.h} = \) <strong><fmt:formatNumber value="${requestScope.langtru.getVolume()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị thể tích</span></p>
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
