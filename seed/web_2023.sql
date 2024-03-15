-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web_2023`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart_item`
--

CREATE TABLE `cart_item` (
  `id` bigint(20) NOT NULL,
  `quantity` bigint(20) NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `size_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_category_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `parent_category_id`) VALUES
(1, 'Áo Sơ Mi', 77),
(2, 'Áo Sơ Mi', 99),
(3, 'Quần', 77),
(4, 'Quần', 99),
(5, 'Áo Nỉ', 77),
(6, 'Áo Nỉ', 99),
(7, 'Áo Thun', 77),
(8, 'Áo Thun', 99),
(9, 'Đầm, Váy', 99),
(10, 'Áo Phao', 77),
(11, 'Áo Phao', 99),
(12, 'Áo Len', 77),
(13, 'Áo Len', 99),
(14, 'Đồ Lót', 77),
(15, 'Đồ Lót', 99),
(16, 'Áo Thun Trẻ Em (Nam)', 100),
(17, 'Áo Thun Trẻ Em (Nữ)', 100),
(18, 'Đầm Trẻ Em', 100),
(19, 'Quần Trẻ Em ', 100),
(20, 'Áo Khoác (Nam)', 100),
(21, 'Áo Khoác (Nữ)', 100),
(22, 'Áo Nỉ', 100),
(23, 'Áo Khoác', 77),
(24, 'Áo Khoác', 99),
(77, 'Nam', NULL),
(99, 'Nữ', NULL),
(100, 'Trẻ Em', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

CREATE TABLE `color` (
  `id` bigint(20) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `color`
--

INSERT INTO `color` (`id`, `image`, `name`) VALUES
(1, 'https://www.icolorpalette.com/download/solidcolorimage/212322_solid_color_background_icolorpalette.png', 'black'),
(2, 'https://www.icolorpalette.com/download/solidcolorimage/f4f5f0_solid_color_background_icolorpalette.png', 'bright white'),
(3, 'https://www.tridentpowders.com/cdn/shop/products/Pantone-348-C_2500x.png?v=1608137950', 'green'),
(4, 'https://www.icolorpalette.com/download/solidcolorimage/4e3629_solid_color_background_icolorpalette.png', 'brown'),
(5, 'https://www.icolorpalette.com/download/solidcolorimage/cb333b_solid_color_background_icolorpalette.png', 'red'),
(6, 'https://www.icolorpalette.com/download/solidcolorimage/62b5e5_solid_color_background_icolorpalette.png', 'blue'),
(7, 'https://www.icolorpalette.com/download/solidcolorimage/fe5000_solid_color_background_icolorpalette.png', 'orange'),
(8, 'https://images.myperfectcolor.com/repositories/images/colors/pantone-pms-102-c-paint-color-match-2.jpg', 'yellow'),
(9, 'https://www.icolorpalette.com/download/solidcolorimage/a20067_solid_color_background_icolorpalette.png', 'purple'),
(10, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSMcOtXVWkwd5kkEvyIXrVMyEaYDdkvew8U9Xl4a3bIQ&s', 'pink'),
(11, 'https://www.icolorpalette.com/download/solidcolorimage/c1c6c8_solid_color_background_icolorpalette.png', 'gray');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `total` bigint(20) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `status_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` bigint(20) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `size_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `description`, `name`) VALUES
(1, '', 'Giao dịch thành công'),
(2, '', 'Giao dịch thất bại');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` bigint(20) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `instruction` varchar(1000) NOT NULL,
  `materials` varchar(1000) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` bigint(20) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `color_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `description`, `image`, `instrucart_itemcart_itemcart_itemction`, `materials`, `name`, `price`, `category_id`, `color_id`) VALUES
(2, 'Áo nỉ cổ tròn, dài tay. Phối dây khác màu tạo họa tiết hình cô gái ở phía trước. Bo viền bằng vải gân.', 'https://static.zara.net/photos///2023/I/0/1/p/0085/629/800/2/w/750/0085629800_6_1_1.jpg?ts=1695649108942', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\nVẢI CHÍNH\r\n61% vải cotton\r\n39% vải pôliexte\r\nVẢI PHỤ\r\n97% vải cotton\r\n3% elastane', 'ÁO NỈ THÊU DÂY TẠO HÌNH CÔ GÁI', 999000, 6, 1),
(3, '- Chất liệu vải rayon-cotton mềm mại.\r\n- Phù hợp mặc thường xuyên.\r\n- Chiếc áo sơ mi cổ trụ đa năng này dễ dàng mặc vào hoặc cởi ra.', 'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/446999/item/goods_00_446999.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ.', '53% Modal, 47% Bông.', 'Áo Sơ Mi Vải Cotton Modal Cổ Trụ Ngắn Tay', 588000, 1, 2),
(4, '- Khóa kéo trước cùng màu với vải giúp tạo kiểu dễ dàng hơn.\r\n- Vải với độ co giãn đáng kinh ngạc giúp vận động dễ dàng.\r\n- Mềm mại và thoải mái.\r\n- Với công nghệ DRY.', 'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/450693/item/goods_03_450693.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, Không giặt khô', 'Thân: Lớp Lót Mũ Trùm: 48% Bông, 47% Polyeste, 5% Elastan/ Bo: 80% Bông, 20% Polyeste/ Vải Túi: Lớp Ngoài: 100% Polyeste/ Lớp Trong: 48% Bông, 47% Polyeste, 5% Elastan.', 'Áo Khoác Nỉ Siêu Co Giãn Dry Có Mũ Kéo Khóa Dài Tay', 489000, 5, 11),
(5, '- Chất liệu mềm mượt mát lạnh khi chạm vào và Độ co giãn tuyệt vời mang đến sự thoải mái mọi lúc.\r\n- vải mắt lưới thoáng khí.\r\n- Được làm bằng vải siêu co giãn.\r\n- Công nghệ DRY khô nhanh.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/454318/item/vngoods_09_454318.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, Không giặt khô, Không sấy khô', '86% Nylon, 14% Elastan', 'AIRism Áo Ba Lỗ Vải Mắt Lưới Khử Mùi', 244000, 7, 1),
(6, '- Miếng đệm chống trượt giúp cố định những chiếc tất này.\r\n- Công nghệ BLUE CYCLE JEANS giúp giảm lượng nước* sử dụng trong quá trình sản xuất. Mức độ tiết kiệm nước sẽ có sự chênh lệch giữa các sản phẩm.', 'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/450617/item/goods_67_450617.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, không giặt khô.', 'Thân: 89% Bông, 6% Polyeste, 5% Elastan/ Đồ Phụ Tùng: 53% Bông, 37% Nylon, 10% Elastan.', 'Quần Jean Bầu Siêu Co Giãn', 980000, 4, 6),
(7, '- Từ phản hồi của khách hàng, chúng tôi đã phân loại các kích thước áo ngực để cải thiện độ vừa vặn.\r\n- Cấu trúc 3 chiều nguyên bản của UNIQLO phù hợp với mọi dáng người.\r\n- Đường viền cổ phẳng.', 'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/450440/item/goods_09_450440.jpg?width=750', 'Giặt tay nước lạnh, Không giặt khô', 'Thân: 85% Nylon, 15% Elastan/ Cúp Áo ( Lớp Lót Trong ): 100% Polyeste', 'Áo Ngực Không Gọng (3D Hold)', 489000, 15, 1),
(8, '- Mẫu áo ngực không gọng được thiết kế để thư giãn.\r\n- Viền không đường may, phẳng ở cổ, cánh tay và đường viền dưới ngực để tạo cảm giác thoải mái.\r\n- Cúp ngực có thể tháo rời.', 'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/450442/item/goods_09_450442.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, Không giặt khô', 'Thân: Lớp Lót: 71% Nylon, 29% Elastan', 'Áo Ngực Không Gọng (Ultra Relax)', 489000, 15, 1),
(9, '- Thiết kế đẹp mắt, cảm giác mượt mà.\r\n- Giữ nguyên dáng áo sau khi giặt.\r\n- Một chiếc áo thun oversized với tay áo dài đến một nửa.\r\n- Sọc rộng 2 tông màu cơ bản.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/455414/item/vngoods_44_455414.jpg?width=750', 'Giặt máy nước lạnh, giặt khô, không sấy khô.', '100% Bông.', 'Áo Thun Dáng Rộng Kẻ Sọc Tay Lỡ', 391000, 7, 8),
(10, '- Chất vải siêu co dãn. \r\n- Tầng trung. \r\n- Thiết kế thời trang với các nút, đường khâu và kích thước túi sau được cân nhắc kỹ lưỡng.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/456191/item/vngoods_01_456191.jpg?width=750', 'Giặt máy nước lạnh, giặt khô, không sấy khô.', '50% Bông, 35% Polyeste, 11% Visco, 4% Elastan.', 'Quần Legging Siêu Co Giãn', 588000, 4, 2),
(11, '- Thiết kế thời trang với các nút, đường khâu và kích thước túi sau được cân nhắc kỹ lưỡng. \r\n- Thắt lưng co giãn hoàn toàn. \r\n- Với vòng đai.', 'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/456213/item/goods_65_456213.jpg?width=750', 'Giặt máy nước lạnh, không giặt khô, không sấy khô.', '51% Bông, 35% Polyeste, 11% Visco, 3% Elastan.', 'Quần Legging Denim Siêu Co Giãn', 588000, 4, 6),
(12, '- Thiết kế theo phong cách tay đua với đường gân cải tiến ở nách áo mang lại vẻ ngoài bóng bẩy hơn. \r\n- Hình dáng vai tạo vẻ ngoài dễ dàng. \r\n- Vải có gân hẹp mờ đục.', 'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/457479/item/goods_27_457479.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, Không giặt khô, Không sấy khô', 'Vải Chính: 97% Bông, 3% Elastan/ Lớp Lót: 95% Bông, 5% Elastan/ Cúp Áo ( Lớp Lót Trong ): 100% Polyeste', 'Áo Bra Lửng Không Tay', 293000, 15, 7),
(13, '- Chất vải pha rayon mềm mịn.\r\n- Chống nhăn để dễ bảo quản. *Định hình lại áo sau khi giặt.\r\n-Thiết kế tay áo và kiểu dáng thoải mái.\r\n- Họa tiết chấm bi.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/457638/item/vngoods_35_457638.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, giặt khô, không sấy khô.', '100% Visco.', 'Áo Kiểu Vải Rayon In Họa Tiết Ngắn Tay\r\n', 489000, 2, 4),
(14, '- Vải slub mềm mại với cảm giác nhẹ nhàng, giản dị.\r\n- Dáng vừa vặn thoải mái và đường cắt xếp tầng đáng yêu.\r\n-Thiết kế không tay thoáng mát.\r\n- Khuy cài phía trước kiểu dáng hiện đại.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/458233/item/vngoods_56_458233.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, giặt khô, không sấy khô.', '100% Bông.', 'Đầm Không Tay Vải Slub Cotton', 784000, 9, 8),
(15, '- Chất liệu vải satin siêu co giãn.\r\n- Các sợi mịn hơn tạo ra kết cấu bóng bẩy.\r\n- Vừa vặn thoải mái.\r\n- Lưng thun co giãn với kiểu dáng đẹp.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/455471/item/vngoods_09_455471.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, giặt khô, không sấy khô.', 'Thân: 97% Bông, 3% Elastan/ Vải Túi: 65% Polyeste, 35% Bông.', 'Quần Jean Siêu Co Giãn Nhiều Màu', 784000, 3, 1),
(16, '- Tận hưởng vẻ ngoài và cảm giác của denim đích thực.\r\n- Đường cắt suông thẳng từ đầu gối đến gấu quần.\r\n- Các chi tiết được thiết kế tỉ mỉ, chẳng hạn như nút, đinh tán và màu sắc đường chỉ.\r\n- Túi trước cao hơn và túi sau có góc cạnh để tạo hiệu ứng tôn dáng.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/459688/item/vngoods_65_459688.jpg?width=750', 'Giặt máy nước lạnh, không giặt khô, không sấy khô.', 'Thân: 98% Bông, 2% Elastan/ Vải Túi: 65% Polyeste, 35% Bông.', 'Quần Jeans Dáng Slim Fit', 980000, 3, 6),
(17, '- Dáng suông rộng, phom suông dễ mặc, độ rộng vừa phải.\r\n- Được làm bằng vải denim cotton, đồng phát triển với Kaihara.\r\n- Đường may xắn gấu theo phong cách Work-wear và thiết kết túi trước đặt trên đường chéo.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/459690/item/vngoods_64_459690.jpg?width=750', 'Giặt máy nước lạnh, không giặt khô, không sấy khô.', 'Thân: 100% Bông/ Vải Túi: 65% Polyeste, 35% Bông.', 'Quần Jeans Ống Rộng', 980000, 3, 6),
(18, '- Cải tiến với đường may bản nhỏ hơn từ phần eo đến đầu gối giúp bạn có một cái nhìn thanh lịch.\r\n- Chất liệu denim siêu co giãn kết hợp cho bạn cảm giác mềm mại từ chất liệu vải nỉ.\r\n- Giờ đây bạn sẽ thoải mái hơn với lớp lót mềm mịn.\r\n- Hoàn hảo để thư giãn tại nhà hoặc mặc đi chơi.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/455476/item/vngoods_09_455476.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, không giặt khô, không sấy khô.', 'Thân: 70% Bông, 20% Polyeste, 9% Lyocell, 1% Elastan/ Vải Túi: 65% Polyeste, 35% Bông.', 'EZY Quần Jean Siêu Co Giãn', 980000, 3, 1),
(19, '- Vải thun cotton. \r\n- Đường cắt hơi rộng, vừa vặn thoải mái. \r\n- Giặt trước và nhuộm quần áo để tạo nên phong cách ‘UNIQLO U’ tinh túy.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/459693/sub/vngoods_459693_sub8.jpg?width=750', 'Giặt máy nước lạnh, không giặt khô, không sấy khô.', 'Thân: 100% Bông/ Vải Túi: 65% Polyeste, 35% Bông [34 BROWN, 36 BROWN] Thân: 100% Bông/ Vải Túi: 100% Bông.', 'Quần Jeans Dáng Relax Fit', 980000, 3, 1),
(20, '- Chất liệu cotton bên ngoài cho vẻ ngoài giản dị.\r\n- Lớp lót polyester êm ái.\r\n- Chất liệu vải siêu co giãn mang lại cảm giác thoải mái và dễ dàng vận động.\r\n- Kết cấu sắc nét hoàn hảo nhưng vẫn mềm mại.\r\n- Với công nghệ DRY nhanh khô.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/460084/sub/vngoods_460084_sub7.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, Không giặt khô, Không sấy khô', 'Thân: Lớp Lót Mũ Trùm: 48% Polyeste, 46% Bông, 6% Elastan/ Bo: 78% Bông, 22% Polyeste/ Vải Túi: Lớp Ngoài: 100% Polyeste/ Vải Túi: Lớp Trong: 48% Polyeste, 46% Bông, 6% Elastan.', 'Áo Khoác Nỉ Có Mũ Dry Siêu Co Giãn Kéo Khóa Dài Tay', 489000, 20, 11),
(21, '- Vải siêu co giãn giúp cử động dễ dàng và tạo cảm giác mềm mại.\r\n- Dáng suông rũ phần vai.\r\n- Một chiếc áo nỉ cổ điển cho phong cách linh hoạt.\r\n- Viền và cổ tay có gân.\r\n- Thiết kế theo chủ đề thể thao đại học tạo điểm nhấn cho trang phục.', 'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/450694/item/goods_15_450694.jpg?width=750', 'Giặt máy nước lạnh, Không giặt khô', 'Thân: 96% Bông, 4% Elastan/ Bo: 74% Bông, 26% Polyeste.', 'Áo Nỉ Siêu Co Giãn Dài Tay', 399000, 22, 5),
(22, '- 100% cotton siêu co giãn mềm mại trên da và cho phép cử động dễ dàng.\r\n- Siêu mềm mại và thoải mái.\r\n- Đường may phía sau cổ áo có băng dính, tránh bị cọ xát để tạo sự thoải mái.\r\n- Đường cắt được cải tiến để dễ dàng di chuyển.\r\n- Thiết kế rũ phần vai.\r\n- Thiết kế cổ điển.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/460086/item/vngoods_02_460086.jpg?width=750', 'Giặt máy nước lạnh, Không giặt khô, Không sấy khô', 'Thân: 96% Bông, 4% Elastan/ Bo: 74% Bông, 26% Polyeste.', 'Áo Nỉ Siêu Co Giãn Dài Tay', 489000, 22, 2),
(23, '- 100% cotton siêu co giãn mềm mại trên da và cho phép cử động dễ dàng.\r\n- Siêu mềm mại và thoải mái.\r\n- Đường may phía sau cổ áo có băng dính, tránh bị cọ xát để tạo sự thoải mái.\r\n- Đường cắt được cải tiến để dễ dàng di chuyển.\r\n- Thiết kế rũ phần vai.\r\n- Thiết kế cổ điển.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/460087/item/vngoods_13_460087.jpg?width=750', 'Giặt máy nước lạnh, Không giặt khô, Không sấy khô.', 'Thân: 96% Bông, 4% Elastan/ Bo: 74% Bông, 26% Polyeste.', 'Áo Nỉ Siêu Co Giãn Dài Tay', 489000, 22, 5),
(24, '- 100% cotton siêu co giãn mềm mại trên da và cho phép cử động dễ dàng.\r\n- Siêu mềm mại và thoải mái.\r\n- Đường may phía sau cổ áo có băng dính, tránh bị cọ xát để tạo sự thoải mái.\r\n- Đường cắt được cải tiến để dễ dàng di chuyển.\r\n- Thiết kế rũ phần vai.\r\n- Thiết kế cổ điển.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/460088/item/vngoods_63_460088.jpg?width=750', 'Giặt máy nước lạnh, Không giặt khô, Không sấy khô.', 'Thân: 96% Bông, 4% Elastan/ Bo: 74% Bông, 26% Polyeste.', 'Áo Nỉ Siêu Co Giãn Dài Tay', 489000, 22, 6),
(25, '- Siêu mềm mại và thoải mái.\r\n- Đường may phía sau cổ áo có băng dính, tránh bị cọ xát để tạo sự thoải mái.\r\n- Đường cắt được cải tiến để dễ dàng di chuyển.\r\n- Thiết kế rũ phần vai.\r\n- Thiết kế cổ điển.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/460089/item/vngoods_55_460089.jpg?width=750', 'Giặt máy nước lạnh, Không giặt khô, Không sấy khô.', 'Thân: 96% Bông, 4% Elastan/ Bo: 74% Bông, 26% Polyeste.', 'Áo Nỉ Siêu Co Giãn Dài Tay', 489000, 22, 3),
(26, '- Siêu mềm mại và thoải mái.\r\n- Đường may phía sau cổ áo có băng dính, tránh bị cọ xát để tạo sự thoải mái.\r\n- Đường cắt được cải tiến để dễ dàng di chuyển.\r\n- Thiết kế rũ phần vai.\r\n- Thiết kế cổ điển.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/460090/item/vngoods_69_460090.jpg?width=750', 'Giặt máy nước lạnh, Không giặt khô, Không sấy khô.', 'Thân: 96% Bông, 4% Elastan/ Bo: 74% Bông, 26% Polyeste.', 'Áo Nỉ Siêu Co Giãn Dài Tay', 489000, 22, 6),
(27, '- Kết cấu mềm mại cho sự thoải mái tuyệt vời.\r\n- Để điều chỉnh độ vừa vặn, hãy kéo dây thắt lưng đàn hồi qua lỗ đã được may sẵn và cố định nút ở vị trí mong muốn.\r\n- Quần jogger co giãn.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/460091/item/vngoods_55_460091.jpg?width=750', 'Giặt máy nước lạnh, Không giặt khô, Không sấy khô.', 'Thân: 96% Bông, 4% Elastan/ Bo: 74% Bông, 26% Polyeste/ Vải Túi: 100% Bông.', 'Quần Nỉ In Họa Tiết Siêu Co Giãn', 489000, 19, 3),
(28, '- Kết cấu mềm mại cho sự thoải mái tuyệt vời.\r\n- Để điều chỉnh độ vừa vặn, hãy kéo dây thắt lưng đàn hồi qua lỗ được may sẵn và cố định nút ở vị trí mong muốn.\r\n- Quần jogger co giãn.\r\n- Viền thun co giãn.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/460092/item/vngoods_13_460092.jpg?width=750', 'Giặt máy nước lạnh, Không giặt khô, Không sấy khô.', 'Thân: 96% Bông, 4% Elastan/ Bo: 74% Bông, 26% Polyeste/ Vải Túi: 100% Bông.', 'Quần Nỉ In Họa Tiết Siêu Co Giãn', 489000, 19, 10),
(29, '- Kết cấu mềm mại cho sự thoải mái tuyệt vời.\r\n- Để điều chỉnh độ vừa vặn, hãy kéo dây thắt lưng đàn hồi qua lỗ được may sẵn và cố định nút ở vị trí mong muốn.\r\n- Quần jogger co giãn.\r\n- Viền thun co giãn.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/460093/item/vngoods_02_460093.jpg?width=750', 'Giặt máy nước lạnh, Không giặt khô, Không sấy khô.', 'Thân: 96% Bông, 4% Elastan/ Bo: 74% Bông, 26% Polyeste/ Vải Túi: 100% Bông.', 'Quần Nỉ In Họa Tiết Siêu Co Giãn', 489000, 19, 2),
(30, '- Được làm bằng cotton co giãn.\r\n- Kiểu dáng ôm sát hông cạp trễ.\r\n- Được thiết kế để tạo sự thoải mái.', 'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/460127/item/goods_05_460127.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, Không giặt khô, Không sấy khô', 'Thân: 95% Bông, 5% Elastan/ Ren: Eo: 81% Nylon, 19% Elastan/ Cổ Chân: 76% Nylon, 24% Elastan\r\n', 'Quần Lót Dáng Hiphugger', 146000, 15, 2),
(31, '- Thiết kế không đường may ẩn dưới lớp áo bên ngoài.\r\n- Chất thun cotton mềm mại.\r\n- Vải \'AIRism\' mềm mịn.\r\n- Thiết kế cạp cao.', 'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/445394/item/goods_39_445394.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ', 'Thân: 71% Nylon, 29% Elastan/ Đũng Quần: 100% Bông', 'AIRism Quần Lót Không Đường May Cạp Cao', 146000, 15, 4),
(32, '- Thiết kế không đường may giúp ẩn dưới lớp áo tránh bị lộ.\r\n- Chất thun cotton mềm mịn.\r\n- Vải \'AIRism\' mềm mịn, nhanh khô.', 'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/460200/item/goods_31_460200.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, Không giặt khô, Không sấy khô', 'Thân: 71% Nylon, 29% Elastan/ Đũng Quần: 100% Bông', 'AIRism Quần Lót Không Đường May', 146000, 15, 10),
(33, '- Chất liệu vải mịn, cao cấp với độ rủ mềm mại.\r\n- Chất vải co giãn 2 chiều giúp vận động dễ dàng.\r\n- Dáng rộng vừa phải, cạp cao.\r\n- Thắt lưng đàn hồi ẩn cho kiểu dáng đẹp mắt.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/460311/item/vngoods_30_460311.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, giặt khô, không sấy khô.', 'Thân: 66% Polyeste, 28% Visco, 6% Elastan ( 66% Sử Dụng Sợi Polyeste Tái Chế )/ Vải Túi: 100% Polyeste ( 60% Sử Dụng Sợi Polyeste Tái Chế ).', 'Quần Xếp Ly Ống Rộng', 784000, 4, 2),
(34, '- Họa tiết kẻ sọc cơ bản.\r\n- Dáng rộng linh hoạt.\r\n- Dáng vai rũ tạo cảm giác thoải mái và cử động dễ dàng.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/460316/item/vngoods_55_460316.jpg?width=750', 'Giặt máy nước lạnh, giặt khô, không sấy khô.', 'Thân: 100% Bông/ Bo: 70% Bông, 30% Polyeste.', 'Áo Thun Vải Cotton Cổ Tròn Dài Tay', 489000, 7, 3),
(35, '- Đường cắt đẹp mắt.\r\n- Độ co giãn cao giúp dễ vận động.\r\n- Phần vai thiết kế rộng giúp bạn có thể phối nhiều lớp áo linh hoạt.\r\n- Những chiếc áo ấm áp với vẻ ngoài cao cấp.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/460327/item/vngoods_09_460327.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, không giặt khô, không sấy khô.', 'Thân: 67% Polyeste, 19% Acrylic, 14% Visco/ Bo: 58% Bông, 39% Polyeste, 3% Elastan/ Vải Túi: Lớp Ngoài: 100% Polyeste/ Lớp Trong: 67% Polyeste, 19% Acrylic, 14% Visco.', 'Áo Nỉ Có Mũ Lót Lông Kéo Khoá Dài Tay', 980000, 5, 1),
(36, '- Chất thun co giãn 2 chiều mặc thoải mái.\r\n- Cap vừa đa năng.\r\n- Thiết kế thời trang với các nút, đường khâu và kích thước túi sau được cân nhắc cẩn thận.\r\n- Lưng thun co giãn hoàn hảo.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/460537/item/vngoods_08_460537.jpg?width=750', 'Giặt máy nước lạnh, không giặt khô, không sấy khô.', '51% Bông, 35% Polyeste, 11% Visco, 3% Elastan ( 23% Sử Dụng Sợi Polyeste Tái Chế ).', 'Quần Legging Denim Siêu Co Giãn', 588000, 4, 1),
(37, '- Chất liệu viscose rayon với độ rũ đáng yêu.\r\n- Nổi bật với phần ôm phía trước và kiểu dáng loe vừa vặn đầy phong cách.\r\n- Thiết kế cổ sơ mi bồng bềnh.\r\n- Túi bên hông.\r\n- In hoa nhỏ.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/460581/item/vngoods_62_460581.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, giặt khô, không sấy khô.', '100% Visco.', 'Đầm Mini In Họa Tiết Cổ V Dài Tay', 784000, 9, 6),
(38, '- Được làm bằng sợi siêu mịn cho sự nhẹ nhàng đáng kinh ngạc.\r\n- Lông vũ cao cấp với chỉ số giữ nhiệt lên đến 750*. *Được đo bằng phương pháp IDFB\r\n- Được thiết kế đặc biệt mà không cần đóng gói cho trọng lượng cực nhẹ.\r\n- Lớp lót chống tĩnh.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/450310/item/vngoods_38_450310.jpg?width=750', 'Giặt tay nước lạnh, không giặt khô, không sấy khô.', 'Mặt Trước: 100% Nylon/ Lớp Độn: 90% Lông Tơ, 10% Lông Vũ/ Mặt Sau: 100% Nylon/ Vải Túi: 100% Polyeste.', 'Ultra Light Down Áo Khoác Siêu Nhẹ', 1668000, 11, 4),
(39, '- Chất liệu cotton-rayon mịn màng, thoải mái với độ rũ tinh tế.\r\n- Dáng suông, trễ vai nhẹ.\r\n- Túi trước ngực tiện dụng.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/460984/item/vngoods_28_460984.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, giặt khô, không sấy khô.', '53% Modal, 47% Bông.', 'Áo Sơ Mi Modal Cổ Mở Ngắn Tay', 686000, 1, 7),
(40, '- Vải rayon cho bạn một cảm giác mềm mịn.\r\n- Chống nhăn để dễ chăm sóc sau khi giặt. *Định hình áo sau khi giặt để phơi khô.\r\n- Thiết kế đa năng dễ phối đồ.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/433604/item/vngoods_00_433604.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ.', '76% Visco, 24% Polyeste.', 'Áo Vải Rayon Dài Tay', 489000, 2, 2),
(41, '- Mềm mại, nhẹ và không gây ngứa da.\r\n- Mềm mại đến mức bạn có cảm giác như đang được bao bọc bởi một lớp không khí.\r\n- Thiết kế phồng bao bọc cơ thể.\r\n- Vải dệt kim có họa tiết.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/451686/item/vngoods_08_451686.jpg?width=750', 'Giặt tay nước lạnh, giặt khô, không sấy khô.', '61% Acrylic, 30% Nylon, 9% Len.', 'Áo Cardigan Dệt 3D Vải Sợi Souffle', 784000, 13, 1),
(42, '- Vải nhung 100% cotton bóng, mịn.\r\n- Thiết kế cạp vừa, dáng suông thẳng rộng.\r\n- Có đường may nổi phía sau.\r\n- Túi ống ở phía sau bên phải.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/461105/item/vngoods_67_461105.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, giặt khô, không sấy khô.', 'Thân: 100% Bông/ Vải Túi: 65% Polyeste, 35% Bông.', 'Quần Dài Vải Nhung Ống Rộng', 980000, 4, 6),
(43, '- Được cập nhật với sợi siêu mịn cho cảm giác mượt mà hơn.\r\n- Loại vải khô cực nhanh Được phát triển sau nhiều năm nghiên cứu.\r\n- Những chiếc quần đa năng này phù hợp cho Những dịp thường ngày, Công sở hoặc thể thao.', 'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/461167/item/goods_09_461167.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, không giặt khô, không sấy khô.', 'Thân: 100% Polyeste ( 33% Sử Dụng Sợi Polyeste Tái Chế )/ Vải Túi: 100% Polyeste.', 'Dry-EX Quần Siêu Co Giãn Ống Ôm Dần', 686000, 4, 1),
(44, '- Quần jeans co giãn nhất của Uniqlo, từ trước đến nay, tự hào với tỷ lệ co giãn hơn 90% với sự thoải mái trong mọi dịp.\r\n- Dáng skinny đẹp mắt với viền ôm thon gọn.\r\n- Công nghệ laser sáng tạo và quá trình gia công tạo hiệu ứng sờn rách tự nhiên.', 'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/461284/item/goods_09_461284.jpg?width=750', 'Giặt máy nước lạnh, không giặt khô.', 'Thân: 90% Bông, 6% Polyeste, 4% Elastan/ Vải Túi: 65% Polyeste, 35% Bông.', 'Quần Jean Siêu Co Giãn', 980000, 3, 1),
(45, 'Lần hợp tác đầu tiên giữa Clare Waight Keller và UNIQLO cho ra mắt một bộ sưu tập LifeWear chất lượng cao với những trang phục thiết yếu hàng ngày dễ mặc nhưng đầy tinh tế.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/461361/item/vngoods_07_461361.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, không giặt khô, không sấy khô.', 'Mặt Trước: 100% Nylon/ Lớp Độn: 100% Polyeste/ Mặt Sau: Thân: 100% Polyeste/ Thân Trước: Thân Trên: 100% Nylon', 'PUFFTECH Áo Khoác Dáng Rộng', 2453000, 11, 1),
(46, '- Lớp đệm ấm, nhẹ và tiện dụng do UNIQLO và Toray đồng phát triển.\r\n- Thân dài cùng độ phồng phù hợp.\r\n- Kiểu dáng rộng.\r\n- Eo thắt lại nhờ dây rút.\r\n- Có thể cài nút ở cổ.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/461362/item/vngoods_01_461362.jpg?width=750', 'Giặt tay nước lạnh, không giặt khô, không sấy khô.', 'Mặt Trước: 100% Nylon/ Lớp Độn: 90% Lông Tơ, 10% Lông Vũ/ Mặt Sau: 100% Nylon/ Vải Túi: 100% Polyeste.', 'Áo Khoác Phao Nhẹ', 1962000, 11, 2),
(47, '- Chất liệu cotton 100% bền, đẹp mắt.\r\n- Sắc nét vừa phải, cảm giác mượt mà.\r\n- Một chiếc áo thun dáng rộng với tay áo dài.\r\n-Thiết kế kẻ sọc đáng yêu.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/461368/item/vngoods_18_461368.jpg?width=750', 'Giặt máy nước lạnh, giặt khô, không sấy khô.', '100% Bông.', 'Áo Thun Kẻ Sọc Cổ Tròn Tay Lỡ Dáng Rộng', 391000, 7, 5),
(48, '- Được chải xù bên trong để mang lại sự mềm mại và ấm áp.\r\n- Thoải mái vừa vặn.\r\n- Chất liệu mềm mại giúp dễ dàng mặc nhiều lớp.\r\n- Áo cổ lọ giúp giữ ấm cổ và tạo điểm nhấn phong cách.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/461529/item/vngoods_76_461529.jpg?width=750', 'Giặt máy nước lạnh, giặt khô, không sấy khô.', 'Thân: 100% Bông/ Bo: 75% Bông, 22% Polyeste, 3% Elastan.', 'Áo Nỉ Cổ Lọ Dài Tay', 784000, 5, 4),
(49, '- Được chải xù từ bên trong để tạo cảm giác mềm mại.\r\n- Độ dày hoàn hảo để tạo ra hình dáng mũ trùm đầu và kiểu dáng thời trang mang đầy phong cách.\r\n- Được làm bằng sợi heather giúp tôn lên độ sâu của màu sắc.\r\n- Kiểu dáng oversize dành cho phong cách unisex.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/461550/item/vngoods_35_461550.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, không giặt khô, không sấy khô.', 'Thân: 51% Polyeste, 49% Bông/ Vải Túi: 100% Polyeste.', 'Áo Nỉ Có Mũ Vải Brushed Jersey Dài Tay', 980000, 5, 4),
(50, '- Tận hưởng vẻ ngoài và cảm giác của denim đích thực.\r\n- Đường cắt suông thẳng từ đầu gối đến gấu quần.\r\n- Các chi tiết được thiết kế tỉ mỉ, chẳng hạn như nút, đinh tán và màu sắc đường chỉ.\r\n- Túi trước cao hơn và túi sau có góc cạnh để tạo hiệu ứng tôn dáng.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/461578/item/vngoods_64_461578.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, không giặt khô, không sấy khô.', 'Thân: 98% Bông, 2% Elastan/ Vải Túi: 65% Polyeste, 35% Bông.', 'Quần Jeans Dáng Slim Fit\r\n', 980000, 3, 6),
(51, '- Được làm từ 100% cotton.\r\n- Kiểu dáng rộng hợp xu hướng.\r\n- Lưng thun co giãn thoải mái.\r\n- Chi tiết quần cargo cổ điển. Thiết kế túi ở hai bên và túi nắp ở phía sau.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/461643/item/vngoods_08_461643.jpg?width=750', 'Giặt máy nước lạnh, giặt khô, không sấy khô.', 'Thân: 100% Bông/ Vải Túi: 80% Polyeste, 20% Bông', 'Quần Ống Suông Dáng Rộng Túi Hộp (Quần Cargo)', 980000, 4, 1),
(52, '- Chất liệu denim 100% cotton.\r\n- Thiết kế 5 túi cổ điển.\r\n- Kiểu dáng cạp cao với đường chân váy hơi cong, tôn dáng.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/461662/item/vngoods_35_461662.jpg?width=750', 'Giặt máy nước lạnh, không giặt khô, không sấy khô.', 'Thân: 100% Bông/ Vải Túi: 100% Bông.', 'Quần Jeans Ống Cong', 980000, 4, 4),
(53, '- Được làm từ vải denim cotton mang lại cảm giác mềm mại, mịn màng.\r\n- Vừa vặn.\r\n- Vị trí túi bên hông và thiết kế cạp cao tạo hiệu ứng tôn dáng cho đôi chân.\r\n- Đường khâu tương phản.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/461665/item/vngoods_08_461665.jpg?width=750', 'Giặt máy nước lạnh, không giặt khô, không sấy khô.', 'Thân: 100% Bông/ Vải Túi: 65% Polyeste, 35% Bông.', 'Quần Dài Vải Denim Ống Suông', 980000, 4, 1),
(54, '- Chất liệu vải Siêu Co Giãn với khả năng co giãn và đàn hồi đáng kinh ngạc.\r\n- Độ co giãn tuyệt vời đảm bảo quần skinny vừa vặn thoải mái, không bó sát xuống mắt cá chân.\r\n- Vị trí túi sau cao tạo hiệu ứng tôn dáng cho đôi chân.\r\n- Độ dày của đường chỉ dọc, số lượng chỉ và quá trình xử lý đã được lựa chọn cẩn thận để có lớp hoàn thiện đẹp mắt nhất.', 'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/461701/item/goods_09_461701.jpg?width=750', 'Giặt máy nước lạnh, giặt khô, không sấy khô.', 'Thân: 54% Bông, 31% Visco, 10% Polyeste, 5% Elastan/ Vải Túi: 65% Polyeste, 35% Bông.', 'Quần Jeans Siêu Co Giãn', 980000, 4, 1),
(55, '- Chất liệu sang trọng.\r\n- Thiết kế không cổ nhưng vẫn giữ được kiểu dáng giống áo len đan.\r\n- Đi kèm thắt lưng có thể dùng để tạo kiểu ở phần eo.\r\n- Bạn có thể gỡ bỏ thắt lưng để tạo kiểu dáng chữ A thoải mái và thể hiện được độ rủ của vải.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/461971/item/vngoods_01_461971.jpg?width=750', 'Giặt tay nước lạnh, giặt khô, không sấy khô.', '45% Bông, 38% Acrylic, 8% Nylon, 4% Len, 4% Polyeste, 1% Elastan.', 'Áo Cardigan Đan Len Mềm Cổ V Dài Tay', 980000, 13, 2),
(56, 'Áo Sơ Mi Vải Pha Linen Ngắn Tay', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/462374/item/vngoods_13_462374.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, giặt khô, không sấy khô.', '47% Visco, 35% Lanh, 18% Bông.', 'Áo Sơ Mi Vải Pha Linen Ngắn Tay', 588000, 2, 5),
(57, '-Cảm giác mềm mại, mịn màng.\r\n-Chống nhăn giúp dễ chăm sóc.\r\n-Thiết kế cổ áo mở tạo điểm nhấn.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/462381/item/vngoods_01_462381.jpg?width=750', 'Giặt máy nước lạnh, giặt khô, không sấy khô', '100% cotton.', 'Áo Sơ Mi Extra Fine Cotton Dài Tay', 489000, 1, 1),
(58, '- Kiểu dáng vừa vặn, rộng rãi giúp bạn dễ dàng chuyển động.\r\n- Thiết kế tay và ngực kiểu dáng đẹp mắt.\r\n- Chất vải mềm mịn, có độ bóng sang trọng.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/462385/item/vngoods_57_462385.jpg?width=750', 'Giặt máy nước lạnh, giặt khô, không sấy khô.', '100% cotton.', 'Áo Sơ Mi Extra Fine Cotton Dài Tay', 489000, 1, 3),
(59, '- Chất liệu vải \'AIRism\' mịn màng với công nghệ DRY khô nhanh.\r\n- Cool Touch, tính năng khử mùi, co giãn tuyệt vời mang lại cảm giác thoải mái trong mọi thời tiết.\r\n- Thiết kế mở phía trước.\r\n- Cạp vừa cổ điển vừa vặn an toàn.', 'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/462417/item/goods_67_462417.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, Không giặt khô, Không sấy khô', 'Thân: 88% Polyeste, 12% Elastan ( 47% Sử Dụng Sợi Polyeste Tái Chế )/ Eo: 90% Nylon, 10% Elastan', 'QUẦN LÓT BOXER AIRism', 244000, 14, 5),
(60, '- Chất liệu vải \'AIRism\' mịn màng với công nghệ DRY khô nhanh.\r\n- Cool Touch, tính năng khử mùi, co giãn tuyệt vời mang lại cảm giác thoải mái trong mọi thời tiết.\r\n- Thiết kế mở phía trước.\r\n- Cạp vừa cổ điển vừa vặn an toàn.', 'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/462418/item/goods_09_462418.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, Không giặt khô, Không sấy khô', 'Thân: 88% Polyeste, 12% Elastan ( 41% Sử Dụng Sợi Polyeste Tái Chế )/ Eo: 90% Nylon, 10% Elastan', 'QUẦN LÓT BOXER AIRism', 244000, 14, 1),
(61, '- Được làm bằng vải twill 100% cotton đặc trưng của Ines de la Fressange.\r\n- Tay áo phồng đặc biệt.\r\n- Kiểu dáng vừa vặn thanh lịch.\r\n- Eo co giãn, có dây rút.\r\n- Thiết kế gấp nếp.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/462508/item/vngoods_67_462508.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, giặt khô, không sấy khô.', '100% Bông.', 'Đầm Vải Cotton Twill Tay Phồng Dáng Dài', 1275000, 9, 6),
(62, '- Đường cắt thon gọn đẹp mắt dưới ngực.\r\n- Tay áo phồng xếp li.\r\n- Có khóa kéo ở phía sau.\r\n- Có túi ở hai bên.\r\n', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/462600/sub/vngoods_462600_sub9.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, giặt khô, không sấy khô.', 'Thân: 100% Visco/ Váy Lót: 100% Polyeste.', 'Đầm Tay Phồng', 1275000, 9, 2),
(63, '- Kiểu dáng vừa vặn đáng yêu.\r\n- Được làm từ vải dệt kim cotton-rayon có gân. Sợi nylon để tăng độ bền.\r\n- Thiết kế không tay tinh tế.\r\n- Dễ dàng mix and match để tạo nên phong cách linh hoạt. * Định hình sản phẩm sau khi giặt.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/462605/sub/vngoods_462605_sub9.jpg?width=750', 'Giặt tay nước lạnh, giặt khô, không sấy khô.', '48% Bông, 40% Modal, 12% Nylon.', 'Đầm Len Vải Pha Cotton Không Tay', 784000, 9, 5),
(64, '- Được làm từ 100% sợi cotton siêu dài với họa tiết trang nhã.\r\n- Được cập nhật với kiểu dáng vừa vặn, thoải mái theo xu hướng.\r\n- Cổ cài cúc dễ dàng mặc.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/462662/item/vngoods_57_462662.jpg?width=750', 'Giặt máy nước lạnh, không giặt khô, không sấy khô.', '100% Cotton.', 'Áo Sơ Mi Extra Fine Cotton Ngắn Tay', 489000, 1, 3),
(65, '- Vải slub nhẹ giản dị.\r\n- Thiết kế xếp tầng xinh xắn tạo điểm nhấn cho phong cách của bạn.\r\n- Dây đeo vai có thể điều chỉnh.\r\n- Có túi tiện dụng.', 'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/462711/item/goods_07_462711.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, Không giặt khô, Không sấy khô', 'Vải Chính: 62% Polyeste, 29% Cupro, 9% Elastan/ Lớp Lót: 72% Nylon, 28% Elastan/ Cúp Áo ( Lớp Lót Trong ): 100% Polyeste', 'AIRism Áo Bra Hai Dây', 489000, 15, 11),
(66, '- Thiết kế theo phong cách thể thao với đường nét được cải tiến ở phần cánh tay.\r\n- Để đáp lại phản hồi của khách hàng, độ dài áo đã được cải tiến.\r\n- Cấu trúc bên trong của cúp tích hợp đã được điều chỉnh để phù hợp hơn.\r\n- Cúp áo ngực tích hợp có thể mặc riêng hoặc kết hợp như chiễ áo ngực thông thường.', 'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/462713/item/goods_09_462713.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, Không giặt khô, Không sấy khô', 'Vải Chính: 97% Bông, 3% Elastan/ Lớp Lót: 95% Bông, 5% Elastan/ Cúp Áo ( Lớp Lót Trong ): 100% Polyeste', 'Áo Bra Lửng Không Tay', 489000, 15, 1),
(67, '- Chất liệu nhung 100% cotton dày, mềm, bóng.\r\n- Đường cắt thoải mái nhưng bóng mượt.\r\n- Chiều dài được cải tiến dài hơn.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/462740/item/vngoods_67_462740.jpg?width=750', 'Giặt tay nước lạnh, giặt khô, không sấy khô.', 'Vải Chính: 100% Bông/ Lớp Lót: 100% Polyeste ( 40% Sử Dụng Sợi Polyeste Tái Chế )/ Vải Túi: 100% Polyeste ( 40% Sử Dụng Sợi Polyeste Tái Chế )', 'Áo Khoác Vải Nhung', 1962000, 24, 6),
(68, '- Chất vải rũ satin nhăn ở mặt sau.\r\n- Các chi tiết xếp ly tạo nên một độ phồng nhất định.\r\n- Độ rũ của vải giúp bạn trông tuyệt vời khi sơ vin hoặc khoác ngoài.\r\n- Tạo điểm nhấn bằng các đường xẻ bên.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/462746/item/vngoods_09_462746.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, giặt khô, không sấy khô.', '100% Polyeste ( 100% Sử Dụng Sợi Polyeste Tái Chế ).', 'Áo Kiểu In Họa Tiết Tay Phồng', 784000, 2, 11),
(69, '- Vải dạ mềm mại.\r\n- Lớp lót bông ở phía sau.\r\n- Vừa vặn theo kiểu cổ điển.\r\n- Các nút bấm giấu kín ngoại trừ ở cổ áo và cổ tay áo.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/462761/item/vngoods_32_462761.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, giặt khô, không sấy khô.', 'Thân: 50% Bông, 30% Acrylic, 20% Visco/ Đồ Phụ Tùng: 65% Polyeste, 35% Bông.', 'Áo Sơ Mi Vải Dạ Dài Tay', 784000, 2, 4),
(70, '- Hỗn hợp tơ nhân tạo-polyester mềm mại.\r\n- Kiểu dáng oversize.\r\n- Lớp vỏ bọc của nút cài tinh tế.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/462763/item/vngoods_09_462763.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, giặt khô, không sấy khô.', '77% Modal, 23% Polyeste.', 'Áo Sơ Mi Vải Rũ Dài Tay', 784000, 2, 1),
(71, '- Với công nghệ DRY, Cool Touch, tính năng kiểm soát mùi và khử mùi tiện nghi.\r\n- Chất thun co giãn thoải mái.\r\n- Thiết kế mở phía trước.\r\n- Cạp thấp giúp không lộ khi mặc.', 'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/462948/item/goods_09_462948.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, Không giặt khô, Không sấy khô', 'Thân: 88% Polyeste, 12% Elastan ( 54% Sử Dụng Sợi Polyeste Tái Chế )/ Eo: 90% Nylon, 10% Elastan', 'QUẦN LÓT BOXER AIRism', 244000, 14, 1),
(72, '- Được cải tiến với độ co dãn thêm cho cảm giác mềm mại và thoải mái. \r\n- Vải twill thông thường. \r\n- Để điều chỉnh độ vừa vặn, hãy kéo dây thun qua khe hở và khuy tại vị trí mong muốn.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/462996/item/vngoods_54_462996.jpg?width=750', 'Giặt máy nước lạnh, Không giặt khô, Không sấy khô.', 'Thân: 98% Bông, 2% Elastan/ Vải Túi: 65% Polyeste, 35% Bông.', 'Quần Easy Short Co Giãn', 293000, 19, 3),
(73, '- Được cải tiến với độ co dãn thêm cho cảm giác mềm mại và thoải mái. \r\n- Vải twill thông thường. \r\n- Để điều chỉnh độ vừa vặn, hãy kéo dây thun qua khe hở và khuy tại vị trí mong muốn.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/462997/item/vngoods_68_462997.jpg?width=750', 'Giặt máy nước lạnh, Không giặt khô, Không sấy khô', 'Thân: 98% Bông, 2% Elastan/ Vải Túi: 65% Polyeste, 35% Bông.', 'Quần Easy Short Co Giãn', 293000, 19, 6),
(74, '- Chất liệu vải \'AIRism\' mịn màng với công nghệ DRY khô nhanh.\r\n- Cool Touch, tính năng khử mùi, co giãn tuyệt vời mang lại cảm giác thoải mái trong mọi thời tiết.\r\n- Thiết kế mở phía trước.\r\n- Cạp vừa cổ điển vừa vặn an toàn.', 'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/463055/item/goods_09_463055.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, Không giặt khô, Không sấy khô', 'Thân: 88% Polyeste, 12% Elastan ( 54% Sử Dụng Sợi Polyeste Tái Chế )/ Eo: 90% Nylon, 10% Elastan', 'QUẦN LÓT BOXER AIRism', 244000, 14, 1),
(75, '- Được làm bằng vải co giãn.\r\n- Với công nghệ DRY nhanh khô.\r\n- Chất vải mềm mịn, kiểu dáng cao cấp, dễ phối đồ.\r\n- Thắt lưng co giãn để tạo sự thoải mái lâu dài.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/463060/item/vngoods_09_463060.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, không giặt khô, không sấy khô.', 'Thân: 80% Polyeste, 15% Visco, 5% Elastan ( 80% Sử Dụng Sợi Polyeste Tái Chế )/ Bo: 82% Bông, 18% Polyeste/ Vải Túi: Lớp Ngoài: 100% Bông/ Vải Túi: Lớp Trong: 80% Polyeste, 15% Visco, 5% Elastan ( 80% Sử Dụng Sợi Polyeste Tái Chế )', 'Quần Nỉ Dry Thể Thao', 686000, 4, 1),
(76, '- Chất liệu vải mịn. Cảm giác mịn màng của lông cừu.\r\n- Với độ co dãn đặc biệt giúp bạn dễ dàng vận động.\r\n- Chất vải mỏng dễ tạo kiểu.\r\n- Kiểu dáng đa năng, vừa vặn.\r\n- Thiết kế nửa khóa kéo thể thao.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/463067/item/vngoods_30_463067.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, không giặt khô, không sấy khô.', '91% Polyeste, 9% Elastan.', 'Áo Thun Giả Lông Cừu Co Giãn Kéo Khóa', 489000, 7, 2),
(77, '- Chất thun co giãn 2 chiều giúp bạn thoải mái vận động.\r\n- Thắt lưng đàn hồi ẩn, phẳng cho kiểu dáng đẹp mắt.\r\n- Kiểu dáng suông, ôm dần nhẹ nhàng từ đầu gối.\r\n- Những chiếc quần tôn dáng này không quá ôm vào đùi và bắp chân.\r\n- Với các vòng thắt lưng.\r\n- Họa tiết kẻ caro.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/463180/item/vngoods_08_463180.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, giặt khô, không sấy khô.', 'Thân: 67% Polyeste, 29% Visco, 4% Elastan ( 62% Sử Dụng Sợi Polyeste Tái Chế )/ Vải Túi: 100% Polyeste ( 60% Sử Dụng Sợi Polyeste Tái Chế ).', 'Quần Smart Pants Dài Đến Mắt Cá (Glen Checked)', 784000, 4, 11),
(78, '- Vải siêu co giãn giúp cử động dễ dàng.\r\n- Kết cấu mềm mại cho sự thoải mái tuyệt vời.\r\n- Để điều chỉnh độ vừa vặn, hãy kéo dây thắt lưng đàn hồi qua lỗ được may sẵn và cố định nút ở vị trí mong muốn.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/463499/item/vngoods_69_463499.jpg?width=750', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/463499/item/vngoods_69_463499.jpg?width=750', 'Thân: 96% Bông, 4% Elastan/ Bo: 74% Bông, 26% Polyeste/ Vải Túi: 100% Bông.', 'Quần Nỉ In Họa Tiết Siêu Co Giãn', 489000, 19, 6),
(79, '- Chất liệu cotton mềm mịn, chống vón cục.\r\n- Với tính năng khử mùi.\r\n- Kiểu tam giác ôm gọn.', 'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/463501/item/goods_18_463501.jpg?width=750', 'Giặt máy nước lạnh, Không giặt khô, Không sấy khô', 'Thân: 93% Bông, 7% Elastan/ Eo: 80% Polyeste, 14% Elastan, 6% Nylon', 'Quần Lót', 146000, 14, 5),
(80, '- Cấu trúc dệt kim đặc biệt ngăn các cạnh bị sờn.\r\n- Co giãn 2 chiều tuyệt vời cho cảm giác êm ái và thoải mái tuyệt vời.\r\n- Thiết kế hoàn toàn liền mạch.\r\n- Quần lót boxer có độ vừa vặn đặc biệt cho cảm giác vừa vặn.', 'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/456710/item/goods_03_456710.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, Không giặt khô, Không sấy khô', '72% Nylon, 28% Elastan', 'AIRism Quần Lót Boxer Briefs Không Đường May', 244000, 14, 11),
(81, '- Đan nổi .\r\n- Kiểu dáng hình hộp, thoải mái.\r\n- Chiều dài ngắn.\r\n- Kết cấu mềm mại và thoáng mát đặc biệt.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/463682/item/vngoods_32_463682.jpg?width=750', 'Giặt tay nước lạnh, giặt khô, không sấy khô.', '100% Len Casomia.', 'Áo Len Cashmere Cổ Tròn Dáng Ngắn Dài Tay', 2453000, 13, 4),
(82, '- Chất liệu vải mềm mại kết hợp giữa cảm giác mát mẻ của vải linen và cảm giác mịn màng của tơ nhân tạo, tạo nên kết cấu tự nhiên, tinh xảo.\r\n- Thiết kế cổ mở thoáng mát.\r\n- Kiểu dáng hình hộp với viền dài hơn ở phía sau.\r\n- In sọc giản dị.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/458284/item/vngoods_55_458284.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, giặt khô, không sấy khô.', '45% Visco, 33% Lanh, 22% Bông.', 'Áo Sơ Mi Linen Pha Cổ Mở Ngắn Tay', 588000, 2, 3),
(83, '- Chất liệu vải jersey mềm mại với cảm giác chải kỹ.\r\n- Kiểu dáng thoải mái, thanh lịch.\r\n- Đầm dài tới đầu gối với thiết kế cổ cao đặc trưng.\r\n- Đường cắt vừa vặn với vai trễ và tay áo rộng.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/464301/item/vngoods_35_464301.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, giặt khô, không sấy khô.', 'Thân: 52% Polyeste, 48% Bông/ Bo: 68% Bông, 32% Polyeste/ Vải Túi: 100% Bông.', 'Đầm Vải Brushed Jersey Cổ Lọ', 784000, 9, 4),
(84, 'Những thiết kế lấy cảm hứng từ hình ảnh Snoopy và những người bạn đang chơi bóng chày trong bộ truyện tranh Peanuts nổi tiếng. Bộ sưu tập khắc họa những hình ảnh quen thuộc của Snoopy và những người bạn, gồm có cả Charlie Brown, quản lý đội bóng kiêm vị trí ném bóng, với niềm đam mê dành cho bóng chày.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/464505/item/vngoods_53_464505.jpg?width=750', 'Giặt máy nước lạnh, không giặt khô, sấy khô ở nhiệt độ thấp.', 'Thân: 100% Bông/ Bo: 78% Bông, 22% Polyeste.', 'PEANUTS Áo Nỉ Dài Tay', 784000, 5, 3),
(85, 'Những thiết kế lấy cảm hứng từ hình ảnh Snoopy và những người bạn đang chơi bóng chày trong bộ truyện tranh Peanuts nổi tiếng. Bộ sưu tập khắc họa những hình ảnh quen thuộc của Snoopy và những người bạn, gồm có cả Charlie Brown, quản lý đội bóng kiêm vị trí ném bóng, với niềm đam mê dành cho bóng chày.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/464509/item/vngoods_03_464509.jpg?width=750', 'Giặt máy nước lạnh, không giặt khô, sấy khô ở nhiệt độ thấp.', 'Thân: 100% Bông/ Bo: 78% Bông, 22% Polyeste.', 'PEANUTS Áo Nỉ Dài Tay\r\n', 784000, 5, 11),
(86, 'Áo Sơ Mi Vải Brushed Mềm Kẻ Caro Dài Tay', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/464680/item/vngoods_16_464680.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, giặt khô, không sấy khô.', '67% Bông, 19% Acrylic, 14% Visco.', 'Áo Sơ Mi Vải Brushed Mềm Kẻ Caro Dài Tay', 588000, 2, 5),
(87, '- Chất jeans 100% cotton mềm mịn.\r\n- Thiết kế 5 túi cổ điển với kiểu dáng cạp vừa.\r\n- Dáng rộng ở hông với đường cắt rộng từ phần đùi nhưng ôm dần về phía mắt cá chân.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/464683/item/vngoods_63_464683.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, không giặt khô, không sấy khô.', 'Thân: 100% Bông/ Vải Túi: 65% Polyeste, 35% Bông.', 'Quần Jeans Dáng Rộng Ống Ôm Dần', 980000, 4, 6),
(88, '- Mềm mại, thoáng mát và không gây ngứa\r\n- Sợi soufflé mềm mại của chúng tôi tạo cảm giác nhẹ như không khí.\r\n- Thiết kế cổ cao cải tiến.\r\n- Viền cao thấp bất đối xứng.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/464860/item/vngoods_32_464860.jpg?width=750', 'Giặt tay nước lạnh, giặt khô, không sấy khô.', '41% Acrylic, 31% Nylon, 26% Bông, 2% Elastan.', 'Áo Len Vải Souffle Nhẹ Cổ Cao Dài Tay', 784000, 13, 4),
(89, '- Chất liệu cotton cho vẻ ngoài giản dị.\r\n- Chất liệu vải siêu co giãn mang lại cảm giác thoải mái và dễ dàng vận động.\r\n-Vải mềm mại nhưng sắc nét hoàn hảo.\r\n- Với công nghệ DRY nhanh khô.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/454378/item/vngoods_71_454378.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, Không giặt khô, Không sấy khô.', 'Thân: Lớp Lót Mũ Trùm: 48% Polyeste, 46% Bông, 6% Elastan/ Bo: 78% Bông, 22% Polyeste/ Vải Túi: Lớp Ngoài: 100% Polyeste/ Vải Túi: Lớp Trong: 48% Polyeste, 46% Bông, 6% Elastan.', 'Áo Khoác Dry Nỉ Siêu Co Giãn Có Mũ Kéo Khóa Dài Tay', 489000, 21, 9),
(90, '- Chất liệu cotton bên ngoài cho vẻ ngoài giản dị.\r\n- Chất liệu vải siêu co giãn mang đến cảm giác thoải mái và dễ dàng vận động.\r\n- Kết cấu sắc nét hoàn hảo nhưng vẫn mềm mại.\r\n- Với công nghệ DRY nhanh khô.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/463500/sub/vngoods_463500_sub7.jpg?width=750', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/463500/sub/vngoods_463500_sub7.jpg?width=750', 'Thân: 48% Polyeste, 46% Bông, 6% Elastan/ Bo: 78% Bông, 22% Polyeste/ Vải Túi: Lớp Ngoài: 100% Polyeste/ Vải Túi: Lớp Trong: 48% Polyeste, 46% Bông, 6% Elastan/ Băng: 100% Polyeste.', 'Quần Nỉ Dry Siêu Co Giãn', 489000, 19, 11),
(91, '- Chất liệu vải dệt kim mịn với màu sắc bắt mắt và kiểu dáng trang nhã.\r\n- Độ dày vừa phải dễ dàng kết hợp với các trang phục khác.\r\n- Chất liệu vải mịn, chống vón cục.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/460324/item/vngoods_24_460324.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, Không giặt khô, Không sấy khô.', 'Thân: 100% Bông/ Bo: 82% Bông, 18% Polyeste/ Lớp Lót Mũ Trùm: 61% Bông, 39% Polyeste', 'Áo Nỉ Có Mũ Kéo Khóa Dài Tay', 784000, 5, 7),
(92, '- Được cải tiến với bề mặt nhám để có vẻ ngoài tinh tế.\r\n- Độ co giãn được cải thiện khiến sản phẩm trở nên lý tưởng khi bạn chơi thể thao.\r\n- Kiểu dáng được cải tiến cho phép di chuyển dễ dàng.\r\n- Đường may phía sau đầu gối để vừa vặn hơn khi gập chân.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/460325/item/vngoods_66_460325.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, không giặt khô, không sấy khô.', 'Thân: 74% Polyeste, 20% Bông, 6% Elastan ( 45% Sử Dụng Sợi Polyeste Tái Chế )/ Lớp Lót Mũ Trùm: Vải Túi: 100% Polyeste.', 'Áo Khoác Nỉ Co Giãn Dry Có Mũ Kéo Khóa Dài Tay', 784000, 5, 6),
(93, 'Đây chính là những thiết kế với đa dạng họa tiết từ các tác phẩm nổi tiếng nhất của Ghibli, hợp tác cùng nghệ sĩ Thái Lan Kanyada. Thông qua bộ sưu tập này, chúng tôi mong rằng tất cả mọi người có thể cảm nhận được năng lượng tuyệt vời của Studio Ghibli.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/465884/item/vngoods_55_465884.jpg?width=750', 'Giặt máy nước lạnh, không giặt khô, sấy khô ở nhiệt độ thấp.', 'Thân: 100% Bông/ Bo: 78% Bông, 22% Polyeste.', 'Studio Ghibli Áo Nỉ Dài Tay', 784000, 5, 3),
(94, '- Chất liệu cotton pha nylon mềm mại, chải kỹ càng.\r\n- Thiết kế dạng kéo.\r\n- Kiểu dáng rộng.\r\n- Đường may thông thường, cơ bản.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/458340/item/vngoods_31_458340.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, giặt khô, không sấy khô.', 'Thân: 75% Bông, 25% Nylon/ Vải Túi: Đồ Phụ Tùng: 80% Polyeste, 20% Bông.', 'Quần Dài Túi Hộp (Quần Cargo)', 980000, 4, 4),
(95, 'Đây chính là những thiết kế với đa dạng họa tiết từ các tác phẩm nổi tiếng nhất của Ghibli, hợp tác cùng nghệ sĩ Thái Lan Kanyada. Thông qua bộ sưu tập này, chúng tôi mong rằng tất cả mọi người có thể cảm nhận được năng lượng tuyệt vời của Studio Ghibli.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/466530/item/vngoods_09_466530.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, giặt khô, không sấy khô.', '53% Modal, 47% Bông.', 'Studio Ghibli Áo Sơ Mi Cổ Mở Ngắn Tay', 784000, 1, 1),
(96, '- Chất liệu vải chải kỹ được dệt đặc biệt mang lại cảm giác mịn màng, cao cấp.\r\n- Kiểu dáng rộng có viền suông thẳng.\r\n- Kiểu dáng vừa phải ở vai và ngực tạo ấn tượng thoải mái nhưng vẫn vừa vặn trang nhã.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/466845/item/vngoods_08_466845.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, giặt khô, không sấy khô.', '60% Polyeste, 20% Nilon, 20% Visco.', 'Áo Sơ Mi Vải Brushed Twill Kẻ Caro Dài Tay', 784000, 1, 1),
(97, 'Được lấy thiết kế từ mặt sau bìa sách artbook mới của KAWS (do Phaidon xuất bản). Với thiết kế kết hợp từ nhân vật \"companion\" nổi trên bề mặt tạo nên điểm nhấn nổi bật.', 'https://image.uniqlo.com/UQ/ST3/vn/imagesgoods/467395/item/vngoods_01_467395.jpg?width=750', 'Giặt máy nước lạnh, không giặt khô, sấy khô ở nhiệt độ thấp.', 'Thân: 100% Bông/ Bo: 86% Bông, 14% Polyeste.', 'KAWS Áo Nỉ Dài Tay', 784000, 5, 2),
(98, 'Áo polo cổ ve lật, cài khuy ẩn phía trước. Dài tay. Bo viền bằng vải gân.', 'https://static.zara.net/photos///2023/I/0/2/p/0526/330/066/2/w/750/0526330066_6_1_1.jpg?ts=1692006318832', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\nKIỂU BODY\r\n65% vải cotton\r\n35% vải pôliexte\r\nVẢI PHỤ\r\n98% vải cotton\r\n2% elastane', 'ÁO NỈ CỔ POLO', 1199000, 5, 2),
(99, 'Quần short bermuda cạp co giãn, điều chỉnh bằng dây rút. Xếp li phía trước. Có hai túi ở phía trước và hai túi may viền ở phía sau. Gấu lật.', 'https://static.zara.net/photos///2023/I/0/2/p/0706/269/914/2/w/750/0706269914_6_1_1.jpg?ts=1695218308029', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\n54% vải thun vitcô\r\n43% vải pôliexte\r\n3% elastane', 'QUẦN SHORT BERMUDA THIẾT KẾ THOẢI MÁI', 629000, 3, 3),
(100, 'Áo nỉ oversize. Cổ tròn, cộc tay. Toàn thân chần chỉ nổi khác màu.', 'https://static.zara.net/photos///2023/I/0/2/p/0761/312/712/2/w/750/0761312712_6_1_1.jpg?ts=1689257030366', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\n86% vải cotton\r\n14% vải pôliexte', 'ÁO NỈ CHẦN CHỈ NỔI KHÁC MÀU', 1299000, 7, 4),
(101, 'Áo nỉ oversize. Cổ tròn, cộc tay. Toàn thân chần chỉ nổi khác màu.', 'https://static.zara.net/photos///2023/I/0/2/p/0761/312/712/2/w/750/0761312712_6_1_1.jpg?ts=1689257030366', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\n86% vải cotton\r\n14% vải pôliexte', 'ÁO NỈ CHẦN CHỈ NỔI KHÁC MÀU', 1299000, 7, 4),
(102, 'Quần short bermuda dáng jogger ngắn, vải cotton compact, bên trong lót vải bông. Cạp co giãn, điều chỉnh bằng dây rút. Có túi hai bên và một túi đáp phía sau. Một bên ống quần in logo Everlast®.', 'https://static.zara.net/photos///2023/I/0/2/p/0761/329/803/2/w/750/0761329803_6_1_1.jpg?ts=1693294166171', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\n50% vải cotton\r\n50% vải pôliexte', 'QUẦN SHORT BERMUDA DÁNG JOGGER EVERLAST®', 1299000, 3, 11),
(103, 'Áo nỉ hoodie vải cotton, mặt bên trong có lông xù. Cổ may liền mũ trùm đầu điều chỉnh được, dài tay. Có một túi kangaroo phía trước. Bo viền bằng vải gân.', 'https://static.zara.net/photos///2023/I/0/2/p/0761/350/807/2/w/750/0761350807_6_1_1.jpg?ts=1688039025314', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\nVẢI CHÍNH\r\n63% vải cotton\r\n37% vải pôliexte\r\nCHI TIẾT\r\n99% vải cotton\r\n1% elastane\r\nLỚP LÓT\r\n63% vải cotton\r\n37% vải pôliexte\r\n', 'ÁO NỈ CÓ MŨ TRÙM ĐẦU', 1199000, 5, 11),
(104, 'Quần short thể thao vải kỹ thuật nhẹ và co giãn.\r\n- Cạp co giãn, điều chỉnh bằng dây rút.\r\n- Có một túi cài khóa kéo ép nhiệt phía sau.', 'https://static.zara.net/photos///2023/I/0/2/p/0765/304/641/2/w/750/0765304641_6_1_1.jpg?ts=1688032628554', 'Chỉ giặt quần áo khi cần thiết, đôi khi chỉ cần phơi quần áo tại nơi thoáng khí là đủ. Quá trình giặt làm hao mòn dần các loại vải. Bằng cách giảm số lần giặt, chúng ta sẽ kéo dài tuổi thọ của quần áo và giảm lượng nước và năng lượng tiêu thụ trong các quá trình chăm sóc.', 'LỚP NGOÀI\r\n85% vải poliamit\r\n15% elastane\r\nLỚP LÓT\r\n92% vải pôliexte\r\n8% elastane', 'QUẦN SHORT THỂ THAO', 729000, 3, 7),
(105, 'Áo nỉ hoodie có mũ trùm đầu, dài tay, bo cổ tay bằng vải gân. Kiểu bạc màu. Gấu cắt lệch. Dáng crop.\r\n\r\n', 'https://static.zara.net/photos///2023/I/0/2/p/0962/328/044/2/w/750/0962328044_6_1_1.jpg?ts=1688638570867', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\nVẢI CHÍNH\r\n65% vải cotton\r\n35% vải pôliexte\r\nVẢI PHỤ\r\n98% vải cotton\r\n2% elastane\r\nLỚP LÓT\r\n65% vải cotton\r\n35% vải pôliexte', 'ÁO NỈ KIỂU BẠC MÀU CÓ MŨ', 1299000, 5, 6);
INSERT INTO `product` (`id`, `description`, `image`, `instruction`, `materials`, `name`, `price`, `category_id`, `color_id`) VALUES
(106, 'Áo nỉ cổ tròn, dài tay. Bo viền bằng vải gân. In họa tiết khác màu hình các cô gái.', 'https://static.zara.net/photos///2023/I/0/1/p/1131/815/710/2/w/750/1131815710_6_1_1.jpg?ts=1692000181837', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải. Đồng thời giúp làm giảm lượng năng lượng tiêu thụ trong các quá trình chăm sóc.', 'LỚP NGOÀI\r\nVẢI CHÍNH\r\n65% vải cotton\r\n35% vải pôliexte\r\nVẢI PHỤ\r\n97% vải cotton\r\n3% elastane', 'ÁO NỈ HỌA TIẾT CÔ GÁI', 899000, 6, 2),
(107, 'Đầm cổ chữ V, cộc tay. Cài khuy trước ngực.', 'https://static.zara.net/photos///2023/I/0/3/p/1165/740/064/2/w/750/1165740064_6_1_1.jpg?ts=1692352002425', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\n100% vải thun vitcô', 'ĐẦM CHẤM BI', 849000, 18, 2),
(108, 'Đầm phối vải nylon, cổ tròn, dài tay. Đáp hai túi vuông hai bên. Eo bo thun co giãn.', 'https://static.zara.net/photos///2023/I/0/3/p/1165/744/731/2/w/750/1165744731_6_1_1.jpg?ts=1694617225431', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\nPHẦN TRÊN\r\n97% vải cotton\r\n3% elastane\r\nPHẦN DƯỚI\r\n79% vải pôliexte\r\n3% elastane\r\n18% vải poliamit', 'ĐẦM PARACHUTE PHỐI VẢI', 699000, 18, 4),
(109, 'Áo nỉ cổ tròn, dài tay. Bo viền bằng vải gân.', 'https://static.zara.net/photos///2023/I/0/3/p/1165/772/681/2/w/750/1165772681_6_1_1.jpg?ts=1691490685803', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\nVẢI CHÍNH\r\n100% vải cotton\r\nVẢI PHỤ\r\n97% vải cotton\r\n3% elastane', 'ÁO NỈ ARTY', 529000, 22, 5),
(110, 'Quần short bermuda dáng slim fit. Cạp co giãn, điều chỉnh bằng dây rút. Có 5 túi. Kiểu bạc màu. Gấu lật.', 'https://static.zara.net/photos///2023/V/0/2/p/1187/444/407/2/w/750/1187444407_6_1_1.jpg?ts=1679299869278', 'Để kéo dài tuổi thọ cho quần áo denim của bạn, hãy luôn lộn trái chúng từ trong ra ngoài và giặt chúng ở nhiệt độ thấp. Cách làm như vậy giúp bảo quản màu sắc và cấu trúc vải, đồng thời giúp làm giảm lượng năng lượng tiêu thụ.', 'LỚP NGOÀI\r\n80% vải cotton\r\n18% vải pôliexte\r\n1% vải thun vitcô\r\n1% elastane', 'QUẦN SHORT BERMUDA VẢI DENIM MỀM', 529000, 3, 6),
(111, 'Quần short bermuda dáng relaxed fit. Có 5 túi. Kiểu bạc màu, trang trí các chi tiết rách trên ống quần. Gấu cắt lệch. Cài phía trước bằng khuy cài.', 'https://static.zara.net/photos///2023/I/0/2/p/1538/332/800/2/w/750/1538332800_6_1_1.jpg?ts=1689591845380', 'Phơi ở nơi thông thoáng và chải quần áo là cách tự nhiên để chăm sóc quần áo mỏng manh của bạn. Nếu cần thiết phải giặt khô, hãy cố gắng tìm những tiệm giặt ủi sử dụng các công nghệ thân thiện với môi trường.', 'LỚP NGOÀI\r\n100% vải cotton', 'QUẦN SHORT BERMUDA VẢI DENIM RÁCH', 1299000, 3, 1),
(112, 'Quần ống côn, cạp lỡ bo thun co giãn phía sau. Có hai túi phía trước và hai túi giả may viền phía sau. Gấu xẻ hai bên. Cài phía trước bằng khóa kéo, khuy ẩn và móc kim loại.', 'https://static.zara.net/photos///2023/I/0/1/p/1478/230/809/2/w/750/1478230809_6_1_1.jpg?ts=1695655521026', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\n63% vải pôliexte\r\n34% vải thun vitcô\r\n3% elastane', 'QUẦN CẠP JOGGER', 899000, 4, 11),
(113, 'Áo nỉ dài tay, có mũ trùm đầu. Bo viền bằng len gân. Có một túi kangaroo ở phía trước. Đáp họa tiết chữ phủ lông mịn.', 'https://static.zara.net/photos///2023/I/0/3/p/1880/783/700/2/w/750/1880783700_6_1_1.jpg?ts=1695368441340', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\nVẢI CHÍNH\r\n76% vải cotton\r\n24% vải pôliexte\r\nVẢI PHỤ\r\n58% vải cotton\r\n39% vải pôliexte\r\n3% elastane\r\nLỚP LÓT\r\n76% vải cotton\r\n24% vải pôliexte', 'ÁO NỈ CÓ MŨ NEW JERSEY', 629000, 22, 4),
(114, 'Jumpsuit denim cổ ve lật, dài tay. Cài khuy bấm phía trước. Có nhiều túi phía trước, túi có nắp hai bên ống quần và hai túi phía sau.', 'https://static.zara.net/photos///2023/I/0/3/p/2187/709/400/2/w/750/2187709400_6_1_1.jpg?ts=1692345942636', 'Để kéo dài tuổi thọ cho quần áo denim của bạn, hãy luôn lộn trái chúng từ trong ra ngoài và giặt chúng ở nhiệt độ thấp. Cách làm như vậy giúp bảo quản màu sắc và cấu trúc vải, đồng thời giúp làm giảm lượng năng lượng tiêu thụ.', 'LỚP NGOÀI\r\n100% vải cotton', 'JUMPSUIT WORKER VẢI DENIM', 999000, 18, 6),
(115, 'Áo nỉ có mũ trùm đầu, dài tay, bo cổ tay. Thêu trang trí phía trước và in họa tiết sau lưng.', 'https://static.zara.net/photos///2023/I/0/3/p/2224/672/081/2/w/750/2224672081_6_1_1.jpg?ts=1694001086095', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\nVẢI CHÍNH\r\n57% vải pôliexte\r\n43% vải cotton\r\nVẢI PHỤ\r\n65% vải cotton\r\n33% vải pôliexte\r\n2% elastane\r\nLỚP LÓT\r\n57% vải pôliexte\r\n43% vải cotton', 'ÁO NỈ THÊU', 629000, 22, 1),
(116, 'Áo nỉ có mũ trùm đầu, dài tay, bo cổ tay. Thêu trang trí phía trước và in họa tiết sau lưng.', 'https://static.zara.net/photos///2023/I/0/3/p/2224/672/081/2/w/750/2224672081_6_1_1.jpg?ts=1694001086095', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\nVẢI CHÍNH\r\n57% vải pôliexte\r\n43% vải cotton\r\nVẢI PHỤ\r\n65% vải cotton\r\n33% vải pôliexte\r\n2% elastane\r\nLỚP LÓT\r\n57% vải pôliexte\r\n43% vải cotton', 'ÁO NỈ THÊU', 629000, 22, 1),
(117, 'Áo nỉ dáng rộng, cổ tròn, dài tay. Bo viền bằng len gân.', 'https://static.zara.net/photos///2023/I/0/2/p/2795/331/707/2/w/750/2795331707_6_1_1.jpg?ts=1696319325168', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\nVẢI CHÍNH\r\n92% vải pôliexte\r\n8% elastane\r\nVẢI PHỤ\r\n98% vải cotton\r\n2% elastane', 'ÁO NỈ THÊU CHỮ', 1299000, 5, 4),
(118, 'Quần short thể thao vải kỹ thuật nhẹ và co giãn.\r\n- Cạp co giãn, điều chỉnh bằng dây rút.\r\n- Có túi hai bên.', 'https://static.zara.net/photos///2023/I/0/2/p/2888/309/485/2/w/750/2888309485_6_1_1.jpg?ts=1694678808556', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\n88% vải poliamit\r\n12% elastane\r\n', 'QUẦN SHORT THỂ THAO IN CHỮ', 629000, 3, 6),
(119, 'Quần vải pha sợi cotton. Cạp cao bo thun co giãn, có dây rút để điều chỉnh. Có túi hai bên. Gấu bo thun co giãn.', 'https://static.zara.net/photos///2023/I/0/1/p/3199/630/501/2/w/750/3199630501_6_1_1.jpg?ts=1696501163055', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\n53% vải cotton\r\n47% vải pôliexte', 'QUẦN JOGGER NHUNG LÔNG', 799000, 3, 3),
(120, 'Áo nỉ vải pha sợi cotton. Cổ tròn, dài tay, vai may thấp. Viền bo vải gân cùng màu. Có các đường may nổi trang trí. Cài phía trước bằng khóa kéo kim loại.', 'https://static.zara.net/photos///2023/I/0/1/p/3199/802/800/2/w/750/3199802800_6_1_1.jpg?ts=1692884469481', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'Áo nỉ vải pha sợi cotton. Cổ tròn, dài tay, vai may thấp. Viền bo vải gân cùng màu. Có các đường may nổi trang trí. Cài phía trước bằng khóa kéo kim loại.', 'ÁO NỈ DÁNG BOMBER CÀI KHÓA KÉO', 999000, 5, 1),
(121, 'Áo nỉ cổ tròn, dài tay. Phối các dải trang trí khác màu ở phía trước và sau lưng. Cổ tay và gấu bo vải gân.', 'https://static.zara.net/photos///2023/I/0/2/p/3443/313/207/2/w/750/3443313207_6_1_1.jpg?ts=1694679578674', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\nVẢI CHÍNH\r\n70% vải cotton\r\n30% vải pôliexte\r\nVẢI PHỤ\r\n95% vải cotton\r\n5% elastane', 'ÁO NỈ PHỐI CÁC DẢI TRANG TRÍ KHÁC MÀU', 1299000, 5, 1),
(122, 'Áo nỉ dáng rộng, cổ tròn, dài tay. Kiểu bạc màu. Bo viền bằng vải gân.', 'https://static.zara.net/photos///2023/I/0/2/p/3854/350/629/2/w/750/3854350629_6_1_1.jpg?ts=1692862508969', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\nVẢI CHÍNH\r\n100% vải cotton\r\nVẢI PHỤ\r\n97% vải cotton\r\n3% elastane', 'ÁO NỈ BẠC MÀU', 1299000, 5, 9),
(123, 'Áo nỉ cổ tròn, dài tay. In họa tiết chữ trước ngực và sau lưng.', 'https://static.zara.net/photos///2023/I/0/3/p/3854/669/400/2/w/750/3854669400_6_1_1.jpg?ts=1693562031457', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\nVẢI CHÍNH\r\n50% vải cotton\r\n50% vải pôliexte\r\nVẢI PHỤ\r\n58% vải cotton\r\n39% vải pôliexte\r\n3% elastane', 'ÁO NỈ THÊU CHỮ', 499000, 22, 6),
(124, 'Áo nỉ dài tay, có mũ trùm đầu. Cổ tay và gấu bo vải gân. Có một túi kangaroo ở phía trước. Thêu chữ trang trí trước ngực và in họa tiết sau lưng.\r\n\r\n', 'https://static.zara.net/photos///2023/I/0/3/p/3854/698/943/2/w/750/3854698943_6_1_1.jpg?ts=1695634465366', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\nVẢI CHÍNH\r\n55% vải cotton\r\n45% vải pôliexte\r\nVẢI PHỤ\r\n58% vải cotton\r\n39% vải pôliexte\r\n3% elastane\r\nLỚP LÓT\r\n55% vải cotton\r\n45% vải pôliexte', 'ÁO NỈ THÊU CHỮ', 629000, 22, 5),
(125, 'Áo polo dáng rộng, cổ ve lật, cài khuy phía trước. Dài tay. Gấu xẻ hai bên.', 'https://static.zara.net/photos///2023/I/0/2/p/3992/341/982/2/w/750/3992341982_6_1_1.jpg?ts=1696319323937', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\n100% vải cotton', 'ÁO NỈ POLO', 1199000, 5, 2),
(126, 'Áo măng tô oversize chất liệu chống thấm nước. Cổ ve lật, dài tay, may con đỉa ở vai và đai cài ở cổ tay. Có hai túi cài khóa kéo phía trước. Kèm thắt lưng cùng chất liệu. Gấu xẻ ở phía sau.', 'https://static.zara.net/photos///2023/I/0/1/p/4341/723/990/2/w/750/4341723990_6_1_1.jpg?ts=1695714735535', 'Để giữ cho áo khoác của bạn sạch sẽ, bạn chỉ cần phơi chúng ở nơi thông thoáng và lau sạch bằng khăn vải hoặc bàn chải chuyên dụng. Quá trình này có lợi hơn cho vải và cũng tránh việc tiêu thụ nước và năng lượng trong quá trình giặt.', 'LỚP NGOÀI\r\n100% pôliurêtan', 'ÁO MĂNG TÔ OVERSIZE VẢI MỎNG XUYÊN THẤU NHẸ', 2699000, 24, 1),
(127, 'Áo nỉ hoodie dài tay, cổ may liền mũ trùm đầu. Vải hiệu ứng bạc màu, trang trí các chi tiết rách. Gấu có viền cắt lệch.\r\n\r\n', 'https://static.zara.net/photos///2023/I/0/2/p/4729/306/922/2/w/750/4729306922_6_1_1.jpg?ts=1693380537042', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\n90% vải cotton\r\n10% vải pôliexte\r\nLỚP LÓT\r\n90% vải cotton\r\n10% vải pôliexte', 'ÁO NỈ DÁNG BOXY FIT CÓ MŨ', 1499000, 5, 11),
(128, 'Đầm yếm giả da, cổ tròn, không tay. Cài khóa kéo sau lưng. Eo bo thun co giãn, có dây rút kèm khóa chỉnh dây.', 'https://static.zara.net/photos///2023/I/0/3/p/4786/701/800/2/w/750/4786701800_6_1_1.jpg?ts=1691592100165', 'Chỉ giặt quần áo khi cần thiết, đôi khi chỉ cần phơi quần áo tại nơi thoáng khí là đủ. Quá trình giặt làm hao mòn dần các loại vải. Bằng cách giảm số lần giặt, chúng ta sẽ kéo dài tuổi thọ của quần áo và giảm lượng nước và năng lượng tiêu thụ trong các quá trình chăm sóc.', 'LỚP NGOÀI\r\nVẢI NỀN\r\n100% vải pôliexte\r\nLỚP PHỦ\r\n100% pôliurêtan\r\nLỚP LÓT\r\n100% vải pôliexte', 'ĐẦM YẾM GIẢ DA', 849000, 18, 1),
(129, 'Áo len cổ tròn, dài tay. Bo viền bằng len gân.', 'https://static.zara.net/photos///2023/I/0/2/p/4938/330/800/2/w/750/4938330800_6_1_1.jpg?ts=1695717311340', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\n100% vải pôliexte', 'ÁO LEN CHENILLE', 1299000, 12, 1),
(130, 'Quần vải xuyên thấu nhẹ, cạp cao co giãn.\r\nKhông có vải lót bên trong.', 'https://static.zara.net/photos///2023/I/0/1/p/5039/419/112/2/w/750/5039419112_6_1_1.jpg?ts=1696490388961', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\n95% vải pôliexte\r\n5% elastane', 'QUẦN VẢI TULLE IN HỌA TIẾT', 729000, 4, 6),
(131, 'Áo nỉ cổ tròn, dài tay.', 'https://static.zara.net/photos///2023/I/0/2/p/5039/810/800/2/w/750/5039810800_6_1_1.jpg?ts=1694675781376', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\n52% vải cotton\r\n48% vải pôliexte', 'ÁO NỈ VẢI DỆT', 1299000, 5, 1),
(132, 'Áo nỉ cổ tròn, dài tay. Thêu họa tiết trang trí.', 'https://static.zara.net/photos///2023/I/0/3/p/5350/778/933/2/w/750/5350778933_6_1_1.jpg?ts=1691757028659', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\nVẢI CHÍNH\r\n83% vải cotton\r\n17% vải pôliexte\r\nVẢI PHỤ\r\n97% vải cotton\r\n3% elastane', 'ÁO NỈ HỌA TIẾT HÌNH BỨC ẢNH', 629000, 22, 3),
(133, 'Áo nỉ vải pha sợi cotton. Cổ tròn, dài tay. Bo viền bằng len gân.', 'https://static.zara.net/photos///2023/I/0/1/p/5388/453/612/2/w/750/5388453612_6_1_1.jpg?ts=1692341218408', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\nVẢI CHÍNH\r\n65% vải cotton\r\n35% vải pôliexte\r\nVẢI PHỤ\r\n97% vải cotton\r\n3% elastane', 'ÁO NỈ VẢI PHA COTTON PHONG CÁCH MINIMALISM', 629000, 6, 9),
(134, 'Đầm nhung lông có mũ trùm đầu, dài tay. Cổ tay và gấu bo vải gân. In họa tiết BARBIE MATTEL và đính đá trang trí.', 'https://static.zara.net/photos///2023/I/0/3/p/5431/816/712/2/w/750/5431816712_6_1_1.jpg?ts=1696426519566', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\nVẢI CHÍNH\r\n65% vải cotton\r\n35% vải pôliexte\r\nVẢI PHỤ\r\n97% vải cotton\r\n3% elastane\r\nLỚP LÓT\r\n65% vải cotton\r\n35% vải pôliexte', 'ĐẦM NHUNG LÔNG BARBIE MATTEL', 999000, 18, 2),
(135, 'Áo khoác không khóa cài, chất liệu 95% là sợi len. Dài tay. Có hai túi phía trước, túi may viền. Bo viền bằng len gân.', 'https://static.zara.net/photos///2023/I/0/1/p/5755/108/807/2/w/750/5755108807_6_1_1.jpg?ts=1695048050747', 'Để giữ cho áo khoác của bạn sạch sẽ, bạn chỉ cần phơi chúng ở nơi thông thoáng và lau sạch bằng khăn vải hoặc bàn chải chuyên dụng. Quá trình này có lợi hơn cho vải và cũng tránh việc tiêu thụ nước và năng lượng trong quá trình giặt.', 'LỚP NGOÀI\r\n95% len\r\n5% vải poliamit', 'ÁO KHOÁC LEN DÁNG NGẮN', 2999000, 24, 11),
(136, 'Áo nỉ vải kỹ thuật, dáng rộng. Cổ tròn, dài tay, cổ tay có dây rút co giãn để điều chỉnh. Gấu áo điều chỉnh bằng dây rút co giãn hai bên.', 'https://static.zara.net/photos///2023/I/0/2/p/6085/360/105/2/w/750/6085360105_6_1_1.jpg?ts=1689753315883', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\nVẢI CHÍNH\r\n100% vải pôliexte\r\nVẢI PHỤ\r\n95% vải pôliexte\r\n5% elastane', 'ÁO NỈ VẢI KỸ THUẬT HỌA TIẾT KẺ', 1699000, 5, 11),
(137, 'Quần short bermuda vải cotton. Cạp co giãn, điều chỉnh bằng dây rút. Có túi hai bên và một túi đáp phía sau.', 'https://static.zara.net/photos///2023/I/0/2/p/6103/330/505/2/w/750/6103330505_6_1_1.jpg?ts=1689087336022', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\n100% vải cotton\r\nLỚP LÓT\r\n100% vải cotton', 'QUẦN SHORT BERMUDA VẢI HIỆU ỨNG NHĂN', 529000, 3, 3),
(138, 'Áo nỉ dáng rộng, cổ may liền mũ trùm đầu, dài tay. Có một túi kangaroo phía trước. Toàn thân in họa tiết khác màu. Cổ tay và gấu bo vải gân.', 'https://static.zara.net/photos///2023/I/0/2/p/6224/295/420/2/w/750/6224295420_6_1_1.jpg?ts=1696319325917', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\nVẢI CHÍNH\r\n89% vải cotton\r\n11% vải pôliexte\r\nVẢI PHỤ\r\n98% vải cotton\r\n2% elastane\r\nLỚP LÓT\r\n89% vải cotton\r\n11% vải pôliexte', 'ÁO NỈ IN HỌA TIẾT KHÁC MÀU', 1499000, 5, 6),
(139, 'Đầm yếm cổ ngang, có hai dây đeo vai cài khuy bấm. Có túi đáp có nắp ở hai bên.', 'https://static.zara.net/photos///2023/I/0/3/p/6738/597/070/2/w/750/6738597070_6_1_1.jpg?ts=1695653507418', 'Chỉ giặt quần áo khi cần thiết, đôi khi chỉ cần phơi quần áo tại nơi thoáng khí là đủ. Quá trình giặt làm hao mòn dần các loại vải. Bằng cách giảm số lần giặt, chúng ta sẽ kéo dài tuổi thọ của quần áo và giảm lượng nước và năng lượng tiêu thụ trong các quá trình chăm sóc.', 'LỚP NGOÀI\r\n63% vải cotton\r\n34% vải pôliexte\r\n2% len\r\n1% vải thun vitcô\r\nLỚP LÓT\r\n100% vải cotton', 'ĐẦM YẾM VẢI DỆT', 999000, 18, 2),
(140, 'Áo khoác dài cổ chữ V, dài tay. Có các chi tiết viền rách. Cài phía trước bằng khuy cài.', 'https://static.zara.net/photos///2023/I/0/1/p/6771/133/704/2/w/750/6771133704_6_1_1.jpg?ts=1694762852979', 'Để giữ cho áo khoác của bạn sạch sẽ, bạn chỉ cần phơi chúng ở nơi thông thoáng và lau sạch bằng khăn vải hoặc bàn chải chuyên dụng. Quá trình này có lợi hơn cho vải và cũng tránh việc tiêu thụ nước và năng lượng trong quá trình giặt.', 'LỚP NGOÀI\r\n80% vải acrylic\r\n20% vải pôliexte', 'ÁO KHOÁC DÀI DỆT VẶN THỪNG VIỀN RÁCH', 1999000, 9, 4),
(141, 'Quần vải pha sợi viscose, cạp lỡ. Cạp có con đỉa. Có hai túi ở phía trước. Gấu xẻ và cài khóa kéo cùng màu ở bên.', 'https://static.zara.net/photos///2023/I/0/1/p/7149/241/800/2/w/750/7149241800_6_1_1.jpg?ts=1696501298049', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\n62% vải pôliexte\r\n33% vải thun vitcô\r\n5% elastane', 'QUẦN CÓ GẤU CÀI KHÓA KÉO ZW COLLECTION', 1699000, 4, 1),
(142, 'Quần short bermuda cạp co giãn. Có hai túi phía trước và một túi đáp phía sau.', 'https://static.zara.net/photos///2023/I/0/2/p/7484/306/710/2/w/750/7484306710_6_1_1.jpg?ts=1692009212544', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\n62% vải cotton\r\n37% vải pôliexte\r\n1% sợi loại khác', 'QUẦN SHORT BERMUDA VẢI JACQUARD HỌA TIẾT HOA', 1499000, 3, 4),
(143, 'Đầm denim cổ chữ V, dài tay. Đính khuy trang trí phía trước. Kèm thắt lưng để điều chỉnh ở eo. Cài khóa kéo sau lưng. Gấu tua rua.', 'https://static.zara.net/photos///2023/I/0/3/p/7513/700/400/2/w/750/7513700400_6_1_1.jpg?ts=1694509675694', 'Để kéo dài tuổi thọ cho quần áo denim của bạn, hãy luôn lộn trái chúng từ trong ra ngoài và giặt chúng ở nhiệt độ thấp. Cách làm như vậy giúp bảo quản màu sắc và cấu trúc vải, đồng thời giúp làm giảm lượng năng lượng tiêu thụ.', 'LỚP NGOÀI\r\n100% vải cotton', 'ĐẦM CORSET VẢI DENIM', 999000, 18, 6),
(144, 'Áo nỉ vải denim sợi cotton, dáng relaxed fit.  Cổ tròn, cộc tay.  Gấu điều chỉnh bằng khóa kéo bên.  Tay và gấu bo viền bằng vải gân.', 'https://static.zara.net/photos///2023/I/0/2/p/7627/404/406/2/w/750/7627404406_6_1_1.jpg?ts=1687859881539', 'Để kéo dài tuổi thọ cho quần áo denim của bạn, hãy luôn lộn trái chúng từ trong ra ngoài và giặt chúng ở nhiệt độ thấp. Cách làm như vậy giúp bảo quản màu sắc và cấu trúc vải, đồng thời giúp làm giảm lượng năng lượng tiêu thụ.', 'LỚP NGOÀI\r\nVẢI CHÍNH\r\n100% vải cotton\r\nVẢI PHỤ\r\n69% vải cotton\r\n29% vải pôliexte\r\n2% elastane', 'ÁO NỈ DENIM', 1299000, 7, 6),
(145, 'Quần cạp cao, có hai túi phía trước và hai túi giả may viền phía sau. Ống vẩy. Cài phía trước bằng khóa kéo, khuy ẩn và móc kim loại.', 'https://static.zara.net/photos///2023/I/0/1/p/8162/786/942/2/w/750/8162786942_6_1_1.jpg?ts=1691595879580', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'Quần cạp cao, có hai túi phía trước và hai túi giả may viền phía sau. Ống vẩy. Cài phía trước bằng khóa kéo, khuy ẩn và móc kim loại.', 'QUẦN FULL LENGTH ỐNG LOE', 1299000, 4, 10),
(146, 'Quần 27% là sợi viscose, cạp lỡ. Cạp tua rua. Có túi hai bên. Có các chi tiết xếp li phía trước. Ống rộng. Cài bằng khóa kéo.', 'https://static.zara.net/photos///2023/I/0/1/p/8312/333/802/2/w/750/8312333802_6_1_1.jpg?ts=1696496768188', 'Phơi ở nơi thông thoáng và chải quần áo là cách tự nhiên để chăm sóc quần áo mỏng manh của bạn. Nếu cần thiết phải giặt khô, hãy cố gắng tìm những tiệm giặt ủi sử dụng các công nghệ thân thiện với môi trường.', 'LỚP NGOÀI\r\n72% vải pôliexte\r\n27% vải thun vitcô\r\n1% elastane', 'QUẦN MAY LI PHONG CÁCH MINIMALISM ZW COLLECTION', 1999000, 4, 1),
(147, 'Quần cạp cao co giãn. Có hai túi phía trước và hai túi giả có nắp phía sau. Cài phía trước bằng khóa kéo và khuy.', 'https://static.zara.net/photos///2023/I/0/1/p/8372/475/922/2/w/750/8372475922_6_1_1.jpg?ts=1695214652563', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'Quần cạp cao co giãn. Có hai túi phía trước và hai túi giả có nắp phía sau. Cài phía trước bằng khóa kéo và khuy.', 'QUẦN PAPERBAG DÀI ĐẾN MẮT CÁ CHÂN', 999000, 4, 11),
(148, 'Áo nỉ bằng vải cotton hiệu ứng bạc màu. Cổ tròn, dài tay, vai may thấp. Gấu không may viền.', 'https://static.zara.net/photos///2023/I/0/1/p/8417/801/629/2/w/750/8417801629_6_1_1.jpg?ts=1692718546035', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\nVẢI CHÍNH\r\n100% vải cotton\r\nVẢI PHỤ\r\n97% vải cotton\r\n3% elastane', 'ÁO NỈ VẢI NHUNG LÔNG HIỆU ỨNG BẠC MÀU', 729000, 6, 9),
(149, 'Quần short bermuda vải cotton, dáng regular fit. Có hai túi phía trước và hai túi may viền phía sau. Cài khóa kéo và khuy phía trước.', 'https://static.zara.net/photos///2023/I/0/2/p/8727/306/710/2/w/750/8727306710_6_1_1.jpg?ts=1689087339137', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\n98% vải cotton\r\n2% elastane', 'QUẦN SHORT CHINO VẢI COTTON', 999000, 3, 4),
(150, 'Quần short bermuda dáng regular fit, chất liệu vải cotton co giãn. Có hai túi phía trước và hai túi may viền phía sau. Cài khóa kéo và khuy phía trước.', 'https://static.zara.net/photos///2023/I/0/2/p/9252/355/445/2/w/750/9252355445_6_1_1.jpg?ts=1689087329717', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\n98% vải cotton\r\n2% elastane', 'QUẦN SHORT BERMUDA DÁNG CHINO VẢI DỆT', 999000, 3, 2),
(151, 'Áo nỉ dài tay, có mũ trùm đầu. Bo viền bằng vải gân. Có một túi kangaroo ở phía trước. Đính nhãn trang trí ở gấu. Họa tiết NBA.', 'https://static.zara.net/photos///2023/I/0/3/p/9805/762/084/2/w/750/9805762084_6_1_1.jpg?ts=1696254861642', 'Giặt ở nhiệt độ thấp và sử dụng các chế độ vắt nhẹ nhàng sẽ có lợi hơn cho quần áo, giúp duy trì màu sắc, hình dạng và cấu trúc của vải.', 'LỚP NGOÀI\r\nKIỂU BODY\r\n60% vải cotton\r\n40% vải pôliexte\r\nVẢI PHỤ\r\n98% vải cotton\r\n2% elastane\r\nLỚP LÓT\r\n60% vải cotton\r\n40% vải pôliexte', 'ÁO NỈ NBA', 849000, 22, 1),
(152, '- Khóa kéo trước cùng màu với vải giúp tạo kiểu dễ dàng hơn.\r\n- Vải với độ co giãn đáng kinh ngạc giúp vận động dễ dàng.\r\n- Mềm mại và thoải mái.\r\n- Với công nghệ DRY.', 'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/450693/item/goods_03_450693.jpg?width=750', 'Giặt máy nước lạnh, giặt nhẹ, Không giặt khô', 'Thân: Lớp Lót Mũ Trùm: 48% Bông, 47% Polyeste, 5% Elastan/ Bo: 80% Bông, 20% Polyeste/ Vải Túi: Lớp Ngoài: 100% Polyeste/ Lớp Trong: 48% Bông, 47% Polyeste, 5% Elastan.', 'Áo Khoác Nỉ Siêu Co Giãn Dry Có Mũ Kéo Khóa Dài Tay', 489000, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_size`
--

