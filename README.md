# Yêu Cầu Hệ Thống Quản Lý Thú Y

## Tổng Quan

Hệ thống quản lý tiêm phòng - PetCare là đơn vị chuyên cung cấp các dịch vụ tiêm phòng vacxin cho thú cưng. Đây một hệ thống quản lý dịch vụ tiêm phòng chăm sóc thú y trực tuyến giúp việc quản lý lịch hẹn và quản lý dịch vụ vacxin trở nên thuận tiện, chính xác và hiệu quả hơn cho chủ cơ sở đồng thời hỗ trợ việc quản lý hồ sơ cá nhân, đặt lịch, theo dõi lịch tiêm và lịch sử tiêm thú cưng cho khách hàng. Các đối tượng chính tương tác với hệ thống bao gồm khách hàng (chủ thú cưng), và chủ cơ sở.

## Yêu Cầu Hệ Thống

### Yêu Cầu Kỹ Thuật

- PHP 7.4 hoặc cao hơn
- MySQL 5.7 hoặc cao hơn
- Máy chủ web (Apache/Nginx)
- PDO PHP Extension
- Trình duyệt web hiện đại có hỗ trợ JavaScript

### Cấu Hình Cơ Sở Dữ Liệu

- Host: localhost
- Tên Database: petcare
- Tên người dùng: root
- Cấu hình mật khẩu mặc định (có thể được sửa đổi trong Config/Database.php)

## Vai Trò Người Dùng và Quyền Truy Cập

Hệ thống quản lý chăm sóc thú cưng PetCare được xây dựng nhằm phục vụ các nhóm người dùng có vai trò khác nhau trong hoạt động vận hành và sử dụng dịch vụ của cơ sở. Mỗi vai trò sẽ có các quyền truy cập và chức năng riêng, đảm bảo tính bảo mật, hiệu quả và phân quyền rõ ràng trong hệ thống.

### Quản Trị Viên

- Quản lý loại Vacxin (thêm, sửa, xóa)
- Quản lý loại đặt lịch (cập nhật các trạng thái)
- Quản lý báo cáo và thống kê 

### Khách hàng

- Đăng ký, đăng nhập, đăng xuất và cập nhật thông tin cá nhân
- Thêm, xem thông tin thú cưng của mình
- Lựa chọn dịch vacxin tiêm mong muốn kèm theo ngày, giờ, thú cưng được tiêm và ghi chú(nếu có).
- Xem lại các loại vacxin đã tiêm
- Xem lịch tiêm sắp tới,  đã đăng ký mà chưa tiêm đồng thời theo dõi trạng thái đơn.


## Use Cases (Trường Hợp Sử Dụng)

### Use Cases Xác Thực

1. **Đăng Nhập**

   - **Tác nhân:** Quản trị viên, Khách hàng
   - **Mô tả:** Người dùng đăng nhập vào hệ thống bằng tên đăng nhập và mật khẩu
   - **Luồng chính:**
     1. Người dùng truy cập trang đăng nhập
     2. Điền tên đăng nhập và mật khẩu
     3. Hệ thống xác thực thông tin
     4. Chuyển hướng đến trang chính tương ứng với vai trò

2. **Đăng Ký**

   - **Tác nhân:** Khách hàng mới
   - **Mô tả:** Người dùng tạo tài khoản mới trong hệ thống
   - **Luồng chính:**
     1. Người dùng truy cập trang đăng ký
     2. Điền thông tin cá nhân như tên đăng nhập, mật khẩu và email
     3. Hệ thống xác thực và lưu thông tin
     4. Chuyển hướng đến trang đăng nhập

3. **Đăng Xuất**

   - **Tác nhân:** Người dùng đã đăng nhập
   - **Mô tả:** Người dùng đăng xuất khỏi hệ thống
   - **Luồng chính:**
     1. Người dùng nhấn nút đăng xuất
     2. Hệ thống xóa phiên đăng nhập hiện tại
     3. Chuyển hướng đến trang đăng nhập

### Use Cases Quản Trị Viên

