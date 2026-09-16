<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Primary Meta Tags -->
    <title>Hình Bình Hành - Công Thức, Tính Toán & Lời Giải Chi Tiết</title>
    <meta name="title" content="Hình Bình Hành - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta name="description" content="Tính chu vi, diện tích và đường chéo hình bình hành nhanh chóng, chính xác.">
    <meta name="author" content="MaxxAlan">
    <meta name="robots" content="index, follow">
    <meta name="theme-color" content="#2b6cb0">

    <!-- Open Graph / Facebook / Zalo -->
    <meta property="og:type" content="article">
    <meta property="og:url" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/hinh-binh-hanh">
    <meta property="og:title" content="Hình Bình Hành - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta property="og:description" content="Tính chu vi, diện tích và đường chéo hình bình hành nhanh chóng, chính xác.">
    <meta property="og:image" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/og-image.jpg">
    <meta property="og:image:width" content="1200">
    <meta property="og:image:height" content="630">
    <meta property="og:locale" content="vi_VN">
    <meta property="og:site_name" content="Tính Toán Hình Học Online">

    <!-- Twitter -->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:url" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/hinh-binh-hanh">
    <meta property="twitter:title" content="Hình Bình Hành - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta property="twitter:description" content="Tính chu vi, diện tích và đường chéo hình bình hành nhanh chóng, chính xác.">
    <meta property="twitter:image" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/og-image.jpg">
    <link rel="icon" type="image/svg+xml" href="favicon.svg">
    <link rel="stylesheet" href="css/style.css">
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
        <h1>Hình Bình Hành</h1>

        <div class="calc-layout">
            <div class="calc-col-left">
                <div class="svg-wrap">
            <svg viewBox="0 0 260 160" xmlns="http://www.w3.org/2000/svg">
                <polygon points="65,25 235,25 195,135 25,135" fill="#ebf8ff" stroke="#2b6cb0" stroke-width="2"/>
                <line x1="65" y1="25" x2="65" y2="135" stroke="#e53e3e" stroke-width="1.5" stroke-dasharray="4,3"/>
                <text id="svgLabelA" x="150" y="18" text-anchor="middle" font-size="12" font-weight="600" fill="#2b6cb0">a (đáy)</text>
                <text id="svgLabelB" x="15" y="85" font-size="12" font-weight="600" fill="#2b6cb0">b</text>
                <text id="svgLabelH" x="72" y="85" font-size="11" font-weight="600" fill="#e53e3e">h</text>
                <text id="svgLabelAlpha" x="42" y="130" font-size="11" font-weight="600" fill="#d69e2e">α</text>
            </svg>
        </div>

        <div class="formula-box">
            <h2>Công thức</h2>
            <ul>
                <li>Chu vi: \(C = 2(a + b)\)</li>
                <li>Diện tích (theo chiều cao): \(S = a \cdot h\)</li>
                <li>Diện tích (theo góc): \(S = a \cdot b \cdot \sin\alpha\)</li>
            </ul>
        </div>
            </div>
            <div class="calc-col-right">
                <% if (request.getAttribute("error") != null) { %>
            <div style="color: #b91c1c; margin-bottom: 15px; padding: 12px; background: #fee2e2; border-radius: 6px; border: 1px solid #f87171;">
                <strong>Lỗi:</strong> ${requestScope.error}
            </div>
        <% } %>
        <form class="calc-form" method="post" action="${pageContext.request.contextPath}/hinh-binh-hanh">
            <div class="form-row">
                <label>Cạnh đáy (a):</label>
                <input type="number" id="inputA" step="any" name="a" required value="${param.a}" placeholder="Cạnh đáy a">
            </div>
            <div class="form-row">
                <label>Cạnh bên (b):</label>
                <input type="number" id="inputB" step="any" name="b" required value="${param.b}" placeholder="Cạnh bên b">
            </div>
            <div class="form-row">
                <label>Chiều cao (h):</label>
                <input type="number" id="inputH" step="any" name="h" required value="${param.h}" placeholder="Chiều cao h">
            </div>
            <div class="form-row">
                <label>Góc α (độ):</label>
                <input type="number" id="inputAlpha" step="any" name="alpha" required value="${param.alpha}" placeholder="Góc alpha (độ)">
            </div>
            <div class="form-actions">
                <button type="submit" class="btn-calc">Tính toán</button>
                <button type="reset" class="btn-reset" onclick="window.location.href=window.location.pathname">Làm mới</button>
            </div>
        </form>

        <% if (request.getAttribute("hbh") != null) { %>
        <div class="result-box">
            <h2>Kết quả & Các bước giải chi tiết</h2>
            <div class="step-detail">
                <p><strong>1. Chu vi (C):</strong></p>
                <p>\(C = 2 \times (a + b) = 2 \times (${param.a} + ${param.b}) = \) <strong><fmt:formatNumber value="${requestScope.hbh.getPerimeter()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị dài</span></p>
            </div>
            <div class="step-detail">
                <p><strong>2. Diện tích theo chiều cao (a×h):</strong></p>
                <p>\(S = a \times h = ${param.a} \times ${param.h} = \) <strong><fmt:formatNumber value="${requestScope.hbh.getAreaByHeight()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị diện tích</span></p>
            </div>
            <div class="step-detail">
                <p><strong>3. Diện tích theo góc (a×b×sinα):</strong></p>
                <p>\(S = a \times b \times \sin(${param.alpha}^\circ) = ${param.a} \times ${param.b} \times \sin(${param.alpha}^\circ) \approx \) <strong><fmt:formatNumber value="${requestScope.hbh.getAreaByAngle()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị diện tích</span></p>
            </div>
        </div>
        <% } %>
                <a href="${pageContext.request.contextPath}/tinh-toan-hinh-hoc" class="btn-home-bottom">Về trang chủ</a>
            </div>
        </div>
    </div>

    <script>
        function updateSvgShape() {
            var inA = parseFloat(document.getElementById('inputA').value);
            var inB = parseFloat(document.getElementById('inputB').value);
            var inH = parseFloat(document.getElementById('inputH').value);
            var inAl = parseFloat(document.getElementById('inputAlpha').value);
            document.getElementById('svgLabelA').textContent = (!isNaN(inA) && inA > 0) ? ('a = ' + inA) : 'a';
            document.getElementById('svgLabelB').textContent = (!isNaN(inB) && inB > 0) ? ('b = ' + inB) : 'b';
            document.getElementById('svgLabelH').textContent = (!isNaN(inH) && inH > 0) ? ('h = ' + inH) : 'h';
            document.getElementById('svgLabelAlpha').textContent = (!isNaN(inAl) && inAl > 0) ? (inAl + '°') : 'α';
        }
        window.addEventListener('DOMContentLoaded', updateSvgShape);
        document.getElementById('inputA').addEventListener('input', updateSvgShape);
        document.getElementById('inputB').addEventListener('input', updateSvgShape);
        document.getElementById('inputH').addEventListener('input', updateSvgShape);
        document.getElementById('inputAlpha').addEventListener('input', updateSvgShape);
    </script>

    <footer class="app-footer">
        © 2026 Tính Toán Hình Học. Hệ thống công cụ học tập và ôn luyện hình học trực quan.
    </footer>

</body>
</html>