CREATE TABLE `product_size` (
  `product_id` bigint(20) NOT NULL,
  `size_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_size`
--

INSERT INTO `product_size` (`product_id`, `size_id`) VALUES
(2, 2),
(2, 3),
(2, 4),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(4, 21),
(4, 22),
(4, 23),
(4, 24),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(6, 2),
(6, 3),
(6, 4),
(7, 1),
(7, 2),
(8, 1),
(8, 2),
(8, 4),
(9, 2),
(9, 3),
(9, 4),
(9, 5),
(9, 6),
(10, 1),
(10, 2),
(10, 6),
(11, 1),
(11, 3),
(11, 4),
(12, 1),
(13, 2),
(13, 4),
(13, 5),
(14, 2),
(14, 3),
(15, 1),
(15, 2),
(15, 3),
(15, 4),
(16, 11),
(16, 12),
(16, 13),
(16, 14),
(16, 15),
(17, 11),
(17, 12),
(17, 13),
(17, 14),
(17, 15),
(18, 2),
(18, 3),
(18, 4),
(18, 5),
(18, 6),
(19, 12),
(19, 13),
(19, 14),
(19, 15),
(20, 21),
(20, 22),
(20, 24),
(20, 25),
(21, 23),
(22, 21),
(22, 22),
(22, 23),
(22, 24),
(22, 25),
(23, 21),
(23, 22),
(23, 23),
(24, 21),
(24, 23),
(24, 24),
(24, 25),
(24, 26),
(25, 21),
(25, 22),
(25, 23),
(25, 24),
(26, 21),
(26, 22),
(26, 23),
(26, 24),
(26, 25),
(27, 21),
(27, 22),
(27, 23),
(27, 24),
(27, 25),
(28, 21),
(28, 22),
(28, 23),
(28, 24),
(28, 25),
(29, 21),
(29, 22),
(29, 23),
(29, 24),
(29, 25),
(30, 2),
(30, 3),
(31, 1),
(31, 3),
(31, 4),
(32, 1),
(32, 2),
(32, 3),
(32, 4),
(33, 1),
(33, 2),
(33, 3),
(33, 5),
(34, 1),
(34, 2),
(34, 3),
(34, 4),
(34, 5),
(34, 6),
(35, 3),
(35, 4),
(36, 3),
(36, 4),
(36, 5),
(37, 1),
(37, 2),
(37, 3),
(37, 4),
(38, 2),
(38, 3),
(38, 5),
(39, 3),
(39, 5),
(39, 6),
(40, 1),
(40, 2),
(40, 3),
(40, 4),
(40, 5),
(40, 6),
(41, 2),
(41, 3),
(41, 4),
(42, 2),
(43, 1),
(43, 2),
(43, 3),
(43, 4),
(43, 5),
(44, 11),
(44, 12),
(44, 14),
(44, 17),
(45, 3),
(45, 4),
(45, 5),
(46, 1),
(46, 2),
(47, 1),
(47, 2),
(47, 3),
(47, 4),
(47, 5),
(48, 2),
(48, 3),
(48, 4),
(49, 2),
(49, 3),
(49, 4),
(50, 12),
(50, 13),
(50, 15),
(51, 1),
(51, 2),
(51, 3),
(51, 4),
(51, 5),
(51, 6),
(51, 7),
(52, 1),
(52, 2),
(53, 1),
(53, 2),
(53, 4),
(53, 5),
(54, 14),
(54, 15),
(54, 16),
(55, 1),
(55, 4),
(56, 2),
(56, 3),
(56, 5),
(57, 3),
(57, 6),
(58, 6),
(59, 5),
(60, 2),
(60, 3),
(60, 4),
(60, 5),
(61, 2),
(61, 3),
(61, 4),
(62, 2),
(62, 3),
(62, 4),
(63, 2),
(63, 4),
(64, 4),
(64, 7),
(65, 1),
(65, 2),
(65, 3),
(65, 4),
(65, 5),
(65, 6),
(66, 1),
(66, 2),
(66, 3),
(66, 4),
(67, 2),
(67, 3),
(68, 1),
(68, 3),
(68, 4),
(68, 6),
(69, 2),
(69, 3),
(70, 2),
(70, 3),
(70, 4),
(71, 3),
(71, 4),
(72, 21),
(72, 22),
(72, 23),
(72, 24),
(73, 21),
(73, 22),
(73, 23),
(73, 24),
(73, 25),
(74, 2),
(74, 3),
(74, 4),
(74, 5),
(75, 1),
(75, 2),
(75, 3),
(75, 4),
(75, 5),
(76, 1),
(76, 2),
(76, 3),
(76, 4),
(76, 5),
(76, 6),
(77, 1),
(77, 2),
(77, 3),
(78, 22),
(78, 23),
(78, 24),
(79, 3),
(79, 4),
(80, 3),
(80, 5),
(80, 6),
(81, 2),
(81, 3),
(82, 4),
(83, 2),
(83, 3),
(83, 4),
(84, 1),
(84, 2),
(84, 3),
(84, 4),
(84, 5),
(85, 1),
(85, 3),
(85, 4),
(86, 1),
(86, 2),
(86, 3),
(87, 2),
(87, 3),
(87, 5),
(88, 4),
(89, 21),
(89, 22),
(89, 23),
(89, 24),
(89, 25),
(90, 21),
(90, 22),
(90, 24),
(90, 25),
(90, 26),
(91, 1),
(91, 3),
(91, 5),
(91, 6),
(92, 2),
(92, 4),
(93, 1),
(93, 2),
(93, 3),
(93, 4),
(93, 5),
(94, 2),
(94, 3),
(94, 4),
(94, 5),
(94, 6),
(95, 4),
(95, 6),
(96, 6),
(97, 2),
(97, 3),
(97, 4),
(97, 5),
(98, 3),
(98, 4),
(99, 4),
(100, 2),
(100, 3),
(101, 2),
(101, 3),
(102, 4),
(103, 2),
(103, 3),
(103, 4),
(103, 5),
(103, 6),
(104, 2),
(104, 4),
(105, 2),
(105, 3),
(105, 4),
(105, 5),
(106, 3),
(106, 4),
(106, 5),
(107, 22),
(107, 23),
(107, 25),
(107, 26),
(108, 21),
(108, 22),
(108, 23),
(108, 24),
(109, 22),
(109, 23),
(109, 24),
(109, 25),
(110, 2),
(110, 3),
(111, 4),
(111, 5),
(112, 1),
(112, 2),
(112, 3),
(113, 22),
(113, 23),
(113, 25),
(114, 22),
(114, 24),
(114, 26),
(115, 23),
(115, 25),
(116, 23),
(116, 25),
(117, 2),
(117, 3),
(117, 5),
(118, 2),
(118, 3),
(118, 4),
(118, 5),
(119, 2),
(119, 3),
(120, 2),
(120, 3),
(120, 4),
(121, 2),
(121, 3),
(122, 3),
(122, 4),
(122, 5),
(123, 22),
(123, 23),
(123, 24),
(124, 22),
(124, 23),
(124, 24),
(124, 25),
(124, 26),
(125, 2),
(125, 4),
(126, 2),
(126, 4),
(127, 3),
(127, 4),
(128, 22),
(128, 23),
(128, 24),
(128, 26),
(129, 3),
(129, 4),
(129, 5),
(130, 2),
(130, 3),
(131, 2),
(131, 3),
(131, 4),
(131, 5),
(132, 23),
(132, 24),
(132, 25),
(133, 2),
(133, 3),
(134, 23),
(134, 24),
(134, 25),
(134, 26),
(135, 3),
(136, 2),
(136, 3),
(136, 4),
(136, 5),
(137, 3),
(137, 5),
(138, 2),
(138, 3),
(138, 4),
(139, 21),
(139, 22),
(139, 24),
(140, 2),
(140, 3),
(140, 4),
(141, 1),
(141, 2),
(142, 2),
(142, 3),
(142, 5),
(142, 6),
(143, 23),
(143, 24),
(143, 25),
(143, 26),
(144, 2),
(144, 3),
(144, 5),
(145, 1),
(145, 3),
(145, 4),
(145, 5),
(146, 2),
(146, 3),
(147, 1),
(147, 2),
(147, 3),
(147, 4),
(148, 2),
(148, 4),
(149, 2),
(149, 3),
(149, 4),
(149, 5),
(150, 3),
(150, 4),
(151, 22),
(151, 23),
(151, 24),
(151, 26),
(152, 21),
(152, 22),
(152, 23),
(152, 24);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` bigint(20) NOT NULL,
  `rolename` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `rolename`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_MODERATOR'),
(3, 'ROLE_USER');

-- --------------------------------------------------------

--
-- Table structure for table `size`
--

CREATE TABLE `size` (
  `size_id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `size`
--

INSERT INTO `size` (`size_id`, `name`) VALUES
(1, 'XS'),
(2, 'S'),
(3, 'M'),
(4, 'L'),
(5, 'XL'),
(6, '2XL'),
(7, '3XL'),
(11, '27inch'),
(12, '28inch'),
(13, '29inch'),
(14, '30inch'),
(15, '31inch'),
(16, '32inch'),
(17, '33inch'),
(18, '34inch'),
(19, '35inch'),
(21, '4-5Y'),
(22, '6-7Y'),
(23, '8-9Y'),
(24, '10-11Y'),
(25, '12-13Y'),
(26, '14Y');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `user_status` bit(1) DEFAULT NULL,
  `provide_id` varchar(255)  DEFAULT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `created`, `email`, `password`, `phone`, `user_status`, `username`) VALUES
