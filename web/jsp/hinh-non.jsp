<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Primary Meta Tags -->
    <title>Hình Nón - Công Thức, Tính Toán & Lời Giải Chi Tiết</title>
    <meta name="title" content="Hình Nón - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta name="description" content="Tính đường sinh, diện tích xung quanh, diện tích toàn phần và thể tích hình nón tròn xoay.">
    <meta name="author" content="MaxxAlan">
    <meta name="robots" content="index, follow">
    <meta name="theme-color" content="#2b6cb0">

    <!-- Open Graph / Facebook / Zalo -->
    <meta property="og:type" content="article">
    <meta property="og:url" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/hinh-non">
    <meta property="og:title" content="Hình Nón - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta property="og:description" content="Tính đường sinh, diện tích xung quanh, diện tích toàn phần và thể tích hình nón tròn xoay.">
    <meta property="og:image" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/web/assets/og-image.jpg">
    <meta property="og:image:width" content="1200">
    <meta property="og:image:height" content="630">
    <meta property="og:locale" content="vi_VN">
    <meta property="og:site_name" content="Tính Toán Hình Học Online">

    <!-- Twitter -->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:url" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/hinh-non">
    <meta property="twitter:title" content="Hình Nón - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta property="twitter:description" content="Tính đường sinh, diện tích xung quanh, diện tích toàn phần và thể tích hình nón tròn xoay.">
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
        <h1>Hình Nón</h1>

        <div class="calc-layout">
            <div class="calc-col-left">
                <div class="svg-wrap">
            <svg viewBox="0 0 240 220" xmlns="http://www.w3.org/2000/svg">
                <ellipse cx="120" cy="180" rx="70" ry="20" fill="#ebf8ff" stroke="#2b6cb0" stroke-width="2"/>
                <line x1="120" y1="35" x2="50" y2="180" stroke="#2b6cb0" stroke-width="2"/>
                <line x1="120" y1="35" x2="190" y2="180" stroke="#2b6cb0" stroke-width="2"/>
                <line x1="120" y1="35" x2="120" y2="180" stroke="#e53e3e" stroke-width="1.5" stroke-dasharray="4,3"/>
                <line x1="120" y1="180" x2="190" y2="180" stroke="#38a169" stroke-width="1.5" stroke-dasharray="4,3"/>
                <text id="svgLabelH" x="125" y="110" font-size="11" font-weight="600" fill="#e53e3e">h</text>
                <text id="svgLabelR" x="155" y="195" font-size="11" font-weight="600" fill="#38a169">r</text>
                <text x="160" y="105" font-size="11" font-weight="600" fill="#2b6cb0">l</text>
            </svg>
        </div>

        <div class="formula-box">
            <h2>Công thức</h2>
            <ul>
                <li>Đường sinh: \(l = \sqrt{r^2 + h^2}\)</li>
                <li>Thể tích: \(V = \dfrac{1}{3}\pi r^2 h\)</li>
                <li>Diện tích xung quanh: \(S_{xq} = \pi r l\)</li>
                <li>Diện tích toàn phần: \(S_{tp} = \pi r(l + r)\)</li>
            </ul>
        </div>
            </div>
            <div class="calc-col-right">
                <% if (request.getAttribute("error") != null) { %>
            <div style="color: #b91c1c; margin-bottom: 15px; padding: 12px; background: #fee2e2; border-radius: 6px; border: 1px solid #f87171;">
                <strong>Lỗi:</strong> ${requestScope.error}
            </div>
        <% } %>
        <form class="calc-form" method="post" action="${pageContext.request.contextPath}/hinh-non">
            <div class="form-row">
                <label>Bán kính đáy (r):</label>
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

        <% if (request.getAttribute("non") != null) { %>
        <div class="result-box">
            <h2>Kết quả & Các bước giải chi tiết</h2>
            <div class="step-detail">
                <p><strong>1. Đường sinh (l):</strong></p>
                <p>\(l = \sqrt{r^2 + h^2} = \sqrt{${param.r}^2 + ${param.h}^2} \approx \) <strong><fmt:formatNumber value="${requestScope.non.getSlantHeight()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị dài</span></p>
            </div>
            <div class="step-detail">
                <p><strong>2. Thể tích (V):</strong></p>
                <p>\(V = \dfrac{1}{3}\pi r^2 h = \dfrac{1}{3} \times \pi \times ${param.r}^2 \times ${param.h} \approx \) <strong><fmt:formatNumber value="${requestScope.non.getVolume()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị thể tích</span></p>
            </div>
            <div class="step-detail">
                <p><strong>3. Diện tích xung quanh (S_xq):</strong></p>
                <p>\(S_{xq} = \pi r l = \pi \times ${param.r} \times <fmt:formatNumber value="${requestScope.non.getSlantHeight()}" pattern="#,##0.####"/> \approx \) <strong><fmt:formatNumber value="${requestScope.non.getLateralArea()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị diện tích</span></p>
            </div>
            <div class="step-detail">
                <p><strong>4. Diện tích toàn phần (S_tp):</strong></p>
                <p>\(S_{tp} = \pi r(l + r) \approx \) <strong><fmt:formatNumber value="${requestScope.non.getSurfaceArea()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị diện tích</span></p>
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
