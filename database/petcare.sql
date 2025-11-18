-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 18, 2025 lúc 04:00 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `petcare`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `baocaothongke`
--

CREATE TABLE `baocaothongke` (
  `MaBCTK` int(11) NOT NULL,
  `MaNV_Tao` int(11) DEFAULT NULL,
  `TenBaoCao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ThoiGianBatDau` date DEFAULT NULL,
  `ThoiGianKetThuc` date DEFAULT NULL,
  `TongDoanhThu` decimal(15,2) DEFAULT NULL,
  `TongSoLuongDV` int(11) DEFAULT NULL,
  `SoKhachHangMoi` int(11) DEFAULT NULL,
  `NoiDung` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NgayTao` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `baocaothongke`
--

INSERT INTO `baocaothongke` (`MaBCTK`, `MaNV_Tao`, `TenBaoCao`, `ThoiGianBatDau`, `ThoiGianKetThuc`, `TongDoanhThu`, `TongSoLuongDV`, `SoKhachHangMoi`, `NoiDung`, `NgayTao`) VALUES
(1, 1, 'Báo cáo tháng 11/2025', '2025-11-01', '2025-11-30', 330000.00, 2, 1, 'Tổng hợp doanh thu dịch vụ tiêm phòng trong tháng 11/2025.', '2025-11-07 10:49:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietthanhtoan`
--

CREATE TABLE `chitietthanhtoan` (
  `MaCTTT` int(11) NOT NULL,
  `MaTT` int(11) NOT NULL,
  `MaTP` int(11) DEFAULT NULL,
  `MoTa` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SoLuong` int(11) DEFAULT 1,
  `DonGia` decimal(12,2) NOT NULL,
  `ThanhTien` decimal(12,2) GENERATED ALWAYS AS (`SoLuong` * `DonGia`) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietthanhtoan`
--

INSERT INTO `chitietthanhtoan` (`MaCTTT`, `MaTT`, `MaTP`, `MoTa`, `SoLuong`, `DonGia`) VALUES
(1, 1, 1, 'Tiêm vaccine dại cho chó Bông', 1, 150000.00),
(2, 2, 3, 'Tiêm vaccine dại cho mèo Miu', 1, 180000.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `datlich`
--

CREATE TABLE `datlich` (
  `MaLich` int(11) NOT NULL,
  `MaKH` int(11) NOT NULL,
  `MaTC` int(11) NOT NULL,
  `MaTP` int(11) DEFAULT NULL,
  `MaNV_DuKien` int(11) DEFAULT NULL,
  `NgayDat` datetime DEFAULT current_timestamp(),
  `NgayHen` date NOT NULL,
  `GioHen` time NOT NULL,
  `TrangThai` enum('Chờ xác nhận','Đã xác nhận','Đang thực hiện','Hoàn thành','Hủy') DEFAULT 'Chờ xác nhận',
  `TongTien` decimal(12,2) DEFAULT 0.00,
  `GhiChu` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `UpdatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `datlich`
--

INSERT INTO `datlich` (`MaLich`, `MaKH`, `MaTC`, `MaTP`, `MaNV_DuKien`, `NgayDat`, `NgayHen`, `GioHen`, `TrangThai`, `TongTien`, `GhiChu`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 1, 1, 1, 2, '2025-11-07 10:49:30', '2025-11-10', '09:00:00', 'Đã xác nhận', 150000.00, 'Tiêm phòng dại cho Bông', '2025-11-07 10:49:30', '2025-11-10 09:57:17'),
(2, 2, 2, 3, NULL, '2025-11-07 10:49:30', '2025-11-11', '10:30:00', 'Chờ xác nhận', 180000.00, 'Tiêm vaccine dại cho Miu', '2025-11-07 10:49:30', '2025-11-10 09:57:51'),
(3, 1, 1, 1, 2, '2025-11-08 16:08:10', '2025-11-29', '08:03:00', 'Đã xác nhận', 0.00, 'k', '2025-11-08 16:08:10', '2025-11-18 06:49:45'),
(4, 1, 1, 1, 2, '2025-11-08 16:08:55', '2025-11-10', '09:00:00', 'Chờ xác nhận', 0.00, 'ko', '2025-11-08 16:08:55', '2025-11-10 09:58:13'),
(5, 1, 1, 1, 2, '2025-11-10 13:13:40', '2025-11-26', '17:13:00', 'Chờ xác nhận', 150000.00, '', '2025-11-10 13:13:40', '2025-11-10 13:13:40'),
(6, 1, 1, 1, 2, '2025-11-14 11:37:51', '2025-11-19', '11:40:00', 'Chờ xác nhận', 150000.00, 'jkjmb,s', '2025-11-14 11:37:51', '2025-11-14 11:37:51'),
(7, 1, 1, 1, 2, '2025-11-15 22:32:55', '2025-11-19', '13:32:00', 'Đã xác nhận', 150000.00, 'tiêm lần 2', '2025-11-15 22:32:55', '2025-11-15 22:34:09'),
(8, 1, 1, 1, 2, '2025-11-18 06:48:44', '2025-11-19', '07:48:00', 'Chờ xác nhận', 150000.00, 'mk kjj', '2025-11-18 06:48:44', '2025-11-18 06:48:44');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `MaKH` int(11) NOT NULL,
  `MaTK` int(11) DEFAULT NULL,
  `HoTen` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SDT` varchar(20) DEFAULT NULL,
  `Email` varchar(150) DEFAULT NULL,
  `DiaChi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NgayDangKy` datetime DEFAULT current_timestamp(),
  `GhiChu` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `UpdatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`MaKH`, `MaTK`, `HoTen`, `SDT`, `Email`, `DiaChi`, `NgayDangKy`, `GhiChu`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 2, 'Nguyễn Thị Lan', '0981111111', 'lan@gmail.com', 'Hà Nội', '2025-11-07 10:49:30', 'Khách quen', '2025-11-07 10:49:30', '2025-11-07 10:49:30'),
(2, 3, 'Phạm Văn Nam', '0982222222', 'nam@gmail.com', 'Bắc Ninh', '2025-11-07 10:49:30', 'Chủ nuôi mới', '2025-11-07 10:49:30', '2025-11-07 10:49:30'),
(3, 6, 'Nguyễn Thị Phương Hiền', '0198762767', 'he@gmail.com', 'Bắc Giang', '2025-11-16 01:00:35', '', '2025-11-16 01:00:35', '2025-11-16 01:04:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lichsutiemphong`
--

CREATE TABLE `lichsutiemphong` (
  `MaLSTP` int(11) NOT NULL,
  `MaTC` int(11) NOT NULL,
  `MaTP` int(11) DEFAULT NULL,
  `TenVacXin` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LieuLuong` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NgayTiem` date NOT NULL,
  `MaNV_Tiem` int(11) DEFAULT NULL,
  `GhiChu` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `lichsutiemphong`
--

INSERT INTO `lichsutiemphong` (`MaLSTP`, `MaTC`, `MaTP`, `TenVacXin`, `LieuLuong`, `NgayTiem`, `MaNV_Tiem`, `GhiChu`) VALUES
(1, 1, 1, 'Vaccine Dại', '1ml', '2025-11-10', 2, 'Tiêm tại cơ sở chính'),
(2, 2, 3, 'Vaccine Mèo Dại', '0.8ml', '2025-11-11', 4, 'Sẽ tiêm trong lịch hẹn');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

CREATE TABLE `nhanvien` (
  `MaNV` int(11) NOT NULL,
  `HoTen` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ChucVu` enum('Bác sỹ thú y','Lễ Tân','Quản lý','Khác') DEFAULT 'Lễ Tân',
  `SDT` varchar(20) DEFAULT NULL,
  `Email` varchar(150) DEFAULT NULL,
  `DiaChi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NgayVaoLam` date DEFAULT NULL,
  `TrangThai` enum('Làm việc','Nghỉ việc') DEFAULT 'Làm việc',
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `UpdatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nhanvien`
--

INSERT INTO `nhanvien` (`MaNV`, `HoTen`, `ChucVu`, `SDT`, `Email`, `DiaChi`, `NgayVaoLam`, `TrangThai`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 'Nguyễn Văn Quản', 'Quản lý', '0911111111', 'manager@petcare.vn', 'Hà Nội', '2022-05-01', 'Làm việc', '2025-11-07 10:49:30', '2025-11-07 10:49:30'),
(2, 'Lê Thu Trang', 'Bác sỹ thú y', '0922222222', 'bs.trang@petcare.vn', 'Hà Nội', '2023-03-12', 'Làm việc', '2025-11-07 10:49:30', '2025-11-07 10:49:30'),
(3, 'Phạm Đức Long', 'Lễ Tân', '0933333333', 'long@petcare.vn', 'Hà Nội', '2024-01-10', 'Làm việc', '2025-11-07 10:49:30', '2025-11-07 10:49:30'),
(4, 'Trần Văn Minh', 'Bác sỹ thú y', '0944444444', 'minh@petcare.vn', 'Hải Phòng', '2024-02-20', 'Làm việc', '2025-11-07 10:49:30', '2025-11-07 10:49:30'),
(5, 'Hoàng Mai Hương', 'Lễ Tân', '0955555555', 'huong@petcare.vn', 'Bắc Ninh', '2023-07-15', 'Làm việc', '2025-11-07 10:49:30', '2025-11-07 10:49:30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `MaTK` int(11) NOT NULL,
  `TenDangNhap` varchar(100) NOT NULL,
  `MatKhau` varchar(255) NOT NULL,
  `Email` varchar(150) DEFAULT NULL,
  `VaiTro` enum('Admin','Khách hàng') NOT NULL DEFAULT 'Khách hàng',
  `TrangThai` enum('Hoạt động','Khóa') DEFAULT 'Hoạt động',
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `UpdatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`MaTK`, `TenDangNhap`, `MatKhau`, `Email`, `VaiTro`, `TrangThai`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 'admin01', 'admin@123', 'admin@petcare.vn', 'Admin', 'Hoạt động', '2025-11-07 10:49:30', '2025-11-07 10:49:30'),
(2, 'kh01', 'kh01@123', 'lan@gmail.com', 'Khách hàng', 'Hoạt động', '2025-11-07 10:49:30', '2025-11-07 10:49:30'),
(3, 'kh02', 'kh02@123', 'nam@gmail.com', 'Khách hàng', 'Hoạt động', '2025-11-07 10:49:30', '2025-11-07 10:49:30'),
(6, 'hien05', 'hien05@123', 'he@gmail.com', 'Khách hàng', 'Hoạt động', '2025-11-16 01:00:35', '2025-11-16 01:00:35');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thanhtoan`
--

CREATE TABLE `thanhtoan` (
  `MaTT` int(11) NOT NULL,
  `MaLich` int(11) NOT NULL,
  `MaKH` int(11) NOT NULL,
  `MaAdmin_XacNhan` int(11) DEFAULT NULL,
  `PhuongThuc` enum('Tiền mặt','Chuyển khoản') NOT NULL,
  `SoTien` decimal(12,2) NOT NULL,
  `NgayThanhToan` datetime DEFAULT current_timestamp(),
  `TrangThai` enum('Chưa thanh toán','Đã thanh toán') DEFAULT 'Chưa thanh toán',
  `GhiChu` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `thanhtoan`
--

INSERT INTO `thanhtoan` (`MaTT`, `MaLich`, `MaKH`, `MaAdmin_XacNhan`, `PhuongThuc`, `SoTien`, `NgayThanhToan`, `TrangThai`, `GhiChu`) VALUES
(1, 1, 1, 1, 'Chuyển khoản', 150000.00, '2025-11-07 10:49:30', 'Đã thanh toán', 'Khách thanh toán đầy đủ'),
(2, 2, 2, NULL, 'Tiền mặt', 180000.00, '2025-11-07 10:49:30', 'Chưa thanh toán', 'Khách sẽ thanh toán sau khi tiêm');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thucung`
--

CREATE TABLE `thucung` (
  `MaTC` int(11) NOT NULL,
  `MaKH` int(11) NOT NULL,
  `TenTC` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Loai` enum('Chó','Mèo','Khác') DEFAULT 'Chó',
  `Giong` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NgaySinh` date DEFAULT NULL,
  `CanNang` decimal(5,2) DEFAULT NULL,
  `GioiTinh` enum('Đực','Cái','Không rõ') DEFAULT 'Không rõ',
  `TinhTrangSucKhoe` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LichSuTiem` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `HinhAnh` varchar(255) DEFAULT NULL,
  `TrangThai` enum('HoatDong','Ngung') DEFAULT 'HoatDong',
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `UpdatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `thucung`
--

INSERT INTO `thucung` (`MaTC`, `MaKH`, `TenTC`, `Loai`, `Giong`, `NgaySinh`, `CanNang`, `GioiTinh`, `TinhTrangSucKhoe`, `LichSuTiem`, `HinhAnh`, `TrangThai`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 1, 'Bông', 'Chó', 'Poodle', '2021-05-20', 5.20, 'Cái', 'Khỏe mạnh', 'Đã tiêm 2 mũi cơ bản', NULL, 'HoatDong', '2025-11-07 10:49:30', '2025-11-07 10:49:30'),
(2, 2, 'Miu', 'Mèo', 'Maine Coon', '2022-02-10', 4.00, 'Đực', 'Bình thường', 'Chưa tiêm phòng dại', NULL, 'HoatDong', '2025-11-07 10:49:30', '2025-11-07 10:49:30'),
(3, 1, 'Cún', '', 'Mèo', '2025-11-21', 4.50, 'Cái', 'Tốt', 'Chưa có', '', 'HoatDong', '2025-11-15 22:36:33', '2025-11-15 22:36:33'),
(9, 3, 'Bông', 'Chó', 'Phốc sóc', '2025-11-12', 5.00, 'Cái', 'khỏe', 'chưa tiêm', '', 'HoatDong', '2025-11-16 01:05:25', '2025-11-16 01:05:25'),
(10, 3, 'Bông', 'Chó', 'Phốc sóc', '2025-11-12', 5.00, 'Cái', 'khỏe', 'chưa tiêm', '', 'HoatDong', '2025-11-16 01:05:31', '2025-11-16 01:05:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tiemphong`
--

CREATE TABLE `tiemphong` (
  `MaTP` int(11) NOT NULL,
  `TenThuoc` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MoTa` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LoaiThuCung` enum('Chó','Mèo','Cả hai') DEFAULT 'Cả hai',
  `SoLanTiem` int(11) DEFAULT 0,
  `Gia` decimal(12,2) NOT NULL,
  `ThoiLuong` int(11) DEFAULT NULL,
  `HinhAnh` varchar(255) DEFAULT NULL,
  `TrangThai` enum('HoatDong','Ngung') DEFAULT 'HoatDong',
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `UpdatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tiemphong`
--

INSERT INTO `tiemphong` (`MaTP`, `TenThuoc`, `MoTa`, `LoaiThuCung`, `SoLanTiem`, `Gia`, `ThoiLuong`, `HinhAnh`, `TrangThai`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 'Vaccine Dại - Rabisin', 'Tiêm phòng bệnh dại cho chó mèo', 'Cả hai', 1, 150000.00, 15, 'https://navetco.com.vn/upload/products/v-rabisin-1lieu-EK2X1752563296.png\r\n', 'HoatDong', '2025-11-07 10:49:30', '2025-11-16 23:10:37'),
(2, 'Vaccine 7 bệnh', 'Phòng 7 bệnh nguy hiểm cho chó', 'Chó', 3, 250000.00, 20, 'https://login.medlatec.vn//ImagePath/images/20230327/20230327_tiem-phong-cho-cho-2.jpg', 'HoatDong', '2025-11-07 10:49:30', '2025-11-10 13:13:05'),
(3, 'Vaccine 4 bệnh cho Mèo', 'Phòng bệnh dại cho mèo', 'Mèo', 2, 180000.00, 15, 'https://cunstores.com/wp-content/uploads/2023/11/zoetis-meo.webp', 'HoatDong', '2025-11-07 10:49:30', '2025-11-10 13:13:14');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `baocaothongke`
--
ALTER TABLE `baocaothongke`
  ADD PRIMARY KEY (`MaBCTK`),
  ADD KEY `MaNV_Tao` (`MaNV_Tao`);

--
-- Chỉ mục cho bảng `chitietthanhtoan`
--
ALTER TABLE `chitietthanhtoan`
  ADD PRIMARY KEY (`MaCTTT`),
  ADD KEY `MaTT` (`MaTT`),
  ADD KEY `MaTP` (`MaTP`);

--
-- Chỉ mục cho bảng `datlich`
--
ALTER TABLE `datlich`
  ADD PRIMARY KEY (`MaLich`),
  ADD KEY `MaKH` (`MaKH`),
  ADD KEY `MaTC` (`MaTC`),
  ADD KEY `MaNV_DuKien` (`MaNV_DuKien`),
  ADD KEY `fk_datlich_tiemphong` (`MaTP`);

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`MaKH`),
  ADD UNIQUE KEY `MaTK` (`MaTK`);

--
-- Chỉ mục cho bảng `lichsutiemphong`
--
ALTER TABLE `lichsutiemphong`
  ADD PRIMARY KEY (`MaLSTP`),
  ADD KEY `MaTC` (`MaTC`),
  ADD KEY `MaTP` (`MaTP`),
  ADD KEY `MaNV_Tiem` (`MaNV_Tiem`);

--
-- Chỉ mục cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`MaNV`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`MaTK`),
  ADD UNIQUE KEY `TenDangNhap` (`TenDangNhap`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Chỉ mục cho bảng `thanhtoan`
--
ALTER TABLE `thanhtoan`
  ADD PRIMARY KEY (`MaTT`),
  ADD KEY `MaLich` (`MaLich`),
  ADD KEY `MaKH` (`MaKH`),
  ADD KEY `MaAdmin_XacNhan` (`MaAdmin_XacNhan`);

--
-- Chỉ mục cho bảng `thucung`
--
ALTER TABLE `thucung`
  ADD PRIMARY KEY (`MaTC`),
  ADD KEY `MaKH` (`MaKH`);

--
-- Chỉ mục cho bảng `tiemphong`
--
ALTER TABLE `tiemphong`
  ADD PRIMARY KEY (`MaTP`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `baocaothongke`
--
ALTER TABLE `baocaothongke`
  MODIFY `MaBCTK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `chitietthanhtoan`
--
ALTER TABLE `chitietthanhtoan`
  MODIFY `MaCTTT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `datlich`
--
ALTER TABLE `datlich`
  MODIFY `MaLich` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  MODIFY `MaKH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `lichsutiemphong`
--
ALTER TABLE `lichsutiemphong`
  MODIFY `MaLSTP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  MODIFY `MaNV` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `MaTK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `thanhtoan`
--
ALTER TABLE `thanhtoan`
  MODIFY `MaTT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `thucung`
--
ALTER TABLE `thucung`
  MODIFY `MaTC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `tiemphong`
--
ALTER TABLE `tiemphong`
  MODIFY `MaTP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `baocaothongke`
--
ALTER TABLE `baocaothongke`
  ADD CONSTRAINT `baocaothongke_ibfk_1` FOREIGN KEY (`MaNV_Tao`) REFERENCES `nhanvien` (`MaNV`);

--
-- Các ràng buộc cho bảng `chitietthanhtoan`
--
ALTER TABLE `chitietthanhtoan`
  ADD CONSTRAINT `chitietthanhtoan_ibfk_1` FOREIGN KEY (`MaTT`) REFERENCES `thanhtoan` (`MaTT`),
  ADD CONSTRAINT `chitietthanhtoan_ibfk_2` FOREIGN KEY (`MaTP`) REFERENCES `tiemphong` (`MaTP`);

--
-- Các ràng buộc cho bảng `datlich`
--
ALTER TABLE `datlich`
  ADD CONSTRAINT `datlich_ibfk_1` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`),
  ADD CONSTRAINT `datlich_ibfk_2` FOREIGN KEY (`MaTC`) REFERENCES `thucung` (`MaTC`),
  ADD CONSTRAINT `datlich_ibfk_3` FOREIGN KEY (`MaNV_DuKien`) REFERENCES `nhanvien` (`MaNV`),
  ADD CONSTRAINT `fk_datlich_tiemphong` FOREIGN KEY (`MaTP`) REFERENCES `tiemphong` (`MaTP`);

--
-- Các ràng buộc cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD CONSTRAINT `khachhang_ibfk_1` FOREIGN KEY (`MaTK`) REFERENCES `taikhoan` (`MaTK`);

--
-- Các ràng buộc cho bảng `lichsutiemphong`
--
ALTER TABLE `lichsutiemphong`
  ADD CONSTRAINT `lichsutiemphong_ibfk_1` FOREIGN KEY (`MaTC`) REFERENCES `thucung` (`MaTC`),
  ADD CONSTRAINT `lichsutiemphong_ibfk_2` FOREIGN KEY (`MaTP`) REFERENCES `tiemphong` (`MaTP`),
  ADD CONSTRAINT `lichsutiemphong_ibfk_3` FOREIGN KEY (`MaNV_Tiem`) REFERENCES `nhanvien` (`MaNV`);

--
-- Các ràng buộc cho bảng `thanhtoan`
--
ALTER TABLE `thanhtoan`
  ADD CONSTRAINT `thanhtoan_ibfk_1` FOREIGN KEY (`MaLich`) REFERENCES `datlich` (`MaLich`),
  ADD CONSTRAINT `thanhtoan_ibfk_2` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`),
  ADD CONSTRAINT `thanhtoan_ibfk_3` FOREIGN KEY (`MaAdmin_XacNhan`) REFERENCES `taikhoan` (`MaTK`);

--
-- Các ràng buộc cho bảng `thucung`
--
ALTER TABLE `thucung`
  ADD CONSTRAINT `thucung_ibfk_1` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