1. **Quản Lý Loại Vắc-xin**

   - **Tác nhân:** Quản trị viên
   - **Mô tả:** Quản lý danh sách các loại vắc-xin
   - **Luồng chính:**
     1. Quản trị viên truy cập trang quản lý người dùng
     2. Xem danh sách vắc-xin hiện có
     3. Thêm loại vắc-xin mới
     4. Cập nhật thông tin vắc-xin
     5. Xóa vắc-xin không còn cung cấp

2. **Quản Lý Lịch Hẹn**

   - **Tác nhân:** Quản trị viên
   - **Mô tả:** Quản lý thông tin lịch hẹn
   - **Luồng chính:**
     1. Quản trị viên truy cập trang quản lý lịch hẹn
     2. Xem danh sách lịch hẹn hiện có
     3. Cập nhật trạng thái của lịch hẹn như: chờ xác nhận, đã xác nhận, đang thực hiện, hoàn thành, hủy
     4. Hệ thống lưu kết quả xử lý, đồng thời hiển thị bên khách hàng

3. **Xem Thống Kê Hệ Thống**

   - **Tác nhân:** Quản trị viên
   - **Mô tả:** Xem các thống kê về lịch hẹn và loại vắc-xin
   - **Luồng chính:**
     1. Quản trị viên truy cập trang thống kê
     2. Xem thông tin về lịch hẹn
     3. Xem thống kê các loại vắc-xin

### Use Cases Khách Hàng

1. **Thêm thú cưng**

   - **Tác nhân:** Khách hàng
   - **Mô tả:** Khách hàng thêm thông tin thú cưng của mình vào hệ thống
   - **Luồng chính:**
     1. Khách hàng truy cập hồ sơ cá nhân
     2. Nhập thông tin thú cưng (tên, loại, giống, ngày sinh, cân nặng, giới tính, tình trạng sức khỏe, lịch sử tiêm, hình ảnh)
     3. Hệ thống lưu thông tin thú cưng vào cơ sở dữ liệu

2. **Đặt Lịch Tiêm Phòng**

   - **Tác nhân:** Khách hàng
   - **Mô tả:** Khách hàng đặt lịch sử dụng dịch vụ tiêm phòng cho thú cưng
   - **Luồng chính:**
     1. Sinh viên truy cập trang đặt lịch tiêm
     2. Khách hàng chọn loại thuốc muốn tiêm cho thú cưng
     3. Chọn thú cưng, ngày, giờ, ghi chú (nếu có)
     4. Hệ thống xác nhận và gửi yêu cầu đặt lịch (cần được duyệt)

3. **Xem Lịch Sử Tiêm**

   - **Tác nhân:** Khách hàng
   - **Mô tả:** Khách hàng xem lại lịch sử các dịch vụ tiêm mà thú cưng đã sử dụng
   - **Luồng chính:**
     1. Khách hàng truy cập trang lịch sử tiêm
     2. Xem các dịch vụ đã sử dụng, ngày thực hiện, bác sĩ phụ trách, liều lượng, số mũi đã tiêm, ghi chú

3. **Xem Lịch Tiêm Phòng**
   - **Tác nhân:** Khách hàng
   - **Mô tả:** Khách hàng xem lịch tiêm của thú cưng
   - **Luồng chính:**
     1. Khách hàng truy cập trang lịch tiêm
     2. Xem thông tin về lịch tiêm sắp tới gồm: tên thú cưng, loại vắc-xin, ngày giờ tiêm, trạng thái lịch hẹn

## Tính Năng Chính

### Hệ Thống Xác Thực

- Đăng nhập người dùng với tên đăng nhập và mật khẩu
- Đăng ký người dùng
- Quản lý phiên làm việc
- Cập nhật thông tin người dùng

### Quản Lý Loại Vắc-xin

- Xem danh sách các loại vắc-xin
- Thêm loại vắc-xin mới
- Cập nhật thông tin loại vắc-xin
- Xóa loại vắc-xin không còn sử dụng

### Quản Lý Lịch Hẹn

- Xem danh sách lịch hẹn của khách hàng
- Cập nhật trạng thái lịch hẹn
- Hệ thống phản ánh cập nhật đến giao diện khách hàng

### Quản Lý Báo Cáo Thống Kê

- Xem các báo cáo tổng quan như số lịch lịch, thống kê số loại vắc-xin

