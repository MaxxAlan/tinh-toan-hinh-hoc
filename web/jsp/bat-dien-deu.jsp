<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bát Diện Đều - Công Thức, Tính Toán & Lời Giải Chi Tiết</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css?v=3">
    <script>
        MathJax = { tex: { inlineMath: [['\\(','\\)']] }, svg: { fontCache: 'global' } };
    </script>
    <script src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-svg.js" async></script>
</head>
<body>
    <header class="app-header">
        <div class="header-inner">
            <a href="${pageContext.request.contextPath}/tinh-toan-hinh-hoc" class="brand">
                <span>Tính Toán Hình Học</span>
            </a>
            <a href="${pageContext.request.contextPath}/tinh-toan-hinh-hoc" class="nav-back-link">
                <span>Về trang chủ</span>
            </a>
        </div>
    </header>

    <div class="container">
        <h1>Bát Diện Đều</h1>
        <div class="calc-grid">
            <div class="calc-col-left">
                <!-- SVG Placeholder -->
                <div class="svg-wrap" style="height:220px; display:flex; align-items:center; justify-content:center; background:#ebf8ff; border:1px dashed #2b6cb0;">
                    <span style="color:#2b6cb0;">[SVG Bát Diện Đều]</span>
                </div>
                <div class="formula-box">
                    <h2>Công Thức Tính</h2>
                    <ul id="formulaList">
                        <li id="fm-v" data-inputs="a">Thể tích: <span class="var-token" data-var="V">V</span> = <span class="var-token" data-var="a">a</span>³√2/3</li>
                        <li id="fm-s" data-inputs="a">Diện tích toàn phần: <span class="var-token" data-var="S">S</span> = 2<span class="var-token" data-var="a">a</span>²√3</li>
                    </ul>
                </div>
            </div>
            <div class="calc-col-right">
                <% if (request.getAttribute("error") != null) { %>
                <div style="color: #b91c1c; margin-bottom: 15px; padding: 12px; background: #fee2e2; border-radius: 6px;">
                    <strong>Lỗi:</strong> ${requestScope.error}
                </div>
                <% } %>
                <form class="calc-form" method="post" action="${pageContext.request.contextPath}/bat-dien-deu">
                    <div class="form-row">
                        <label>Cạnh (a):</label>
                        <input type="number" id="inputA" step="any" name="a" required value="${param.a}" placeholder="Cạnh a">
                    </div>
                    <div class="form-actions">
                        <button type="submit" class="btn-calc">Tính toán</button>
                        <button type="reset" class="btn-reset" onclick="window.location.href=window.location.pathname">Làm mới</button>
                    </div>
                </form>

                <% if (request.getAttribute("shape") != null) { %>
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
                <% } %>
                <a href="${pageContext.request.contextPath}/tinh-toan-hinh-hoc" class="btn-home-bottom">Về trang chủ</a>
            </div>
        </div>
    </div>
</body>
</html>
