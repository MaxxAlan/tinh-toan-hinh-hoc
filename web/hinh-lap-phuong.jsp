<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Primary Meta Tags -->
    <title>Hình Lập Phương - Công Thức, Tính Toán & Lời Giải Chi Tiết</title>
    <meta name="title" content="Hình Lập Phương - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta name="description" content="Tính thể tích, diện tích xung quanh, toàn phần và bán kính mặt cầu ngoại tiếp hình lập phương.">
    <meta name="author" content="MaxxAlan">
    <meta name="robots" content="index, follow">
    <meta name="theme-color" content="#2b6cb0">

    <!-- Open Graph / Facebook / Zalo -->
    <meta property="og:type" content="article">
    <meta property="og:url" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/hinh-lap-phuong">
    <meta property="og:title" content="Hình Lập Phương - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta property="og:description" content="Tính thể tích, diện tích xung quanh, toàn phần và bán kính mặt cầu ngoại tiếp hình lập phương.">
    <meta property="og:image" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/og-image.jpg">
    <meta property="og:image:width" content="1200">
    <meta property="og:image:height" content="630">
    <meta property="og:locale" content="vi_VN">
    <meta property="og:site_name" content="Tính Toán Hình Học Online">

    <!-- Twitter -->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:url" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/hinh-lap-phuong">
    <meta property="twitter:title" content="Hình Lập Phương - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta property="twitter:description" content="Tính thể tích, diện tích xung quanh, toàn phần và bán kính mặt cầu ngoại tiếp hình lập phương.">
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
        <h1>Hình Lập Phương</h1>

        <div class="calc-layout">
            <div class="calc-col-left">
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
            </div>
            <div class="calc-col-right">
                <% if (request.getAttribute("error") != null) { %>
            <div style="color: #b91c1c; margin-bottom: 15px; padding: 12px; background: #fee2e2; border-radius: 6px; border: 1px solid #f87171;">
                <strong>Lỗi:</strong> ${requestScope.error}
            </div>
        <% } %>
        <form class="calc-form" method="post" action="${pageContext.request.contextPath}/hinh-lap-phuong">
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
                <a href="tinh-toan-hinh-hoc" class="btn-home">🏠 Về trang chủ</a>
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
</body>
</html>
