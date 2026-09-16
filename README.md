# 📐 Ứng Dụng Web Tính Toán Hình Học (`tinh-toan-hinh-hoc`)

Ứng dụng Web Java Servlet / JSP toàn diện phục vụ giảng dạy, học tập và ôn thi môn Toán (Hình học phẳng 2D và Hình học không gian 3D).
Repository: [https://github.com/MaxxAlan/tinh-toan-hinh-hoc](https://github.com/MaxxAlan/tinh-toan-hinh-hoc)

---

## 🌟 Các tính năng nổi bật
1. **19 Hình học chuẩn SGK & Thi THPT:**
   - **Hình phẳng 2D (9 hình):** Hình chữ nhật, hình vuông, hình tròn, tam giác thường, tam giác đều, tam giác vuông, hình thang, hình bình hành, hình thoi.
   - **Hình không gian 3D (10 hình):** Hộp chữ nhật, lập phương, lăng trụ, hình chóp, chóp cụt, hình trụ, hình nón, nón cụt, hình cầu, tứ diện đều.
2. **Quy trình giải chi tiết (Step-by-step substitutions):**
   - Trình bày công thức tổng quát bằng **LaTeX** với thư viện MathJax 3.
   - Hiển thị bước thế số cụ thể và kết quả kèm huy hiệu nhãn đơn vị trực quan (*đơn vị dài*, *đơn vị diện tích*, *đơn vị thể tích*, *độ*).
3. **Mô phỏng hình học tương tác trực quan (Live Interactive SVG):**
   - Hình vẽ tự động co giãn và hiển thị các số liệu đầu vào theo thời gian thực (Live dynamic label & shape scaling).
   - Tối ưu góc vuông, đường cao, và các góc đo ($\\alpha$) chuẩn hình học.
4. **Chuẩn hóa Tiếng Việt UTF-8:**
   - Bộ lọc xử lý mã hóa UTF-8 toàn diện, không phát sinh lỗi ký tự lạ (mojibake).
5. **Favicon chuyên biệt:**
   - Biểu tượng thước Ê-ke và Com-pa hình học hiện đại.

---

## 🛠️ Công nghệ sử dụng
- **Backend:** Java EE / Jakarta EE Servlet (Java 8 bytecode compatibility).
- **Frontend:** JSP, JSTL 1.2, HTML5, CSS3, SVG động, JavaScript, MathJax 3 (LaTeX rendering).
- **Server:** Apache Tomcat 9.0.x.
- **Build System:** Apache Ant / NetBeans Web Project.

---

## 🚀 Hướng dẫn Cài đặt & Triển khai

### Cách 1: Chạy bằng NetBeans IDE
1. Mở NetBeans IDE (8.2 / 12+ / 17+ / 21+).
2. Chọn **File -> Open Project** và trỏ đến thư mục chứa dự án.
3. Cấu hình máy chủ Apache Tomcat (port mặc định hoặc 8080 / 8093).
4. Nhấn nút **Clean and Build** (Búa & Chổi), sau đó nhấn **Run Project** (F6).

### Cách 2: Triển khai file .war lên Server Tomcat
1. Đóng gói dự án bằng lệnh Ant:
   ```bash
   ant dist
   ```
2. File `hocJSP.war` được sinh ra trong thư mục `dist/`.
3. Copy file `hocJSP.war` vào thư mục `webapps/` của Apache Tomcat:
   ```bash
   cp dist/hocJSP.war <TOMCAT_HOME>/webapps/
   ```
4. Khởi động Tomcat và truy cập trình duyệt:
   ```
   http://localhost:8080/hocJSP/tinh-toan-hinh-hoc
   ```
   *(Trang chủ chào đón: `tinh-toan-hinh-hoc.html` hoặc Clean URL `/tinh-toan-hinh-hoc`)*

---

## 🧪 Kiểm thử Tự động (E2E Testing)
Dự án tích hợp bộ kiểm thử tự động toàn diện qua kịch bản Python HTTP client:
- Đạt **62/62 checks (100%)** bao gồm: Welcome file, Assets, Điều hướng 19 hình, GET/POST form, Rendering LaTeX MathJax, Step details, Badges, và Validation Tiếng Việt.

---

## 📄 Bản quyền
Dự án được xây dựng phục vụ môn học **PRJ301 - Java Web Application Development**.
