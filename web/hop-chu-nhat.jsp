<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Primary Meta Tags -->
    <title>Hình Hộp Chữ Nhật - Công Thức, Tính Toán & Lời Giải Chi Tiết</title>
    <meta name="title" content="Hình Hộp Chữ Nhật - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta name="description" content="Tính thể tích, diện tích xung quanh, diện tích toàn phần và đường chéo hình hộp chữ nhật.">
    <meta name="author" content="MaxxAlan">
    <meta name="robots" content="index, follow">
    <meta name="theme-color" content="#2b6cb0">

    <!-- Open Graph / Facebook / Zalo -->
    <meta property="og:type" content="article">
    <meta property="og:url" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/hop-chu-nhat">
    <meta property="og:title" content="Hình Hộp Chữ Nhật - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta property="og:description" content="Tính thể tích, diện tích xung quanh, diện tích toàn phần và đường chéo hình hộp chữ nhật.">
    <meta property="og:image" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/og-image.jpg">
    <meta property="og:image:width" content="1200">
    <meta property="og:image:height" content="630">
    <meta property="og:locale" content="vi_VN">
    <meta property="og:site_name" content="Tính Toán Hình Học Online">

    <!-- Twitter -->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:url" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/hop-chu-nhat">
    <meta property="twitter:title" content="Hình Hộp Chữ Nhật - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta property="twitter:description" content="Tính thể tích, diện tích xung quanh, diện tích toàn phần và đường chéo hình hộp chữ nhật.">
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
        <h1>Hộp Chữ Nhật (Hình Hộp Chữ Nhật)</h1>

        <div class="calc-layout">
            <div class="calc-col-left">
                <div class="svg-wrap">
            <svg viewBox="0 0 260 200" xmlns="http://www.w3.org/2000/svg">
                <polygon points="40,70 180,70 180,170 40,170" fill="#ebf8ff" stroke="#2b6cb0" stroke-width="2"/>
                <polygon points="40,70 80,30 220,30 180,70" fill="#dbeafe" stroke="#2b6cb0" stroke-width="2"/>
                <polygon points="180,70 220,30 220,130 180,170" fill="#bfdbfe" stroke="#2b6cb0" stroke-width="2"/>
                <line x1="40" y1="170" x2="220" y2="30" stroke="#e53e3e" stroke-width="1.5" stroke-dasharray="5,3"/>
                <text id="svgLabelA" x="110" y="188" text-anchor="middle" font-size="12" font-weight="600" fill="#2b6cb0">a</text>
                <text id="svgLabelB" x="195" y="125" font-size="12" font-weight="600" fill="#2b6cb0">b</text>
                <text id="svgLabelC" x="200" y="55" font-size="12" font-weight="600" fill="#2b6cb0">c</text>
                <text x="125" y="95" font-size="11" fill="#e53e3e">d</text>
            </svg>
        </div>

        <div class="formula-box">
            <h2>📐 Công thức</h2>
            <ul>
                <li>Thể tích: \(V = a \cdot b \cdot c\)</li>
                <li>Diện tích toàn phần: \(S_{tp} = 2(ab + bc + ca)\)</li>
                <li>Đường chéo: \(d = \sqrt{a^2 + b^2 + c^2}\)</li>
                <li>Bán kính mặt cầu ngoại tiếp: \(R = \dfrac{\sqrt{a^2 + b^2 + c^2}}{2}\)</li>
            </ul>
        </div>
            </div>
            <div class="calc-col-right">
                <% if (request.getAttribute("error") != null) { %>
            <div style="color: #b91c1c; margin-bottom: 15px; padding: 12px; background: #fee2e2; border-radius: 6px; border: 1px solid #f87171;">
                <strong>Lỗi:</strong> ${requestScope.error}
            </div>
        <% } %>
        <form class="calc-form" method="post" action="${pageContext.request.contextPath}/hop-chu-nhat">
            <div class="form-row">
                <label>Chiều dài (a):</label>
                <input type="number" id="inputA" step="any" name="a" required value="${param.a}" placeholder="Chiều dài a">
            </div>
            <div class="form-row">
                <label>Chiều rộng (b):</label>
                <input type="number" id="inputB" step="any" name="b" required value="${param.b}" placeholder="Chiều rộng b">
            </div>
            <div class="form-row">
                <label>Chiều cao (c):</label>
                <input type="number" id="inputC" step="any" name="c" required value="${param.c}" placeholder="Chiều cao c">
            </div>
            <div class="form-actions">
                <button type="submit" class="btn-calc">Tính toán</button>
                <button type="reset" class="btn-reset" onclick="window.location.href=window.location.pathname">Làm mới</button>
            </div>
        </form>

        <% if (request.getAttribute("hcn3d") != null) { %>
        <div class="result-box">
            <h2>📊 Kết quả & Các bước giải chi tiết</h2>
            <div class="step-detail">
                <p><strong>1. Thể tích (V):</strong></p>
                <p>\(V = a \times b \times c = ${param.a} \times ${param.b} \times ${param.c} = \) <strong><fmt:formatNumber value="${requestScope.hcn3d.getVolume()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị thể tích</span></p>
            </div>
            <div class="step-detail">
                <p><strong>2. Diện tích toàn phần (S):</strong></p>
                <p>\(S_{tp} = 2(ab + bc + ca) = 2(${param.a}\times${param.b} + ${param.b}\times${param.c} + ${param.c}\times${param.a}) = \) <strong><fmt:formatNumber value="${requestScope.hcn3d.getSurfaceArea()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị diện tích</span></p>
            </div>
            <div class="step-detail">
                <p><strong>3. Đường chéo (d):</strong></p>
                <p>\(d = \sqrt{a^2 + b^2 + c^2} = \sqrt{${param.a}^2 + ${param.b}^2 + ${param.c}^2} \approx \) <strong><fmt:formatNumber value="${requestScope.hcn3d.getDiagonal()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị dài</span></p>
            </div>
            <div class="step-detail">
                <p><strong>4. Bán kính mặt cầu ngoại tiếp (R):</strong></p>
                <p>\(R = \dfrac{d}{2} = \dfrac{<fmt:formatNumber value="${requestScope.hcn3d.getDiagonal()}" pattern="#,##0.####"/>}{2} \approx \) <strong><fmt:formatNumber value="${requestScope.hcn3d.getCircumradius()}" pattern="#,##0.####"/></strong> <span class="unit-badge">đơn vị dài</span></p>
            </div>
        </div>
        <% } %>
                <a href="${pageContext.request.contextPath}/tinh-toan-hinh-hoc" class="btn-home">Về trang chủ</a>
            </div>
        </div>
    </div>

    <script>
        function updateSvgShape() {
            var inA = parseFloat(document.getElementById('inputA').value);
            var inB = parseFloat(document.getElementById('inputB').value);
            var inC = parseFloat(document.getElementById('inputC').value);
            document.getElementById('svgLabelA').textContent = (!isNaN(inA) && inA > 0) ? ('a = ' + inA) : 'a';
            document.getElementById('svgLabelB').textContent = (!isNaN(inB) && inB > 0) ? ('b = ' + inB) : 'b';
            document.getElementById('svgLabelC').textContent = (!isNaN(inC) && inC > 0) ? ('c = ' + inC) : 'c';
        }
        window.addEventListener('DOMContentLoaded', updateSvgShape);
        document.getElementById('inputA').addEventListener('input', updateSvgShape);
        document.getElementById('inputB').addEventListener('input', updateSvgShape);
        document.getElementById('inputC').addEventListener('input', updateSvgShape);
    </script>
</body>
</html>
