<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tính Toán Hình Elip - Chuẩn SGK & THPT</title>
    <meta name="description" content="Tính diện tích elip, chu vi Ramanujan, tiêu cự, tâm sai và các thông số hình Elip chi tiết.">
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
        <h1>Tính Toán Hình Elip</h1>
        <p class="page-desc">Giải chi tiết phương trình chính tắc, diện tích, chu vi Ramanujan, tiêu cự và tâm sai.</p>

        <div class="calc-grid-2col">
            <!-- Cột trái: SVG & Công thức -->
            <div class="calc-col-left">
                <div class="svg-card">
                    <svg id="elipSvg" viewBox="0 0 280 220" width="100%" height="220" xmlns="http://www.w3.org/2000/svg">
                        <!-- Trục tọa độ Ox, Oy -->
                        <line x1="20" y1="110" x2="260" y2="110" stroke="#94a3b8" stroke-width="1.5"/>
                        <polygon points="260,110 252,106 252,114" fill="#94a3b8"/>
                        <text x="255" y="125" font-size="11" font-weight="600" fill="#64748b">x</text>

                        <line x1="140" y1="205" x2="140" y2="15" stroke="#94a3b8" stroke-width="1.5"/>
                        <polygon points="140,15 136,23 144,23" fill="#94a3b8"/>
                        <text x="148" y="24" font-size="11" font-weight="600" fill="#64748b">y</text>

                        <!-- Đường elip -->
                        <ellipse cx="140" cy="110" rx="90" ry="52" fill="rgba(99, 102, 241, 0.08)" stroke="#6366f1" stroke-width="2.5"/>

                        <!-- Tiêu điểm F1, F2 (với c ≈ sqrt(90^2 - 52^2) ≈ 73) -->
                        <circle cx="67" cy="110" r="3.5" fill="#ef4444"/>
                        <text x="67" y="126" text-anchor="middle" font-size="11" font-weight="700" fill="#ef4444">F₁(-c,0)</text>

                        <circle cx="213" cy="110" r="3.5" fill="#ef4444"/>
                        <text x="213" y="126" text-anchor="middle" font-size="11" font-weight="700" fill="#ef4444">F₂(c,0)</text>

                        <!-- Đỉnh trục lớn A1, A2 -->
                        <circle cx="50" cy="110" r="3" fill="#4338ca"/>
                        <text x="44" y="104" text-anchor="end" font-size="11" font-weight="600" fill="#4338ca">A₁(-a,0)</text>

                        <circle cx="230" cy="110" r="3" fill="#4338ca"/>
                        <text x="236" y="104" text-anchor="start" font-size="11" font-weight="600" fill="#4338ca">A₂(a,0)</text>

                        <!-- Đỉnh trục bé B1, B2 -->
                        <circle cx="140" cy="58" r="3" fill="#059669"/>
                        <text x="146" y="55" font-size="11" font-weight="600" fill="#059669">B₂(0,b)</text>

                        <circle cx="140" cy="162" r="3" fill="#059669"/>
                        <text x="146" y="174" font-size="11" font-weight="600" fill="#059669">B₁(0,-b)</text>

                        <!-- Tâm O -->
                        <circle cx="140" cy="110" r="2.5" fill="#1e293b"/>
                        <text x="133" y="123" font-size="11" font-weight="700" fill="#1e293b">O</text>
                    </svg>
                </div>

                <div class="formula-box">
                    <h2>
                        <svg viewBox="0 0 24 24"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg>
                        Công Thức Tính
                    </h2>
                    <ul id="formulaList">
                        <li id="fm-pt" data-inputs="a,b">
                            Phương trình chính tắc: \(\dfrac{x^2}{\mathbf{<span class="var-token" data-var="a">a</span>^2}} + \dfrac{y^2}{\mathbf{<span class="var-token" data-var="b">b</span>^2}} = 1\)
                        </li>
                        <li id="fm-s" data-inputs="a,b">
                            Diện tích: <span class="var-token" data-var="S">S</span> = \(\pi\)<span class="var-token" data-var="a">a</span><span class="var-token" data-var="b">b</span>
                        </li>
                        <li id="fm-c" data-inputs="a,b">
                            Tiêu cự: 2<span class="var-token" data-var="c">c</span> = \(2\sqrt{<span class="var-token" data-var="a">a</span>^2 - <span class="var-token" data-var="b">b</span>^2}\)
                        </li>
                        <li id="fm-e" data-inputs="a,c">
                            Tâm sai: <span class="var-token" data-var="e">e</span> = \(\dfrac{<span class="var-token" data-var="c">c</span>}{<span class="var-token" data-var="a">a</span>} < 1\)
                        </li>
                        <li id="fm-peri" data-inputs="a,b">
                            Chu vi Ramanujan: <span class="var-token" data-var="C">C</span> \(\approx \pi [3(a+b) - \sqrt{(3a+b)(a+3b)}]\)
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

                <form class="calc-form" method="post" action="${pageContext.request.contextPath}/hinh-elip">
                    <div style="font-size: 0.82rem; color: var(--color-text-muted); margin-bottom: 14px; line-height: 1.45; background: var(--color-neutral-subtle); padding: 8px 12px; border-radius: 6px; border: 1px dashed var(--color-border);">
                        💡 <em>Chỉ cần nhập <strong>cặp thông số phù hợp</strong> (ví dụ: bán trục <strong>a & b</strong>; hoặc độ dài trục lớn <strong>2a & 2b</strong>; hoặc <strong>a & tiêu cự c</strong>; hoặc <strong>a & diện tích S</strong>). Hệ thống sẽ tự suy luận các thông số còn lại.</em>
                    </div>

                    <div class="form-row">
                        <label>Bán trục lớn (a):</label>
                        <input type="number" id="inputA" step="any" name="a" value="${param.a}" placeholder="Ví dụ: 5">
                    </div>

                    <div class="form-row">
                        <label>Bán trục bé (b):</label>
                        <input type="number" id="inputB" step="any" name="b" value="${param.b}" placeholder="Ví dụ: 3">
                    </div>

                    <div class="form-row">
                        <label>Độ dài trục lớn (2a):</label>
                        <input type="number" id="input2A" step="any" name="twoA" value="${param.twoA}" placeholder="2a = 10">
                    </div>

                    <div class="form-row">
                        <label>Độ dài trục bé (2b):</label>
                        <input type="number" id="input2B" step="any" name="twoB" value="${param.twoB}" placeholder="2b = 6">
                    </div>

                    <div class="form-row">
                        <label>Bán tiêu cự (c):</label>
                        <input type="number" id="inputC" step="any" name="c" value="${param.c}" placeholder="c = √(a² - b²)">
                    </div>

                    <div class="form-row">
                        <label>Tâm sai (e &lt; 1):</label>
                        <input type="number" id="inputE" step="any" min="0" max="0.9999" name="e" value="${param.e}" placeholder="e = c/a">
                    </div>

                    <div class="form-row">
                        <label>Diện tích (S):</label>
                        <input type="number" id="inputS" step="any" name="s" value="${param.s}" placeholder="S = πab">
                    </div>

                    <div class="form-actions">
                        <button type="submit" class="btn-calc">Tính toán</button>
                        <button type="reset" class="btn-reset" onclick="window.location.href=window.location.pathname">Làm mới</button>
                    </div>
                </form>

                <% if (request.getAttribute("el") != null) { %>
                <div class="result-box">
                    <h2>Kết quả &amp; Các bước giải chi tiết</h2>

                    <c:if test="${requestScope.el.isDeduced()}">
                    <div style="background:#f0fdf4;border-left:4px solid #22c55e;padding:10px 14px;border-radius:4px;margin-bottom:14px;font-size:0.88rem;color:#166534;">
                        <strong>Chế độ tính:</strong> ${requestScope.el.getCalculationType()} — Hệ thống đã tự động suy luận ra các bán trục chính tắc.
                    </div>
                    </c:if>

                    <div class="step-detail">
                        <p><strong>1. Phương trình chính tắc của Elip:</strong></p>
                        <p>\[\dfrac{x^2}{(<fmt:formatNumber value="${requestScope.el.getRoundedA()}" pattern="#,##0.####"/>)^2} + \dfrac{y^2}{(<fmt:formatNumber value="${requestScope.el.getRoundedB()}" pattern="#,##0.####"/>)^2} = 1 \implies \dfrac{x^2}{<fmt:formatNumber value="${requestScope.el.getRoundedA() * requestScope.el.getRoundedA()}" pattern="#,##0.####"/>} + \dfrac{y^2}{<fmt:formatNumber value="${requestScope.el.getRoundedB() * requestScope.el.getRoundedB()}" pattern="#,##0.####"/>} = 1\]</p>
                    </div>

                    <div class="step-detail">
                        <p><strong>2. Kích thước các trục:</strong></p>
                        <p>Trục lớn: \(2a = \) <strong><fmt:formatNumber value="${requestScope.el.getRoundedMajorAxis()}" pattern="#,##0.####"/></strong> (bán trục \(a = <fmt:formatNumber value="${requestScope.el.getRoundedA()}" pattern="#,##0.####"/>\))</p>
                        <p>Trục bé: \(2b = \) <strong><fmt:formatNumber value="${requestScope.el.getRoundedMinorAxis()}" pattern="#,##0.####"/></strong> (bán trục \(b = <fmt:formatNumber value="${requestScope.el.getRoundedB()}" pattern="#,##0.####"/>\))</p>
                    </div>

                    <div class="step-detail">
                        <p><strong>3. Tiêu cự &amp; Tọa độ các tiêu điểm:</strong></p>
                        <p>Bán tiêu cự: \(c = \sqrt{a^2 - b^2} = \sqrt{(<fmt:formatNumber value="${requestScope.el.getRoundedA()}" pattern="#,##0.####"/>)^2 - (<fmt:formatNumber value="${requestScope.el.getRoundedB()}" pattern="#,##0.####"/>)^2} = \) <strong><fmt:formatNumber value="${requestScope.el.getRoundedC()}" pattern="#,##0.####"/></strong></p>
                        <p>Tiêu cự: \(2c = \) <strong><fmt:formatNumber value="${requestScope.el.getRoundedFocalDistance()}" pattern="#,##0.####"/></strong></p>
                        <p>Hai tiêu điểm: \(F_1(-<fmt:formatNumber value="${requestScope.el.getRoundedC()}" pattern="#,##0.####"/>, 0)\), \(F_2(<fmt:formatNumber value="${requestScope.el.getRoundedC()}" pattern="#,##0.####"/>, 0)\)</p>
                    </div>

                    <div class="step-detail">
                        <p><strong>4. Tâm sai (e):</strong></p>
                        <p>\(e = \dfrac{c}{a} = \dfrac{<fmt:formatNumber value="${requestScope.el.getRoundedC()}" pattern="#,##0.####"/>}{<fmt:formatNumber value="${requestScope.el.getRoundedA()}" pattern="#,##0.####"/>} = \) <strong><fmt:formatNumber value="${requestScope.el.getRoundedE()}" pattern="#,##0.####"/></strong> \( (< 1) \)</p>
                    </div>

                    <div class="step-detail">
                        <p><strong>5. Diện tích Elip (S):</strong></p>
                        <p>\(S = \pi \cdot a \cdot b = \pi \times <fmt:formatNumber value="${requestScope.el.getRoundedA()}" pattern="#,##0.####"/> \times <fmt:formatNumber value="${requestScope.el.getRoundedB()}" pattern="#,##0.####"/> = \) <strong><fmt:formatNumber value="${requestScope.el.getRoundedArea()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị diện tích</span></p>
                    </div>

                    <div class="step-detail">
                        <p><strong>6. Chu vi Elip (Xấp xỉ Ramanujan):</strong></p>
                        <p>\(C \approx \pi \left[ 3(a + b) - \sqrt{(3a + b)(a + 3b)} \right] = \) <strong><fmt:formatNumber value="${requestScope.el.getRoundedPerimeter()}" pattern="#,##0.####"/></strong> <span class="unit-text">đơn vị dài</span></p>
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
            var inB = document.getElementById('inputB');
            var in2A = document.getElementById('input2A');
            var in2B = document.getElementById('input2B');
            var inC = document.getElementById('inputC');
            var inE = document.getElementById('inputE');
            var inS = document.getElementById('inputS');

            var valA = (inA && parseFloat(inA.value) > 0) || (in2A && parseFloat(in2A.value) > 0);
            var valB = (inB && parseFloat(inB.value) > 0) || (in2B && parseFloat(in2B.value) > 0);
            var valC = inC && parseFloat(inC.value) > 0;
            var valE = inE && parseFloat(inE.value) > 0;
            var valS = inS && parseFloat(inS.value) > 0;

            var anyInput = valA || valB || valC || valE || valS;

            document.querySelectorAll('.var-token').forEach(function(token) {
                var v = token.getAttribute('data-var');
                token.classList.remove('known', 'target');

                if (v === 'a' && valA) token.classList.add('known');
                else if (v === 'b' && valB) token.classList.add('known');
                else if (v === 'c' && valC) token.classList.add('known');
                else if (v === 'e' && valE) token.classList.add('known');
                else if (v === 'S' && valS) token.classList.add('known');
                else if (anyInput) {
                    token.classList.add('target');
                }
            });
        }

        ['inputA', 'inputB', 'input2A', 'input2B', 'inputC', 'inputE', 'inputS'].forEach(function(id) {
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
