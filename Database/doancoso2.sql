-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3333
-- Thời gian đã tạo: Th12 04, 2022 lúc 01:06 PM
-- Phiên bản máy phục vụ: 10.4.25-MariaDB
-- Phiên bản PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `doancoso2`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Giày nam'),
(2, 'Giày nữ'),
(3, 'Giày trẻ em'),
(4, 'Sản phẩm khác');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `favorite`
--

CREATE TABLE `favorite` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `favorite`
--

INSERT INTO `favorite` (`id`, `product_id`, `user_id`) VALUES
(2, 2, 2),
(3, 7, 2),
(4, 22, 1),
(5, 29, 1),
(7, 6, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `feedback`
--

INSERT INTO `feedback` (`id`, `user_id`, `product_id`, `content`, `comment_date`) VALUES
(1, 3, 2, 'Sản phẩm rất đẹp, giống như hình ảnh.....', '2022-11-19 12:01:00'),
(3, 3, 4, 'Giày đẹp đế giày chắc chắn, da mềm ko bị đau chân, đánh giá giày quá tuyệt vời....', '2022-11-20 10:31:09'),
(4, 1, 18, 'Sản phẩm quá tuyệt vời.....', '2022-11-20 10:36:46'),
(5, 1, 10, 'Giày đẹp đế giày chắc chắn , đánh giá giày quá tuyệt vời....', '2022-11-20 10:37:31'),
(6, 1, 18, 'Giày đẹp đế giày chắc chắn, da mềm ko bị đau chân, đánh giá giày quá tuyệt vời....', '2022-11-20 10:38:15'),
(7, 4, 10, 'Giày quá đẹp, đi rất êm chân, .....', '2022-11-21 10:27:01'),
(8, 4, 2, 'Giày đẹp đế giày chắc chắn, da mềm ko bị đau chân, đánh giá giày quá tuyệt vời....', '2022-11-21 10:28:19'),
(9, 2, 1, 'Sản phẩm quá tuyệt vời.....', '2022-11-21 10:31:16'),
(10, 2, 2, 'Sản phẩm quá tuyệt vời.....', '2022-11-21 20:43:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_money` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `fullname`, `email`, `phone_number`, `address`, `order_date`, `status`, `total_money`) VALUES
(23, 3, 'Nguyễn Phúc Hậu', 'hauchuoi@gmail.com', '0859021321', 'Quãng nam', '2022-11-18 21:17:43', 'Đã giao hàng', 1550000),
(24, 3, 'Nguyễn Phúc Hậu', 'hauchuoi@gmail.com', '0859021323', 'Quãng nam', '2022-11-18 21:19:08', 'Đã giao hàng', 2250000),
(25, 3, 'Nguyễn Phúc Hậu', 'hauchuoi@gmail.com', '0859021234', 'Quãng nam', '2022-11-18 21:24:28', 'Đang Vận chuyển', 400000),
(26, 3, 'Nguyễn Phúc Hậu', 'hauchuoi@gmail.com', '0859021123', 'Quãng nam', '2022-11-18 21:25:23', 'Đang Vận chuyển', 3150000),
(27, 1, 'Nguyễn Quang Bảo', 'baosuza@gmail.com', '0859021385', 'Hà Tĩnh', '2022-11-18 21:27:01', 'Đã giao hàng', 2193600),
(28, 4, 'Nguyễn Quang Bảo', 'baonq.21it@vku.udn.vn', '0859021385', 'Hà Tĩnh', '2022-11-21 10:25:47', 'Đã giao hàng', 1700000),
(29, 2, 'Phạm Quốc Huy', 'Huy@gmail.com', '0134113123', 'Huế', '2022-11-21 10:29:39', 'Đã giao hàng', 1950000),
(30, 4, 'Nguyễn Quang Bảo', 'baonq.21it@vku.udn.vn', '0859021385', 'Hà Tĩnh', '2022-12-01 23:24:13', 'Đang xử lý', 900000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `total_money` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `user_id`, `order_id`, `product_id`, `price`, `num`, `total_money`) VALUES
(63, 3, 23, 2, 500000, 1, 500000),
(64, 3, 23, 4, 350000, 4, 1400000),
(65, 3, 24, 36, 210000, 9, 1890000),
(66, 3, 24, 15, 600000, 2, 1200000),
(67, 3, 25, 16, 400000, 1, 400000),
(68, 3, 26, 1, 450001, 7, 3150000),
(69, 3, NULL, 6, 650000, 2, 1300000),
(70, 3, NULL, 19, 595000, 3, 1785000),
(71, 1, 27, 18, 248400, 4, 993600),
(72, 1, 27, 10, 600000, 2, 1200000),
(73, 1, NULL, 4, 350000, 1, 350000),
(74, 1, NULL, 14, 800000, 3, 2400000),
(75, 4, 28, 10, 600000, 3, 1800000),
(76, 4, 28, 2, 500000, 2, 1000000),
(77, 1, NULL, 30, 399000, 1, 399000),
(78, 2, 29, 1, 450000, 2, 900000),
(79, 2, 29, 2, 500000, 3, 1500000),
(82, 2, NULL, 6, 650000, 1, 650000),
(83, 1, NULL, 1, 450000, 1, 450000),
(84, 1, NULL, 29, 599000, 1, 599000),
(85, 4, 30, 1, 450000, 2, 900000),
(86, 4, NULL, 15, 600000, 2, 1200000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `quantity_purchased` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `category_id`, `title`, `price`, `discount`, `thumbnail`, `description`, `type`, `quantity`, `quantity_purchased`) VALUES
(1, 1, 'Air Jordan 1 Low', 450000, NULL, '../images/product/1.png', 'Lấy cảm hứng từ phiên bản gốc ra mắt vào năm 1985, Air Jordan 1 Low mang đến một vẻ ngoài cổ điển, sạch sẽ, quen thuộc nhưng luôn mới mẻ. Với một thiết kế mang tính biểu tượng kết hợp hoàn hảo với bất kỳ \'sự vừa vặn nào, những cú đá này đảm bảo bạn sẽ luôn đi đúng hướng.', NULL, 22, 10),
(2, 1, 'Promo Exclusion', 500000, NULL, '../images/product/men/Promo Exclusion.png', NULL, NULL, 34, 5),
(3, 1, 'New Air Max OG', 700000, 6, '../images/product/men/New Air Max OG.png', NULL, NULL, 13, 0),
(4, 1, 'Jordan LS', 350000, NULL, '../images/product/men/Jordan LS.png', NULL, NULL, 51, 3),
(5, 1, 'Nike Metcon 7 AMP', 850000, NULL, '../images/product/men/Nike Metcon 7 AMP.png', NULL, NULL, 32, 0),
(6, 1, 'Nike Air Max Pre-Day', 650000, NULL, '../images/product/men/Nike Air Max Pre-Day.png', NULL, NULL, 53, 0),
(7, 1, 'Nike SB Zoom', 490000, NULL, '../images/product/men/Nike SB Zoom.png', NULL, NULL, 45, 0),
(8, 1, 'PG 6 EP', 590000, NULL, '../images/product/men/PG 6 EP.png', NULL, NULL, 65, 0),
(9, 1, 'Nike ZoomX Streakfly', 320000, 10, '../images/product/men/Nike ZoomX Streakfly.png', NULL, NULL, 23, 0),
(10, 1, 'Nike Air Zoom Infinity', 600000, NULL, '../images/product/men/Nike Air Zoom Infinity.png', NULL, NULL, 50, 4),
(11, 1, 'Kyrie Infinity', 290000, NULL, '../images/product/men/Kyrie Infinity.png', NULL, NULL, 12, 0),
(12, 1, 'Nike ACG Lowcate', 560000, 5, '../images/product/men/Nike ACG Lowcate.png', NULL, NULL, 34, 0),
(13, 1, 'Jordan Max Aura 3', 720000, NULL, '../images/product/men/Jordan Max Aura 3.png', NULL, NULL, 34, 0),
(14, 2, 'Nike Go FLyEase', 800000, NULL, '../images/product/women/Nike Go FLyEase.png', NULL, NULL, 35, 0),
(15, 2, 'Nike Air Force 1\'07', 600000, NULL, '../images/product/women/Nike Air Force 1\'07.png', NULL, NULL, 61, 2),
(16, 2, 'Nike Air Force Fontanka', 400000, NULL, '../images/product/women/Nike Air Force Fontanka.png', NULL, NULL, 37, 1),
(17, 2, 'Nike Air Zoom Pegasus', 360000, NULL, '../images/product/women/Nike Air Zoom Pegasus.png', NULL, NULL, 43, 0),
(18, 2, 'Nike Air Max Koko', 270000, 8, '../images/product/women/Nike Air Max Koko.png', NULL, NULL, 50, 4),
(19, 2, 'Nike Dunk Low LX', 700000, 15, '../images/product/women/Nike Dunk Low LX.png', NULL, NULL, 68, 0),
(20, 2, 'Nike Air Rift Breathe', 460000, NULL, '../images/product/women/Nike Air Rift Breathe.png', NULL, NULL, 34, 0),
(21, 2, 'Nike Air Force 1\'07LV', 360000, NULL, '../images/product/women/Nike Air Force 1\'07LV.png', NULL, NULL, 28, 0),
(22, 2, 'Nike Air Max 90 SE', 250000, NULL, '../images/product/women/Nike Air Max 90 SE.png', NULL, NULL, 64, 0),
(23, 2, 'Jordan Delta 2', 299000, NULL, '../images/product/women/Jordan Delta 2.png', NULL, NULL, 84, 0),
(24, 2, 'Nike Air Max 1 Premium', 499000, 5, '../images/product/women/Nike Air Max 1 Premium.png', NULL, NULL, 29, 0),
(25, 2, 'Nike Air Max Dawn SE', 599000, 10, '../images/product/women/Nike Air Max Dawn SE.png', NULL, NULL, 72, 0),
(26, 3, 'Promo Exclusion', 499000, 7, '../images/product/kids/Promo Exclusion.png', NULL, NULL, 74, 0),
(27, 3, 'New Air Max OG', 299000, NULL, '../images/product/kids/New Air Max OG.png', NULL, NULL, 77, 0),
(28, 3, 'Jordan LS', 700000, NULL, '../images/product/kids/Jordan LS.png', NULL, NULL, 32, 0),
(29, 3, 'Nike Metcon 7 AMP', 599000, NULL, '../images/product/kids/Nike Metcon 7 AMP.png', NULL, NULL, 7, 0),
(30, 3, 'Nike Air Max Pre-Day', 399000, NULL, '../images/product/kids/Nike Air Max Pre-Day.png', NULL, NULL, 22, 0),
(31, 3, 'Nike SB Zoom', 800000, 10, '../images/product/kids/Nike SB Zoom.png', NULL, NULL, 33, 0),
(32, 3, 'PG 6 EP', 899000, NULL, '../images/product/kids/PG 6 EP.png', NULL, NULL, 31, 0),
(33, 3, 'Nike ZoomX Streakfly', 320000, NULL, '../images/product/kids/Nike ZoomX Streakfly.png', NULL, NULL, 11, 0),
(34, 3, 'Nike Air Zoom Infinity', 450000, 10, '../images/product/kids/Nike Air Zoom Infinity.png', NULL, NULL, 44, 0),
(35, 3, 'Kyrie Infinity', 399000, NULL, '../images/product/kids/Kyrie Infinity.png', NULL, NULL, 53, 0),
(36, 3, 'Nike ACG Lowcate', 210000, NULL, '../images/product/kids/Nike ACG Lowcate.png', NULL, NULL, 29, 5),
(37, 3, 'Jordan Max Aura 3', 600000, 8, '../images/product/kids/Jordan Max Aura 3.png', NULL, NULL, 45, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Người dùng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `fullname`, `email`, `phone_number`, `address`, `password`, `role_id`) VALUES
(1, 'Nguyễn Quang Bảo', 'baosuza@gmail.com', '0859021385', 'Hà Tĩnh', '12345', 2),
(2, 'Phạm Quốc Huy', 'huy@gmail.com', '851231385', 'Thừa Thiên Huế', '12345', 2),
(3, 'Nguyễn Phúc Hậu', 'hauchuoi@gmail.com', '859021334', 'Quảng Nam', '12345', 2),
(4, 'Nguyễn Quang Bảo', 'baonq.21it@vku.udn.vn', '859021385', 'Hà Tĩnh', '123456', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `favorite`
--
ALTER TABLE `favorite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Các ràng buộc cho bảng `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
