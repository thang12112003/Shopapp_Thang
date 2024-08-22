-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 22, 2024 lúc 07:40 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shopapp`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(6, 'Cài áo'),
(5, 'Khăn '),
(7, 'Kính'),
(4, 'Nón 2'),
(1, 'Phụ kiện tóc'),
(3, 'Túi sách và Ví');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `fullname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `phone_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `note` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `order_date` datetime DEFAULT current_timestamp(),
  `status` enum('pending','processing','shipped','delivered','cancelled') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Trạng thái đơn hàng',
  `total_money` float DEFAULT NULL,
  `shipping_method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `shipping_address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `shipping_date` date DEFAULT NULL,
  `tracking_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `payment_method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `fullname`, `email`, `phone_number`, `address`, `note`, `order_date`, `status`, `total_money`, `shipping_method`, `shipping_address`, `shipping_date`, `tracking_number`, `payment_method`, `active`, `coupon_id`) VALUES
(17, 13, 'Nguyen Duc Thang', 'thangnguyen12112003@gmail.com', '0866550634', 'ha noi', 'xin nhẹ tay', '2024-08-21 00:00:00', 'pending', 137.5, 'express', NULL, '2024-08-21', NULL, 'cod', 1, NULL),
(18, 5, 'Nguyễn Văn Test', 'nguyenvantest@gmail.com', '097623223', 'Đà Nẵng', 'để ở đó', '2024-08-21 00:00:00', 'pending', 660, 'express', NULL, '2024-08-21', NULL, 'cod', 1, NULL),
(19, 8, 'Nguyễn Đức Hoàng ', 'hoang123@gmail.com', '037418926', 'Hồ Chí Minh city', 'giao trong 4 ngày', NULL, 'shipped', 860.2, 'express', NULL, NULL, NULL, 'cod', 1, NULL),
(20, 8, 'Nguyễn Đức Hoàng', 'hoang123@gmail.com', '012737612', 'Hạ Long', 'cứ để ở đấy', '2024-08-21 00:00:00', 'pending', 110, 'express', NULL, '2024-08-21', NULL, 'cod', 1, NULL),
(21, 8, 'Nguyen Duc Thang', 'thang12@gmail.com', '0828637811', 'ha noi', 'xin nhẹ tay', NULL, 'shipped', 55, 'express', NULL, NULL, NULL, 'cod', 1, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `number_of_products` int(11) DEFAULT 1,
  `total_money` decimal(10,2) DEFAULT 0.00,
  `color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `coupon_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `price`, `number_of_products`, `total_money`, `color`, `coupon_id`) VALUES
(30, 17, 1, 27.50, 2, NULL, NULL, NULL),
(31, 17, 6, 55.00, 1, NULL, NULL, NULL),
(32, 17, 11, 27.50, 1, NULL, NULL, NULL),
(33, 18, 29, 60.50, 2, NULL, NULL, NULL),
(34, 18, 18, 107.80, 5, NULL, NULL, NULL),
(35, 19, 18, 107.80, 1, NULL, NULL, NULL),
(36, 19, 3, 9.90, 2, NULL, NULL, NULL),
(37, 19, 30, 84.70, 3, NULL, NULL, NULL),
(38, 19, 12, 159.50, 3, NULL, NULL, NULL),
(39, 20, 1, 27.50, 1, NULL, NULL, NULL),
(40, 20, 9, 20.90, 1, NULL, NULL, NULL),
(41, 20, 36, 61.60, 1, NULL, NULL, NULL),
(42, 21, 1, 27.50, 2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(350) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Tên sản phẩm',
  `price` decimal(10,2) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `thumbnail`, `description`, `created_at`, `updated_at`, `category_id`) VALUES
(1, 'kẹp tóc cá mập hình kẹo ngọt', 27.50, '3ab0d960-6f7e-4182-8f1e-bc1a8a9575a9_20240731_1UWkI34k6s.jpeg', 'Kẹp tóc xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 16:28:50', '2024-08-16 16:32:20', 1),
(2, 'Kẹp tóc xà cừ đục lỗ hình sao', 33.00, '63dc3b8a-6d0f-4911-bc8c-b973c1c3b8e6_20240731_Dv00PcWs3J.jpeg', 'Kẹp tóc xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 16:33:55', '2024-08-16 16:34:52', 1),
(3, 'Dây buộc tóc vải thun nhà cú co giãn màu ombre', 9.90, '56cdb0bb-fee1-4d8c-a80b-851c82d2f200_20240714_6YbpnRkAG8.jpeg', 'Dây buộc tóc xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 16:36:06', '2024-08-16 16:36:47', 1),
(4, 'Dây buộc tóc hình hoa', 22.00, '160bdf2c-a59c-4668-af4d-a6cb82df5a49_20240714_CrclBzMh9A.jpeg', 'Dây buộc tóc xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 16:37:41', '2024-08-16 16:38:36', 1),
(5, 'kẹp tóc càng cua nhà cú giả vân đá', 16.50, '3aa2ea40-3246-48fd-9511-caceafb87594_20240629_iMHoQ2aTAj.jpeg', 'Kẹp tóc xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 16:39:37', '2024-08-16 16:40:21', 1),
(6, 'Kẹp tóc càng cua hình bướm màu thạch', 55.00, 'f27ff92a-9e35-4c55-a696-5c1e339daef3_20240629_9ocobrY0D1.jpeg', 'Kẹp tóc xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 16:40:46', '2024-08-16 16:41:30', 1),
(7, 'Kẹp tóc hình bướm màu trong', 20.90, '14de2162-707d-42f9-bd0b-4a38a03ca5d5_20240628_2R4YRYvoCK.jpeg', 'Kẹp tóc xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 16:42:03', '2024-08-16 16:42:44', 1),
(8, 'Kẹp tóc càng cua đính đá nhiều màu', 44.00, 'faa8b673-71cd-4a40-a057-cffc07c089d1_20240628_0UPHAlILEG.jpeg', 'Kẹp tóc xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 16:43:04', '2024-08-16 16:43:45', 1),
(9, 'Kẹp tóc hình bướm cánh đôi chuyển màu', 20.90, 'e162f95d-c370-4fc6-9a93-24334760df1c_20240628_gXpl0us0MN.jpeg', 'Kẹp tóc xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 16:44:18', '2024-08-16 16:45:19', 1),
(10, 'Kẹp Tóc Nơ Ngọc Hình Tim Nhà Cú Nữ', 27.50, '37845a99-f199-4578-b8e5-98d28dc90e0d_20240623_0aM0TXsx6G.jpeg', 'Kẹp tóc xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 16:45:44', '2024-08-16 16:46:29', 1),
(11, 'Mắt kính gọng hcn càng mắt xích màu vàng chống uv400', 27.50, '90a8217f-7029-4438-87f8-bf81983142e7_20230420_4UNIEjBlwl.jpeg', 'Kẹp tóc xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 16:49:32', '2024-08-16 16:50:46', 7),
(12, 'Mắt kính nhà cú gọng vuông màu đen chống uv400', 159.50, 'f4b84fee-3fa4-46b6-b7b2-e8957d537a5e_20230420_9t6N46TlzX.jpeg', 'Mắt kính xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 16:51:29', '2024-08-16 16:51:57', 7),
(13, 'Mắt kính Nhà cú gọng tròn viền tròn chống UV400 ', 146.30, 'fe36e1bb-6f47-428f-b657-d3f820bb68cc_20230420_9t6N46TlzX.jpeg', 'Mắt kính xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 16:52:29', '2024-08-16 16:52:55', 7),
(14, 'Mắt kính nhà cú gọng vuông màu đen chống uv400', 176.00, 'c6fd2364-62b8-4b37-a22c-90c8e6f32867_20230420_4UNIEjBlwl.jpeg', 'Mắt kính xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 16:53:46', '2024-08-16 16:54:10', 7),
(15, 'Mắt kinh Nhà Cú gọng mắt mèo bầu chống UV400', 154.00, 'f472f84e-1547-4477-849b-91fdfbcf18a5_20220912_nzMSiPDzww9SqzuN299MXRxg.jpg', 'Mắt kính xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 16:55:14', '2024-08-16 16:56:23', 7),
(16, 'Mắt kinh Nhà Cú gọng oval chống UV400', 187.00, '2eca41be-8419-43b8-94e5-52c3acd2f056_20220912_UOQZx2xewyPSYL3AJBpO04CF.jpg', 'Mắt kính xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 16:57:07', '2024-08-16 16:57:46', 7),
(17, 'Mắt kính mắt mèo gọng kim loại màu đen', 198.00, 'd4ca836c-6da5-4721-8be0-273b7d36659b_20220611_Os25Zf5ZxkrKXCYVJCU8nLHL.jpg', 'Mắt kính xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 16:58:20', '2024-08-16 16:59:05', 7),
(18, 'Cài áo tạo hình uyên ương đính đá màu bạc', 107.80, '844ec2d2-3c9b-4bc8-8bad-aa79cd47fe68_20221217_zSfhlEQn3DPEB8Q63yuM3CZ1.jpg', 'Cài áo xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 16:59:53', '2024-08-16 17:01:11', 6),
(19, 'Cài áo hạt ngọc trắng nơ đính đá màu bạc 170', 207.90, '634329ca-df78-4cdf-9bf6-1a1c50084b5a_20221130_uoF1vOogt31LZ7NHWK914Dzi.jpg', 'Cài áo xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 17:01:28', '2024-08-16 17:01:59', 6),
(20, 'Cài áo kiểu màu bạc', 97.90, 'f9cfcbfb-58b4-4048-8cae-9a447c7a45b4_20221129_NZ0l7yrZZ8pwa5LPK2DA3Sdw.jpg', 'Cài áo xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 17:02:27', '2024-08-16 17:02:57', 6),
(21, 'Cài áo mèo hạt ngọc đính đá màu bạc', 118.80, '8aebf2d0-e97f-46e9-b321-8c182dc619ac_20221112_4obAP7aU9EnWYA5emW7cIhyd.jpg', 'Cài áo xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 17:03:43', '2024-08-16 17:04:11', 6),
(22, 'Ca bán nguyệt đính đá và hạt ngọc màu bạc ', 173.80, 'dd9b3b68-d752-4ee6-b5b1-639ae3a5ebf9_20221010_TQPftL0Ij9FtqmbmqmcAjWpi.jpg', 'Cài áo xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 17:05:10', '2024-08-16 17:05:30', 6),
(23, 'CA bướm đính đá viền màu vàng ', 271.70, '4f9afbaf-1d27-4aa1-b17a-df2fa04821a0_20221010_6wUXq4z6grB4dep8JwDb1Xyc.jpg', 'Cài áo xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 17:06:07', '2024-08-16 17:06:25', 6),
(24, 'Cài áo Nhà Cú hoa 2 tầng đính hạt ngọc', 135.30, 'ca2345cc-f29f-4498-8171-388b14d2a158_20220709_1CQt9OTI7YtnFOGzv8dTbKTB.jpg', 'Cài áo xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 17:07:01', '2024-08-16 17:07:21', 6),
(25, 'Túi tote họa tiết vịt cute', 165.00, '93c7df1c-9543-43af-8609-3852550b55a3_20220702_1OTf4IIsDBy1Qyy4LAFZB5W5.jpg', 'Túi xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 17:08:09', '2024-08-16 17:09:23', 3),
(26, 'Túi tote Nhà Cú trắng kem họa tiết gấu và chữ 1166', 171.60, '73a7bc55-0ebf-41c9-99eb-534bfdf7df16_20220702_1OTf4IIsDBy1Qyy4LAFZB5W5.jpg', 'Túi xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 17:09:45', '2024-08-16 17:09:58', 3),
(27, 'Túi tote tlo vàng họa tiết cô gái', 550.00, '0cec6982-1f2f-4a03-9a77-ddfdeb9c2a77_20210421_el4PczkM1KBhBTywLu48XNV3.jpg', 'Túi xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 17:10:34', '2024-08-16 17:10:49', 3),
(28, 'Túi tote họa tiết trái cam ', 476.30, '37f1def8-23d1-49a7-8d16-4eac1aba3b5b_20210421_el4PczkM1KBhBTywLu48XNV3.jpg', 'Túi xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 17:11:16', '2024-08-16 17:11:32', 3),
(29, 'Khăn hcn bản nhỏ các kiểu', 60.50, '81769056-36ae-4934-a372-a285096cbee0_20220627_8xBEi4DEQgerKNL1bJrc2Su0.jpg', 'Khăn xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 17:13:28', '2024-08-16 17:13:42', 5),
(30, 'Khăn hcn bản nhỏ nên trắng quả vàng', 84.70, '6b235054-b738-4982-af97-eba7c564f7ce_20220125_s862BRvjtz8p3OAn5OzTNrWu.jpg', 'Khăn xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 17:14:07', '2024-08-16 17:14:33', 5),
(31, 'Khăn hcn bản lớn viền xám đen họa tiết chữ ', 85.80, '1bf65224-e481-42e1-8a59-1f447c3ae2aa_20220125_P3WP5rn9wwkvHlbf62ZCA4PA.jpg', 'Khăn xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 17:15:06', '2024-08-16 17:15:21', 5),
(32, 'Khăn hcn bản nhỏ xanh họa tiết hoa', 122.10, '8284da0d-598e-48f2-807d-6119abbb556f_20220125_P3WP5rn9wwkvHlbf62ZCA4PA.jpg', 'Khăn xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 17:15:52', '2024-08-16 17:16:55', 5),
(33, 'Khăn hcn bản to xanh vàng', 171.60, '27712e0d-c514-4f17-9ea1-1c1a97dbaa24_20211227_070r57Bj1Fqc2Z0y7L6fMIvj.jpg', 'Khăn xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 17:16:31', '2024-08-16 17:18:12', 5),
(34, 'Khăn hcn bản to hoạ tiết đa dạng', 39.60, 'cd1925e9-6e83-4b21-83e5-2f74ee251891_20220125_P3WP5rn9wwkvHlbf62ZCA4PA.jpg', 'Khăn xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 17:17:32', '2024-08-16 17:18:44', 5),
(35, 'Nón cói vành lớn nơ thương hiệu paris màu nâu', 135.30, '8ef4f9c8-b413-48d5-9e5b-9f4af5f96a2b_20230429_aJ2PsQ3WTq.jpeg', 'Nón xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 17:20:18', '2024-08-16 19:38:51', 4),
(36, 'Nón cói nâu vành lớn viền ren trắng', 61.60, '7db10f1e-2c26-4177-9977-09fa930251ee_20230429_aJ2PsQ3WTq.jpeg', 'Nón xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 17:21:37', '2024-08-16 19:39:00', 4),
(37, 'Nón cói nhà cú bản nơ nhỏ màu kem', 135.30, '1ce0c25c-f60e-498c-845a-81c36f0c3bf7_20220625_2pFrd1U5knfqLL0TaSkDQyKU.jpg', 'Nón xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 17:22:17', '2024-08-16 20:26:06', 4),
(38, 'Nón Nhà Cú họa tiết chuối ', 496.10, 'efc86512-4c78-4717-9eb7-655833871315_20220625_2pFrd1U5knfqLL0TaSkDQyKU.jpg', 'Nón xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 17:23:18', '2024-08-16 19:39:12', 4),
(39, 'Nón cói trắng nơ bản to  ', 137.50, '8959d1a1-2617-452c-aa9a-0b0c930dbad3_20220417_DyaGJgQ4PEWPzumIUso18CDg.jpg', 'Nón xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 17:24:25', '2024-08-16 17:25:44', 4),
(40, 'Nón cối hoa khô sắc màu', 172.70, '710f916e-d282-4e54-9111-37c3d69f43c2_20220403_ElRdsDaIl4Qavm49huuwfNbu.jpg', 'Nón xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 17:26:31', '2024-08-16 17:26:51', 4),
(41, 'Nón tlo họa tiết chuối vàng', 61.60, '7c04044d-dc43-4d55-a3e3-d7d436a181c9_20210414_1wkrk76bFLaGB7DZirQXVW3b.jpg', 'Nón xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 17:27:18', '2024-08-16 17:27:31', 4),
(42, 'Nón cối tlo bản viền basic', 282.70, 'e252bfae-20df-4039-a4a4-dd5dd44c7c4c_20220403_ElRdsDaIl4Qavm49huuwfNbu.jpg', 'Nón xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 17:28:09', '2024-08-16 17:28:33', 4),
(43, 'Nón cói đính chữ m viền chuỗi ngọc màu be', 136.40, 'd0b88536-c3a3-4ad2-924b-d89db77e909d_20220417_DyaGJgQ4PEWPzumIUso18CDg.jpg', 'Nón xinh xắn, đa dạng kiểu dáng, chất liệu.', '2024-08-16 17:29:02', '2024-08-16 17:29:54', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `image_url` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image_url`) VALUES
(1, 1, '3ab0d960-6f7e-4182-8f1e-bc1a8a9575a9_20240731_1UWkI34k6s.jpeg'),
(2, 1, '0ea39cc9-6845-4f6f-8963-95aab2b216d2_20240731_9KvHhwZpZD.jpeg'),
(3, 1, '09e04b41-f716-4af9-8fb4-b5863fecc45a_20240731_fDOwKBah8s.jpeg'),
(4, 1, '3d6459ca-017b-4c4e-bc7d-6e3c49c85cb8_20240731_PW3CjplmSK.jpeg'),
(5, 2, '63dc3b8a-6d0f-4911-bc8c-b973c1c3b8e6_20240731_Dv00PcWs3J.jpeg'),
(6, 2, 'ef295e70-f401-45c4-9fbe-c135887a3348_20240731_fDOwKBah8s.jpeg'),
(7, 2, '86b425e1-9821-4f34-bd09-7d5f4a6e981b_20240731_PW3CjplmSK.jpeg'),
(8, 2, 'c47ca8ac-93d7-42ec-b4c4-b8f2dc1c0acc_20240731_zrlZMqZGVE.jpeg'),
(9, 3, '56cdb0bb-fee1-4d8c-a80b-851c82d2f200_20240714_6YbpnRkAG8.jpeg'),
(10, 3, 'affa5554-4704-47bb-8752-0e71708a3211_20240714_ePuVL3Chng.jpeg'),
(11, 3, '1b8343ec-8aea-47d1-89ba-532f72bd08ad_20240714_kJGsOxaiIa.jpeg'),
(12, 4, '160bdf2c-a59c-4668-af4d-a6cb82df5a49_20240714_CrclBzMh9A.jpeg'),
(13, 4, 'a250fa0d-64e9-4fad-9f34-eaed1c940c5f_20240714_LG0N37MmMI.jpeg'),
(14, 4, '03325602-55f1-4506-b7bf-2886b0172bdc_20240714_OwyDFvCdxY.jpeg'),
(15, 4, '88f4bf2f-ebf8-4574-a5cb-5d1a82dd1853_20240714_VaVjG5o9Su.jpeg'),
(16, 5, '3aa2ea40-3246-48fd-9511-caceafb87594_20240629_iMHoQ2aTAj.jpeg'),
(17, 5, 'bcaeb70b-84a0-4f2f-8de7-fe8e07941373_20240629_jb5lCIs60J.jpeg'),
(18, 5, '6ee89106-365c-4a26-b8ad-06bf15d25ada_20240629_Ljw63So820.jpeg'),
(19, 5, '26d236d2-f9b3-4550-a06e-348e2297fdfa_20240629_sSoVxSTMP0.jpeg'),
(20, 5, '3203e0e6-4eec-4ee0-a436-c4f0f3416ffc_20240629_wDOnCRfWDG.jpeg'),
(21, 6, 'f27ff92a-9e35-4c55-a696-5c1e339daef3_20240629_9ocobrY0D1.jpeg'),
(22, 6, 'd7dbebd5-f2c3-4ec4-b4fa-0a7fd05d8e45_20240629_BDRcGPMEG4.jpeg'),
(23, 6, 'f909239d-e1a1-468d-9b1e-e951f66a1971_20240629_KhOxNgkusd.jpeg'),
(24, 6, 'e788244f-f655-41cc-a0fa-40df69cbf646_20240629_QcDtHjYRLT.jpeg'),
(25, 7, '14de2162-707d-42f9-bd0b-4a38a03ca5d5_20240628_2R4YRYvoCK.jpeg'),
(26, 7, '6b29143f-7024-4ab5-9ef2-4b2e69659226_20240628_FaDgbGtJcp.jpeg'),
(27, 7, '8e7c509d-f25b-4636-80d2-8e4302fe69d6_20240628_i2UpcqK6HO.jpeg'),
(28, 7, '667c4ca6-678d-439b-9241-599e70fd5ce7_20240628_X7d0nDVXYz.jpeg'),
(29, 8, 'faa8b673-71cd-4a40-a057-cffc07c089d1_20240628_0UPHAlILEG.jpeg'),
(30, 8, 'a5e61d93-8b12-4e56-b742-06a151566a10_20240628_ckKSevAzjc.jpeg'),
(31, 8, 'b2ae5061-2f37-4a49-b553-aaa8ead7e44f_20240628_ezhmdWFREN.jpeg'),
(32, 8, '82fe7072-beab-45b0-b40c-f325e7e686e8_20240628_Ok2k0Dtrqd.jpeg'),
(33, 8, '688a7c47-ef60-461c-aaae-2cf0bcfedc8e_20240628_gXpl0us0MN.jpeg'),
(34, 9, 'e162f95d-c370-4fc6-9a93-24334760df1c_20240628_gXpl0us0MN.jpeg'),
(35, 10, '37845a99-f199-4578-b8e5-98d28dc90e0d_20240623_0aM0TXsx6G.jpeg'),
(36, 10, 'f09d6359-a682-4688-a11c-17b551e660db_20240623_b4JCTyIYEi.jpeg'),
(37, 10, '3a8c1169-bda0-41c4-af4c-a811562b991e_20240623_m7m1OLWwwo.jpeg'),
(38, 10, '0e32fdc7-339b-4697-8a7e-5f447d8ca433_20240623_xk6mzOhhqP.jpeg'),
(39, 11, '90a8217f-7029-4438-87f8-bf81983142e7_20230420_4UNIEjBlwl.jpeg'),
(40, 11, '87d6310a-a610-449f-9fc7-dc0c105d5211_20230422_CDl2slZVwr.jpeg'),
(41, 11, 'c9511a17-7a69-444d-92fd-942381980599_20230422_kct5cRFETD.jpeg'),
(42, 11, '9176ef96-52fc-4140-b4c1-f1bfe19cbeb6_20230422_Uv7v4Kgbne.jpeg'),
(43, 12, 'f4b84fee-3fa4-46b6-b7b2-e8957d537a5e_20230420_9t6N46TlzX.jpeg'),
(44, 12, 'dc71098d-d204-4b74-8ccf-c7e3a805b0b9_20230420_zFswNYNG2H.jpeg'),
(45, 12, '36ca1a58-0e39-4639-93ca-340d9dfb6b53_20230422_CDl2slZVwr.jpeg'),
(46, 12, 'd0064979-6e2e-442b-87be-82af9d51b6a3_20230422_kct5cRFETD.jpeg'),
(47, 12, 'a03bbbb3-e50f-4943-a2a7-6c9f7ee19bd7_20230422_Uv7v4Kgbne.jpeg'),
(48, 13, 'fe36e1bb-6f47-428f-b657-d3f820bb68cc_20230420_9t6N46TlzX.jpeg'),
(49, 13, 'cec0572c-b2ca-47cc-98d9-31e990608bc9_20230420_LP8C2hSpal.jpeg'),
(50, 13, '27a53688-5e7d-44d5-9642-1ecfc5891a56_20230420_zFswNYNG2H.jpeg'),
(51, 13, 'ecf8c25f-3ab8-4da0-9ecd-f869cd1f9d9e_20230422_CDl2slZVwr.jpeg'),
(52, 13, '1693fec7-8781-42ae-9e4f-6bcd86830874_20230422_kct5cRFETD.jpeg'),
(53, 14, 'c6fd2364-62b8-4b37-a22c-90c8e6f32867_20230420_4UNIEjBlwl.jpeg'),
(54, 14, 'bd1be2ca-80eb-4b4e-9d63-156016c49b44_20230420_9t6N46TlzX.jpeg'),
(55, 14, '2abfaa6b-aa8e-42f5-bc9a-518d771850e0_20230422_CDl2slZVwr.jpeg'),
(56, 14, 'bdc2575d-2c0f-4539-838a-1477c6367747_20230422_CJcYBIYr79.jpeg'),
(57, 14, '7734b348-1c63-44d8-9ee3-5a3f5490ab60_20230422_Uv7v4Kgbne.jpeg'),
(58, 15, 'f472f84e-1547-4477-849b-91fdfbcf18a5_20220912_nzMSiPDzww9SqzuN299MXRxg.jpg'),
(59, 15, 'dd3f239f-c589-4c22-a30b-467b59d73ba3_20220921_C2lRmHsaoL9jHwecreBPrm1h.jpg'),
(60, 15, 'deb7d5fc-4293-43e8-be6f-a870f916eba4_20220921_g3IFKkapyQZaHRxw2nLJKxxS.jpg'),
(61, 15, '01bd09ec-1c20-449c-aa4c-0bf12673479e_20220921_kX9KGpiZ2j12NAkQoG3QUKTb.jpg'),
(62, 16, '2eca41be-8419-43b8-94e5-52c3acd2f056_20220912_UOQZx2xewyPSYL3AJBpO04CF.jpg'),
(63, 16, '93bb0b26-017b-4811-8897-d02ac27624d9_20220921_4vGUaEKDMIwmGLcuY6fOJAYk.jpg'),
(64, 16, '64e67bb5-dd0d-438f-b956-685c7102bd72_20220921_C2lRmHsaoL9jHwecreBPrm1h.jpg'),
(65, 16, '6f4ce51f-76a7-4c65-af67-a1f9d9f795d6_20220921_g3IFKkapyQZaHRxw2nLJKxxS.jpg'),
(66, 16, '23fd9daf-554f-4155-87f8-2f8138af7634_20220921_kX9KGpiZ2j12NAkQoG3QUKTb.jpg'),
(67, 17, 'd4ca836c-6da5-4721-8be0-273b7d36659b_20220611_Os25Zf5ZxkrKXCYVJCU8nLHL.jpg'),
(68, 17, '483cc989-b74b-4bd8-9f8a-e908736ca6a8_20220912_UOQZx2xewyPSYL3AJBpO04CF.jpg'),
(69, 17, '568b8de9-45ca-4119-868d-2a7bd63af9aa_20220921_g3IFKkapyQZaHRxw2nLJKxxS.jpg'),
(70, 17, '17ee65d3-88d4-4433-abf6-d9925ed797ef_20221128_HmGWcSQuwaGqvmufwHclx0tx.jpg'),
(71, 17, '73b75cba-1fc2-420c-bc84-a1587a1f4d02_20221128_qXYRAZskb91UhyRcVsApmhs0.jpg'),
(72, 18, '844ec2d2-3c9b-4bc8-8bad-aa79cd47fe68_20221217_zSfhlEQn3DPEB8Q63yuM3CZ1.jpg'),
(73, 18, 'ea9a3cff-ffba-40ef-81d2-1f6eb6453044_20221219_3FxKqE4NQpSS5e8BKptzydqg.jpg'),
(74, 18, 'b93ae355-f1e9-465d-b61d-f53da8b46818_20221220_1qJm9O6gcvGHbWb91NOXwRRD.jpg'),
(75, 18, 'b78ae9b8-6117-4bb2-9ec6-dd09710849c2_20221220_46D6eM4u6E683mh9ACPi6ySv.jpg'),
(76, 18, 'd241144a-c086-41b1-ad03-fd96753074d1_20230130_Bh3Czjx2XcEAI4qn.jpg'),
(77, 18, '3f7bd220-6569-46d5-b36f-d66f4fad67fb_20221130_uoF1vOogt31LZ7NHWK914Dzi.jpg'),
(78, 19, '634329ca-df78-4cdf-9bf6-1a1c50084b5a_20221130_uoF1vOogt31LZ7NHWK914Dzi.jpg'),
(79, 19, '5e192ad2-bcc0-448d-a136-f681f2c1665d_20221217_zSfhlEQn3DPEB8Q63yuM3CZ1.jpg'),
(80, 19, '44028205-743e-405f-bf01-3682cad63d9d_20221219_3FxKqE4NQpSS5e8BKptzydqg.jpg'),
(81, 19, '03b83ea9-7252-4ab6-ae48-4b95a8091280_20221220_1qJm9O6gcvGHbWb91NOXwRRD.jpg'),
(82, 19, '87b89320-78c1-4f46-bb4a-a9717210b37b_20221220_46D6eM4u6E683mh9ACPi6ySv.jpg'),
(83, 20, 'f9cfcbfb-58b4-4048-8cae-9a447c7a45b4_20221129_NZ0l7yrZZ8pwa5LPK2DA3Sdw.jpg'),
(84, 20, '3f351743-90a1-4dcb-82e6-cbc26fe2ff95_20221130_uoF1vOogt31LZ7NHWK914Dzi.jpg'),
(85, 20, '1311f8e2-d3bd-4108-a3ef-0d561539a7f0_20221217_zSfhlEQn3DPEB8Q63yuM3CZ1.jpg'),
(86, 20, 'a601835c-898c-4f64-8e93-ccc77fe8d71d_20221220_46D6eM4u6E683mh9ACPi6ySv.jpg'),
(87, 20, '4e3da5f1-f9e1-4bff-98ca-98c678d101cd_20230130_Bh3Czjx2XcEAI4qn.jpg'),
(88, 21, '8aebf2d0-e97f-46e9-b321-8c182dc619ac_20221112_4obAP7aU9EnWYA5emW7cIhyd.jpg'),
(89, 21, '9f892cfc-609c-44f4-abb5-9120d2c3338e_20221121_VByKl8IgMXPShMoc8w5Xk1uD.jpg'),
(90, 21, 'e010f98f-e271-40c6-9105-e240a6320354_20221129_NZ0l7yrZZ8pwa5LPK2DA3Sdw.jpg'),
(91, 21, 'afd9f771-23a4-488a-8097-4b3837738dff_20221220_46D6eM4u6E683mh9ACPi6ySv.jpg'),
(92, 21, '0eec982d-0cec-4bfe-a3b7-e71658c28909_20221220_jTe1kjnYNzT6LQRdnJQUWPmf.jpg'),
(93, 21, '2fc98cb7-d00a-4589-bb7c-f5c0adfa41af_20221010_TQPftL0Ij9FtqmbmqmcAjWpi.jpg'),
(94, 22, 'dd9b3b68-d752-4ee6-b5b1-639ae3a5ebf9_20221010_TQPftL0Ij9FtqmbmqmcAjWpi.jpg'),
(95, 22, '760f693f-5fc3-4d0a-af21-c809553e1835_20221112_4obAP7aU9EnWYA5emW7cIhyd.jpg'),
(96, 22, '828ce99c-01fc-45b7-82ec-cef77e98bfb4_20221121_VByKl8IgMXPShMoc8w5Xk1uD.jpg'),
(97, 22, '8692c529-f385-40ce-a56f-e0f443a1679a_20221130_uoF1vOogt31LZ7NHWK914Dzi.jpg'),
(98, 22, 'e740115c-2fce-4063-9b36-b2bfad2f936e_20230130_Bh3Czjx2XcEAI4qn.jpg'),
(99, 23, '4f9afbaf-1d27-4aa1-b17a-df2fa04821a0_20221010_6wUXq4z6grB4dep8JwDb1Xyc.jpg'),
(100, 23, '6ebce742-5192-48ea-8c50-028236e5695c_20221010_TQPftL0Ij9FtqmbmqmcAjWpi.jpg'),
(101, 23, 'ea2038c1-1f11-40a5-9219-ffc30c8cd0f1_20221112_4obAP7aU9EnWYA5emW7cIhyd.jpg'),
(102, 23, '5264192b-abf3-4bde-996a-d29bfa208b54_20221219_3FxKqE4NQpSS5e8BKptzydqg.jpg'),
(103, 23, '9688b70f-4618-4d09-8dc3-5eb7d8d7286b_20221220_1qJm9O6gcvGHbWb91NOXwRRD.jpg'),
(104, 23, '7f9ffaa0-9d54-469f-b1f0-2102b70b09a0_20220709_1CQt9OTI7YtnFOGzv8dTbKTB.jpg'),
(105, 24, 'ca2345cc-f29f-4498-8171-388b14d2a158_20220709_1CQt9OTI7YtnFOGzv8dTbKTB.jpg'),
(106, 24, '0abfc540-49c1-4c29-a7e7-487ed142de42_20221010_6wUXq4z6grB4dep8JwDb1Xyc.jpg'),
(107, 24, 'a6dfd374-8163-4c18-8a6b-5c82558d1f69_20221112_4obAP7aU9EnWYA5emW7cIhyd.jpg'),
(108, 24, '63093f5e-1112-4b98-be29-37a8a8bae84f_20221121_VByKl8IgMXPShMoc8w5Xk1uD.jpg'),
(109, 24, '0789fcaa-58e0-4cac-8b41-2adb42d0b64a_20221129_NZ0l7yrZZ8pwa5LPK2DA3Sdw.jpg'),
(110, 25, '93c7df1c-9543-43af-8609-3852550b55a3_20220702_1OTf4IIsDBy1Qyy4LAFZB5W5.jpg'),
(111, 25, 'bef01e3a-04de-4941-9508-ab19eb690d36_20221029_CP05KFIrZT888wM1IBifY9ca.jpg'),
(112, 25, 'e7c88a46-5cce-41b5-b2b7-46654c42a141_20221029_DYYKg8IMmANoJwUfKBqICDKQ.jpg'),
(113, 25, '37d85ea5-22c6-46c1-9f62-a85fc1e21e72_20221110_i9R0BnTf5sWS0LHf6MvdpJmI.jpg'),
(114, 25, '008275ce-c540-489e-9b27-5cae5c4d7502_20221110_k9tHrEqfn7dayBXlQXbGiJz7.jpg'),
(115, 26, '73a7bc55-0ebf-41c9-99eb-534bfdf7df16_20220702_1OTf4IIsDBy1Qyy4LAFZB5W5.jpg'),
(116, 26, '593d0ebb-0dac-4e53-b129-eeb116ef319c_20221029_CP05KFIrZT888wM1IBifY9ca.jpg'),
(117, 26, '2546ebbd-25ca-4ada-8cb0-c494b142e662_20221029_DYYKg8IMmANoJwUfKBqICDKQ.jpg'),
(118, 26, 'f1cb893f-298a-4eac-b211-f960096463c3_20221110_i9R0BnTf5sWS0LHf6MvdpJmI.jpg'),
(119, 26, '5663e0e0-bf03-468a-870e-2670f313b16b_20221110_k9tHrEqfn7dayBXlQXbGiJz7.jpg'),
(120, 26, '0d9a8267-74d5-47ab-8705-3bc95f076eae_20210421_el4PczkM1KBhBTywLu48XNV3.jpg'),
(121, 27, '0cec6982-1f2f-4a03-9a77-ddfdeb9c2a77_20210421_el4PczkM1KBhBTywLu48XNV3.jpg'),
(122, 27, '1e2af933-3e6d-44a1-9d1a-23d292eef987_20220702_1OTf4IIsDBy1Qyy4LAFZB5W5.jpg'),
(123, 27, '0f43b57b-0398-4512-b7c8-5a7e46c29b0b_20221029_CP05KFIrZT888wM1IBifY9ca.jpg'),
(124, 27, 'b614d4ff-9da6-4e17-b0ea-5b23f3a1903f_20221029_DYYKg8IMmANoJwUfKBqICDKQ.jpg'),
(125, 27, '7ea82294-5bb6-4b2a-8006-a7274b832a38_20221110_i9R0BnTf5sWS0LHf6MvdpJmI.jpg'),
(126, 27, '4e547b2a-6051-4081-bd46-19c0a239520f_20210421_el4PczkM1KBhBTywLu48XNV3.jpg'),
(127, 28, '37f1def8-23d1-49a7-8d16-4eac1aba3b5b_20210421_el4PczkM1KBhBTywLu48XNV3.jpg'),
(128, 28, 'f23ddcf5-1045-4fbd-aca8-fb6ae3a031d4_20220125_Pkjuwik57lGf3Ehwhlvcll9B.jpg'),
(129, 28, '4824ae98-ec12-4277-898d-15eb0dafd9a9_20220702_1OTf4IIsDBy1Qyy4LAFZB5W5.jpg'),
(130, 28, '01105f16-a43f-4c85-bf77-4a784f1dce93_20221029_DYYKg8IMmANoJwUfKBqICDKQ.jpg'),
(131, 28, '18df8044-c30a-440d-a9f0-8552f505cf5e_20221110_i9R0BnTf5sWS0LHf6MvdpJmI.jpg'),
(132, 29, '81769056-36ae-4934-a372-a285096cbee0_20220627_8xBEi4DEQgerKNL1bJrc2Su0.jpg'),
(133, 29, 'c6a681c7-dd84-48e3-aea0-3e8ea3170b1a_20220627_bsUB74eLXin42ZcUBlIrKx21.jpg'),
(134, 29, '6b816ec0-b120-461f-96de-ce2bfc4c1210_20220627_IuvCiDZsy2R4cszzsS21z7N8.jpg'),
(135, 29, '9bdc1401-ff43-4b20-9ab9-955eef7358fd_20220627_pUWs9ah9T1qnVuAtvJb8cNc7.jpg'),
(136, 29, '671aaa86-5dd1-4aa4-a00f-d9f660581dd5_20220627_Ui7taeJPtdlJ9zEsBIFRW028.jpg'),
(137, 29, '6b6c10a3-570b-4013-954e-550f730bb16b_20220125_s862BRvjtz8p3OAn5OzTNrWu.jpg'),
(138, 30, '6b235054-b738-4982-af97-eba7c564f7ce_20220125_s862BRvjtz8p3OAn5OzTNrWu.jpg'),
(139, 30, '48e94a98-b526-49cf-a2bf-b201ef879f96_20220627_8xBEi4DEQgerKNL1bJrc2Su0.jpg'),
(140, 30, '4b5f46b8-0601-4049-88a9-4706ca20c456_20220627_bsUB74eLXin42ZcUBlIrKx21.jpg'),
(141, 30, '921ae1d2-4004-4fda-99fd-a752215bd200_20220627_pUWs9ah9T1qnVuAtvJb8cNc7.jpg'),
(142, 30, '2c6c95f3-469d-4d79-8ede-79f490f28da1_20220627_W1n1yzBErzbK6MmRtpRIvcIz.jpg'),
(143, 31, '1bf65224-e481-42e1-8a59-1f447c3ae2aa_20220125_P3WP5rn9wwkvHlbf62ZCA4PA.jpg'),
(144, 31, 'b0206c2a-e2dd-4866-aa45-d2370cf0a1eb_20220627_8xBEi4DEQgerKNL1bJrc2Su0.jpg'),
(145, 31, 'd58fe103-50c8-426c-b668-5cf7a6ba5ca1_20220627_IuvCiDZsy2R4cszzsS21z7N8.jpg'),
(146, 31, 'ba2b784d-0c7f-4022-8da3-e68bfd137723_20220627_pUWs9ah9T1qnVuAtvJb8cNc7.jpg'),
(147, 31, '799fe384-cda0-4231-87a1-f85b6f3d51e1_20220627_Ui7taeJPtdlJ9zEsBIFRW028.jpg'),
(148, 31, '180717c7-aca3-4f4b-8a6c-77a6dcb8ad95_20220125_s862BRvjtz8p3OAn5OzTNrWu.jpg'),
(149, 32, '8284da0d-598e-48f2-807d-6119abbb556f_20220125_P3WP5rn9wwkvHlbf62ZCA4PA.jpg'),
(150, 32, 'a53af006-a338-494d-bc70-a15378030fdc_20220125_QUJ17BoZMlVD9MzoROitcDeY.jpg'),
(151, 32, '337a117d-4c29-48f7-8775-4a168995f392_20220627_8xBEi4DEQgerKNL1bJrc2Su0.jpg'),
(152, 32, '54568c66-543d-4813-b106-64c5f411782f_20220627_bsUB74eLXin42ZcUBlIrKx21.jpg'),
(153, 32, '43d883af-9518-4b15-8d35-48f01d35b109_20220627_W1n1yzBErzbK6MmRtpRIvcIz.jpg'),
(154, 33, '27712e0d-c514-4f17-9ea1-1c1a97dbaa24_20211227_070r57Bj1Fqc2Z0y7L6fMIvj.jpg'),
(155, 33, 'a5bb1bca-5286-45cf-925f-ad76059e1ad8_20220125_P3WP5rn9wwkvHlbf62ZCA4PA.jpg'),
(156, 33, '0799ad3c-3e50-4738-b062-c615185cc7cb_20220125_QUJ17BoZMlVD9MzoROitcDeY.jpg'),
(157, 33, 'cf20443a-f436-4e5d-b6c9-2b635ef7757a_20220125_s862BRvjtz8p3OAn5OzTNrWu.jpg'),
(158, 33, '429ff12e-03c2-4304-82f3-90b736d85597_20220627_IuvCiDZsy2R4cszzsS21z7N8.jpg'),
(159, 34, 'cd1925e9-6e83-4b21-83e5-2f74ee251891_20220125_P3WP5rn9wwkvHlbf62ZCA4PA.jpg'),
(160, 34, '3d8b484c-9c3c-4ca3-b022-77b61b5cf377_20220125_s862BRvjtz8p3OAn5OzTNrWu.jpg'),
(161, 34, 'ee9724de-492a-441a-91ab-7683b856356f_20220627_8xBEi4DEQgerKNL1bJrc2Su0.jpg'),
(162, 34, '0fef77ca-b0c2-4938-9908-6a7802070ad1_20220627_RT6uvG4aQG7fIEeMRQozZpPj.jpg'),
(163, 35, '8ef4f9c8-b413-48d5-9e5b-9f4af5f96a2b_20230429_aJ2PsQ3WTq.jpeg'),
(164, 35, '45c4409c-e8b6-4bc9-a365-c63cce508f97_20230429_CcU5dABSUg.jpeg'),
(165, 35, '1b4e2c8f-22a2-400c-a1d9-54e9b544d2ff_20230429_GDmUoZ10U6.jpeg'),
(166, 35, '329762a0-2b62-45b1-bfcd-578f6b8ca188_20230429_hZ7R4Ytvze.jpeg'),
(167, 35, 'aedd42a9-df67-4a49-8a7a-5cc50f85e1a0_20230429_Xrftvvimz5.jpeg'),
(168, 36, '7db10f1e-2c26-4177-9977-09fa930251ee_20230429_aJ2PsQ3WTq.jpeg'),
(169, 36, 'c173121e-4986-4397-81d6-74529247809e_20230429_CcU5dABSUg.jpeg'),
(170, 36, '0224f58c-4e94-427a-b5dc-f9d17706530f_20230429_GDmUoZ10U6.jpeg'),
(171, 36, '520e7d16-7cfc-4c79-ae7f-95f1454d3a7c_20230429_hZ7R4Ytvze.jpeg'),
(172, 36, '310f64b6-7c1b-44d0-91a0-6e05a0c3442b_20230429_Xrftvvimz5.jpeg'),
(173, 37, '1ce0c25c-f60e-498c-845a-81c36f0c3bf7_20220625_2pFrd1U5knfqLL0TaSkDQyKU.jpg'),
(174, 37, '85dbb2a3-c5b8-4614-a8b4-49c989987697_20230429_aJ2PsQ3WTq.jpeg'),
(175, 37, '49934c3e-365d-4fb8-a3d3-4ee3439ad3aa_20230429_CcU5dABSUg.jpeg'),
(176, 37, 'cbc709cb-be43-4da6-96c4-4af1ea3b7ea1_20230429_GDmUoZ10U6.jpeg'),
(177, 37, '70c1fb46-422e-446c-9596-6a9da0972d32_20230429_hZ7R4Ytvze.jpeg'),
(178, 37, '3525daec-3b7d-40b7-8e23-e5facf690154_20220625_m7ia8wZGrUM6jKnKLwvhWUVO.jpg'),
(179, 39, '8959d1a1-2617-452c-aa9a-0b0c930dbad3_20220417_DyaGJgQ4PEWPzumIUso18CDg.jpg'),
(180, 39, '7537488f-18b3-4d3f-96a1-312be0202e56_20220625_2pFrd1U5knfqLL0TaSkDQyKU.jpg'),
(181, 39, '3c909ff9-5fe2-495e-ae55-531efcad3494_20220625_m7ia8wZGrUM6jKnKLwvhWUVO.jpg'),
(182, 39, '744b692e-549e-4161-8551-3eca25e7631f_20230429_GDmUoZ10U6.jpeg'),
(183, 39, 'ae019709-65d1-4d99-9201-9ff0703712c6_20230429_hZ7R4Ytvze.jpeg'),
(184, 40, '710f916e-d282-4e54-9111-37c3d69f43c2_20220403_ElRdsDaIl4Qavm49huuwfNbu.jpg'),
(185, 40, 'e77b531a-4625-4db0-a6e4-8ab351c7cbf6_20220417_DyaGJgQ4PEWPzumIUso18CDg.jpg'),
(186, 40, '99aacac2-2852-463c-92d3-7052ecf96395_20220419_0wST9w8AKxYZjsuuLIRQkzzI.jpg'),
(187, 40, 'ca4d41a2-141d-45ca-9f22-99d04dd223e5_20230429_CcU5dABSUg.jpeg'),
(188, 40, '805bda5c-ee73-44f2-adf6-442d87c8e0e1_20230429_hZ7R4Ytvze.jpeg'),
(189, 41, '7c04044d-dc43-4d55-a3e3-d7d436a181c9_20210414_1wkrk76bFLaGB7DZirQXVW3b.jpg'),
(190, 41, '931844b6-27c3-4fbb-a77a-0814c39f6883_20220625_2pFrd1U5knfqLL0TaSkDQyKU.jpg'),
(191, 41, '1fd8ace2-5085-449d-aedf-bd7e3edf6091_20220625_m7ia8wZGrUM6jKnKLwvhWUVO.jpg'),
(192, 41, 'f20a1862-2d05-437e-bc6e-e498bbbf2261_20230429_aJ2PsQ3WTq.jpeg'),
(193, 41, '59aaddf4-f9b5-4f0f-af7f-8c113d63cdc4_20230429_CcU5dABSUg.jpeg'),
(194, 41, '2bed3841-635e-4753-9297-9421e7e4e71e_20220403_ElRdsDaIl4Qavm49huuwfNbu.jpg'),
(195, 42, 'e252bfae-20df-4039-a4a4-dd5dd44c7c4c_20220403_ElRdsDaIl4Qavm49huuwfNbu.jpg'),
(196, 42, '6682c7b6-81f1-4a70-bd56-415649af0e3b_20220625_2pFrd1U5knfqLL0TaSkDQyKU.jpg'),
(197, 42, '71d7056f-b2a7-4be3-86a4-351f6a9fa803_20230429_hZ7R4Ytvze.jpeg'),
(198, 42, '1fde1fc8-23e5-4619-8aa4-4bc4f84e1335_20230429_VSa64aQnV9.jpeg'),
(199, 42, '56f55058-37ad-4047-96f1-adac4b6716bd_20230429_Xrftvvimz5.jpeg'),
(200, 42, '66d65ad1-7b37-4fdf-b87e-1553a9e43609_20220417_DyaGJgQ4PEWPzumIUso18CDg.jpg'),
(201, 43, 'd0b88536-c3a3-4ad2-924b-d89db77e909d_20220417_DyaGJgQ4PEWPzumIUso18CDg.jpg'),
(202, 43, 'd2cd6204-1805-4d00-9804-1239e3f0fde5_20220625_2pFrd1U5knfqLL0TaSkDQyKU.jpg'),
(203, 43, 'f249663d-813f-4d57-a6c4-dad19026b749_20230429_CcU5dABSUg.jpeg'),
(204, 43, '1a99671a-7988-4530-8686-3188b499840b_20230429_GDmUoZ10U6.jpeg'),
(205, 43, '66b1b7e7-2a7a-49d0-bc8d-c24bd70b1834_20230429_hZ7R4Ytvze.jpeg'),
(211, 38, 'efc86512-4c78-4717-9eb7-655833871315_20220625_2pFrd1U5knfqLL0TaSkDQyKU.jpg'),
(212, 38, '67e65adc-7537-4073-bc34-0a5bc317c971_20220706_74vgDbjmmNxzZ6PpEQ8jQtnt.jpg'),
(213, 38, '6285daab-7b23-4db4-af8b-b99e57d221bd_20230429_hZ7R4Ytvze.jpeg'),
(214, 38, '40b0441a-9c31-4232-8203-45a717d711af_20230429_VSa64aQnV9.jpeg'),
(215, 38, 'ba91fc01-2862-4c8a-b1c5-aa9ecaeed127_20230429_Xrftvvimz5.jpeg'),
(216, 1, '44f4824e-0c3a-4046-8ec0-172420a68e74_0ea39cc9-6845-4f6f-8963-95aab2b216d2_20240731_9KvHhwZpZD.jpeg'),
(217, 2, '4245f326-58bb-427d-afaf-249cb0931335_0ea39cc9-6845-4f6f-8963-95aab2b216d2_20240731_9KvHhwZpZD.jpeg'),
(218, 2, 'e77cb0b9-7249-4d9e-9750-3e2c20f0d2fe_0ea39cc9-6845-4f6f-8963-95aab2b216d2_20240731_9KvHhwZpZD.jpeg'),
(219, 3, '4646ac92-6d99-4c6c-8b9a-ee095fba101e_0ea39cc9-6845-4f6f-8963-95aab2b216d2_20240731_9KvHhwZpZD.jpeg'),
(220, 3, 'a7728056-57fe-4e1e-915d-045a1b5fd588_0ea39cc9-6845-4f6f-8963-95aab2b216d2_20240731_9KvHhwZpZD.jpeg'),
(221, 4, '9a2b120e-4679-4086-8b30-83637159dca8_0ea39cc9-6845-4f6f-8963-95aab2b216d2_20240731_9KvHhwZpZD.jpeg'),
(222, 6, '06207110-1581-48c8-a673-5df092391b99_0ea39cc9-6845-4f6f-8963-95aab2b216d2_20240731_9KvHhwZpZD.jpeg'),
(223, 7, '39f61032-1d61-4dbb-8818-5bab9d6c8f6f_0ea39cc9-6845-4f6f-8963-95aab2b216d2_20240731_9KvHhwZpZD.jpeg'),
(224, 10, '56106db6-bed3-491b-a4fc-5e40165e3b3c_0ea39cc9-6845-4f6f-8963-95aab2b216d2_20240731_9KvHhwZpZD.jpeg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'user'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `social_accounts`
--

CREATE TABLE `social_accounts` (
  `id` int(11) NOT NULL,
  `provider` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Tên nhà social network',
  `provider_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Email tài khoản',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Tên người dùng',
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) DEFAULT '',
  `phone_number` varchar(15) DEFAULT NULL,
  `address` varchar(200) DEFAULT '',
  `password` char(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `date_of_birth` date DEFAULT NULL,
  `facebook_account_id` int(11) DEFAULT 0,
  `google_account_id` int(11) DEFAULT 0,
  `role_id` int(11) DEFAULT 1,
  `email` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `fullname`, `phone_number`, `address`, `password`, `created_at`, `updated_at`, `is_active`, `date_of_birth`, `facebook_account_id`, `google_account_id`, `role_id`, `email`) VALUES
(2, 'Nguyễn Văn A', '012456878', 'Nhà a ngõ b', '$2a$10$WdSf5UuyxQMAHcO502qXredzcc8OZQo4XQZNp3UxeT6/bKbuJx/6y', '2023-08-03 05:36:11', '2023-08-03 05:36:11', 1, '1999-10-25', 0, 0, 2, ''),
(3, 'Tài khoản admin 1', '11223344', 'Admin ', '$2a$10$JFQT3HeFUKDl7c/l.iNFAeybFr7Wi3krwgVVR7ieif.2De5p9LGAG', '2023-08-06 00:34:35', '2023-08-06 00:34:35', 1, '1993-10-25', 0, 0, 2, ''),
(5, 'Nguyễn Văn test ', '33445566', 'Nhà a ngõ b 11', '$2a$10$W5KFERtqHoTCmp4WDs8x1.I73j81pW0FSeJ/ZqcVvu.QS0sLTcSdy', '2023-08-08 03:02:48', '2024-08-21 09:33:48', 1, '2000-10-23', 2, 3, 1, ''),
(7, 'Nguyen Van Y', '123456789', 'Đây là user', '$2a$10$oZwu2RA2iiNVIaQZgdi7bueKc5YNWr39yu.gXdsavBzo5AOb1kP5e', '2023-11-16 00:52:29', '2023-11-16 00:52:29', 1, '2000-10-25', 0, 0, 1, ''),
(8, 'Nguyen Duc Hoang', '0964896239', 'Bach mai, hanoi, vietnam', '$2a$10$cGkVz4/65tDn2M33Gx3GYOC3DKrRni4SK/m1So0rpIXQFiG/ltM5G', '2023-12-09 08:27:38', '2023-12-09 08:27:38', 1, '1979-10-25', 0, 0, 1, ''),
(13, 'Nguyen Duc Thang', '0866550634', 'ha noi', '$2a$10$faWTvyu774osz3SHctEG9egg.YxubYisuj2ZIaUFTwuE2RaJyYtae', '2024-08-21 13:34:13', '2024-08-21 13:34:13', 1, '2003-12-11', 0, 0, 1, '');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fk_orders_coupon` (`coupon_id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `fk_order_details_coupon` (`coupon_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_images_product_id` (`product_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `social_accounts`
--
ALTER TABLE `social_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT cho bảng `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=248;

--
-- AUTO_INCREMENT cho bảng `social_accounts`
--
ALTER TABLE `social_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_coupon` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`),
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `fk_order_details_coupon` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`),
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Các ràng buộc cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `fk_product_images_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `social_accounts`
--
ALTER TABLE `social_accounts`
  ADD CONSTRAINT `social_accounts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
