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
    <title>Bát Diện Đều - Công Thức, Tính Toán & Lời Giải Chi Tiết</title>
    <meta name="title" content="Bát Diện Đều - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta name="description" content="Tính thể tích và diện tích toàn phần khối bát diện đều cạnh a với các bước giải chi tiết chuẩn THPT.">
    <meta name="author" content="MaxxAlan">
    <meta name="robots" content="index, follow">
    <meta name="theme-color" content="#2b6cb0">

    <!-- Open Graph / Facebook / Zalo -->
    <meta property="og:type" content="article">
    <meta property="og:url" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/bat-dien-deu">
    <meta property="og:title" content="Bát Diện Đều - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta property="og:description" content="Tính thể tích và diện tích toàn phần khối bát diện đều cạnh a với các bước giải chi tiết chuẩn THPT.">
    <meta property="og:image" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/web/assets/og-image.jpg?v=2">
    <meta property="og:image:width" content="1200">
    <meta property="og:image:height" content="630">
    <meta property="og:locale" content="vi_VN">
    <meta property="og:site_name" content="Tính Toán Hình Học">

    <!-- Twitter -->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:url" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/bat-dien-deu">
    <meta property="twitter:title" content="Bát Diện Đều - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta property="twitter:description" content="Tính thể tích và diện tích toàn phần khối bát diện đều cạnh a với các bước giải chi tiết chuẩn THPT.">
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
        <h1>Bát Diện Đều</h1>
        <p class="page-desc">Khối đa diện đều \(\{3;4\}\): 8 mặt tam giác đều, 6 đỉnh, 12 cạnh. Cấu tạo từ 2 chóp tứ giác đều úp đáy vào nhau.</p>

        <div class="calc-grid">
            <div class="calc-col-left">
                <div class="svg-wrap">
            <svg viewBox="0 0 240 220" xmlns="http://www.w3.org/2000/svg">
                <!-- middle rhombus (equator) -->
                <polygon points="120,25 195,110 120,195 45,110" fill="#ebf8ff" stroke="#2b6cb0" stroke-width="2"/>
                <!-- equator dashed -->
                <line x1="45" y1="110" x2="195" y2="110" stroke="#2b6cb0" stroke-width="1.5" stroke-dasharray="5,3"/>
                <!-- vertical axis -->
                <line x1="120" y1="25" x2="120" y2="195" stroke="#38a169" stroke-width="1" stroke-dasharray="3,3"/>
                <!-- face medians -->
                <line x1="120" y1="25" x2="45" y2="110" stroke="#2b6cb0" stroke-width="1"/>
                <line x1="120" y1="25" x2="195" y2="110" stroke="#2b6cb0" stroke-width="1"/>
                <line x1="120" y1="195" x2="45" y2="110" stroke="#2b6cb0" stroke-width="1"/>
                <line x1="120" y1="195" x2="195" y2="110" stroke="#2b6cb0" stroke-width="1"/>
                <circle cx="120" cy="25" r="3.5" fill="#2b6cb0"/>
                <circle cx="120" cy="195" r="3.5" fill="#2b6cb0"/>
                <circle cx="45" cy="110" r="3" fill="#2b6cb0"/>
                <circle cx="195" cy="110" r="3" fill="#2b6cb0"/>
                <circle cx="120" cy="110" r="3" fill="#e53e3e"/>
                <text id="svgLabelA" x="162" y="62" font-size="12" font-weight="600" fill="#e53e3e">a</text>
                <text x="126" y="114" font-size="10" fill="#38a169">O</text>
            </svg>
        </div>

                <div class="formula-box">
                    <h2>
                        <svg viewBox="0 0 24 24"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg>
                        Công Thức Tính
                    </h2>
                    <ul id="formulaList">
                        <li id="fm-v" data-inputs="a">
                            Thể tích: <span class="var-token" data-var="V">V</span> = <span class="var-token" data-var="a">a</span>³√2/3
                        </li>
                        <li id="fm-s" data-inputs="a">
                            Diện tích toàn phần: <span class="var-token" data-var="S">S</span> = 2<span class="var-token" data-var="a">a</span>²√3
                        </li>
                        <li id="fm-s1" data-inputs="a">
                            Diện tích 1 mặt: <span class="var-token" data-var="S1">S₁</span> = <span class="var-token" data-var="a">a</span>²√3/4
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
        <form class="calc-form" method="post" action="${pageContext.request.contextPath}/app?page=bat-dien-deu">
            <div class="form-row">
                <label>Cạnh (a):</label>
                <input type="number" id="inputA" step="any" name="a" required value="${param.a}" placeholder="Cạnh a">
            </div>
            <div class="form-actions">
                <button type="submit" class="btn-calc">Tính toán</button>
                <button type="reset" class="btn-reset" onclick="window.location.href='${pageContext.request.contextPath}/app?page=bat-dien-deu'">Làm mới</button>
            </div>
        </form>

        <c:if test="${not empty requestScope.shape}">
        <div class="result-box">
            <h2>Kết quả & Các bước giải chi tiết</h2>
            <div class="step-detail">
                <p><strong>1. Thể tích (V):</strong></p>
                <p>\(V = \dfrac{a^3\sqrt{2}}{3} = \dfrac{${param.a}^3\sqrt{2}}{3} \approx \) <strong><fmt:formatNumber value="${requestScope.shape.getVolume()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị thể tích</span></p>
            </div>
            <div class="step-detail">
                <p><strong>2. Diện tích toàn phần (S_tp):</strong></p>
                <p>\(S_{tp} = 2a^2\sqrt{3} = 2(${param.a})^2\sqrt{3} \approx \) <strong><fmt:formatNumber value="${requestScope.shape.getSurfaceArea()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị diện tích</span></p>
            </div>
        </div>
        </c:if>
                <a href="${pageContext.request.contextPath}/app?page=home" class="btn-home-bottom">Về trang chủ</a>
            </div>
        </div>
    </div>

    <script>
        function watchFormulas() {
            var val = parseFloat(document.getElementById('inputA').value);
            var has = !isNaN(val) && val > 0;
            document.querySelectorAll('.var-token').forEach(function(el) { el.classList.remove('var-known','var-target'); });
            document.querySelectorAll('.formula-box li').forEach(function(el) { el.classList.remove('formula-ready'); });
            if (has) {
                document.querySelectorAll('.var-token[data-var="a"]').forEach(function(el) { el.classList.add('var-known'); });
                ['fm-v','fm-s','fm-s1'].forEach(function(id) { var n = document.getElementById(id); if (n) n.classList.add('formula-ready'); });
                ['V','S','S1'].forEach(function(v) {
                    document.querySelectorAll('.var-token[data-var="'+v+'"]').forEach(function(el) { el.classList.add('var-target'); });
                });
            }
        }
        function updateSvgShape() {
            var inA = parseFloat(document.getElementById('inputA').value);
            document.getElementById('svgLabelA').textContent = (!isNaN(inA) && inA > 0) ? ('a = ' + inA) : 'a';
        }
        function handleAll() { watchFormulas(); updateSvgShape(); }
        window.addEventListener('DOMContentLoaded', handleAll);
        document.getElementById('inputA').addEventListener('input', handleAll);
    </script>

    <footer class="app-footer">
        © MaxxAlan. Hệ thống công cụ học tập và ôn luyện hình học trực quan.
    </footer>

</body>
</html>
