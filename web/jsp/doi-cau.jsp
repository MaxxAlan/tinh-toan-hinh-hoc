<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hình Đới Cầu</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css?v=3">
</head>
<body>
    <div class="container">
        <h1>Hình Đới Cầu</h1>
        <div class="calc-grid">
            <div class="calc-col-left">
                <div class="formula-box">
                    <h2>Công Thức Tính</h2>
                    <ul>
                        <li>Thể tích: \(V = \dfrac{1}{6}\pi h(3r_1^2 + 3r_2^2 + h^2)\)</li>
                    </ul>
                </div>
            </div>
            <div class="calc-col-right">
                <% if (request.getAttribute("error") != null) { %>
                    <div style="color: red;">${requestScope.error}</div>
                <% } %>
                <form class="calc-form" method="post" action="${pageContext.request.contextPath}/doi-cau">
                    <div class="form-row">
                        <label>Bán kính đáy 1 (r1):</label>
                        <input type="number" step="any" name="r1" required value="${param.r1}">
                    </div>
                    <div class="form-row">
                        <label>Bán kính đáy 2 (r2):</label>
                        <input type="number" step="any" name="r2" required value="${param.r2}">
                    </div>
                    <div class="form-row">
                        <label>Khoảng cách (h):</label>
                        <input type="number" step="any" name="h" required value="${param.h}">
                    </div>
                    <button type="submit" class="btn-calc">Tính toán</button>
                </form>

                <% if (request.getAttribute("shape") != null) { %>
                <div class="result-box">
                    <h2>Kết quả</h2>
                    <p>Thể tích (V): <fmt:formatNumber value="${requestScope.shape.getVolume()}" pattern="#,##0.####"/></p>
                </div>
                <% } %>
                <a href="${pageContext.request.contextPath}/tinh-toan-hinh-hoc">Về trang chủ</a>
            </div>
        </div>
    </div>
</body>
</html>
