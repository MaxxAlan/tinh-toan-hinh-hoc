<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Primary Meta Tags -->
    <title>Tam Giác Đều - Công Thức, Tính Toán & Lời Giải Chi Tiết</title>
    <meta name="title" content="Tam Giác Đều - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta name="description" content="Tính nhanh diện tích, chiều cao, chu vi và bán kính tam giác đều cạnh a chuẩn công thức THPT.">
    <meta name="author" content="MaxxAlan">
    <meta name="robots" content="index, follow">
    <meta name="theme-color" content="#2b6cb0">

    <!-- Open Graph / Facebook / Zalo -->
    <meta property="og:type" content="article">
    <meta property="og:url" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/tam-giac-deu">
    <meta property="og:title" content="Tam Giác Đều - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta property="og:description" content="Tính nhanh diện tích, chiều cao, chu vi và bán kính tam giác đều cạnh a chuẩn công thức THPT.">
    <meta property="og:image" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/og-image.jpg">
    <meta property="og:image:width" content="1200">
    <meta property="og:image:height" content="630">
    <meta property="og:locale" content="vi_VN">
    <meta property="og:site_name" content="Tính Toán Hình Học Online">

    <!-- Twitter -->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:url" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/tam-giac-deu">
    <meta property="twitter:title" content="Tam Giác Đều - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta property="twitter:description" content="Tính nhanh diện tích, chiều cao, chu vi và bán kính tam giác đều cạnh a chuẩn công thức THPT.">
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
        <h1>Tam Giác Đều</h1>

        <div class="calc-layout">
            <div class="calc-col-left">
                <div class="svg-wrap">
            <svg viewBox="0 0 240 200" xmlns="http://www.w3.org/2000/svg">
                <polygon points="120,25 25,175 215,175" fill="#ebf8ff" stroke="#2b6cb0" stroke-width="2"/>
                <line x1="120" y1="25" x2="120" y2="175" stroke="#e53e3e" stroke-width="1.5" stroke-dasharray="4,3"/>
                <circle cx="120" cy="95" r="50" fill="none" stroke="#38a169" stroke-width="1" stroke-dasharray="3,3"/>
                <circle cx="120" cy="125" r="28" fill="none" stroke="#d69e2e" stroke-width="1" stroke-dasharray="3,3"/>
                <text id="svgLabelA" x="120" y="192" text-anchor="middle" font-size="12" font-weight="600" fill="#2b6cb0">a</text>
                <text x="125" y="105" font-size="11" fill="#e53e3e">h</text>
            </svg>
        </div>

        <div class="formula-box">
            <h2>Công thức</h2>
            <ul>
                <li>Chu vi: \(C = 3a\)</li>
                <li>Diện tích: \(S = \dfrac{a^2\sqrt{3}}{4}\)</li>
                <li>Chiều cao: \(h = \dfrac{a\sqrt{3}}{2}\)</li>
                <li>Bán kính ngoại tiếp: \(R = \dfrac{a\sqrt{3}}{3}\)</li>
                <li>Bán kính nội tiếp: \(r = \dfrac{a\sqrt{3}}{6}\)</li>
            </ul>
        </div>
            </div>
            <div class="calc-col-right">
                <% if (request.getAttribute("error") != null) { %>
            <div style="color: #b91c1c; margin-bottom: 15px; padding: 12px; background: #fee2e2; border-radius: 6px; border: 1px solid #f87171;">
                <strong>Lỗi:</strong> ${requestScope.error}
            </div>
        <% } %>
        <form class="calc-form" method="post" action="${pageContext.request.contextPath}/tam-giac-deu">
            <div class="form-row">
                <label>Cạnh (a):</label>
                <input type="number" id="inputA" step="any" name="a" required value="${param.a}" placeholder="Nhập cạnh a">
            </div>
            <div class="form-actions">
                <button type="submit" class="btn-calc">Tính toán</button>
                <button type="reset" class="btn-reset" onclick="window.location.href=window.location.pathname">Làm mới</button>
            </div>
        </form>

        <% if (request.getAttribute("tgd") != null) { %>
        <div class="result-box">
            <h2>Kết quả & Các bước giải chi tiết</h2>
            <div class="step-detail">
                <p><strong>1. Chu vi (C):</strong></p>
                <p>\(C = 3 \times a = 3 \times ${param.a} = \) <strong><fmt:formatNumber value="${requestScope.tgd.getPerimeter()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị dài</span></p>
            </div>
            <div class="step-detail">
                <p><strong>2. Diện tích (S):</strong></p>
                <p>\(S = \dfrac{a^2\sqrt{3}}{4} = \dfrac{${param.a}^2 \times \sqrt{3}}{4} \approx \) <strong><fmt:formatNumber value="${requestScope.tgd.getArea()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị diện tích</span></p>
            </div>
            <div class="step-detail">
                <p><strong>3. Chiều cao (h):</strong></p>
                <p>\(h = \dfrac{a\sqrt{3}}{2} = \dfrac{${param.a}\sqrt{3}}{2} \approx \) <strong><fmt:formatNumber value="${requestScope.tgd.getHeight()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị dài</span></p>
            </div>
            <div class="step-detail">
                <p><strong>4. Bán kính ngoại tiếp (R):</strong></p>
                <p>\(R = \dfrac{a\sqrt{3}}{3} = \dfrac{${param.a}\sqrt{3}}{3} \approx \) <strong><fmt:formatNumber value="${requestScope.tgd.getCircumRadius()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị dài</span></p>
            </div>
            <div class="step-detail">
                <p><strong>5. Bán kính nội tiếp (r):</strong></p>
                <p>\(r = \dfrac{a\sqrt{3}}{6} = \dfrac{${param.a}\sqrt{3}}{6} \approx \) <strong><fmt:formatNumber value="${requestScope.tgd.getInRadius()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị dài</span></p>
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
            document.getElementById('svgLabelA').textContent = (!isNaN(inA) && inA > 0) ? ('a = ' + inA) : 'a';
        }
        window.addEventListener('DOMContentLoaded', updateSvgShape);
        document.getElementById('inputA').addEventListener('input', updateSvgShape);
    </script>

    <footer class="app-footer">
        © MaxxAlan. Hệ thống công cụ học tập và ôn luyện hình học trực quan.
    </footer>

</body>
</html>
