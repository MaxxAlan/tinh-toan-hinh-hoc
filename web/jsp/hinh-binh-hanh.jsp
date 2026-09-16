<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hình Bình Hành - Công Thức, Tính Toán Đa Chế Độ &amp; Lời Giải Chi Tiết</title>
    <meta name="title" content="Hình Bình Hành - Công Thức, Tính Toán Đa Chế Độ &amp; Lời Giải Chi Tiết">
    <meta name="description" content="Tính chu vi, diện tích hình bình hành theo cạnh-chiều cao hoặc cạnh-cạnh-góc. Hỗ trợ suy luận ngược chiều cao, cạnh bên, góc α.">
    <meta name="keywords" content="hình bình hành, tính diện tích hình bình hành, công thức hình bình hành, chu vi hình bình hành">
    <meta name="author" content="MaxxAlan">
    <meta name="robots" content="index, follow">
    <meta name="theme-color" content="#1d4ed8">

    <!-- Open Graph -->
    <meta property="og:type" content="article">
    <meta property="og:url" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/hinh-binh-hanh">
    <meta property="og:title" content="Hình Bình Hành - Công Thức, Tính Toán Đa Chế Độ &amp; Lời Giải Chi Tiết">
    <meta property="og:description" content="Tính chu vi, diện tích hình bình hành theo cạnh-chiều cao hoặc cạnh-cạnh-góc.">
    <meta property="og:image" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/web/assets/og-image.jpg?v=2">
    <meta property="og:image:width" content="1200">
    <meta property="og:image:height" content="630">
    <meta property="og:locale" content="vi_VN">
    <meta property="og:site_name" content="Tính Toán Hình Học">

    <!-- Twitter -->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:url" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/hinh-binh-hanh">
    <meta property="twitter:title" content="Hình Bình Hành - Công Thức, Tính Toán Đa Chế Độ &amp; Lời Giải Chi Tiết">
    <meta property="twitter:description" content="Tính chu vi, diện tích hình bình hành theo cạnh-chiều cao hoặc cạnh-cạnh-góc.">
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
            <a href="${pageContext.request.contextPath}/tinh-toan-hinh-hoc">Trang chủ</a> &rsaquo; <span>Hình Bình Hành</span>
        </nav>

        <h1>Tính Toán Hình Bình Hành</h1>

        <div class="calc-grid">
            <!-- Left Column: SVG + Formula Box -->
            <div class="calc-col-left">
                <div class="svg-wrap">
                    <svg id="svgShape" viewBox="0 0 280 200" width="280" height="200" style="max-width:100%;height:auto;">
                        <!-- Hình bình hành -->
                        <polygon id="svgPoly" points="65,30 235,30 200,160 30,160" fill="#ebf8ff" stroke="#2b6cb0" stroke-width="2"/>
                        <!-- Đường cao h -->
                        <line id="svgLineH" x1="65" y1="30" x2="65" y2="160" stroke="#e53e3e" stroke-width="1.5" stroke-dasharray="4,3"/>
                        <!-- Ký hiệu vuông góc -->
                        <path id="svgSqH" d="M 65 150 L 77 150 L 77 160" fill="none" stroke="#718096" stroke-width="1.2"/>
                        <!-- Nhãn a (đáy) -->
                        <text id="svgLabelA" x="132" y="22" text-anchor="middle" font-size="12" font-weight="700" fill="#2b6cb0">a</text>
                        <!-- Nhãn b (cạnh bên) -->
                        <text id="svgLabelB" x="17" y="100" text-anchor="middle" font-size="12" font-weight="700" fill="#2b6cb0">b</text>
                        <!-- Nhãn h (chiều cao) -->
                        <text id="svgLabelH" x="78" y="100" text-anchor="start" font-size="11" font-weight="700" fill="#e53e3e">h</text>
                        <!-- Nhãn alpha -->
                        <text id="svgLabelAlpha" x="46" y="156" text-anchor="middle" font-size="12" font-weight="700" fill="#b7791f">α</text>
                    </svg>
                </div>

                <div class="formula-box">
                    <h2>
                        <svg viewBox="0 0 24 24"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg>
                        Công Thức Tính
                    </h2>
                    <ul id="formulaList">
                        <li id="fm-c" data-inputs="a,b">
                            Chu vi: <span class="var-token" data-var="C">C</span> = 2(<span class="var-token" data-var="a">a</span> + <span class="var-token" data-var="b">b</span>)
                        </li>
                        <li id="fm-s-height" data-inputs="a,h">
                            Diện tích (cạnh &amp; chiều cao): <span class="var-token" data-var="S">S</span> = <span class="var-token" data-var="a">a</span> · <span class="var-token" data-var="h">h</span>
                        </li>
                        <li id="fm-s-angle" data-inputs="a,b,alpha">
                            Diện tích (2 cạnh &amp; góc): <span class="var-token" data-var="S">S</span> = <span class="var-token" data-var="a">a</span> · <span class="var-token" data-var="b">b</span> · \(\sin\)<span class="var-token" data-var="alpha">α</span>
                        </li>
                        <li id="fm-h-deduce" data-inputs="b,alpha">
                            Suy luận chiều cao: <span class="var-token" data-var="h">h</span> = <span class="var-token" data-var="b">b</span> · \(\sin\)<span class="var-token" data-var="alpha">α</span>
                        </li>
                        <li id="fm-b-deduce" data-inputs="h,alpha">
                            Suy luận cạnh bên: <span class="var-token" data-var="b">b</span> = <span class="var-token" data-var="h">h</span> / \(\sin\)<span class="var-token" data-var="alpha">α</span>
                        </li>
                        <li id="fm-alpha-deduce" data-inputs="h,b">
                            Suy luận góc: <span class="var-token" data-var="alpha">α</span> = \(\arcsin\)(<span class="var-token" data-var="h">h</span> / <span class="var-token" data-var="b">b</span>)
                        </li>
                    </ul>

                    <div class="formula-legend">
                        <span class="legend-item"><span class="legend-dot dot-known"></span> <strong>Xanh</strong>: Đã nhập</span>
                        <span class="legend-item"><span class="legend-dot dot-target"></span> <strong>Vàng</strong>: Sẽ tính / suy ra</span>
                    </div>
                </div>
            </div>

            <!-- Right Column: Form + Results -->
            <div class="calc-col-right">
                <% if (request.getAttribute("error") != null) { %>
                <div style="color:#b91c1c;margin-bottom:15px;padding:12px;background:#fee2e2;border-radius:6px;border:1px solid #f87171;">
                    <strong>Lỗi:</strong> ${requestScope.error}
                </div>
                <% } %>

                <form class="calc-form" method="post" action="${pageContext.request.contextPath}/hinh-binh-hanh">
                    <div style="font-size:0.82rem;color:var(--color-text-muted);margin-bottom:14px;line-height:1.45;background:var(--color-neutral-subtle);padding:8px 12px;border-radius:6px;border:1px dashed var(--color-border);">
                        💡 <em>Chỉ cần nhập đủ dữ kiện cho ít nhất 1 công thức. VD: chỉ cần <strong>a, h</strong>; hoặc <strong>a, b</strong>; hoặc <strong>b, α</strong>; hoặc <strong>h, α</strong>. Hệ thống tự suy luận các thông số còn lại.</em>
                    </div>

                    <div class="form-row">
                        <label>Cạnh đáy (a): <span class="badge-optional">Tùy chọn</span></label>
                        <input type="number" id="inputA" step="any" name="a" value="${param.a}" placeholder="Nhập cạnh đáy a">
                    </div>
                    <div class="form-row">
                        <label>Cạnh bên (b): <span class="badge-optional">Tùy chọn</span></label>
                        <input type="number" id="inputB" step="any" name="b" value="${param.b}" placeholder="Nhập cạnh bên b">
                    </div>
                    <div class="form-row">
                        <label>Chiều cao (h): <span class="badge-optional">Tùy chọn</span></label>
                        <input type="number" id="inputH" step="any" name="h" value="${param.h}" placeholder="Nhập chiều cao h (vuông góc với a)">
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

                <% if (request.getAttribute("hbh") != null) { %>
                <div class="result-box">
                    <h2>Kết quả &amp; Các bước giải chi tiết</h2>

                    <%-- Suy luận chiều cao h từ b & α --%>
                    <c:if test="${requestScope.hbh.deducedH}">
                    <div class="step-detail" style="border-left:3px solid #10b981;background:#f0fdf4;">
                        <p><strong>✨ Suy luận chiều cao h từ cạnh bên b và góc α:</strong></p>
                        <p>\(h = b \times \sin\alpha = <fmt:formatNumber value="${requestScope.hbh.b}" pattern="#,##0.####"/> \times \sin(<fmt:formatNumber value="${requestScope.hbh.alpha}" pattern="#,##0.##"/>°) = \) <strong><fmt:formatNumber value="${requestScope.hbh.h}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị dài</span></p>
                    </div>
                    </c:if>

                    <%-- Suy luận cạnh bên b từ h & α --%>
                    <c:if test="${requestScope.hbh.deducedB}">
                    <div class="step-detail" style="border-left:3px solid #10b981;background:#f0fdf4;">
                        <p><strong>✨ Suy luận cạnh bên b từ chiều cao h và góc α:</strong></p>
                        <p>\(b = \dfrac{h}{\sin\alpha} = \dfrac{<fmt:formatNumber value="${requestScope.hbh.h}" pattern="#,##0.####"/>}{\sin(<fmt:formatNumber value="${requestScope.hbh.alpha}" pattern="#,##0.##"/>°)} = \) <strong><fmt:formatNumber value="${requestScope.hbh.b}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị dài</span></p>
                    </div>
                    </c:if>

                    <%-- Suy luận góc α từ h & b --%>
                    <c:if test="${requestScope.hbh.deducedAlpha}">
                    <div class="step-detail" style="border-left:3px solid #10b981;background:#f0fdf4;">
                        <p><strong>✨ Suy luận góc α từ chiều cao h và cạnh bên b:</strong></p>
                        <p>\(\alpha = \arcsin\!\left(\dfrac{h}{b}\right) = \arcsin\!\left(\dfrac{<fmt:formatNumber value="${requestScope.hbh.h}" pattern="#,##0.####"/>}{<fmt:formatNumber value="${requestScope.hbh.b}" pattern="#,##0.####"/>}\right) \approx \) <strong><fmt:formatNumber value="${requestScope.hbh.alpha}" pattern="#,##0.##"/>°</strong></p>
                    </div>
                    </c:if>

                    <%-- Chu vi --%>
                    <c:if test="${requestScope.hbh.perimeter != null}">
                    <div class="step-detail">
                        <p><strong>1. Chu vi hình bình hành (C):</strong></p>
                        <p>\(C = 2 \times (a + b) = 2 \times (<fmt:formatNumber value="${requestScope.hbh.a}" pattern="#,##0.####"/> + <fmt:formatNumber value="${requestScope.hbh.b}" pattern="#,##0.####"/>) = \) <strong><fmt:formatNumber value="${requestScope.hbh.perimeter}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị dài</span></p>
                    </div>
                    </c:if>

                    <%-- Diện tích theo chiều cao --%>
                    <c:if test="${requestScope.hbh.areaByHeight != null}">
                    <div class="step-detail">
                        <p><strong>2. Diện tích theo chiều cao (S = a·h):</strong></p>
                        <p>\(S = a \times h = <fmt:formatNumber value="${requestScope.hbh.a}" pattern="#,##0.####"/> \times <fmt:formatNumber value="${requestScope.hbh.h}" pattern="#,##0.####"/> = \) <strong><fmt:formatNumber value="${requestScope.hbh.areaByHeight}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị diện tích</span></p>
                    </div>
                    </c:if>

                    <%-- Diện tích theo góc --%>
                    <c:if test="${requestScope.hbh.areaByAngle != null}">
                    <div class="step-detail">
                        <p><strong>3. Diện tích theo 2 cạnh &amp; góc (S = a·b·sinα):</strong></p>
                        <p>\(S = a \times b \times \sin\alpha = <fmt:formatNumber value="${requestScope.hbh.a}" pattern="#,##0.####"/> \times <fmt:formatNumber value="${requestScope.hbh.b}" pattern="#,##0.####"/> \times \sin(<fmt:formatNumber value="${requestScope.hbh.alpha}" pattern="#,##0.##"/>°) \approx \) <strong><fmt:formatNumber value="${requestScope.hbh.areaByAngle}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị diện tích</span></p>
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
        function watchFormulas() {
            var valA  = parseFloat(document.getElementById('inputA').value);
            var valB  = parseFloat(document.getElementById('inputB').value);
            var valH  = parseFloat(document.getElementById('inputH').value);
            var valAl = parseFloat(document.getElementById('inputAlpha').value);

            var hasA  = !isNaN(valA)  && valA  > 0;
            var hasB  = !isNaN(valB)  && valB  > 0;
            var hasH  = !isNaN(valH)  && valH  > 0;
            var hasAl = !isNaN(valAl) && valAl > 0 && valAl < 180;

            // Reset tất cả về mặc định
            document.querySelectorAll('.var-token').forEach(function(el) {
                el.classList.remove('var-known', 'var-target');
            });
            document.querySelectorAll('.formula-box li').forEach(function(el) {
                el.classList.remove('formula-ready');
            });

            // 1. Tô XANH cho biến đã nhập
            if (hasA)  document.querySelectorAll('.var-token[data-var="a"]').forEach(function(el)     { el.classList.add('var-known'); });
            if (hasB)  document.querySelectorAll('.var-token[data-var="b"]').forEach(function(el)     { el.classList.add('var-known'); });
            if (hasH)  document.querySelectorAll('.var-token[data-var="h"]').forEach(function(el)     { el.classList.add('var-known'); });
            if (hasAl) document.querySelectorAll('.var-token[data-var="alpha"]').forEach(function(el) { el.classList.add('var-known'); });

            // 2. Phân tích công thức nào có thể giải & tô VÀNG biến đích

            // C = 2(a+b) — cần a, b
            if (hasA && hasB) {
                document.getElementById('fm-c').classList.add('formula-ready');
                document.querySelectorAll('.var-token[data-var="C"]').forEach(function(el) { el.classList.add('var-target'); });
            }

            // S = a*h — cần a, h
            if (hasA && hasH) {
                document.getElementById('fm-s-height').classList.add('formula-ready');
                document.querySelectorAll('.var-token[data-var="S"]').forEach(function(el) { el.classList.add('var-target'); });
            }

            // S = a*b*sin(α) — cần a, b, alpha
            if (hasA && hasB && hasAl) {
                document.getElementById('fm-s-angle').classList.add('formula-ready');
                document.querySelectorAll('.var-token[data-var="S"]').forEach(function(el) { el.classList.add('var-target'); });
            }

            // h = b*sin(α) — cần b, alpha (suy luận)
            if (hasB && hasAl && !hasH) {
                document.getElementById('fm-h-deduce').classList.add('formula-ready');
                document.querySelectorAll('#fm-h-deduce .var-token[data-var="h"]').forEach(function(el) { el.classList.add('var-target'); });
                // nếu có a thì tính được S và C ngay
                if (hasA) {
                    document.getElementById('fm-s-height').classList.add('formula-ready');
                    document.querySelectorAll('.var-token[data-var="S"]').forEach(function(el) { el.classList.add('var-target'); });
                    document.getElementById('fm-c').classList.add('formula-ready');
                    document.querySelectorAll('.var-token[data-var="C"]').forEach(function(el) { el.classList.add('var-target'); });
                }
            }

            // b = h/sin(α) — cần h, alpha (suy luận)
            if (hasH && hasAl && !hasB) {
                document.getElementById('fm-b-deduce').classList.add('formula-ready');
                document.querySelectorAll('#fm-b-deduce .var-token[data-var="b"]').forEach(function(el) { el.classList.add('var-target'); });
                if (hasA) {
                    document.getElementById('fm-c').classList.add('formula-ready');
                    document.querySelectorAll('.var-token[data-var="C"]').forEach(function(el) { el.classList.add('var-target'); });
                    document.getElementById('fm-s-angle').classList.add('formula-ready');
                    document.querySelectorAll('.var-token[data-var="S"]').forEach(function(el) { el.classList.add('var-target'); });
                }
            }

            // α = arcsin(h/b) — cần h, b (suy luận, nếu h ≤ b)
            if (hasH && hasB && !hasAl && valH <= valB) {
                document.getElementById('fm-alpha-deduce').classList.add('formula-ready');
                document.querySelectorAll('#fm-alpha-deduce .var-token[data-var="alpha"]').forEach(function(el) { el.classList.add('var-target'); });
                if (hasA) {
                    document.getElementById('fm-s-angle').classList.add('formula-ready');
                    document.querySelectorAll('.var-token[data-var="S"]').forEach(function(el) { el.classList.add('var-target'); });
                }
            }
        }

        // ==========================================
        // DYNAMIC SVG
        // ==========================================
        function updateSvgShape() {
            var inA  = parseFloat(document.getElementById('inputA').value);
            var inB  = parseFloat(document.getElementById('inputB').value);
            var inH  = parseFloat(document.getElementById('inputH').value);
            var inAl = parseFloat(document.getElementById('inputAlpha').value);

            // Suy luận h từ b và alpha để vẽ
            if (isNaN(inH) && !isNaN(inB) && inB > 0 && !isNaN(inAl) && inAl > 0 && inAl < 180) {
                inH = inB * Math.sin(inAl * Math.PI / 180);
            }

            var dispA = (!isNaN(inA) && inA > 0) ? inA : 10;
            var dispH = (!isNaN(inH) && inH > 0) ? inH : 5;
            var maxW  = 180, maxH = 130;
            var scaleA = maxW / dispA, scaleH = maxH / dispH;
            var scale  = Math.min(scaleA, scaleH, 18);
            var svgA   = Math.max(80, Math.min(maxW, dispA * scale));
            var svgH   = Math.max(30, Math.min(maxH, dispH * scale));
            var offset = Math.max(20, svgH * 0.35);

            var x0 = 30, y0 = 180;
            var p1x = x0 + offset, p1y = y0 - svgH;
            var p2x = x0 + offset + svgA, p2y = y0 - svgH;
            var p3x = x0 + svgA, p3y = y0;

            var poly = document.getElementById('svgPoly');
            poly.setAttribute('points',
                p1x + ',' + p1y + ' ' + p2x + ',' + p2y + ' ' + p3x + ',' + y0 + ' ' + x0 + ',' + y0);

            var lineH = document.getElementById('svgLineH');
            lineH.setAttribute('x1', p1x); lineH.setAttribute('y1', p1y);
            lineH.setAttribute('x2', p1x); lineH.setAttribute('y2', y0);

            var sq = document.getElementById('svgSqH');
            var sqS = Math.min(12, svgH * 0.15);
            sq.setAttribute('d', 'M ' + p1x + ' ' + (y0 - sqS) + ' L ' + (p1x + sqS) + ' ' + (y0 - sqS) + ' L ' + (p1x + sqS) + ' ' + y0);

            var lblA = document.getElementById('svgLabelA');
            lblA.textContent = (!isNaN(inA) && inA > 0) ? 'a = ' + inA : 'a';
            lblA.setAttribute('x', (p1x + p2x) / 2);
            lblA.setAttribute('y', p1y - 8);

            var lblB = document.getElementById('svgLabelB');
            lblB.textContent = (!isNaN(inB) && inB > 0) ? 'b = ' + inB : 'b';
            lblB.setAttribute('x', x0 - 14);
            lblB.setAttribute('y', (y0 + p1y) / 2 + 4);

            var lblH = document.getElementById('svgLabelH');
            lblH.textContent = (!isNaN(inH) && inH > 0) ? 'h = ' + Math.round(inH * 100) / 100 : 'h';
            lblH.setAttribute('x', p1x + 6);
            lblH.setAttribute('y', (y0 + p1y) / 2 + 4);

            var lblAl = document.getElementById('svgLabelAlpha');
            lblAl.textContent = (!isNaN(inAl) && inAl > 0) ? (inAl + '°') : 'α';
            lblAl.setAttribute('x', x0 + offset * 0.5);
            lblAl.setAttribute('y', y0 - 6);
        }

        function handleAllInputs() {
            watchFormulas();
            updateSvgShape();
        }

        window.addEventListener('DOMContentLoaded', handleAllInputs);
        ['inputA','inputB','inputH','inputAlpha'].forEach(function(id) {
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