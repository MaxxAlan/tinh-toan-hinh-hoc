<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hai Mươi Mặt Đều</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css?v=3">
</head>
<body>
    <div class="container">
        <h1>Hai Mươi Mặt Đều</h1>
        <div class="calc-grid">
            <div class="calc-col-left">
                <div class="formula-box">
                    <h2>Công Thức Tính</h2>
                    <ul>
                        <li>Thể tích: \(V = \dfrac{5a^3(3+\sqrt{5})}{12}\)</li>
                        <li>Diện tích toàn phần: \(S = 5a^2\sqrt{3}\)</li>
                    </ul>
                </div>
            </div>
            <div class="calc-col-right">
                <% if (request.getAttribute("error") != null) { %>
                    <div style="color: red;">${requestScope.error}</div>
                <% } %>
                <form class="calc-form" method="post" action="${pageContext.request.contextPath}/hai-muoi-mat-deu">
                    <div class="form-row">
                        <label>Cạnh (a):</label>
                        <input type="number" step="any" name="a" required value="${param.a}">
                    </div>
                    <button type="submit" class="btn-calc">Tính toán</button>
                </form>

                <% if (request.getAttribute("shape") != null) { %>
                <div class="result-box">
                    <h2>Kết quả</h2>
                    <p>Thể tích (V): <fmt:formatNumber value="${requestScope.shape.getVolume()}" pattern="#,##0.####"/></p>
                    <p>Diện tích toàn phần (S): <fmt:formatNumber value="${requestScope.shape.getSurfaceArea()}" pattern="#,##0.####"/></p>
                </div>
                <% } %>
                <a href="${pageContext.request.contextPath}/tinh-toan-hinh-hoc">Về trang chủ</a>
            </div>
        </div>
    </div>
</body>
</html>
