<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hình Chỏm Cầu</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css?v=3">
</head>
<body>
    <div class="container">
        <h1>Hình Chỏm Cầu</h1>
        <div class="calc-grid">
            <div class="calc-col-left">
                <div class="formula-box">
                    <h2>Công Thức Tính</h2>
                    <ul>
                        <li>Diện tích xung quanh: \(S_{xq} = 2\pi R h\)</li>
                        <li>Thể tích: \(V = \pi h^2(R - \dfrac{h}{3})\)</li>
                    </ul>
                </div>
            </div>
            <div class="calc-col-right">
                <% if (request.getAttribute("error") != null) { %>
                    <div style="color: red;">${requestScope.error}</div>
                <% } %>
                <form class="calc-form" method="post" action="${pageContext.request.contextPath}/chom-cau">
                    <div class="form-row">
                        <label>Bán kính (R):</label>
                        <input type="number" step="any" name="r" required value="${param.r}">
                    </div>
                    <div class="form-row">
                        <label>Chiều cao (h):</label>
                        <input type="number" step="any" name="h" required value="${param.h}">
                    </div>
                    <button type="submit" class="btn-calc">Tính toán</button>
                </form>

                <% if (request.getAttribute("shape") != null) { %>
                <div class="result-box">
                    <h2>Kết quả</h2>
                    <p>Diện tích xung quanh (S_xq): <fmt:formatNumber value="${requestScope.shape.getSurfaceArea()}" pattern="#,##0.####"/></p>
                    <p>Thể tích (V): <fmt:formatNumber value="${requestScope.shape.getVolume()}" pattern="#,##0.####"/></p>
                </div>
                <% } %>
                <a href="${pageContext.request.contextPath}/tinh-toan-hinh-hoc">Về trang chủ</a>
            </div>
        </div>
    </div>
</body>
</html>
