<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Primary Meta Tags -->
    <title>Hình Thang - Công Thức, Tính Toán & Lời Giải Chi Tiết</title>
    <meta name="title" content="Hình Thang - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta name="description" content="Tính diện tích và chu vi hình thang từ đáy lớn, đáy nhỏ, chiều cao và hai cạnh bên.">
    <meta name="author" content="MaxxAlan">
    <meta name="robots" content="index, follow">
    <meta name="theme-color" content="#2b6cb0">

    <!-- Open Graph / Facebook / Zalo -->
    <meta property="og:type" content="article">
    <meta property="og:url" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/hinh-thang">
    <meta property="og:title" content="Hình Thang - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta property="og:description" content="Tính diện tích và chu vi hình thang từ đáy lớn, đáy nhỏ, chiều cao và hai cạnh bên.">
    <meta property="og:image" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/web/assets/og-image.jpg">
    <meta property="og:image:width" content="1200">
    <meta property="og:image:height" content="630">
    <meta property="og:locale" content="vi_VN">
    <meta property="og:site_name" content="Tính Toán Hình Học Online">

    <!-- Twitter -->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:url" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/hinh-thang">
    <meta property="twitter:title" content="Hình Thang - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta property="twitter:description" content="Tính diện tích và chu vi hình thang từ đáy lớn, đáy nhỏ, chiều cao và hai cạnh bên.">
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
        <h1>Hình Thang</h1>

        <div class="calc-layout">
            <div class="calc-col-left">
                <div class="svg-wrap">
            <svg id="thangSvg" viewBox="0 0 280 170" xmlns="http://www.w3.org/2000/svg">
                <polygon id="svgPoly" points="70,35 190,35 240,135 20,135" fill="#ebf8ff" stroke="#2b6cb0" stroke-width="2"/>
                <line id="svgH" x1="70" y1="35" x2="70" y2="135" stroke="#e53e3e" stroke-width="1.5" stroke-dasharray="4,3"/>
                <text id="svgLabelA" x="130" y="25" text-anchor="middle" font-size="12" font-weight="600" fill="#2b6cb0">a (đáy nhỏ)</text>
                <text id="svgLabelB" x="130" y="152" text-anchor="middle" font-size="12" font-weight="600" fill="#2b6cb0">b (đáy lớn)</text>
                <text id="svgLabelH" x="55" y="88" font-size="11" font-weight="600" fill="#e53e3e">h</text>
            </svg>
        </div>

        <div class="formula-box">
            <h2>Công thức</h2>
            <ul>
                <li>Diện tích: \(S = \dfrac{(a+b)\cdot h}{2}\)</li>
                <li>Đường trung bình: \(m = \dfrac{a+b}{2}\)</li>
            </ul>
        </div>
            </div>
            <div class="calc-col-right">
                <% if (request.getAttribute("error") != null) { %>
            <div style="color: #b91c1c; margin-bottom: 15px; padding: 12px; background: #fee2e2; border-radius: 6px; border: 1px solid #f87171;">
                <strong>Lỗi:</strong> ${requestScope.error}
            </div>
        <% } %>
        <form class="calc-form" method="post" action="${pageContext.request.contextPath}/hinh-thang">
            <div class="form-row">
                <label>Đáy nhỏ (a):</label>
                <input type="number" id="inputA" step="any" name="a" required value="${param.a}" placeholder="Đáy nhỏ a">
            </div>
            <div class="form-row">
                <label>Đáy lớn (b):</label>
                <input type="number" id="inputB" step="any" name="b" required value="${param.b}" placeholder="Đáy lớn b">
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

        <% if (request.getAttribute("thang") != null) { %>
        <div class="result-box">
            <h2>Kết quả & Các bước giải chi tiết</h2>
            <div class="step-detail">
                <p><strong>1. Diện tích (S):</strong></p>
                <p>\(S = \dfrac{(a + b) \times h}{2} = \dfrac{(${param.a} + ${param.b}) \times ${param.h}}{2} = \) <strong><fmt:formatNumber value="${requestScope.thang.getArea()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị diện tích</span></p>
            </div>
            <div class="step-detail">
                <p><strong>2. Đường trung bình (m):</strong></p>
                <p>\(m = \dfrac{a + b}{2} = \dfrac{${param.a} + ${param.b}}{2} = \) <strong><fmt:formatNumber value="${requestScope.thang.getMedian()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị dài</span></p>
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
            document.getElementById('svgLabelA').textContent = (!isNaN(inA) && inA > 0) ? ('a = ' + inA) : 'a (đáy nhỏ)';
            document.getElementById('svgLabelB').textContent = (!isNaN(inB) && inB > 0) ? ('b = ' + inB) : 'b (đáy lớn)';
            document.getElementById('svgLabelH').textContent = (!isNaN(inH) && inH > 0) ? ('h = ' + inH) : 'h';
        }
        window.addEventListener('DOMContentLoaded', updateSvgShape);
        document.getElementById('inputA').addEventListener('input', updateSvgShape);
        document.getElementById('inputB').addEventListener('input', updateSvgShape);
        document.getElementById('inputH').addEventListener('input', updateSvgShape);
    </script>

    <footer class="app-footer">
        © MaxxAlan. Hệ thống công cụ học tập và ôn luyện hình học trực quan.
    </footer>

</body>
</html>
