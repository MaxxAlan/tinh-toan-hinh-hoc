<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hình Thoi - Công Thức, Tính Toán Đa Chế Độ & Lời Giải Chi Tiết</title>
    <meta name="title" content="Hình Thoi - Công Thức, Tính Toán Đa Chế Độ & Lời Giải Chi Tiết">
    <meta name="description" content="Tính diện tích, chu vi, bán kính nội tiếp hình thoi theo 2 đường chéo, theo cạnh và góc với công thức và các bước giải chi tiết.">
    <meta name="keywords" content="hình thoi, tính diện tích hình thoi, công thức hình thoi, chu vi hình thoi, đường chéo hình thoi">
    <meta name="author" content="MaxxAlan">
    <meta name="robots" content="index, follow">
    <meta name="theme-color" content="#1d4ed8">

    <!-- Open Graph / Facebook / Zalo -->
    <meta property="og:type" content="article">
    <meta property="og:url" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/hinh-thoi">
    <meta property="og:title" content="Hình Thoi - Công Thức, Tính Toán Đa Chế Độ & Lời Giải Chi Tiết">
    <meta property="og:description" content="Tính diện tích, chu vi, bán kính nội tiếp hình thoi theo 2 đường chéo, theo cạnh và góc với công thức và các bước giải chi tiết.">
    <meta property="og:image" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/web/assets/og-image.jpg?v=2">
    <meta property="og:image:secure_url" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/web/assets/og-image.jpg?v=2">
    <meta property="og:image:type" content="image/jpeg">
    <meta property="og:image:width" content="1200">
    <meta property="og:image:height" content="630">
    <meta property="og:locale" content="vi_VN">
    <meta property="og:site_name" content="Tính Toán Hình Học">

    <!-- Twitter -->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:url" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/hinh-thoi">
    <meta property="twitter:title" content="Hình Thoi - Công Thức, Tính Toán Đa Chế Độ & Lời Giải Chi Tiết">
    <meta property="twitter:description" content="Tính diện tích, chu vi, bán kính nội tiếp hình thoi theo 2 đường chéo, theo cạnh và góc với công thức và các bước giải chi tiết.">
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
        <nav class="breadcrumb">
            <a href="${pageContext.request.contextPath}/tinh-toan-hinh-hoc">Trang chủ</a> &rsaquo; <span>Hình Thoi</span>
        </nav>

        <h1>Tính Toán Hình Thoi</h1>

        <div class="calc-grid">
            <!-- Left Column: SVG Illustration & Formula Box -->
            <div class="calc-col-left">
                <div class="svg-wrap">
                    <svg id="svgShape" viewBox="0 0 280 220" width="280" height="220" style="max-width: 100%; height: auto;">
                        <!-- Hình thoi (4 đỉnh) -->
                        <polygon id="svgPoly" points="140,25 240,110 140,195 40,110" fill="#ebf8ff" stroke="#2b6cb0" stroke-width="2"/>
                        
                        <!-- Vùng quạt đo góc alpha tại đỉnh trái (40, 110) -->
                        <path id="svgArcAlpha" d="M 40 110 L 61 96 A 32 32 0 0 1 61 124 Z" fill="rgba(214, 158, 46, 0.2)" stroke="#d69e2e" stroke-width="2"/>
                        
                        <!-- Đường chéo d1 (ngang) -->
                        <line id="svgLineD1" x1="40" y1="110" x2="240" y2="110" stroke="#e53e3e" stroke-width="1.5" stroke-dasharray="4,3"/>
                        
                        <!-- Đường chéo d2 (dọc) -->
                        <line id="svgLineD2" x1="140" y1="25" x2="140" y2="195" stroke="#3182ce" stroke-width="1.5" stroke-dasharray="4,3"/>
                        
                        <!-- Ký hiệu vuông góc ở giao điểm 2 đường chéo -->
                        <path id="svgSqMarker" d="M 140 100 L 150 100 L 150 110" fill="none" stroke="#718096" stroke-width="1.2"/>
                        
                        <!-- Nhãn cạnh a -->
                        <text id="svgLabelA" x="80" y="55" text-anchor="middle" font-size="12" font-weight="700" fill="#2b6cb0">a</text>
                        
                        <!-- Nhãn d1 -->
                        <text id="svgLabelD1" x="200" y="104" text-anchor="middle" font-size="11" font-weight="700" fill="#e53e3e">d₁</text>
                        
                        <!-- Nhãn d2 -->
                        <text id="svgLabelD2" x="152" y="60" text-anchor="start" font-size="11" font-weight="700" fill="#3182ce">d₂</text>
                        
                        <!-- Nhãn góc alpha -->
                        <text id="svgLabelAlpha" x="52" y="113" text-anchor="middle" font-size="12" font-weight="700" fill="#b7791f">α</text>
                    </svg>
                </div>

                <div class="formula-box">
                    <h2>
                        <svg viewBox="0 0 24 24"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg>
                        Công Thức Tính
                    </h2>
                    <ul id="formulaList">
                        <li id="fm-c" data-inputs="a">
                            Chu vi: <span class="var-token" data-var="C">C</span> = 4<span class="var-token" data-var="a">a</span>
                        </li>
                        <li id="fm-s-diag" data-inputs="d1,d2">
                            Diện tích (2 đường chéo): <span class="var-token" data-var="S">S</span> = \(\dfrac{1}{2}\)<span class="var-token" data-var="d1">d₁</span> · <span class="var-token" data-var="d2">d₂</span>
                        </li>
                        <li id="fm-s-angle" data-inputs="a,alpha">
                            Diện tích (cạnh & góc): <span class="var-token" data-var="S">S</span> = <span class="var-token" data-var="a">a</span>² · \(\sin\)<span class="var-token" data-var="alpha">α</span>
                        </li>
                        <li id="fm-pythagoras" data-inputs="d1,d2">
                            Quan hệ cạnh & chéo: <span class="var-token" data-var="a">a</span> = \(\sqrt{(d_1/2)^2 + (d_2/2)^2}\)
                        </li>
                        <li id="fm-inradius" data-inputs="d1,d2,a">
                            Bán kính nội tiếp: <span class="var-token" data-var="r">r</span> = \(\dfrac{d_1 \cdot d_2}{4a}\)
                        </li>
                    </ul>

                    <div class="formula-legend">
                        <span class="legend-item"><span class="legend-dot dot-known"></span> <strong>Xanh</strong>: Đã nhập</span>
                        <span class="legend-item"><span class="legend-dot dot-target"></span> <strong>Vàng</strong>: Sẽ tính / suy ra</span>
                    </div>
                </div>
            </div>

            <!-- Right Column: Input Form & Detailed Results -->
            <div class="calc-col-right">
                <% if (request.getAttribute("error") != null) { %>
                <div style="color: #b91c1c; margin-bottom: 15px; padding: 12px; background: #fee2e2; border-radius: 6px; border: 1px solid #f87171;">
                    <strong>Lỗi:</strong> ${requestScope.error}
                </div>
                <% } %>

                <form class="calc-form" method="post" action="${pageContext.request.contextPath}/hinh-thoi">
                    <div style="font-size: 0.82rem; color: var(--color-text-muted); margin-bottom: 14px; line-height: 1.45; background: var(--color-neutral-subtle); padding: 8px 12px; border-radius: 6px; border: 1px dashed var(--color-border);">
                        💡 <em>Chỉ cần nhập đủ dữ kiện cho ít nhất 1 công thức (VD: chỉ cần 2 đường chéo <strong>d₁, d₂</strong>; hoặc cạnh <strong>a & góc α</strong>; hoặc <strong>a & 1 đường chéo</strong>). Hệ thống sẽ tự động suy luận các thông số còn lại.</em>
                    </div>

                    <div class="form-row">
                        <label>Cạnh (a): <span class="badge-optional">Tùy chọn</span></label>
                        <input type="number" id="inputA" step="any" name="a" value="${param.a}" placeholder="Nhập cạnh a (hoặc để trống để tính từ d₁, d₂)">
                    </div>
                    <div class="form-row">
                        <label>Đường chéo d₁: <span class="badge-optional">Tùy chọn</span></label>
                        <input type="number" id="inputD1" step="any" name="d1" value="${param.d1}" placeholder="Nhập đường chéo d₁">
                    </div>
                    <div class="form-row">
                        <label>Đường chéo d₂: <span class="badge-optional">Tùy chọn</span></label>
                        <input type="number" id="inputD2" step="any" name="d2" value="${param.d2}" placeholder="Nhập đường chéo d₂">
                    </div>
                    <div class="form-row">
                        <label>Góc α (độ): <span class="badge-optional">Tùy chọn</span></label>
                        <input type="number" id="inputAlpha" step="any" name="alpha" value="${param.alpha}" placeholder="Nhập góc nhọn α (0° - 180°)">
                    </div>
                    <div class="form-actions">
                        <button type="submit" class="btn-calc">Tính toán</button>
                        <button type="reset" class="btn-reset" onclick="window.location.href=window.location.pathname">Làm mới</button>
                    </div>
                </form>

                <% if (request.getAttribute("hthi") != null) { %>
                <div class="result-box">
                    <h2>Kết quả & Các bước giải chi tiết</h2>

                    <%-- 1. Nếu có suy luận ngược cạnh a từ d1, d2 --%>
                    <c:if test="${requestScope.hthi.deducedA}">
                    <div class="step-detail" style="border-left: 3px solid #10b981; background: #f0fdf4;">
                        <p><strong>✨ Suy luận cạnh a từ 2 đường chéo (Định lý Pythagoras):</strong></p>
                        <p>Hai đường chéo của hình thoi vuông góc tại trung điểm mỗi đường. Do đó cạnh \(a\) là cạnh huyền của tam giác vuông có 2 cạnh góc vuông là \(\dfrac{d_1}{2}\) và \(\dfrac{d_2}{2}\):</p>
                        <p>\(a = \sqrt{\left(\dfrac{d_1}{2}\right)^2 + \left(\dfrac{d_2}{2}\right)^2} = \sqrt{\left(\dfrac{${requestScope.hthi.d1}}{2}\right)^2 + \left(\dfrac{${requestScope.hthi.d2}}{2}\right)^2} = \) <strong><fmt:formatNumber value="${requestScope.hthi.a}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị dài</span></p>
                    </div>
                    </c:if>

                    <%-- 2. Nếu có suy luận ngược đường chéo d2 từ a và d1 --%>
                    <c:if test="${requestScope.hthi.deducedD2}">
                    <div class="step-detail" style="border-left: 3px solid #10b981; background: #f0fdf4;">
                        <p><strong>✨ Suy luận đường chéo d₂ từ cạnh a và d₁:</strong></p>
                        <p>\(d_2 = 2 \times \sqrt{a^2 - \left(\dfrac{d_1}{2}\right)^2} = 2 \times \sqrt{${requestScope.hthi.a}^2 - \left(\dfrac{${requestScope.hthi.d1}}{2}\right)^2} = \) <strong><fmt:formatNumber value="${requestScope.hthi.d2}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị dài</span></p>
                    </div>
                    </c:if>

                    <%-- 3. Nếu có suy luận ngược đường chéo d1 từ a và d2 --%>
                    <c:if test="${requestScope.hthi.deducedD1}">
                    <div class="step-detail" style="border-left: 3px solid #10b981; background: #f0fdf4;">
                        <p><strong>✨ Suy luận đường chéo d₁ từ cạnh a và d₂:</strong></p>
                        <p>\(d_1 = 2 \times \sqrt{a^2 - \left(\dfrac{d_2}{2}\right)^2} = 2 \times \sqrt{${requestScope.hthi.a}^2 - \left(\dfrac{${requestScope.hthi.d2}}{2}\right)^2} = \) <strong><fmt:formatNumber value="${requestScope.hthi.d1}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị dài</span></p>
                    </div>
                    </c:if>

                    <%-- 4. Chu vi (C) --%>
                    <c:if test="${requestScope.hthi.perimeter > 0}">
                    <div class="step-detail">
                        <p><strong>1. Chu vi hình thoi (C):</strong></p>
                        <p>\(C = 4 \times a = 4 \times <fmt:formatNumber value="${requestScope.hthi.a}" pattern="#,##0.####"/> = \) <strong><fmt:formatNumber value="${requestScope.hthi.perimeter}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị dài</span></p>
                    </div>
                    </c:if>

                    <%-- 5. Diện tích theo 2 đường chéo hoặc cạnh/góc --%>
                    <c:if test="${requestScope.hthi.hasArea}">
                    <div class="step-detail">
                        <p><strong>2. Diện tích hình thoi (S):</strong></p>
                        <c:choose>
                            <c:when test="${requestScope.hthi.d1 > 0 && requestScope.hthi.d2 > 0}">
                                <p>Áp dụng công thức theo 2 đường chéo:</p>
                                <p>\(S = \dfrac{d_1 \times d_2}{2} = \dfrac{<fmt:formatNumber value="${requestScope.hthi.d1}" pattern="#,##0.####"/> \times <fmt:formatNumber value="${requestScope.hthi.d2}" pattern="#,##0.####"/>}{2} = \) <strong><fmt:formatNumber value="${requestScope.hthi.area}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị diện tích</span></p>
                            </c:when>
                            <c:otherwise>
                                <p>Áp dụng công thức theo cạnh và góc nhọn:</p>
                                <p>\(S = a^2 \times \sin(\alpha) = <fmt:formatNumber value="${requestScope.hthi.a}" pattern="#,##0.####"/>^2 \times \sin(<fmt:formatNumber value="${requestScope.hthi.alpha}" pattern="#,##0.####"/>^\circ) \approx \) <strong><fmt:formatNumber value="${requestScope.hthi.area}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị diện tích</span></p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    </c:if>

                    <%-- 6. Bán kính đường tròn nội tiếp (r) --%>
                    <c:if test="${requestScope.hthi.hasInradius}">
                    <div class="step-detail">
                        <p><strong>3. Bán kính đường tròn nội tiếp (r):</strong></p>
                        <p>\(r = \dfrac{d_1 \times d_2}{4a} = \dfrac{<fmt:formatNumber value="${requestScope.hthi.d1}" pattern="#,##0.####"/> \times <fmt:formatNumber value="${requestScope.hthi.d2}" pattern="#,##0.####"/>}{4 \times <fmt:formatNumber value="${requestScope.hthi.a}" pattern="#,##0.####"/>} \approx \) <strong><fmt:formatNumber value="${requestScope.hthi.inradius}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị dài</span></p>
                    </div>
                    </c:if>

                    <%-- 7. Nếu có suy luận ngược góc alpha --%>
                    <c:if test="${requestScope.hthi.deducedAlpha}">
                    <div class="step-detail" style="border-left: 3px solid #10b981; background: #f0fdf4;">
                        <p><strong>✨ Góc nhọn suy luận từ diện tích (α):</strong></p>
                        <p>\(\sin\alpha = \dfrac{S}{a^2} \implies \alpha \approx \) <strong><fmt:formatNumber value="${requestScope.hthi.alpha}" pattern="#,##0.##"/>°</strong></p>
                    </div>
                    </c:if>
                </div>
                <% } %>

                <a href="${pageContext.request.contextPath}/tinh-toan-hinh-hoc" class="btn-home-bottom">Về trang chủ</a>
            </div>
        </div>
    </div>

    <script>
        // ==========================================
        // LIVE FORMULA WATCHING & VARIABLE HIGHLIGHT
        // ==========================================
        function watchRhombusFormulas() {
            var valA = parseFloat(document.getElementById('inputA').value);
            var valD1 = parseFloat(document.getElementById('inputD1').value);
            var valD2 = parseFloat(document.getElementById('inputD2').value);
            var valAl = parseFloat(document.getElementById('inputAlpha').value);

            var hasA = !isNaN(valA) && valA > 0;
            var hasD1 = !isNaN(valD1) && valD1 > 0;
            var hasD2 = !isNaN(valD2) && valD2 > 0;
            var hasAl = !isNaN(valAl) && valAl > 0 && valAl < 180;

            // Đặt lại tất cả các token về mặc định
            document.querySelectorAll('.var-token').forEach(function(el) {
                el.classList.remove('var-known', 'var-target');
            });
            document.querySelectorAll('.formula-box li').forEach(function(el) {
                el.classList.remove('formula-ready');
            });

            // 1. Tô màu XANH LÁ cho các biến đã nhập (Knowns)
            if (hasA) {
                document.querySelectorAll('.var-token[data-var="a"]').forEach(function(el) { el.classList.add('var-known'); });
            }
            if (hasD1) {
                document.querySelectorAll('.var-token[data-var="d1"]').forEach(function(el) { el.classList.add('var-known'); });
            }
            if (hasD2) {
                document.querySelectorAll('.var-token[data-var="d2"]').forEach(function(el) { el.classList.add('var-known'); });
            }
            if (hasAl) {
                document.querySelectorAll('.var-token[data-var="alpha"]').forEach(function(el) { el.classList.add('var-known'); });
            }

            // 2. Phân tích các công thức có thể giải & tô màu VÀNG cho biến đích (Targets)
            // Chu vi: C = 4a (nếu có a, hoặc có d1 & d2)
            if (hasA || (hasD1 && hasD2)) {
                document.getElementById('fm-c').classList.add('formula-ready');
                document.querySelectorAll('.var-token[data-var="C"]').forEach(function(el) { el.classList.add('var-target'); });
            }

            // Diện tích theo 2 đường chéo: S = 1/2 d1 d2
            if (hasD1 && hasD2) {
                document.getElementById('fm-s-diag').classList.add('formula-ready');
                document.getElementById('fm-pythagoras').classList.add('formula-ready');
                document.querySelectorAll('.var-token[data-var="S"]').forEach(function(el) { el.classList.add('var-target'); });
                if (!hasA) {
                    // Cạnh a là biến mục tiêu có thể suy luận ngược
                    document.querySelectorAll('#fm-pythagoras .var-token[data-var="a"]').forEach(function(el) { el.classList.add('var-target'); });
                }
                document.getElementById('fm-inradius').classList.add('formula-ready');
                document.querySelectorAll('.var-token[data-var="r"]').forEach(function(el) { el.classList.add('var-target'); });
            }

            // Diện tích theo cạnh & góc: S = a^2 sin(alpha)
            if (hasA && hasAl) {
                document.getElementById('fm-s-angle').classList.add('formula-ready');
                document.querySelectorAll('.var-token[data-var="S"]').forEach(function(el) { el.classList.add('var-target'); });
            }

            // Pythagoras tính d2 từ a & d1 (nếu d1 < 2a)
            if (hasA && hasD1 && !hasD2 && valD1 < 2 * valA) {
                document.getElementById('fm-pythagoras').classList.add('formula-ready');
                document.querySelectorAll('#fm-pythagoras .var-token[data-var="d2"]').forEach(function(el) { el.classList.add('var-target'); });
                document.getElementById('fm-s-diag').classList.add('formula-ready');
                document.querySelectorAll('.var-token[data-var="S"]').forEach(function(el) { el.classList.add('var-target'); });
                document.getElementById('fm-inradius').classList.add('formula-ready');
                document.querySelectorAll('.var-token[data-var="r"]').forEach(function(el) { el.classList.add('var-target'); });
            }

            // Pythagoras tính d1 từ a & d2 (nếu d2 < 2a)
            if (hasA && hasD2 && !hasD1 && valD2 < 2 * valA) {
                document.getElementById('fm-pythagoras').classList.add('formula-ready');
                document.querySelectorAll('#fm-pythagoras .var-token[data-var="d1"]').forEach(function(el) { el.classList.add('var-target'); });
                document.getElementById('fm-s-diag').classList.add('formula-ready');
                document.querySelectorAll('.var-token[data-var="S"]').forEach(function(el) { el.classList.add('var-target'); });
                document.getElementById('fm-inradius').classList.add('formula-ready');
                document.querySelectorAll('.var-token[data-var="r"]').forEach(function(el) { el.classList.add('var-target'); });
            }
        }

        // ==========================================
        // DYNAMIC SVG ILLUSTRATION
        // ==========================================
        function updateSvgShape() {
            var inA = parseFloat(document.getElementById('inputA').value);
            var inD1 = parseFloat(document.getElementById('inputD1').value);
            var inD2 = parseFloat(document.getElementById('inputD2').value);
            var inAl = parseFloat(document.getElementById('inputAlpha').value);
            
            // Nếu có a và d1 nhưng thiếu d2 -> tính nháp d2 để vẽ SVG
            if (!isNaN(inA) && inA > 0 && !isNaN(inD1) && inD1 > 0 && isNaN(inD2) && inD1 < 2 * inA) {
                inD2 = 2.0 * Math.sqrt(inA * inA - Math.pow(inD1 / 2.0, 2));
            }
            // Nếu có a và d2 nhưng thiếu d1 -> tính nháp d1 để vẽ SVG
            if (!isNaN(inA) && inA > 0 && !isNaN(inD2) && inD2 > 0 && isNaN(inD1) && inD2 < 2 * inA) {
                inD1 = 2.0 * Math.sqrt(inA * inA - Math.pow(inD2 / 2.0, 2));
            }

            var dispD1 = (!isNaN(inD1) && inD1 > 0) ? inD1 : 12;
            var dispD2 = (!isNaN(inD2) && inD2 > 0) ? inD2 : 8;
            
            var maxRx = 95, maxRy = 75;
            var scale = Math.min(maxRx / (dispD1 / 2), maxRy / (dispD2 / 2));
            var rx = Math.max(25, Math.min(maxRx, (dispD1 / 2) * scale));
            var ry = Math.max(20, Math.min(maxRy, (dispD2 / 2) * scale));
            
            var cx = 135, cy = 110;
            var xLeft = cx - rx, xRight = cx + rx;
            var yTop = cy - ry, yBottom = cy + ry;
            
            var poly = document.getElementById('svgPoly');
            poly.setAttribute('points', cx + ',' + yTop + ' ' + xRight + ',' + cy + ' ' + cx + ',' + yBottom + ' ' + xLeft + ',' + cy);
            
            var lineD1 = document.getElementById('svgLineD1');
            lineD1.setAttribute('x1', xLeft); lineD1.setAttribute('y1', cy);
            lineD1.setAttribute('x2', xRight); lineD1.setAttribute('y2', cy);
            
            var lineD2 = document.getElementById('svgLineD2');
            lineD2.setAttribute('x1', cx); lineD2.setAttribute('y1', yTop);
            lineD2.setAttribute('x2', cx); lineD2.setAttribute('y2', yBottom);
            
            var sqSize = Math.min(12, Math.min(rx, ry) * 0.25);
            var sq = document.getElementById('svgSqMarker');
            sq.setAttribute('d', 'M ' + cx + ' ' + (cy - sqSize) + ' L ' + (cx + sqSize) + ' ' + (cy - sqSize) + ' L ' + (cx + sqSize) + ' ' + cy);
            
            var arcR = Math.min(36, Math.min(rx, ry) * 0.55);
            var sideLen = Math.sqrt(rx * rx + ry * ry);
            var cosTh = rx / sideLen, sinTh = ry / sideLen;
            var arcX1 = xLeft + arcR * cosTh, arcY1 = cy - arcR * sinTh;
            var arcX2 = xLeft + arcR * cosTh, arcY2 = cy + arcR * sinTh;
            var arcEl = document.getElementById('svgArcAlpha');
            arcEl.setAttribute('d', 'M ' + xLeft + ' ' + cy + ' L ' + arcX1.toFixed(1) + ' ' + arcY1.toFixed(1) + ' A ' + arcR + ' ' + arcR + ' 0 0 1 ' + arcX2.toFixed(1) + ' ' + arcY2.toFixed(1) + ' Z');
            
            var lblAlpha = document.getElementById('svgLabelAlpha');
            lblAlpha.textContent = (!isNaN(inAl) && inAl > 0) ? (inAl + '°') : 'α';
            lblAlpha.setAttribute('x', (xLeft + arcR * 0.45));
            lblAlpha.setAttribute('y', cy + 4);
            
            var lblA = document.getElementById('svgLabelA');
            var dispA = (!isNaN(inA) && inA > 0) ? inA : (Math.sqrt(Math.pow(dispD1/2, 2) + Math.pow(dispD2/2, 2)).toFixed(1));
            lblA.textContent = 'a = ' + dispA;
            lblA.setAttribute('x', (xLeft + cx) / 2 - 14);
            lblA.setAttribute('y', (yTop + cy) / 2 - 10);
            
            var lblD1 = document.getElementById('svgLabelD1');
            lblD1.textContent = (!isNaN(inD1) && inD1 > 0) ? ('d₁ = ' + inD1) : 'd₁';
            lblD1.setAttribute('x', (cx + rx * 0.55));
            lblD1.setAttribute('y', cy - 6);
            
            var lblD2 = document.getElementById('svgLabelD2');
            lblD2.textContent = (!isNaN(inD2) && inD2 > 0) ? ('d₂ = ' + inD2) : 'd₂';
            lblD2.setAttribute('x', cx + 8);
            lblD2.setAttribute('y', (cy - ry * 0.55));
        }

        function handleAllInputs() {
            watchRhombusFormulas();
            updateSvgShape();
        }

        window.addEventListener('DOMContentLoaded', handleAllInputs);
        ['inputA', 'inputD1', 'inputD2', 'inputAlpha'].forEach(function(id) {
            var el = document.getElementById(id);
            if (el) {
                el.addEventListener('input', handleAllInputs);
                el.addEventListener('change', handleAllInputs);
            }
        });
    </script>

    <footer class="app-footer">
        © MaxxAlan. Hệ thống công cụ học tập và ôn luyện hình học trực quan.
    </footer>

</body>
</html>
