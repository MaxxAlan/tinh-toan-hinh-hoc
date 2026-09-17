<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tính Toán Hình Lục Giác Đều - Chuẩn SGK & THPT</title>
    <meta name="description" content="Tính chu vi, diện tích, bán kính ngoại tiếp, nội tiếp và đường chéo hình lục giác đều chuẩn xác.">
    <link rel="icon" type="image/svg+xml" href="${pageContext.request.contextPath}/assets/favicon.svg">
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
                <div class="brand-icon">
                    <svg viewBox="0 0 24 24"><polygon points="3 20 21 20 12 4 3 20"></polygon><line x1="12" y1="4" x2="12" y2="20"></line></svg>
                </div>
                <span>Tính Toán Hình Học</span>
            </a>
            <a href="${pageContext.request.contextPath}/tinh-toan-hinh-hoc" class="btn-nav-back">
                <svg viewBox="0 0 24 24"><path d="M19 12H5M12 19l-7-7 7-7"/></svg>
                Trang Chủ
            </a>
        </div>
    </header>

    <main class="container">
        <h1>Tính Toán Hình Lục Giác Đều</h1>
        <p class="page-desc">Lục giác đều gồm 6 tam giác đều cạnh \(a\). Hỗ trợ suy luận ngược từ bất kỳ thông số nào.</p>

        <div class="calc-grid-2col">
            <!-- Cột trái: SVG & Công thức -->
            <div class="calc-col-left">
                <div class="svg-card">
                    <svg id="hexSvg" viewBox="0 0 280 220" width="100%" height="220" xmlns="http://www.w3.org/2000/svg">
                        <!-- Đường tròn ngoại tiếp R (nét đứt mờ) -->
                        <circle cx="140" cy="110" r="80" fill="none" stroke="#93c5fd" stroke-dasharray="3,3" stroke-width="1"/>
                        <!-- Đường tròn nội tiếp r (nét đứt mờ) -->
                        <circle cx="140" cy="110" r="69.28" fill="none" stroke="#cbd5e1" stroke-dasharray="3,3" stroke-width="1"/>
                        
                        <!-- 6 tam giác đều tạo thành lục giác -->
                        <line x1="140" y1="110" x2="220" y2="110" stroke="#cbd5e1" stroke-width="1"/>
                        <line x1="140" y1="110" x2="180" y2="40.7" stroke="#cbd5e1" stroke-width="1"/>
                        <line x1="140" y1="110" x2="100" y2="40.7" stroke="#cbd5e1" stroke-width="1"/>
                        <line x1="140" y1="110" x2="60" y2="110" stroke="#cbd5e1" stroke-width="1"/>
                        <line x1="140" y1="110" x2="100" y2="179.3" stroke="#cbd5e1" stroke-width="1"/>
                        <line x1="140" y1="110" x2="180" y2="179.3" stroke="#cbd5e1" stroke-width="1"/>
                        
                        <!-- Đường chéo chính d1 -->
                        <line x1="60" y1="110" x2="220" y2="110" stroke="#ef4444" stroke-width="1.5" stroke-dasharray="4,3"/>
                        <!-- Đường chéo phụ d2 (nối 180,40.7 với 180,179.3) -->
                        <line x1="180" y1="40.7" x2="180" y2="179.3" stroke="#3b82f6" stroke-width="1.5" stroke-dasharray="4,3"/>

                        <!-- Đa giác lục giác đều -->
                        <polygon points="220,110 180,40.7 100,40.7 60,110 100,179.3 180,179.3" fill="rgba(59, 130, 246, 0.08)" stroke="#2563eb" stroke-width="2.5"/>
                        
                        <!-- Tâm O -->
                        <circle cx="140" cy="110" r="3" fill="#1e40af"/>
                        <text x="140" y="103" text-anchor="middle" font-size="11" font-weight="700" fill="#1e40af">O</text>
                        
                        <!-- Nhãn thông số -->
                        <text x="140" y="32" text-anchor="middle" font-size="12" font-weight="700" fill="#2563eb">cạnh a</text>
                        <text x="100" y="104" text-anchor="middle" font-size="11" font-weight="700" fill="#ef4444">d₁ = 2a</text>
                        <text x="188" y="115" text-anchor="start" font-size="11" font-weight="700" fill="#3b82f6">d₂ = a√3</text>
                        <text x="135" y="155" text-anchor="end" font-size="11" font-weight="600" fill="#059669">r = a√3/2</text>
                    </svg>
                </div>

                <div class="formula-box">
                    <h2>
                        <svg viewBox="0 0 24 24"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg>
                        Công Thức Tính
                    </h2>
                    <ul id="formulaList">
                        <li id="fm-p" data-inputs="a">
                            Chu vi: <span class="var-token" data-var="P">P</span> = 6<span class="var-token" data-var="a">a</span>
                        </li>
                        <li id="fm-s" data-inputs="a">
                            Diện tích: <span class="var-token" data-var="S">S</span> = \(\dfrac{3\sqrt{3}}{2}\)<span class="var-token" data-var="a">a</span>²
                        </li>
                        <li id="fm-r-out" data-inputs="a">
                            Bán kính ngoại tiếp: <span class="var-token" data-var="R">R</span> = <span class="var-token" data-var="a">a</span>
                        </li>
                        <li id="fm-r-in" data-inputs="a">
                            Bán kính nội tiếp: <span class="var-token" data-var="r">r</span> = \(\dfrac{\sqrt{3}}{2}\)<span class="var-token" data-var="a">a</span>
                        </li>
                        <li id="fm-d1" data-inputs="a">
                            Đường chéo chính: <span class="var-token" data-var="d1">d₁</span> = 2<span class="var-token" data-var="a">a</span>
                        </li>
                        <li id="fm-d2" data-inputs="a">
                            Đường chéo phụ: <span class="var-token" data-var="d2">d₂</span> = <span class="var-token" data-var="a">a</span>\(\sqrt{3}\)
                        </li>
                    </ul>

                    <div class="formula-legend">
                        <span class="legend-item"><span class="legend-dot dot-known"></span> <strong>Xanh</strong>: Đã nhập</span>
                        <span class="legend-item"><span class="legend-dot dot-target"></span> <strong>Vàng</strong>: Sẽ tính / suy ra</span>
                    </div>
                </div>
            </div>

            <!-- Cột phải: Form nhập & Kết quả -->
            <div class="calc-col-right">
                <% if (request.getAttribute("error") != null) { %>
                <div style="color: #b91c1c; margin-bottom: 15px; padding: 12px; background: #fee2e2; border-radius: 6px; border: 1px solid #f87171;">
                    <strong>Lỗi:</strong> ${requestScope.error}
                </div>
                <% } %>

                <form class="calc-form" method="post" action="${pageContext.request.contextPath}/hinh-luc-giac-deu">
                    <div style="font-size: 0.82rem; color: var(--color-text-muted); margin-bottom: 14px; line-height: 1.45; background: var(--color-neutral-subtle); padding: 8px 12px; border-radius: 6px; border: 1px dashed var(--color-border);">
                        💡 <em>Chỉ cần nhập <strong>1 thông số bất kỳ</strong> (cạnh <strong>a</strong>, chu vi <strong>P</strong>, diện tích <strong>S</strong>, bán kính <strong>R/r</strong> hoặc đường chéo). Hệ thống sẽ tự suy luận toàn bộ các thông số còn lại.</em>
                    </div>

                    <div class="form-row">
                        <label>Độ dài cạnh (a):</label>
                        <input type="number" id="inputA" step="any" name="a" value="${param.a}" placeholder="Ví dụ: 6">
                    </div>

                    <div class="form-row">
                        <label>Chu vi (P):</label>
                        <input type="number" id="inputP" step="any" name="p" value="${param.p}" placeholder="P = 6a">
                    </div>

                    <div class="form-row">
                        <label>Diện tích (S):</label>
                        <input type="number" id="inputS" step="any" name="s" value="${param.s}" placeholder="S = 3√3/2 · a²">
                    </div>

                    <div class="form-row">
                        <label>Bán kính ngoại tiếp (R):</label>
                        <input type="number" id="inputR" step="any" name="r" value="${param.r}" placeholder="R = a">
                    </div>

                    <div class="form-row">
                        <label>Bán kính nội tiếp (r):</label>
                        <input type="number" id="inputRIn" step="any" name="rIn" value="${param.rIn}" placeholder="r = a√3/2">
                    </div>

                    <div class="form-row">
                        <label>Đường chéo chính (d₁):</label>
                        <input type="number" id="inputD1" step="any" name="d1" value="${param.d1}" placeholder="d₁ = 2a">
                    </div>

                    <div class="form-row">
                        <label>Đường chéo phụ (d₂):</label>
                        <input type="number" id="inputD2" step="any" name="d2" value="${param.d2}" placeholder="d₂ = a√3">
                    </div>

                    <div class="form-actions">
                        <button type="submit" class="btn-calc">Tính toán</button>
                        <button type="reset" class="btn-reset" onclick="window.location.href=window.location.pathname">Làm mới</button>
                    </div>
                </form>

                <% if (request.getAttribute("hex") != null) { %>
                <div class="result-box">
                    <h2>Kết quả &amp; Các bước giải chi tiết</h2>
                    
                    <c:if test="${requestScope.hex.isDeducedFromOther()}">
                    <div style="background:#f0fdf4;border-left:4px solid #22c55e;padding:10px 14px;border-radius:4px;margin-bottom:14px;font-size:0.88rem;color:#166534;">
                        <strong>Suy luận từ ${requestScope.hex.getInputMode()}:</strong> 
                        Đã xác định độ dài cạnh <strong>a = <fmt:formatNumber value="${requestScope.hex.getRoundedA()}" pattern="#,##0.####"/></strong>
                    </div>
                    </c:if>

                    <div class="step-detail">
                        <p><strong>1. Độ dài cạnh (a):</strong></p>
                        <p>\(a =\) <strong><fmt:formatNumber value="${requestScope.hex.getRoundedA()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị dài</span></p>
                    </div>

                    <div class="step-detail">
                        <p><strong>2. Chu vi lục giác đều (P):</strong></p>
                        <p>\(P = 6 \cdot a = 6 \times <fmt:formatNumber value="${requestScope.hex.getRoundedA()}" pattern="#,##0.####"/> = \) <strong><fmt:formatNumber value="${requestScope.hex.getRoundedPerimeter()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị dài</span></p>
                    </div>

                    <div class="step-detail">
                        <p><strong>3. Diện tích lục giác đều (S):</strong></p>
                        <p>\(S = \dfrac{3\sqrt{3}}{2} \cdot a^2 = \dfrac{3\sqrt{3}}{2} \times (<fmt:formatNumber value="${requestScope.hex.getRoundedA()}" pattern="#,##0.####"/>)^2 = \) <strong><fmt:formatNumber value="${requestScope.hex.getRoundedArea()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị diện tích</span></p>
                    </div>

                    <div class="step-detail">
                        <p><strong>4. Bán kính đường tròn ngoại tiếp (R) &amp; nội tiếp (r):</strong></p>
                        <p>\(R = a =\) <strong><fmt:formatNumber value="${requestScope.hex.getRoundedCircumradius()}" pattern="#,##0.####"/></strong></p>
                        <p>\(r = \dfrac{a\sqrt{3}}{2} = \) <strong><fmt:formatNumber value="${requestScope.hex.getRoundedInradius()}" pattern="#,##0.####"/></strong></p>
                    </div>

                    <div class="step-detail">
                        <p><strong>5. Độ dài các đường chéo:</strong></p>
                        <p>Đường chéo chính (qua tâm): \(d_1 = 2a = \) <strong><fmt:formatNumber value="${requestScope.hex.getRoundedMajorDiagonal()}" pattern="#,##0.####"/></strong></p>
                        <p>Đường chéo phụ: \(d_2 = a\sqrt{3} = \) <strong><fmt:formatNumber value="${requestScope.hex.getRoundedMinorDiagonal()}" pattern="#,##0.####"/></strong></p>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
    </main>

    <footer class="app-footer">
        © MaxxAlan. Hệ thống công cụ học tập và ôn luyện hình học trực quan.
    </footer>

    <script>
        function watchFormulas() {
            var inA = document.getElementById('inputA');
            var inP = document.getElementById('inputP');
            var inS = document.getElementById('inputS');
            var inR = document.getElementById('inputR');
            var inRIn = document.getElementById('inputRIn');
            var inD1 = document.getElementById('inputD1');
            var inD2 = document.getElementById('inputD2');

            var valA = inA && parseFloat(inA.value) > 0;
            var valP = inP && parseFloat(inP.value) > 0;
            var valS = inS && parseFloat(inS.value) > 0;
            var valR = inR && parseFloat(inR.value) > 0;
            var valRIn = inRIn && parseFloat(inRIn.value) > 0;
            var valD1 = inD1 && parseFloat(inD1.value) > 0;
            var valD2 = inD2 && parseFloat(inD2.value) > 0;

            var anyInput = valA || valP || valS || valR || valRIn || valD1 || valD2;

            document.querySelectorAll('.var-token').forEach(function(token) {
                var v = token.getAttribute('data-var');
                token.classList.remove('known', 'target');

                if (v === 'a' && valA) token.classList.add('known');
                else if (v === 'P' && valP) token.classList.add('known');
                else if (v === 'S' && valS) token.classList.add('known');
                else if (v === 'R' && valR) token.classList.add('known');
                else if (v === 'r' && valRIn) token.classList.add('known');
                else if (v === 'd1' && valD1) token.classList.add('known');
                else if (v === 'd2' && valD2) token.classList.add('known');
                else if (anyInput) {
                    token.classList.add('target');
                }
            });
        }

        ['inputA', 'inputP', 'inputS', 'inputR', 'inputRIn', 'inputD1', 'inputD2'].forEach(function(id) {
            var el = document.getElementById(id);
            if (el) {
                el.addEventListener('input', watchFormulas);
                el.addEventListener('change', watchFormulas);
            }
        });
        window.addEventListener('DOMContentLoaded', watchFormulas);
    </script>
</body>
</html>