### Quản Lý Thú Cưng

- Xem thông tin thú cưng
- Thêm thông tin thú cưng 

### Đặt Lịch Tiêm Phòng

- Chọn dịch vụ tiêm phòng
- Chọn thú cưng cần tiêm, ngày-giờ, ghi chú
- Hệ thống ghi nhận và lưu lịch hẹn

### Xem Lịch Sử Tiêm 

- Xem các mũi tiêm đã thực hiện
- Xem bác sĩ phụ trách, liều lượng, ngày tiêm
- Xem số mũi đã tiêm, ghi chú và trạng thái hoàn thành

### Xem Lịch Tiêm Phòng

- Xem các lịch tiêm gồm tên thú cưng, loại vắc-xin, ngày giờ tiêm, trạng thái lịch hẹn

## Mô Hình Dữ Liệu

### Tài Khoản

- MaTK (khoá chính)
- TenDangNhap (tên đăng nhập)
- MatKhau (mật khẩu đã mã hoá)
- Email 
- VaiTro (phân quyền)
- TrangThai (trạng thái tài khoản)
- CreatedAt (thời điểm tạo tài khoản)
- UpdatedAt (thời điểm cập nhật tài khoản)

### Nhân Viên

- MaNV (khoá chính) 
- HoTen (họ tên nhân viên)
- ChucVu
- SDT (số điện thoại)
- Email
- DiaChi
- NgayVaoLam (ngày bắt đầu làm)
- TrangThai
- CreatedAt (thời điểm tạo)
- UpdatedAt (thời điểm cập nhật)

### Khách hàng

- MaKH (khoá chính)
- MaTK ( khoá ngoại)
- HoTen (họ tên khách hàng)
- SDT (số điện thoại)
- Email
- DiaChi
- NgayDangKy (ngày tạo tài khoản)
- GhiChu 
- CreatedAt (thời điểm tạo)
- UpdatedAt (thời điểm cập nhật)

### Thú Cưng

- MaTC (khoá chính)
- MaKH (khoá ngoại)
- TenTC (tên thú cưng)
- Loai (loại thú)
- Giong (giống loài)
- NgaySinh
- CanNang
- GioiTinh
- TinhTrangSucKhoe
- LichSuTiem
- HinhAnh
- TrangThai
- CreatedAt (thời điểm tạo)
- UpdatedAt (thời điểm cập nhật)

### Tiêm Phòng

- MaTP (khoá chính)
- TenThuoc (tên vaccine)
- MoTa
- LoaiThuCung (dành cho đối tượng nào)
- SoLanTiem
- Gia
- ThoiLuong
- HinhAnh
- TrangThai
- CreatedAt (thời điểm tạo)
- UpdatedAt (thời điểm cập nhật)

### Đặt Lịch

- MaLich (khoá chính)
- MaKH (khoá ngoại)
- MaTC (khoá ngoại)
- MaTP (khoá ngoại)
- MaNV_DuKien (nhân viên dự kiến thực hiện, khoá ngoại)
- NgayDat (ngày tạo lịch)
- NgayHen (ngày thực hiện)
GioHen
- TrangThai (tình trạng lịch hẹn)
- GhiChu
- CreatedAt (thời điểm tạo)
- UpdatedAt (thời điểm cập nhật)

### Thanh Toán

- MaTT (khoá chính)
- MaLich (khoá ngoại)
- MaKH (khoá ngoại)
- MaAdmin_XacNhan (mã adnin xác nhận, khoá ngoại)
- PhuongThuc (phương thức thanh toán)
- SoTien
- NgayThanhToan 
- TrangThai (trạng thái thanh toán)
- GhiChu

### Chi Tiết Thanh Toán

- MaCTTT (khoá chính)
- MaTT (khoá ngoại)
- MaTP (khoá ngoại)
- MoTa
- SoLuong
- DonGia
- ThanhTien

### Lịch Sử Tiêm Phòng

- MaLSTP (khoá chính)
- MaTC (khoá ngoại)
- MaTP (khoá ngoại)
- TenVacXin
- LieuLuong
- NgayTiem
- MaNV_Tiem (khoá ngoại, nhân viên thực hiện)
- GhiChu