(1, '2023-10-24 00:00:00.000000', 'trung@gmail.com', '$2a$10$5M7HgGn2Q1qbu1FkIJvJ1eo8MfMK5mhPO6MsbthON6KIcVYNR4WGm', '0326496229', b'1', 'admin'),
(2, '2023-11-13 00:00:00.000000', 'anhtrung@gmail.com', '$2a$10$N5tarJPcirbuVSXPGKhkn.sXRLG/oCybIKlMbGac/n93pG6vw5jCm', '0326496229', b'1', 'trung');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKjcyd5wv4igqnw413rgxbfu4nv` (`product_id`),
  ADD KEY `FKjnaj4sjyqjkr4ivemf9gb25w` (`user_id`),
  ADD KEY `FK27btch34nojjlgacglak3yyap` (`size_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKs2ride9gvilxy2tcuv7witnxc` (`parent_category_id`);

--
-- Indexes for table `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKr5l1vt9npeu6cx6jekmpaf0ii` (`status_id`),
  ADD KEY `FKcpl0mjoeqhxvgeeeq5piwpd3i` (`user_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKs234mi6jususbx4b37k44cipy` (`order_id`),
  ADD KEY `FK551losx9j75ss5d6bfsqvijna` (`product_id`),
  ADD KEY `FK8klnbu469mgjnuybpa6lbkljo` (`size_id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`),
  ADD KEY `FK7j8aci4xn0sahyhxk0fvqql6e` (`color_id`);

--
-- Indexes for table `product_size`
--
ALTER TABLE `product_size`
  ADD PRIMARY KEY (`product_id`,`size_id`),
  ADD KEY `FKnlkh5xcjuopsnoimdvmumioia` (`size_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`size_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`),
  ADD UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart_item`
--
ALTER TABLE `cart_item`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `color`
--
ALTER TABLE `color`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `size`
--
ALTER TABLE `size`
  MODIFY `size_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD CONSTRAINT `FK27btch34nojjlgacglak3yyap` FOREIGN KEY (`size_id`) REFERENCES `size` (`size_id`),
  ADD CONSTRAINT `FKjcyd5wv4igqnw413rgxbfu4nv` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FKjnaj4sjyqjkr4ivemf9gb25w` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `FKs2ride9gvilxy2tcuv7witnxc` FOREIGN KEY (`parent_category_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FKcpl0mjoeqhxvgeeeq5piwpd3i` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKr5l1vt9npeu6cx6jekmpaf0ii` FOREIGN KEY (`status_id`) REFERENCES `order_status` (`id`);

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `FK551losx9j75ss5d6bfsqvijna` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK8klnbu469mgjnuybpa6lbkljo` FOREIGN KEY (`size_id`) REFERENCES `size` (`size_id`),
  ADD CONSTRAINT `FKs234mi6jususbx4b37k44cipy` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FK7j8aci4xn0sahyhxk0fvqql6e` FOREIGN KEY (`color_id`) REFERENCES `color` (`id`);

--
-- Constraints for table `product_size`
--
ALTER TABLE `product_size`
  ADD CONSTRAINT `FK8i3jm2ctt0lsyeik2wt76yvv0` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FKnlkh5xcjuopsnoimdvmumioia` FOREIGN KEY (`size_id`) REFERENCES `size` (`size_id`);

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
