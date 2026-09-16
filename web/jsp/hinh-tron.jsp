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
    <title>Hình Tròn - Công Thức, Tính Toán & Lời Giải Chi Tiết</title>
    <meta name="title" content="Hình Tròn - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta name="description" content="Tính chu vi, diện tích, đường kính hình tròn chính xác theo số Pi kèm giải thích chi tiết.">
    <meta name="author" content="MaxxAlan">
    <meta name="robots" content="index, follow">
    <meta name="theme-color" content="#2b6cb0">

    <!-- Open Graph / Facebook / Zalo -->
    <meta property="og:type" content="article">
    <meta property="og:url" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/hinh-tron">
    <meta property="og:title" content="Hình Tròn - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta property="og:description" content="Tính chu vi, diện tích, đường kính hình tròn chính xác theo số Pi kèm giải thích chi tiết.">
    <meta property="og:image" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/web/assets/og-image.jpg?v=2">
    <meta property="og:image:width" content="1200">
    <meta property="og:image:height" content="630">
    <meta property="og:locale" content="vi_VN">
    <meta property="og:site_name" content="Tính Toán Hình Học">

    <!-- Twitter -->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:url" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/hinh-tron">
    <meta property="twitter:title" content="Hình Tròn - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta property="twitter:description" content="Tính chu vi, diện tích, đường kính hình tròn chính xác theo số Pi kèm giải thích chi tiết.">
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
        <h1>Hình Tròn</h1>

        <div class="calc-grid">
            <div class="calc-col-left">
                <div class="svg-wrap">
            <svg id="circleSvg" viewBox="0 0 240 220" xmlns="http://www.w3.org/2000/svg">
                <circle id="svgCircle" cx="120" cy="110" r="75" fill="#ebf8ff" stroke="#2b6cb0" stroke-width="2"/>
                <line id="svgRadiusLine" x1="120" y1="110" x2="195" y2="110" stroke="#e53e3e" stroke-width="2" stroke-dasharray="4,3"/>
                <text id="svgLabelR" x="155" y="103" font-size="12" font-weight="600" fill="#e53e3e">r</text>
                <circle id="svgCenter" cx="120" cy="110" r="3.5" fill="#2b6cb0"/>
            </svg>
        </div>

                <div class="formula-box">
                    <h2>
                        <svg viewBox="0 0 24 24"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg>
                        Công Thức Tính
                    </h2>
                    <ul id="formulaList">
                        <li id="fm-c" data-inputs="r">
                            Chu vi: <span class="var-token" data-var="C">C</span> = 2π<span class="var-token" data-var="r">r</span>
                        </li>
                        <li id="fm-s" data-inputs="r">
                            Diện tích: <span class="var-token" data-var="S">S</span> = π<span class="var-token" data-var="r">r</span>²
                        </li>
                        <li id="fm-d" data-inputs="r">
                            Đường kính: <span class="var-token" data-var="d">d</span> = 2<span class="var-token" data-var="r">r</span>
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
        <form class="calc-form" method="post" action="${pageContext.request.contextPath}/hinh-tron">
            <div class="form-row">
                <label>Bán kính (r):</label>
                <input type="number" id="inputR" step="any" name="r" required value="${param.r}" placeholder="Nhập bán kính r">
            </div>
            <div class="form-actions">
                <button type="submit" class="btn-calc">Tính toán</button>
                <button type="reset" class="btn-reset" onclick="window.location.href=window.location.pathname">Làm mới</button>
            </div>
        </form>

        <% if (request.getAttribute("ht") != null) { %>
        <div class="result-box">
            <h2>Kết quả & Các bước giải chi tiết</h2>
            <div class="step-detail">
                <p><strong>1. Chu vi (C):</strong></p>
                <p>\(C = 2\pi r = 2 \times \pi \times ${param.r} \approx \) <strong><fmt:formatNumber value="${requestScope.ht.getPerimeter()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị dài</span></p>
            </div>
            <div class="step-detail">
                <p><strong>2. Diện tích (S):</strong></p>
                <p>\(S = \pi r^2 = \pi \times ${param.r}^2 \approx \) <strong><fmt:formatNumber value="${requestScope.ht.getArea()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị diện tích</span></p>
            </div>
            <div class="step-detail">
                <p><strong>3. Đường kính (d):</strong></p>
                <p>\(d = 2r = 2 \times ${param.r} = \) <strong><fmt:formatNumber value="${requestScope.ht.getDiameter()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị dài</span></p>
            </div>
        </div>
        <% } %>
                <a href="${pageContext.request.contextPath}/tinh-toan-hinh-hoc" class="btn-home-bottom">Về trang chủ</a>
            </div>
        </div>
    </div>

    <script>
        function watchFormulas() {
            var inR = parseFloat(document.getElementById('inputR').value);
            var hasR = !isNaN(inR) && inR > 0;
            document.querySelectorAll('.var-token').forEach(function(el) { el.classList.remove('var-known','var-target'); });
            document.querySelectorAll('.formula-box li').forEach(function(el) { el.classList.remove('formula-ready'); });
            if (hasR) {
                document.querySelectorAll('.var-token[data-var="r"]').forEach(function(el) { el.classList.add('var-known'); });
                ['fm-c','fm-s','fm-d'].forEach(function(id) { document.getElementById(id).classList.add('formula-ready'); });
                ['C','S','d'].forEach(function(v) {
                    document.querySelectorAll('.var-token[data-var="'+v+'"]').forEach(function(el) { el.classList.add('var-target'); });
                });
            }
        }
        function updateSvgShape() {
            var inR = parseFloat(document.getElementById('inputR').value);
            document.getElementById('svgLabelR').textContent = (!isNaN(inR) && inR > 0) ? ("r = " + inR) : "r";
        }
        function handleAll() { watchFormulas(); updateSvgShape(); }
        window.addEventListener('DOMContentLoaded', handleAll);
        document.getElementById('inputR').addEventListener('input', handleAll);
    </script>

    <footer class="app-footer">
        © MaxxAlan. Hệ thống công cụ học tập và ôn luyện hình học trực quan.
    </footer>

</body>
</html>
