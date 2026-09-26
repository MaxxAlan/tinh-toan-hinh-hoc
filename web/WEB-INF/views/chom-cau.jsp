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
    <title>Hình Chỏm Cầu - Công Thức, Tính Toán & Lời Giải Chi Tiết</title>
    <meta name="title" content="Hình Chỏm Cầu - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta name="description" content="Tính diện tích xung quanh và thể tích hình chỏm cầu theo bán kính R và chiều cao h với các bước giải chi tiết.">
    <meta name="author" content="MaxxAlan">
    <meta name="robots" content="index, follow">
    <meta name="theme-color" content="#2b6cb0">

    <!-- Open Graph / Facebook / Zalo -->
    <meta property="og:type" content="article">
    <meta property="og:url" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/chom-cau">
    <meta property="og:title" content="Hình Chỏm Cầu - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta property="og:description" content="Tính diện tích xung quanh và thể tích hình chỏm cầu theo bán kính R và chiều cao h với các bước giải chi tiết.">
    <meta property="og:image" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/web/assets/og-image.jpg?v=2">
    <meta property="og:image:width" content="1200">
    <meta property="og:image:height" content="630">
    <meta property="og:locale" content="vi_VN">
    <meta property="og:site_name" content="Tính Toán Hình Học">

    <!-- Twitter -->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:url" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/chom-cau">
    <meta property="twitter:title" content="Hình Chỏm Cầu - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta property="twitter:description" content="Tính diện tích xung quanh và thể tích hình chỏm cầu theo bán kính R và chiều cao h với các bước giải chi tiết.">
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
            <a href="${pageContext.request.contextPath}/app?page=home" class="brand">
                <div class="brand-icon">
                    <svg viewBox="0 0 24 24"><polygon points="3 20 21 20 12 4 3 20"></polygon><line x1="12" y1="4" x2="12" y2="20"></line></svg>
                </div>
                <span>Tính Toán Hình Học</span>
            </a>
            <a href="${pageContext.request.contextPath}/app?page=home" class="nav-back-link">
                <svg viewBox="0 0 24 24"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
                <span>Về trang chủ</span>
            </a>
        </div>
    </header>

    <div class="container">
        <h1>Hình Chỏm Cầu</h1>
        <p class="page-desc">Phần mặt cầu bị cắt bởi một mặt phẳng: bán kính cầu \(R\), chiều cao chỏm \(h\) (điều kiện \(0 < h \le 2R\)).</p>

        <div class="calc-grid">
            <div class="calc-col-left">
                <div class="svg-wrap">
            <svg viewBox="0 0 240 220" xmlns="http://www.w3.org/2000/svg">
                <!-- sphere -->
                <circle cx="120" cy="120" r="75" fill="#ebf8ff" stroke="#2b6cb0" stroke-width="2"/>
                <!-- equator dashed -->
                <ellipse cx="120" cy="120" rx="75" ry="22" fill="none" stroke="#2b6cb0" stroke-width="1" stroke-dasharray="4,4"/>
                <!-- cap shaded -->
                <path id="svgCap" d="M 55 80 A 75 75 0 0 1 185 80 L 185 80 Z" fill="#bee3f8" stroke="#e53e3e" stroke-width="2"/>
                <line id="svgChord" x1="55" y1="80" x2="185" y2="80" stroke="#e53e3e" stroke-width="1.5" stroke-dasharray="4,3"/>
                <!-- R line -->
                <line x1="120" y1="120" x2="173" y2="67" stroke="#2b6cb0" stroke-width="1.5" stroke-dasharray="4,3"/>
                <circle cx="120" cy="120" r="3" fill="#2b6cb0"/>
                <!-- h arrow -->
                <line id="svgHLine" x1="200" y1="45" x2="200" y2="80" stroke="#38a169" stroke-width="2"/>
                <polygon points="200,40 196,48 204,48" fill="#38a169"/>
                <polygon points="200,85 196,77 204,77" fill="#38a169"/>
                <text id="svgLabelR" x="148" y="88" font-size="12" font-weight="600" fill="#2b6cb0">R</text>
                <text id="svgLabelH" x="204" y="66" font-size="12" font-weight="600" fill="#38a169">h</text>
            </svg>
        </div>

                <div class="formula-box">
                    <h2>
                        <svg viewBox="0 0 24 24"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg>
                        Công Thức Tính
                    </h2>
                    <ul id="formulaList">
                        <li id="fm-s" data-inputs="r,h">
                            Diện tích xung quanh: <span class="var-token" data-var="S">S<sub>xq</sub></span> = 2π<span class="var-token" data-var="r">R</span><span class="var-token" data-var="h">h</span>
                        </li>
                        <li id="fm-v" data-inputs="r,h">
                            Thể tích: <span class="var-token" data-var="V">V</span> = π<span class="var-token" data-var="h">h</span>²(<span class="var-token" data-var="r">R</span> − <span class="var-token" data-var="h">h</span>/3)
                        </li>
                    </ul>
                    <div class="formula-legend">
                        <span class="legend-item"><span class="legend-dot dot-known"></span> <strong>Xanh</strong>: Đã nhập</span>
                        <span class="legend-item"><span class="legend-dot dot-target"></span> <strong>Vàng</strong>: Sẽ tính</span>
                    </div>
                </div>
            </div>
            <div class="calc-col-right">
                <c:if test="${not empty requestScope.error}">
            <div style="color: #b91c1c; margin-bottom: 15px; padding: 12px; background: #fee2e2; border-radius: 6px; border: 1px solid #f87171;">
                <strong>Lỗi:</strong> ${requestScope.error}
            </div>
        </c:if>
        <form class="calc-form" method="post" action="${pageContext.request.contextPath}/app?page=chom-cau">
            <div class="form-row">
                <label>Bán kính cầu (R):</label>
                <input type="number" id="inputR" step="any" name="r" required value="${param.r}" placeholder="Bán kính R">
            </div>
            <div class="form-row">
                <label>Chiều cao chỏm (h):</label>
                <input type="number" id="inputH" step="any" name="h" required value="${param.h}" placeholder="Chiều cao h">
            </div>
            <div class="form-actions">
                <button type="submit" class="btn-calc">Tính toán</button>
                <button type="reset" class="btn-reset" onclick="window.location.href='${pageContext.request.contextPath}/app?page=chom-cau'">Làm mới</button>
            </div>
        </form>

        <c:if test="${not empty requestScope.shape}">
        <div class="result-box">
            <h2>Kết quả & Các bước giải chi tiết</h2>
            <div class="step-detail">
                <p><strong>1. Diện tích xung quanh (S_xq):</strong></p>
                <p>\(S_{xq} = 2\pi Rh = 2\pi(${param.r})(${param.h}) \approx \) <strong><fmt:formatNumber value="${requestScope.shape.getSurfaceArea()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị diện tích</span></p>
            </div>
            <div class="step-detail">
                <p><strong>2. Thể tích (V):</strong></p>
                <p>\(V = \pi h^2\left(R - \dfrac{h}{3}\right) = \pi(${param.h})^2\left(${param.r} - \dfrac{${param.h}}{3}\right) \approx \) <strong><fmt:formatNumber value="${requestScope.shape.getVolume()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị thể tích</span></p>
            </div>
        </div>
        </c:if>
                <a href="${pageContext.request.contextPath}/app?page=home" class="btn-home-bottom">Về trang chủ</a>
            </div>
        </div>
    </div>

    <script>
        function watchFormulas() {
            var inR = parseFloat(document.getElementById('inputR').value);
            var inH = parseFloat(document.getElementById('inputH').value);
            var hasR = !isNaN(inR) && inR > 0, hasH = !isNaN(inH) && inH > 0;
            document.querySelectorAll('.var-token').forEach(function(el) { el.classList.remove('var-known','var-target'); });
            document.querySelectorAll('.formula-box li').forEach(function(el) { el.classList.remove('formula-ready'); });
            if (hasR) document.querySelectorAll('.var-token[data-var="r"]').forEach(function(el) { el.classList.add('var-known'); });
            if (hasH) document.querySelectorAll('.var-token[data-var="h"]').forEach(function(el) { el.classList.add('var-known'); });
            if (hasR && hasH) {
                ['fm-s','fm-v'].forEach(function(id) { var n = document.getElementById(id); if (n) n.classList.add('formula-ready'); });
                ['V','S'].forEach(function(v) {
                    document.querySelectorAll('.var-token[data-var="'+v+'"]').forEach(function(el) { el.classList.add('var-target'); });
                });
            }
        }
        function updateSvgShape() {
            var inR = parseFloat(document.getElementById('inputR').value);
            var inH = parseFloat(document.getElementById('inputH').value);
            document.getElementById('svgLabelR').textContent = (!isNaN(inR) && inR > 0) ? ('R = ' + inR) : 'R';
            document.getElementById('svgLabelH').textContent = (!isNaN(inH) && inH > 0) ? ('h = ' + inH) : 'h';
        }
        function handleAll() { watchFormulas(); updateSvgShape(); }
        window.addEventListener('DOMContentLoaded', handleAll);
        document.getElementById('inputR').addEventListener('input', handleAll);
        document.getElementById('inputH').addEventListener('input', handleAll);
    </script>

    <footer class="app-footer">
        © MaxxAlan. Hệ thống công cụ học tập và ôn luyện hình học trực quan.
    </footer>

</body>
</html>
