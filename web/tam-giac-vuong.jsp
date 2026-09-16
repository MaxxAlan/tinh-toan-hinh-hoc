<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Primary Meta Tags -->
    <title>Tam Giác Vuông - Công Thức, Tính Toán & Lời Giải Chi Tiết</title>
    <meta name="title" content="Tam Giác Vuông - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta name="description" content="Định lý Pythagore, tính cạnh huyền, chiều cao ứng với cạnh huyền, diện tích và chu vi tam giác vuông.">
    <meta name="author" content="MaxxAlan">
    <meta name="robots" content="index, follow">
    <meta name="theme-color" content="#2b6cb0">

    <!-- Open Graph / Facebook / Zalo -->
    <meta property="og:type" content="article">
    <meta property="og:url" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/tam-giac-vuong">
    <meta property="og:title" content="Tam Giác Vuông - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta property="og:description" content="Định lý Pythagore, tính cạnh huyền, chiều cao ứng với cạnh huyền, diện tích và chu vi tam giác vuông.">
    <meta property="og:image" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/og-image.jpg">
    <meta property="og:image:width" content="1200">
    <meta property="og:image:height" content="630">
    <meta property="og:locale" content="vi_VN">
    <meta property="og:site_name" content="Tính Toán Hình Học Online">

    <!-- Twitter -->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:url" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/tam-giac-vuong">
    <meta property="twitter:title" content="Tam Giác Vuông - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta property="twitter:description" content="Định lý Pythagore, tính cạnh huyền, chiều cao ứng với cạnh huyền, diện tích và chu vi tam giác vuông.">
    <meta property="twitter:image" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/og-image.jpg">
    <link rel="icon" type="image/svg+xml" href="favicon.svg">
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
        <h1>Tam Giác Vuông</h1>

        <div class="calc-layout">
            <div class="calc-col-left">
                <div class="svg-wrap">
            <svg id="tgvSvg" viewBox="0 0 290 190" xmlns="http://www.w3.org/2000/svg">
                <polygon id="svgPoly" points="50,150 50,40 210,150" fill="#ebf8ff" stroke="#2b6cb0" stroke-width="2"/>
                <path id="svgSqMarker" d="M 50 135 L 65 135 L 65 150" fill="none" stroke="#2b6cb0" stroke-width="1.5"/>
                <line id="svgAlt" x1="50" y1="150" x2="114" y2="93" stroke="#e53e3e" stroke-width="1.5" stroke-dasharray="4,3"/>
                <text id="svgLabelA" x="40" y="95" text-anchor="end" font-size="12" font-weight="600" fill="#2b6cb0">a</text>
                <text id="svgLabelB" x="130" y="168" text-anchor="middle" font-size="12" font-weight="600" fill="#2b6cb0">b</text>
                <text id="svgLabelC" x="140" y="85" text-anchor="start" font-size="12" font-weight="600" fill="#e53e3e">c</text>
            </svg>
        </div>

        <div class="formula-box">
            <h2>Công thức</h2>
            <ul>
                <li>Cạnh huyền: \(c = \sqrt{a^2 + b^2}\) — Định lý Pytago</li>
                <li>Diện tích: \(S = \dfrac{1}{2}\cdot a \cdot b\)</li>
                <li>Chu vi: \(C = a + b + c\)</li>
                <li>Đường cao từ đỉnh vuông: \(h = \dfrac{a \cdot b}{c}\)</li>
                <li>Bán kính ngoại tiếp: \(R = \dfrac{c}{2}\) | Bán kính nội tiếp: \(r = \dfrac{a + b - c}{2}\)</li>
            </ul>
        </div>
            </div>
            <div class="calc-col-right">
                <% if (request.getAttribute("error") != null) { %>
            <div style="color: #b91c1c; margin-bottom: 15px; padding: 12px; background: #fee2e2; border-radius: 6px; border: 1px solid #f87171;">
                <strong>Lỗi:</strong> ${requestScope.error}
            </div>
        <% } %>
        <form class="calc-form" method="post" action="${pageContext.request.contextPath}/tam-giac-vuong">
            <div class="form-row">
                <label>Cạnh góc vuông 1 (a):</label>
                <input type="number" id="inputC1" step="any" name="c1" required value="${param.c1}" placeholder="Cạnh a">
            </div>
            <div class="form-row">
                <label>Cạnh góc vuông 2 (b):</label>
                <input type="number" id="inputC2" step="any" name="c2" required value="${param.c2}" placeholder="Cạnh b">
            </div>
            <div class="form-actions">
                <button type="submit" class="btn-calc">Tính toán</button>
                <button type="reset" class="btn-reset" onclick="window.location.href=window.location.pathname">Làm mới</button>
            </div>
        </form>

        <% if (request.getAttribute("tgv") != null) { %>
        <div class="result-box">
            <h2>Kết quả & Các bước giải chi tiết</h2>
            <div class="step-detail">
                <p><strong>1. Cạnh huyền (c):</strong></p>
                <p>\(c = \sqrt{a^2 + b^2} = \sqrt{${param.c1}^2 + ${param.c2}^2} = \) <strong><fmt:formatNumber value="${requestScope.tgv.getHypotenuse()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị dài</span></p>
            </div>
            <div class="step-detail">
                <p><strong>2. Chu vi (C):</strong></p>
                <p>\(C = a + b + c = ${param.c1} + ${param.c2} + <fmt:formatNumber value="${requestScope.tgv.getHypotenuse()}" pattern="#,##0.####"/> = \) <strong><fmt:formatNumber value="${requestScope.tgv.getPerimeter()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị dài</span></p>
            </div>
            <div class="step-detail">
                <p><strong>3. Diện tích (S):</strong></p>
                <p>\(S = \dfrac{1}{2} \times a \times b = \dfrac{1}{2} \times ${param.c1} \times ${param.c2} = \) <strong><fmt:formatNumber value="${requestScope.tgv.getArea()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị diện tích</span></p>
            </div>
            <div class="step-detail">
                <p><strong>4. Đường cao hạ từ góc vuông (h):</strong></p>
                <p>\(h = \dfrac{a \times b}{c} = \dfrac{${param.c1} \times ${param.c2}}{<fmt:formatNumber value="${requestScope.tgv.getHypotenuse()}" pattern="#,##0.####"/>} \approx \) <strong><fmt:formatNumber value="${requestScope.tgv.getAltitude()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị dài</span></p>
            </div>
            <div class="step-detail">
                <p><strong>5. Bán kính ngoại tiếp (R):</strong></p>
                <p>\(R = \dfrac{c}{2} = \dfrac{<fmt:formatNumber value="${requestScope.tgv.getHypotenuse()}" pattern="#,##0.####"/>}{2} = \) <strong><fmt:formatNumber value="${requestScope.tgv.getCircumradius()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị dài</span></p>
            </div>
            <div class="step-detail">
                <p><strong>6. Bán kính nội tiếp (r):</strong></p>
                <p>\(r = \dfrac{a + b - c}{2} = \dfrac{${param.c1} + ${param.c2} - <fmt:formatNumber value="${requestScope.tgv.getHypotenuse()}" pattern="#,##0.####"/>}{2} \approx \) <strong><fmt:formatNumber value="${requestScope.tgv.getInradius()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị dài</span></p>
            </div>
        </div>
        <% } %>
                <a href="${pageContext.request.contextPath}/tinh-toan-hinh-hoc" class="btn-home-bottom">Về trang chủ</a>
            </div>
        </div>
    </div>

    <script>
        function updateSvgShape() {
            var inA = parseFloat(document.getElementById('inputC1').value);
            var inB = parseFloat(document.getElementById('inputC2').value);
            var dispA = (!isNaN(inA) && inA > 0) ? inA : (!isNaN(inB) && inB > 0 ? inB * 0.75 : 80);
            var dispB = (!isNaN(inB) && inB > 0) ? inB : (!isNaN(inA) && inA > 0 ? inA * 1.33 : 130);
            
            var maxW = 180, maxH = 120, startX = 50, baseY = 150;
            var scale = Math.min(maxW / dispB, maxH / dispA);
            var w = Math.max(30, Math.min(maxW, dispB * scale));
            var h = Math.max(30, Math.min(maxH, dispA * scale));
            
            var topY = baseY - h;
            var rightX = startX + w;
            
            // Tam giác vuông: góc vuông tại (startX, baseY)
            var poly = document.getElementById('svgPoly');
            poly.setAttribute('points', startX + ',' + baseY + ' ' + startX + ',' + topY + ' ' + rightX + ',' + baseY);
            
            // Đường cao từ góc vuông xuống cạnh huyền
            var cSq = w * w + h * h;
            var footX = startX + (w * h * h) / cSq;
            var footY = baseY - (w * w * h) / cSq;
            var alt = document.getElementById('svgAlt');
            alt.setAttribute('x1', startX);
            alt.setAttribute('y1', baseY);
            alt.setAttribute('x2', footX.toFixed(1));
            alt.setAttribute('y2', footY.toFixed(1));
            
            // Ký hiệu góc vuông
            var sqSize = Math.min(15, Math.min(w, h) * 0.25);
            var sq = document.getElementById('svgSqMarker');
            sq.setAttribute('d', 'M ' + startX + ' ' + (baseY - sqSize) + ' L ' + (startX + sqSize) + ' ' + (baseY - sqSize) + ' L ' + (startX + sqSize) + ' ' + baseY);
            
            // Nhãn
            var lblA = document.getElementById('svgLabelA');
            lblA.textContent = (!isNaN(inA) && inA > 0) ? ('a = ' + inA) : 'a';
            lblA.setAttribute('x', startX - 8);
            lblA.setAttribute('y', (baseY - h / 2));
            
            var lblB = document.getElementById('svgLabelB');
            lblB.textContent = (!isNaN(inB) && inB > 0) ? ('b = ' + inB) : 'b';
            lblB.setAttribute('x', startX + w / 2);
            lblB.setAttribute('y', baseY + 18);
            
            var lblC = document.getElementById('svgLabelC');
            lblC.setAttribute('x', (startX + rightX) / 2 + 10);
            lblC.setAttribute('y', (topY + baseY) / 2 - 5);
        }
        window.addEventListener('DOMContentLoaded', updateSvgShape);
        document.getElementById('inputC1').addEventListener('input', updateSvgShape);
        document.getElementById('inputC2').addEventListener('input', updateSvgShape);
    </script>

    <footer class="app-footer">
        © MaxxAlan. Hệ thống công cụ học tập và ôn luyện hình học trực quan.
    </footer>

</body>
</html>
