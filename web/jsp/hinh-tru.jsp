<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Primary Meta Tags -->
    <title>Hình Trụ - Công Thức, Tính Toán & Lời Giải Chi Tiết</title>
    <meta name="title" content="Hình Trụ - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta name="description" content="Tính diện tích xung quanh, toàn phần và thể tích khối trụ tròn xoay bán kính r, chiều cao h.">
    <meta name="author" content="MaxxAlan">
    <meta name="robots" content="index, follow">
    <meta name="theme-color" content="#2b6cb0">

    <!-- Open Graph / Facebook / Zalo -->
    <meta property="og:type" content="article">
    <meta property="og:url" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/hinh-tru">
    <meta property="og:title" content="Hình Trụ - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta property="og:description" content="Tính diện tích xung quanh, toàn phần và thể tích khối trụ tròn xoay bán kính r, chiều cao h.">
    <meta property="og:image" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/web/assets/og-image.jpg">
    <meta property="og:image:width" content="1200">
    <meta property="og:image:height" content="630">
    <meta property="og:locale" content="vi_VN">
    <meta property="og:site_name" content="Tính Toán Hình Học Online">

    <!-- Twitter -->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:url" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/hinh-tru">
    <meta property="twitter:title" content="Hình Trụ - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta property="twitter:description" content="Tính diện tích xung quanh, toàn phần và thể tích khối trụ tròn xoay bán kính r, chiều cao h.">
    <meta property="twitter:image" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/web/assets/og-image.jpg">
    <link rel="icon" type="image/svg+xml" href="${pageContext.request.contextPath}/assets/favicon.svg">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script>
        MathJax = { tex: { inlineMath: [['\\(','\\)']] }, svg: { fontCache: 'global' } };
    </script>
    <script src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-svg.js" async></script>
</head>
<body>
    <!-- App Header -->
    <header class="app-header">
        <div class="header-inner">
            <a href="${pageContext.request.contextPath}/tinh-toan-hinh-hoc" class="brand">
                <div class="brand-icon">
                    <svg viewBox="0 0 24 24"><polygon points="3 20 21 20 12 4 3 20"></polygon><line x1="12" y1="4" x2="12" y2="20"></line></svg>
                </div>
                <span>Tính Toán Hình Học</span>
            </a>
            <a href="${pageContext.request.contextPath}/tinh-toan-hinh-hoc" class="nav-back-link">
                <svg viewBox="0 0 24 24"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
                <span>Về trang chủ</span>
            </a>
        </div>
    </header>

    <div class="container">
        <h1>Hình Trụ</h1>

        <div class="calc-layout">
            <div class="calc-col-left">
                <div class="svg-wrap">
            <svg viewBox="0 0 240 230" xmlns="http://www.w3.org/2000/svg">
                <ellipse cx="120" cy="45" rx="70" ry="20" fill="#dbeafe" stroke="#2b6cb0" stroke-width="2"/>
                <line x1="50" y1="45" x2="50" y2="175" stroke="#2b6cb0" stroke-width="2"/>
                <line x1="190" y1="45" x2="190" y2="175" stroke="#2b6cb0" stroke-width="2"/>
                <ellipse cx="120" cy="175" rx="70" ry="20" fill="#ebf8ff" stroke="#2b6cb0" stroke-width="2"/>
                <line x1="120" y1="45" x2="190" y2="45" stroke="#e53e3e" stroke-width="1.5" stroke-dasharray="4,3"/>
                <line x1="200" y1="45" x2="200" y2="175" stroke="#e53e3e" stroke-width="1.5" stroke-dasharray="4,3"/>
                <text id="svgLabelR" x="155" y="40" font-size="11" font-weight="600" fill="#e53e3e">r</text>
                <text id="svgLabelH" x="206" y="115" font-size="11" font-weight="600" fill="#e53e3e">h</text>
            </svg>
        </div>

        <div class="formula-box">
            <h2>Công thức</h2>
            <ul>
                <li>Thể tích: \(V = \pi r^2 h\)</li>
                <li>Diện tích xung quanh: \(S_{xq} = 2\pi r h\)</li>
                <li>Diện tích toàn phần: \(S_{tp} = 2\pi r(h + r)\)</li>
            </ul>
        </div>
            </div>
            <div class="calc-col-right">
                <% if (request.getAttribute("error") != null) { %>
            <div style="color: #b91c1c; margin-bottom: 15px; padding: 12px; background: #fee2e2; border-radius: 6px; border: 1px solid #f87171;">
                <strong>Lỗi:</strong> ${requestScope.error}
            </div>
        <% } %>
        <form class="calc-form" method="post" action="${pageContext.request.contextPath}/hinh-tru">
            <div class="form-row">
                <label>Bán kính (r):</label>
                <input type="number" id="inputR" step="any" name="r" required value="${param.r}" placeholder="Bán kính r">
            </div>
            <div class="form-row">
                <label>Chiều cao (h):</label>
                <input type="number" id="inputH" step="any" name="h" required value="${param.h}" placeholder="Chiều cao h">
            </div>
            <div class="form-actions">
                <button type="submit" class="btn-calc">Tính toán</button>
                <button type="reset" class="btn-reset" onclick="window.location.href=window.location.pathname">Làm mới</button>
            </div>
        </form>

        <% if (request.getAttribute("tru") != null) { %>
        <div class="result-box">
            <h2>Kết quả & Các bước giải chi tiết</h2>
            <div class="step-detail">
                <p><strong>1. Thể tích (V):</strong></p>
                <p>\(V = \pi r^2 h = \pi \times ${param.r}^2 \times ${param.h} \approx \) <strong><fmt:formatNumber value="${requestScope.tru.getVolume()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị thể tích</span></p>
            </div>
            <div class="step-detail">
                <p><strong>2. Diện tích xung quanh (S_xq):</strong></p>
                <p>\(S_{xq} = 2\pi r h = 2 \times \pi \times ${param.r} \times ${param.h} \approx \) <strong><fmt:formatNumber value="${requestScope.tru.getLateralArea()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị diện tích</span></p>
            </div>
            <div class="step-detail">
                <p><strong>3. Diện tích toàn phần (S_tp):</strong></p>
                <p>\(S_{tp} = 2\pi r(h + r) = 2 \times \pi \times ${param.r} \times (${param.h} + ${param.r}) \approx \) <strong><fmt:formatNumber value="${requestScope.tru.getSurfaceArea()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị diện tích</span></p>
            </div>
        </div>
        <% } %>
                <a href="${pageContext.request.contextPath}/tinh-toan-hinh-hoc" class="btn-home-bottom">Về trang chủ</a>
            </div>
        </div>
    </div>

    <script>
        function updateSvgShape() {
            var inR = parseFloat(document.getElementById('inputR').value);
            var inH = parseFloat(document.getElementById('inputH').value);
            document.getElementById('svgLabelR').textContent = (!isNaN(inR) && inR > 0) ? ('r = ' + inR) : 'r';
            document.getElementById('svgLabelH').textContent = (!isNaN(inH) && inH > 0) ? ('h = ' + inH) : 'h';
        }
        window.addEventListener('DOMContentLoaded', updateSvgShape);
        document.getElementById('inputR').addEventListener('input', updateSvgShape);
        document.getElementById('inputH').addEventListener('input', updateSvgShape);
    </script>

    <footer class="app-footer">
        © MaxxAlan. Hệ thống công cụ học tập và ôn luyện hình học trực quan.
    </footer>

</body>
</html>
