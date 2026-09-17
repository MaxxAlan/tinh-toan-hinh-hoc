<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Primary Meta Tags -->
    <title>Hình Chóp - Công Thức, Tính Toán & Lời Giải Chi Tiết</title>
    <meta name="title" content="Hình Chóp - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta name="description" content="Tính thể tích hình chóp V = 1/3 S.h và diện tích xung quanh các khối chóp đa giác.">
    <meta name="author" content="MaxxAlan">
    <meta name="robots" content="index, follow">
    <meta name="theme-color" content="#2b6cb0">

    <!-- Open Graph / Facebook / Zalo -->
    <meta property="og:type" content="article">
    <meta property="og:url" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/hinh-chop">
    <meta property="og:title" content="Hình Chóp - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta property="og:description" content="Tính thể tích hình chóp V = 1/3 S.h và diện tích xung quanh các khối chóp đa giác.">
    <meta property="og:image" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/web/assets/og-image.jpg?v=2">
    <meta property="og:image:width" content="1200">
    <meta property="og:image:height" content="630">
    <meta property="og:locale" content="vi_VN">
    <meta property="og:site_name" content="Tính Toán Hình Học">

    <!-- Twitter -->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:url" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/hinh-chop">
    <meta property="twitter:title" content="Hình Chóp - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta property="twitter:description" content="Tính thể tích hình chóp V = 1/3 S.h và diện tích xung quanh các khối chóp đa giác.">
    <meta property="twitter:image" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/web/assets/og-image.jpg?v=2">
    <link rel="icon" type="image/svg+xml" href="${pageContext.request.contextPath}/assets/favicon.svg">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css?v=3">
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
        <h1>Hình Chóp</h1>

        <div class="calc-grid">
            <div class="calc-col-left">
                <div class="svg-wrap">
            <svg viewBox="0 0 240 220" xmlns="http://www.w3.org/2000/svg">
                <polygon points="35,180 185,180 155,140" fill="#ebf8ff" stroke="#2b6cb0" stroke-width="2"/>
                <line x1="110" y1="35" x2="35" y2="180" stroke="#2b6cb0" stroke-width="2"/>
                <line x1="110" y1="35" x2="185" y2="180" stroke="#2b6cb0" stroke-width="2"/>
                <line x1="110" y1="35" x2="155" y2="140" stroke="#2b6cb0" stroke-width="2"/>
                <line x1="110" y1="35" x2="110" y2="165" stroke="#e53e3e" stroke-width="1.5" stroke-dasharray="4,3"/>
                <text x="110" y="28" text-anchor="middle" font-size="12" font-weight="600" fill="#2b6cb0">S</text>
                <text id="svgLabelH" x="115" y="105" font-size="11" font-weight="600" fill="#e53e3e">h</text>
                <text id="svgLabelB" x="110" y="195" text-anchor="middle" font-size="11" font-weight="600" fill="#2b6cb0">B (đáy)</text>
            </svg>
        </div>

                        <div class="formula-box">
                    <h2>
                        <svg viewBox="0 0 24 24"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg>
                        Công Thức Tính
                    </h2>
                    <ul id="formulaList">
                        <li id="fm-v" data-inputs="a,h">
                            Thể tích: <span class="var-token" data-var="V">V</span> = (1/3) × S<sub>đáy</sub> × <span class="var-token" data-var="h">h</span>
                        </li>
                        <li id="fm-sxq" data-inputs="a,h">
                            Diện tích xung quanh (gần đúng): <span class="var-token" data-var="Sxq">S<sub>xq</sub></span> = (1/2) × C<sub>đáy</sub> × l
                        </li>
                    </ul>
                        <li id="fm-rmc-1">
                            \(R_{mc}\) (Cạnh bên \(SA \perp\) đáy): \(R_{mc} = \sqrt{R_{\text{đáy}}^2 + \dfrac{SA^2}{4}}\)
                        </li>
                        <li id="fm-rmc-2">
                            \(R_{mc}\) (Chóp đều đỉnh \(S\), tâm đáy \(O\)): \(R_{mc} = \dfrac{SA^2}{2 \cdot SO}\)
                        </li>
                        <li id="fm-rmc-3">
                            \(R_{mc}\) (Mặt bên ⊥ đáy, giao tuyến \(GT\)): \(R_{mc} = \sqrt{R_{\text{đáy}}^2 + R_{\text{bên}}^2 - \dfrac{GT^2}{4}}\)
                        </li>
                        <li id="fm-ti-so-chop-tu-giac">
                            Tỉ số thể tích chóp tứ giác đáy bình hành: \(\dfrac{V'}{V} = \dfrac{x+y+z+t}{4xyzt}\) (với \(x+z=y+t\))
                        </li>
                        <li id="fm-khoang-cach-3net">
                            Khoảng cách chân đường vuông góc (3 nét vẽ): \(\dfrac{1}{HK^2} = \dfrac{1}{SH^2} + \dfrac{1}{HI^2} \implies HK = \dfrac{SH \cdot HI}{\sqrt{SH^2+HI^2}}\)
                        </li>
                        <li id="fm-doi-diem">
                            Công thức đổi điểm tính khoảng cách: \(\dfrac{d(A,(\alpha))}{d(B,(\alpha))} = \dfrac{IA}{IB}\)
                        </li>
                    </ul>
                    <div class="formula-legend">
                        <span class="legend-item"><span class="legend-dot dot-known"></span> <strong>Xanh</strong>: Đã nhập</span>
                        <span class="legend-item"><span class="legend-dot dot-target"></span> <strong>Vàng</strong>: Sẽ tính</span>
                    </div>
                </div>
        </div>
            <div class="calc-col-right">
                <% if (request.getAttribute("error") != null) { %>
            <div style="color: #b91c1c; margin-bottom: 15px; padding: 12px; background: #fee2e2; border-radius: 6px; border: 1px solid #f87171;">
                <strong>Lỗi:</strong> ${requestScope.error}
            </div>
        <% } %>
        <form class="calc-form" method="post" action="${pageContext.request.contextPath}/hinh-chop">
            <div class="form-row">
                <label>Diện tích đáy (B):</label>
                <input type="number" id="inputB" step="any" name="baseArea" required value="${param.baseArea}" placeholder="Diện tích đáy B">
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

        <% if (request.getAttribute("chop") != null) { %>
        <div class="result-box">
            <h2>Kết quả & Các bước giải chi tiết</h2>
            <div class="step-detail">
                <p><strong>1. Thể tích (V):</strong></p>
                <p>\(V = \dfrac{1}{3} \times B \times h = \dfrac{1}{3} \times ${param.baseArea} \times ${param.h} = \) <strong><fmt:formatNumber value="${requestScope.chop.getVolume()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị thể tích</span></p>
            </div>
        </div>
        <% } %>
                <a href="${pageContext.request.contextPath}/tinh-toan-hinh-hoc" class="btn-home-bottom">Về trang chủ</a>
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
                function watchFormulas() {
            var v1 = parseFloat(document.getElementById('inputA').value);
            var v2 = parseFloat(document.getElementById('inputH').value);
            var has1 = !isNaN(v1) && v1 > 0, has2 = !isNaN(v2) && v2 > 0;
            document.querySelectorAll('.var-token').forEach(function(el) { el.classList.remove('var-known','var-target'); });
            document.querySelectorAll('.formula-box li').forEach(function(el) { el.classList.remove('formula-ready'); });
            if (has1) document.querySelectorAll('.var-token[data-var="a"]').forEach(function(el) { el.classList.add('var-known'); });
            if (has2) document.querySelectorAll('.var-token[data-var="h"]').forEach(function(el) { el.classList.add('var-known'); });
            if (has1 && has2) {
                ['fm-v','fm-sxq'].forEach(function(id) { document.getElementById(id).classList.add('formula-ready'); });
                ['V','Sxq'].forEach(function(v) {
                    document.querySelectorAll('.var-token[data-var="'+v+'"]').forEach(function(el) { el.classList.add('var-target'); });
                });
            }
        }
        function handleAll() { watchFormulas(); updateSvgShape(); }
        window.addEventListener('DOMContentLoaded', handleAll);
        document.getElementById('inputB').addEventListener('input', updateSvgShape);
        document.getElementById('inputH').addEventListener('input', handleAll);
    </script>

    <footer class="app-footer">
        © MaxxAlan. Hệ thống công cụ học tập và ôn luyện hình học trực quan.
    </footer>

</body>
</html>
