<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Công Thức Nâng Cao - Oxyz, Mặt Cầu Ngoại Tiếp & Tỉ Số Thể Tích</title>
    <meta name="title" content="Công Thức Nâng Cao - Oxyz, Mặt Cầu Ngoại Tiếp & Tỉ Số Thể Tích">
    <meta name="description" content="Tổng hợp công thức nâng cao Oxyz, bán kính mặt cầu ngoại tiếp 6 dạng, tỉ số thể tích và 5 khối đa diện đều ôn thi THPT.">
    <meta name="author" content="MaxxAlan">
    <meta name="robots" content="index, follow">
    <meta name="theme-color" content="#1d4ed8">
    <meta property="og:type" content="article">
    <meta property="og:url" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/cong-thuc-nang-cao">
    <meta property="og:title" content="Công Thức Nâng Cao - Oxyz, Mặt Cầu Ngoại Tiếp & Tỉ Số Thể Tích">
    <meta property="og:description" content="Tổng hợp công thức nâng cao Oxyz, bán kính mặt cầu ngoại tiếp 6 dạng, tỉ số thể tích và 5 khối đa diện đều ôn thi THPT.">
    <meta property="og:image" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/web/assets/og-image.jpg?v=2">
    <meta property="og:image:width" content="1200">
    <meta property="og:image:height" content="630">
    <meta property="og:locale" content="vi_VN">
    <meta property="og:site_name" content="Tính Toán Hình Học">
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:url" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/cong-thuc-nang-cao">
    <meta property="twitter:title" content="Công Thức Nâng Cao - Oxyz, Mặt Cầu Ngoại Tiếp & Tỉ Số Thể Tích">
    <meta property="twitter:description" content="Tổng hợp công thức nâng cao Oxyz, bán kính mặt cầu ngoại tiếp 6 dạng, tỉ số thể tích và 5 khối đa diện đều ôn thi THPT.">
    <meta property="twitter:image" content="https://maxxalan.github.io/tinh-toan-hinh-hoc/web/assets/og-image.jpg?v=2">
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
            <a href="${pageContext.request.contextPath}/app?page=home" class="brand">
                <div class="brand-icon">
                    <svg viewBox="0 0 24 24"><polygon points="3 20 21 20 12 4 3 20"></polygon><line x1="12" y1="4" x2="12" y2="20"></line></svg>
                </div>
                <span>Tính Toán Hình Học</span>
            </a>
            <a href="${pageContext.request.contextPath}/app?page=home" class="nav-back-link">
                <svg viewBox="0 0 24 24"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
                <span>Về trang chủ</span>
            </a>
        </div>
    </header>

    <main class="container">
        <h1>Công Thức Nâng Cao</h1>
        <p class="page-desc">Trang tra cứu tĩnh: Oxyz, mặt cầu ngoại tiếp 6 dạng, tỉ số thể tích, 5 khối đa diện đều. Không cần nhập liệu.</p>

        <!-- Oxyz -->
        <section class="formula-box" style="margin-top: 24px;">
            <h2>
                <svg viewBox="0 0 24 24"><line x1="3" y1="3" x2="21" y2="21"></line><path d="M3 21V3h18"></path></svg>
                Hình Học Tọa Độ Oxyz (Lớp 12)
            </h2>
            <ul>
                <li><strong>Tích có hướng</strong>: Cho \(\vec{u}=(x_1,y_1,z_1),\; \vec{v}=(x_2,y_2,z_2)\):
                    \[[\vec{u},\vec{v}] = (y_1z_2-z_1y_2\;,\; z_1x_2-x_1z_2\;,\; x_1y_2-y_1x_2)\]
                </li>
                <li><strong>Diện tích tam giác</strong> \(ABC\):
                    \[S_{\Delta ABC} = \dfrac{1}{2}\left|[\vec{AB},\vec{AC}]\right|\]
                </li>
                <li><strong>Thể tích tứ diện</strong> \(ABCD\):
                    \[V = \dfrac{1}{6}\left|[\vec{AB},\vec{AC}]\cdot\vec{AD}\right|\]
                </li>
                <li><strong>Thể tích khối hộp</strong> \(ABCD.A'B'C'D'\):
                    \[V = \left|[\vec{AB},\vec{AD}]\cdot\vec{AA'}\right|\]
                </li>
                <li><strong>Khoảng cách điểm → mặt phẳng</strong>: \(M(x_0,y_0,z_0)\) đến \((P): Ax+By+Cz+D=0\):
                    \[d(M,(P)) = \dfrac{|Ax_0+By_0+Cz_0+D|}{\sqrt{A^2+B^2+C^2}}\]
                </li>
                <li><strong>Khoảng cách điểm → đường thẳng</strong>:
                    \[d(M,\Delta) = \dfrac{|[\vec{AM},\vec{u}]|}{|\vec{u}|}\]
                </li>
                <li><strong>Khoảng cách 2 đường chéo nhau</strong>:
                    \[d(\Delta_1,\Delta_2) = \dfrac{\left|[\vec{u_1},\vec{u_2}]\cdot\vec{AB}\right|}{\left|[\vec{u_1},\vec{u_2}]\right|}\]
                </li>
            </ul>
        </section>

        <!-- R_mc 6 dạng -->
        <section class="formula-box" style="margin-top: 24px;">
            <h2>
                <svg viewBox="0 0 24 24"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path></svg>
                Bán Kính Mặt Cầu Ngoại Tiếp \(R_{mc}\) (6 Dạng Trọng Tâm)
            </h2>
            <ul>
                <li><strong>Dạng 1</strong> — Chóp có cạnh bên ⊥ đáy (\(SA \perp\) đáy):
                    \[R_{mc} = \sqrt{R_{\text{đáy}}^2 + \dfrac{SA^2}{4}}\]
                </li>
                <li><strong>Dạng 2</strong> — Khối chóp đều:
                    \[R_{mc} = \dfrac{SA^2}{2 \cdot SO}\]
                </li>
                <li><strong>Dạng 3</strong> — Chóp có mặt bên ⊥ mặt phẳng đáy:
                    \[R_{mc} = \sqrt{R_{\text{đáy}}^2 + R_{\text{bên}}^2 - \dfrac{GT^2}{4}}\]
                </li>
                <li><strong>Dạng 4</strong> — Lăng trụ đứng / đều:
                    \[R_{mc} = \sqrt{R_{\text{đáy}}^2 + \dfrac{h^2}{4}}\]
                </li>
                <li><strong>Dạng 5</strong> — Tứ diện vuông tại \(O\):
                    \[R_{mc} = \dfrac{\sqrt{OA^2 + OB^2 + OC^2}}{2}\]
                </li>
                <li><strong>Dạng 6</strong> — Tứ diện gần đều (\(AB=CD=a,\; AC=BD=b,\; AD=BC=c\)):
                    \[R_{mc} = \sqrt{\dfrac{a^2 + b^2 + c^2}{8}}\]
                </li>
            </ul>
        </section>

        <!-- Tỉ số thể tích -->
        <section class="formula-box" style="margin-top: 24px;">
            <h2>
                <svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"></circle><line x1="12" y1="16" x2="12" y2="12"></line><line x1="12" y1="8" x2="12.01" y2="8"></line></svg>
                Tỉ Số Thể Tích (Trọng Tâm Ôn Thi THPT)
            </h2>
            <ul>
                <li>Chóp tam giác: \(\dfrac{V_{S.A'B'C'}}{V_{S.ABC}} = \dfrac{SA'}{SA}\cdot\dfrac{SB'}{SB}\cdot\dfrac{SC'}{SC}\)</li>
                <li>Chóp tứ giác đáy hình bình hành: \(\dfrac{V_{S.A'B'C'D'}}{V_{S.ABCD}} = \dfrac{x+y+z+t}{4xyzt}\) (đk: \(x+z=y+t\))</li>
                <li>Lăng trụ tam giác: \(\dfrac{V_{ABC.MNP}}{V_{ABC.A'B'C'}} = \dfrac{x+y+z}{3}\)</li>
                <li>Lập phương cạnh \(a\) nội tiếp mặt cầu: \(R = \dfrac{a\sqrt{3}}{2}\)</li>
            </ul>
        </section>

        <!-- 5 đa diện đều -->
        <section class="formula-box" style="margin-top: 24px;">
            <h2>
                <svg viewBox="0 0 24 24"><path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"></path></svg>
                5 Khối Đa Diện Đều
            </h2>
            <p style="font-size:0.85rem;color:var(--color-text-muted);margin-bottom:12px;">Ký hiệu \(\{p; q\}\): \(p\) = số cạnh mỗi mặt, \(q\) = số cạnh gặp nhau ở mỗi đỉnh. Euler: \(Đ - C + M = 2\).</p>
            <div style="overflow-x:auto;">
            <table style="width:100%;border-collapse:collapse;font-size:0.9rem;">
                <thead>
                    <tr style="background:var(--color-primary);color:#fff;">
                        <th style="padding:8px 10px;text-align:left;">Tên khối</th>
                        <th style="padding:8px 10px;">Ký hiệu</th>
                        <th style="padding:8px 10px;">Đỉnh</th>
                        <th style="padding:8px 10px;">Cạnh</th>
                        <th style="padding:8px 10px;">Mặt</th>
                        <th style="padding:8px 10px;text-align:left;">Thể tích (V)</th>
                    </tr>
                </thead>
                <tbody>
                    <tr style="background:var(--color-neutral-subtle);">
                        <td style="padding:8px 10px;font-weight:600;"><a href="${pageContext.request.contextPath}/app?page=tu-dien-deu">Tứ diện đều</a></td>
                        <td style="padding:8px 10px;text-align:center;">\(\{3;3\}\)</td>
                        <td style="padding:8px 10px;text-align:center;">4</td>
                        <td style="padding:8px 10px;text-align:center;">6</td>
                        <td style="padding:8px 10px;text-align:center;">4</td>
                        <td style="padding:8px 10px;">\(V = \dfrac{a^3\sqrt{2}}{12}\)</td>
                    </tr>
                    <tr>
                        <td style="padding:8px 10px;font-weight:600;"><a href="${pageContext.request.contextPath}/app?page=hinh-lap-phuong">Lập phương</a></td>
                        <td style="padding:8px 10px;text-align:center;">\(\{4;3\}\)</td>
                        <td style="padding:8px 10px;text-align:center;">8</td>
                        <td style="padding:8px 10px;text-align:center;">12</td>
                        <td style="padding:8px 10px;text-align:center;">6</td>
                        <td style="padding:8px 10px;">\(V = a^3\)</td>
                    </tr>
                    <tr style="background:var(--color-neutral-subtle);">
                        <td style="padding:8px 10px;font-weight:600;"><a href="${pageContext.request.contextPath}/app?page=bat-dien-deu">Bát diện đều</a></td>
                        <td style="padding:8px 10px;text-align:center;">\(\{3;4\}\)</td>
                        <td style="padding:8px 10px;text-align:center;">6</td>
                        <td style="padding:8px 10px;text-align:center;">12</td>
                        <td style="padding:8px 10px;text-align:center;">8</td>
                        <td style="padding:8px 10px;">\(V = \dfrac{a^3\sqrt{2}}{3}\)</td>
                    </tr>
                    <tr>
                        <td style="padding:8px 10px;font-weight:600;"><a href="${pageContext.request.contextPath}/app?page=muoi-hai-mat-deu">12 mặt đều</a></td>
                        <td style="padding:8px 10px;text-align:center;">\(\{5;3\}\)</td>
                        <td style="padding:8px 10px;text-align:center;">20</td>
                        <td style="padding:8px 10px;text-align:center;">30</td>
                        <td style="padding:8px 10px;text-align:center;">12</td>
                        <td style="padding:8px 10px;">\(V = \dfrac{a^3(15+7\sqrt{5})}{4}\)</td>
                    </tr>
                    <tr style="background:var(--color-neutral-subtle);">
                        <td style="padding:8px 10px;font-weight:600;"><a href="${pageContext.request.contextPath}/app?page=hai-muoi-mat-deu">20 mặt đều</a></td>
                        <td style="padding:8px 10px;text-align:center;">\(\{3;5\}\)</td>
                        <td style="padding:8px 10px;text-align:center;">12</td>
                        <td style="padding:8px 10px;text-align:center;">30</td>
                        <td style="padding:8px 10px;text-align:center;">20</td>
                        <td style="padding:8px 10px;">\(V = \dfrac{5a^3(3+\sqrt{5})}{12}\)</td>
                    </tr>
                </tbody>
            </table>
            </div>
        </section>

        <section class="formula-box" style="margin-top: 24px;">
            <h2>
                <svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"></circle><path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path></svg>
                Chỏm Cầu & Đới Cầu
            </h2>
            <ul>
                <li><strong>Chỏm cầu</strong> (\(R, h\)): \(S_{xq} = 2\pi R h\), \(V = \pi h^2\left(R - \dfrac{h}{3}\right)\) — <a href="${pageContext.request.contextPath}/app?page=chom-cau">tính ngay</a></li>
                <li style="margin-top:10px;"><strong>Đới cầu</strong> (\(r_1, r_2, h\)): \(V = \dfrac{1}{6}\pi h\left(3r_1^2 + 3r_2^2 + h^2\right)\) — <a href="${pageContext.request.contextPath}/app?page=doi-cau">tính ngay</a></li>
            </ul>
        </section>

        <a href="${pageContext.request.contextPath}/app?page=home" class="btn-home-bottom">Về trang chủ</a>
    </main>

    <footer class="app-footer">
        © MaxxAlan. Hệ thống công cụ học tập và ôn luyện hình học trực quan.
    </footer>

</body>
</html>