### Báo Cáo Thống Kê

- MaBCTK (khoá chính)
- MaNV_Tao (khoá ngoại, nhân viên tạo báo cáo)
- TenBaoCao
- ThoiGianBatDau 
- ThoiGianKetThuc
- TongDoanhThu
- TongSoLuongDV
- SoKhachHangMoi
- NoiDung
- NgayTao

## Yêu Cầu Giao Diện Người Dùng

- Giao diện website PetCare được thiết kế  hiện đại, phù hợp với chủ đề chăm sóc thú cưng
- Bố cục trang web rõ ràng, trực quan, sử dụng tông màu trắng xanh cam 
- Các chức năng chính (đặt lịch, đăng nhập, xem dịch vụ, quản lý hồ sơ, quản lý vacxin, quản lý lịch hẹn) được bố trí nổi bật, dễ truy cập từ thanh điều hướng
- Mỗi dịch vụ có trang chi tiết riêng gồm mô tả, hình ảnh minh họa, giá dịch vụ, thời gian thực hiện 
- Form nhập liệu (đăng ký, đặt lịch, phản hồi) có kiểm tra tính hợp lệ, hướng dẫn nhập liệu rõ ràng, và thông báo lỗi cụ thể
- Ngôn ngữ hiển thị thuần Việt, dễ hiểu và có thể mở rộng sang song ngữ (Việt – Anh) trong tương lai
- Giao diện dành cho quản trị viên có bố cục rõ ràng, thuận tiện trong việc cập nhật và theo dõi thông tin

## Yêu Cầu Báo Cáo

- Thống kê lịch hẹn trong ngày
- Báo cáo số lượng thuốc

## Yêu Cầu Bảo Mật

- Toàn bộ thông tin khách hàng được bảo mật tuyệt đối
- Kiểm soát truy cập dựa trên vai trò

## Cấu Trúc Dự Án

- `/petcare/admin` - Giao diện & chức năng dành cho quản trị viên
- `/petcare/assets` - Tài nguyên tĩnh
- `/petcare/classes` - Các mô hình dữ liệu cho tương tác với CSDL
- `/petcare/config` - Các file cấu hình hệ thống 
- `/petcare/controller` - Các controller của hệ thống- điều phối luồng xử lý
- `/petcare/customer` - Các trang giao diện dành cho khách hàng + xác thực giao diện khách hàng và quản trị viên
- `/petcare/database` - Chứa tệp SQL

## Chi Tiết Triển Khai

- Kiến trúc MVC (Model-View-Controller)
- PDO cho tương tác cơ sở dữ liệu
- Định tuyến URL sạch thông qua Routing thủ công + query string (controller=…&action=…)
- Tách biệt logic nghiệp vụ khỏi giao diện

## Các Tuyến Đường (Routes) Chính

### Tuyến Đường Quản Trị Viên

- `/petcare/admin/index.php` - Trang chủ quản trị viên 
- `/petcare/admin/index.php?controller=AdminController&action=quanLyVacXin` - Quản lý Vacxin của quản trị viên
- `/petcare/admin/index.php?controller=AdminController&action=quanLyDatLich` -  Quản lý Lịch hẹn của quản trị viên

### Tuyến Đường Khách Hàng

- `/petcare/customer/index.php` - Trang chủ khách hàng
- `/customer/index.php?controller=XacThucController&action=hienThiDangNhap` - Đăng nhập
- `/customer/index.php?controller=XacThucController&action=hienThiDangKy` - Đăng ký
- `/customer/index.php?controller=DichVuController&action=hienThiDanhSachDichVu` - Dịch vụ tiêm phòng
- `/customer/index.php?controller=LichTiemController&action=hienThiLichTiem` - Lịch tiêm
- `/customer/index.php?controller=LichTiemController&action=hienThiLichTiem` - Lịch sử tiêm
- `/customer/index.php?controller=KhachHangController&action=hienThiHoSo` - Hồ sơ cá nhân 


## Hướng Dẫn Sử Dụng

Tài liệu hướng dẫn chi tiết cách sử dụng hệ thống có thể được tìm thấy trong thư mục `/docs`.
