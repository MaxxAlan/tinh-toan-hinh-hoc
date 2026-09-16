<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Primary Meta Tags -->
    <title>Hình Chữ Nhật - Công Thức, Tính Toán & Lời Giải Chi Tiết</title>
    <meta name="title" content="Hình Chữ Nhật - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta name="description" content="Tính chu vi, diện tích, đường chéo hình chữ nhật kèm mô phỏng SVG tương tác và lời giải từng bước.">
    <meta name="author" content="MaxxAlan">
    <meta name="robots" content="index, follow">
    <meta name="theme-color" content="#2b6cb0">

    <!-- Open Graph / Facebook / Zalo -->
    <meta property="og:type" content="article">
    <meta property="og:url" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/hinh-chu-nhat">
    <meta property="og:title" content="Hình Chữ Nhật - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta property="og:description" content="Tính chu vi, diện tích, đường chéo hình chữ nhật kèm mô phỏng SVG tương tác và lời giải từng bước.">
    <meta property="og:image" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/web/assets/og-image.jpg">
    <meta property="og:image:width" content="1200">
    <meta property="og:image:height" content="630">
    <meta property="og:locale" content="vi_VN">
    <meta property="og:site_name" content="Tính Toán Hình Học Online">

    <!-- Twitter -->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:url" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/hinh-chu-nhat">
    <meta property="twitter:title" content="Hình Chữ Nhật - Công Thức, Tính Toán & Lời Giải Chi Tiết">
    <meta property="twitter:description" content="Tính chu vi, diện tích, đường chéo hình chữ nhật kèm mô phỏng SVG tương tác và lời giải từng bước.">
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
        <h1>Hình Chữ Nhật</h1>

        <div class="calc-layout">
            <div class="calc-col-left">
                <div class="svg-wrap">
            <svg id="rectSvg" viewBox="0 0 260 160" xmlns="http://www.w3.org/2000/svg">
                <!-- Sẽ được vẽ động hoặc hiển thị mặc định -->
                <rect id="svgRect" x="30" y="30" width="180" height="100" fill="#ebf8ff" stroke="#2b6cb0" stroke-width="2" rx="4"/>
                <line id="svgDiag" x1="30" y1="130" x2="210" y2="30" stroke="#cbd5e0" stroke-width="1.5" stroke-dasharray="4,4"/>
                <text id="svgLabelA" x="120" y="22" text-anchor="middle" font-size="13" font-weight="600" fill="#2b6cb0">a (chiều dài)</text>
                <text id="svgLabelB" x="220" y="85" text-anchor="start" font-size="13" font-weight="600" fill="#2b6cb0">b (rộng)</text>
            </svg>
        </div>

        <div class="formula-box">
            <h2>Công thức</h2>
            <ul>
                <li>Chu vi: \(C = 2(a + b)\)</li>
                <li>Diện tích: \(S = a \times b\)</li>
                <li>Đường chéo: \(d = \sqrt{a^2 + b^2}\)</li>
                <li>Bán kính ngoại tiếp: \(R = \dfrac{d}{2} = \dfrac{\sqrt{a^2 + b^2}}{2}\)</li>
            </ul>
        </div>
            </div>
            <div class="calc-col-right">
                <% if (request.getAttribute("error") != null) { %>
            <div style="color: #b91c1c; margin-bottom: 15px; padding: 12px; background: #fee2e2; border-radius: 6px; border: 1px solid #f87171;">
                <strong>Lỗi:</strong> ${requestScope.error}
            </div>
        <% } %>
        <form class="calc-form" method="post" action="${pageContext.request.contextPath}/hinh-chu-nhat">
            <div class="form-row">
                <label>Chiều dài (a):</label>
                <input type="number" id="inputA" step="any" name="s" required value="${param.s}" placeholder="Nhập chiều dài a">
            </div>
            <div class="form-row">
                <label>Chiều rộng (b):</label>
                <input type="number" id="inputB" step="any" name="l" required value="${param.l}" placeholder="Nhập chiều rộng b">
            </div>
            <div class="form-actions">
                <button type="submit" class="btn-calc">Tính toán</button>
                <button type="reset" class="btn-reset" onclick="window.location.href=window.location.pathname">Làm mới</button>
            </div>
        </form>

        <% if (request.getAttribute("hcn") != null) { %>
        <div class="result-box">
            <h2>Kết quả & Các bước giải chi tiết</h2>
            <div class="step-detail">
                <p><strong>1. Chu vi (C):</strong></p>
                <p>\(C = 2 \times (a + b) = 2 \times (${param.s} + ${param.l}) = \) <strong><fmt:formatNumber value="${requestScope.hcn.getPerimeter()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị dài</span></p>
            </div>
            <div class="step-detail">
                <p><strong>2. Diện tích (S):</strong></p>
                <p>\(S = a \times b = ${param.s} \times ${param.l} = \) <strong><fmt:formatNumber value="${requestScope.hcn.getArea()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị diện tích</span></p>
            </div>
            <div class="step-detail">
                <p><strong>3. Đường chéo (d):</strong></p>
                <p>\(d = \sqrt{a^2 + b^2} = \sqrt{${param.s}^2 + ${param.l}^2} \approx \) <strong><fmt:formatNumber value="${requestScope.hcn.getDiagonal()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị dài</span></p>
            </div>
            <div class="step-detail">
                <p><strong>4. Bán kính đường tròn ngoại tiếp (R):</strong></p>
                <p>\(R = \dfrac{d}{2} = \dfrac{\sqrt{${param.s}^2 + ${param.l}^2}}{2} \approx \) <strong><fmt:formatNumber value="${requestScope.hcn.getCircumradius()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị dài</span></p>
            </div>
        </div>
        <% } %>
                <a href="${pageContext.request.contextPath}/tinh-toan-hinh-hoc" class="btn-home-bottom">Về trang chủ</a>
            </div>
        </div>
    </div>

    <!-- Script điều chỉnh SVG co giãn tương tác theo tỷ lệ a và b -->
    <script>
        function updateSvgShape() {
            var inA = parseFloat(document.getElementById('inputA').value);
            var inB = parseFloat(document.getElementById('inputB').value);
            
            // Nếu chưa nhập số hợp lệ, dùng tỷ lệ mẫu 180x100
            if (isNaN(inA) || isNaN(inB) || inA <= 0 || inB <= 0) {
                return;
            }
            
            var maxW = 200;
            var maxH = 110;
            var startX = 25;
            var startY = 25;
            
            // Tính toán scale vừa vặn khung vẽ SVG 260x160
            var scale = Math.min(maxW / inA, maxH / inB);
            var rectW = inA * scale;
            var rectH = inB * scale;
            
            // Canh giữa khung hình
            var x = startX + (maxW - rectW) / 2;
            var y = startY + (maxH - rectH) / 2;
            
            var rect = document.getElementById('svgRect');
            rect.setAttribute('x', x);
            rect.setAttribute('y', y);
            rect.setAttribute('width', rectW);
            rect.setAttribute('height', rectH);
            
            var diag = document.getElementById('svgDiag');
            diag.setAttribute('x1', x);
            diag.setAttribute('y1', y + rectH);
            diag.setAttribute('x2', x + rectW);
            diag.setAttribute('y2', y);
            
            var labelA = document.getElementById('svgLabelA');
            labelA.setAttribute('x', x + rectW / 2);
            labelA.setAttribute('y', y - 8);
            labelA.textContent = "a = " + inA;
            
            var labelB = document.getElementById('svgLabelB');
            labelB.setAttribute('x', x + rectW + 10);
            labelB.setAttribute('y', y + rectH / 2 + 5);
            labelB.textContent = "b = " + inB;
        }

        // Tự động gọi khi load trang (nếu đã có param) và khi người dùng gõ
        window.addEventListener('DOMContentLoaded', updateSvgShape);
        document.getElementById('inputA').addEventListener('input', updateSvgShape);
        document.getElementById('inputB').addEventListener('input', updateSvgShape);
    </script>

    <footer class="app-footer">
        © MaxxAlan. Hệ thống công cụ học tập và ôn luyện hình học trực quan.
    </footer>

</body>
</html>
