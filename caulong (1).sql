-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2025 at 10:17 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `caulong`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `quantity`, `created_at`) VALUES
(10, 5, 11, 1, '2025-05-20 08:06:29'),
(94, 11, 5, 1, '2025-05-28 08:06:57'),
(95, 11, 2, 2, '2025-05-28 08:06:57'),
(102, 13, 3, 2, '2025-05-28 10:26:57'),
(148, 15, 2, 1, '2025-06-06 08:00:44'),
(149, 15, 6, 1, '2025-06-06 08:00:44'),
(151, 16, 1, 1, '2025-06-06 08:03:23');

-- --------------------------------------------------------

--
-- Table structure for table `chi_tiet_don_hang`
--

CREATE TABLE `chi_tiet_don_hang` (
  `id` int(11) NOT NULL,
  `don_hang_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `so_luong` int(11) NOT NULL,
  `don_gia` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chi_tiet_don_hang`
--

INSERT INTO `chi_tiet_don_hang` (`id`, `don_hang_id`, `product_id`, `so_luong`, `don_gia`) VALUES
(4, 4, 5, 1, 590000.00),
(5, 5, 38, 1, 142500.00),
(9, 9, 2, 1, -99999999.99),
(10, 10, 10, 1, 3800000.00),
(11, 11, 1, 1, 1500000.00),
(12, 12, 1, 1, 1500000.00),
(13, 12, 2, 1, -99999999.99),
(14, 12, 10, 1, 3800000.00),
(15, 13, 6, 6, 620000.00),
(16, 14, 1, 1, 1500000.00),
(17, 15, 2, 1, 400000.00),
(18, 16, 1, 1, 1500000.00);

-- --------------------------------------------------------

--
-- Table structure for table `don_hang`
--

CREATE TABLE `don_hang` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `sdt` varchar(20) DEFAULT NULL,
  `dia_chi` varchar(255) DEFAULT NULL,
  `ngay_dat` timestamp NOT NULL DEFAULT current_timestamp(),
  `trang_thai` varchar(50) DEFAULT 'Chờ xử lý',
  `tong_tien` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `don_hang`
--

INSERT INTO `don_hang` (`id`, `user_id`, `username`, `sdt`, `dia_chi`, `ngay_dat`, `trang_thai`, `tong_tien`) VALUES
(4, 11, 'chuong', '123456', 'trocuavinh', '2025-05-23 17:12:01', 'Đã giao', 590000.00),
(5, 10, 'gun', '0399167895', 'phuyen', '2025-05-23 17:16:38', 'Chờ xử lý', 142500.00),
(9, 13, 'thien', '0321456789', 'phucat', '2025-05-28 07:17:38', 'Đã giao', -99999999.99),
(10, 13, 'thien', '0321456789', 'phucat', '2025-05-28 07:21:50', 'Chờ xử lý', 3800000.00),
(11, 13, 'thien', '0321456789', 'phucat', '2025-05-28 09:16:04', 'Chờ xử lý', 1500000.00),
(12, 15, 'myhoi', '0999999999', '12345', '2025-05-28 16:29:05', 'Chờ xử lý', -99999999.99),
(13, 15, 'myhoi', '0999999999', '12345', '2025-05-29 02:40:27', 'Chờ xử lý', 3720000.00),
(14, 15, 'myhoi', '0999999999', '12345', '2025-06-02 08:46:49', 'Chờ xử lý', 1500000.00),
(15, 15, 'myhoi', '0999999999', '12345', '2025-06-04 18:57:27', 'Chờ xử lý', 400000.00),
(16, 18, 'myhoiii', '0328175565', '142 Tran Luong', '2025-06-06 08:14:34', 'Chờ xử lý', 1500000.00);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `sao` int(1) NOT NULL,
  `noi_dung` text DEFAULT NULL,
  `ngay` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `user_id`, `sao`, `noi_dung`, `ngay`) VALUES
(1, 11, 4, 'Shop nhu c', '2025-05-23 17:42:01');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `published_date` date DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `summary` text DEFAULT NULL,
  `thumbnail` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `url`, `author`, `published_date`, `content`, `summary`, `thumbnail`) VALUES
(1, 'Ra mắt BST giày Lining cùng đại sứ Issiac', 'https://lining.com.vn/blogs/news/ra-mat-bst-giay-li-ning-soft-cung-dai-su-isaac-khoi-bat-chat-rieng', 'Li-Ning Team', '2024-11-15', '<p>Li-Ning Soft - Sự kết hợp hoàn hảo giữa phong cách thời trang và công nghệ êm ái vượt trội. Hãy cùng Đại sứ thương hiệu Li-Ning - Nam ca sĩ Isaac \"nâng tầm\" phong cách và \"bùng nổ\" chất riêng với Li-Ning Soft!</p>\r\n<img src=\"//file.hstatic.net/1000312752/file/kv_900_x_900_c4a39a12957e4dbcb26764cec556acde_grande.png\">\r\n<ul><li>Cạ cứng cho mọi outfit với thiết kế trendy, đa màu sắc</li><li>Công nghệ “hạng A” giúp bảo vệ chân tối ưu, giúp bạn tận hưởng từng bước chân nhẹ êm như bay</li><li>Chất liệu cao cấp, êm ái, thoáng khí, mang lại cảm giác thoải mái tối ưu cho mọi hoạt động.</li></ul><p>Li-Ning Soft - “Must-have item” để bạn tự tin tỏa sáng với phong cách riêng!</p><p>Đặc biệt, Li-Ning còn có quà tặng hấp dẫn lên đến 677K khi mua 01 đôi giày SOFT. Còn chờ gì nữa mà không đến store Li-Ning gần nhất để “cheap-moment” với Đại sứ Isaac!</p>\r\n<p>#LiNing #LiNingVietnam #LiNingSOFT #SOFT</p>\r\n<img src=\"https://file.hstatic.net/1000312752/file/posm-softt__2__cc547b656494470fb2ee90650298e12d_grande.png\">\r\n<p>Website: <a href = \"https://lining.com.vn/\">https://lining.com.vn/</a></p>\r\n\r\n<p>Hệ thống cửa hàng: <a href = \"https://lining.com.vn/pages/he-thong-cua-hang-2\">https://lining.com.vn/pages/he-thong-cua-hang-2</a></p>', 'Li-Ning ra mắt BST giày Soft kết hợp công nghệ êm ái và phong cách thời trang hiện đại cùng đại sứ thương hiệu Isaac.', 'https://file.hstatic.net/1000312752/file/kv_900_x_900_c4a39a12957e4dbcb26764cec556acde_grande.png'),
(2, 'Thùy Linh thắng cựu số 1 thế giới ở giải Malaysia', 'https://vnexpress.net/thuy-linh-thang-cuu-so-1-the-gioi-o-giai-malaysia-4888731.html', 'Đức Đồng', '2025-05-21', '<p>MalaysiaTay vợt nữ số một Việt Nam Nguyễn Thuỳ Linh ra quân suôn sẻ ở giải Malaysia Masters, khi đánh bại Pusarla Venkata Sindhu (Ấn Độ) 2-1, trưa 21/5.</p>\r\n\r\n<p>Thùy Linh hiện đứng thứ 26 thế giới, kém Sindhu 10 bậc. Tay vợt Ấn Độ từng vô địch thế giới năm 2019, lên số một thế giới, giành HC bạc Olympic 2016 và HC đồng Olympic 2020. Nhưng ở lần chạm trán gần nhất hồi tháng 1 ở Indonesia Masters, Thùy Linh thắng 22-20, 21-12.</p>\r\n\r\n<p>Tái đấu hôm nay, Thùy Linh nhập cuộc đầy tự tin và liên tiếp dẫn trước, trước khi bị gỡ 6-6. Nhưng tay vợt người Phú Thọ không đánh mất thế trận mà bình tĩnh chắt chiu các pha cầu bền để ghi liền 6 điểm, dẫn lại 12-6. Khi tay vợt Việt Nam tăng tốc, tượng đài quần vợt Ấn Độ lại lúng túng, mắc nhiều lỗi đánh hỏng. Do đó, Thùy Linh dẫn 17-7 rồi thắng 21-11.</p>\r\n\r\n<img src =\"https://i1-thethao.vnecdn.net/2025/05/21/498972330-1011888404482455-398-8088-1789-1747803864.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=DWOkFRz2CkX5T24ic2fRwQ\">\r\n<p>Thùy Linh ăn mừng sau khi đánh bại Pusarla Venkata Sindhu (Ấn Độ) 2-1, trưa 21/5. Ảnh: Zyy</p>\r\n\r\n<p>Ở thế nguy hiểm, Sindhu vùng lên đầu set hai, liên tiếp ghi điểm. Cô dẫn 6-0 trước khi bị Thùy Linh rút ngắn còn 5-6. Nhưng với bản lĩnh của mình, Sindhu hóa giải các pha cầu khó của tay vợt Việt Nam, đồng thời điều cầu cuối sân chính xác đẩy lùi Thùy Linh ra sâu rồi dứt điểm trên lưới. Sindhu dẫn 14-12 rồi 19-12 trước khi thắng 21-14, đưa trận đấu vào set 3.</p>\r\n\r\n<p>Dù cả hai xuống sức, Thùy Linh tỏ ra quyết tâm cao hơn. Cô giữ ưu thế và thường ghi điểm sau các pha cầu giằng co. Đại diện Việt Nam dẫn 8-6 rồi 13-6 để tạo cách biệt an toàn. Sindhu nỗ lực đảo ngược tình thế, nhưng không kịp. Thùy Linh dẫn 19-14 rồi tiến tới điểm thắng 21-15 để vào vòng 2.</p>\r\n\r\n<p>Đối thủ tiếp theo của Thùy Linh là người thắng trong cặp đấu giữa Tidapron (Thái Lan, 80 thế giới) với Line (Đan Mạch, 35 thế giới).</p>\r\n\r\nMalaysia Masters 2025 thuộc hệ thống super 500 của Liên đoàn cầu lông thế giới, diễn ra tại Axiata Arena, Kuala Lumpur từ ngày 20 đến 25/5 với tổng giải thưởng là 475.000 USD. Ngoài Thùy Linh, Việt Nam còn có hai tay vợt nam là Lê Đức Phát, Nguyễn Hải Đăng tham dự. Trong đó, Hải Đăng đã đánh bại Đức Phát 2-0 ở vòng bảng để ghi tên vào vòng chính. Hải Đăng sẽ gặp Yushi Tanaka (Nhật Bản, số 23 thế giới) ở vòng tiếp theo.\r\n\r\nThùy Linh sinh ngày 20/11/1997 tại Phú Thọ. Cô thi đấu chuyên nghiệp năm 14 tuổi, và rồi mất thêm 4 năm để vô địch giải các tay vợt xuất sắc toàn quốc 2015. Từ 2018, Thùy Linh là tay vợt nữ số một Việt Nam, với 7 lần liên tiếp vô địch giải cầu lông cá nhân quốc gia. Cô còn ba lần liên tiếp vô địch Vietnam Open, từ 2022.\r\n\r\nThùy Linh cũng từng dự Olympic Tokyo 2020 và Paris 2024. Cô hiện xếp thứ 29 thế giới nội dung đơn nữ.\r\n\r\n', 'Tay vợt Việt Nam Nguyễn Thùy Linh thắng ngược đối thủ Đan Mạch - Line Christophersen 2-1 ở vòng hai giải Malaysia Masters 500 trưa 22/5.', 'https://i1-thethao.vnecdn.net/2025/05/22/499568967-1012669111071051-342-5238-4197-1747896723.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=_VJT7QyfIbZi2c6aXUIeYQ'),
(3, 'Top mẫu giày cầu lông 2025 đáng mua nhất hiện nay', 'https://mira.vn/top-mau-giay-cau-long-2025-dang-mua-nhat-hien-nay', 'Chuongw Phajm', '2025-05-25', '<p>Cầu lông là môn thể thao đòi hỏi sự di chuyển linh hoạt, phản xạ nhanh và sức bật tốt. Vì thế, việc chọn một đôi giày cầu lông chuyên dụng, phù hợp với bàn chân và lối chơi là điều vô cùng quan trọng. Giày tốt giúp bảo vệ cổ chân, hạn chế chấn thương, tăng độ bám sân và nâng cao hiệu suất thi đấu.</p>\r\n\r\n \r\n\r\n<p>Dưới đây là những mẫu giày cầu lông nổi bật nhất năm 2025, đang được giới vận động viên và người chơi phong trào ưa chuộng.</p>\r\n \r\n\r\n<h3>MIRA WARRIOR 2025 – Đôi giày của sự bền bỉ</h3>\r\n<img width = 600px src =\"https://mira.vn/upload/images/Screen%20Shot%202025-05-03%20at%2017_33_44.png\">\r\n\r\n<h4>Đặc điểm nổi bật:</h4>\r\n\r\n<ul>\r\n<li>Upper dày và chắc chắn, chống mài mòn.</li>\r\n<li>Đế EVA kết hợp đệm lót hấp thụ lực cực tốt.</li>\r\n<li>Heel counter cố định gót – chống lật cổ chân hiệu quả.</li>\r\n<li>Thiết kế mạnh mẽ, phù hợp với người có lối chơi thiên về sức mạnh.</li>\r\n</ul>\r\n<strong>Điểm mạnh:</strong> Giày rất bền, hỗ trợ cổ chân tốt, phù hợp cả luyện tập và thi đấu.\r\n\r\n \r\n\r\n<h3>Yonex Power Cushion 65Z3 2025 – Công nghệ giảm chấn hàng đầu</h3>\r\n<img width = 600px src =\"https://mira.vn/upload/images/Screen%20Shot%202025-05-03%20at%2017_34_22.png\">\r\n<h4>Đặc điểm nổi bật:</h4>\r\n<ul>\r\n<li>Power Cushion+ hấp thụ sốc, trả lại lực nhanh.</li>\r\n<li>Đế ngoài tròn – giúp xoay trở linh hoạt hơn.</li>\r\n<li>Form giày chuẩn thi đấu quốc tế, được nhiều VĐV sử dụng.</li>\r\n<li>Kiểu dáng thể thao, bắt mắt.</li>\r\n<strong>Điểm mạnh:</strong> Giảm chấn tốt, chơi lâu không đau chân, độ bám cực cao.\r\n\r\n\r\n<h3>MIRA LIGHTER – Đối thủ đáng gờm trong phân khúc giá rẻ</h3>\r\n<img width = 600px src = \"https://mira.vn/upload/images/Screen%20Shot%202025-05-03%20at%2017_33_53.png\">\r\n\r\n<h4>Đặc điểm nổi bật:</h4>\r\n\r\n<ul>\r\n<li>Thiết kế tối giản nhưng tinh tế.</li>\r\n<li>Upper bền, dễ vệ sinh – phù hợp học sinh, sinh viên.</li>\r\n<li>Đế cao su tổng hợp đàn hồi – chơi tốt trên cả sân gạch và sân thảm.</li>\r\n</ul>\r\n<strong>Điểm mạnh:</strong> Giá phải chăng, chất lượng vượt mong đợi trong phân khúc phổ thông.\r\n\r\n\r\n<h3>Tiêu chí chọn giày cầu lông năm 2025</h3>\r\n \r\n\r\n<p>Khi chọn mua giày cầu lông, bạn nên lưu ý:</p>\r\n\r\n<ul>\r\n<li>Form giày ôm chân: Tránh bị trượt bên trong khi di chuyển.</li>\r\n<li>Chống sốc – giảm chấn: Giúp chơi lâu mà không đau bàn chân hay đầu gối.</li>\r\n<li>Bám sân tốt: Nhất là khi chơi trên mặt sân gạch hoặc thảm cũ.</li>\r\n<li>Thoáng khí: Hạn chế mùi và đổ mồ hôi.</li>\r\n</ul>\r\n\r\n<p>Năm 2025, thị trường giày cầu lông có rất nhiều lựa chọn chất lượng, phù hợp mọi phong cách chơi – từ nhẹ, linh hoạt cho đến bền, hỗ trợ lực. Hãy chọn cho mình một đôi giày phù hợp với thể trạng, ngân sách và mục tiêu tập luyện để cải thiện hiệu suất thi đấu tốt nhất.</p>', 'Những mẫu giày cầu lông nổi bật nhất năm 2025 và tiêu chí chọn giày phù hợp', 'https://mira.vn/upload/images/Screen%20Shot%202025-05-03%20at%2017_33_44.png');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `ten_san_pham` varchar(100) NOT NULL,
  `soluong` int(11) DEFAULT NULL,
  `Loại` int(11) NOT NULL,
  `mo_ta` text DEFAULT NULL,
  `gia` decimal(10,2) NOT NULL,
  `Giamgia` int(11) NOT NULL,
  `hinh_anh` varchar(255) NOT NULL,
  `luot_mua` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `ten_san_pham`, `soluong`, `Loại`, `mo_ta`, `gia`, `Giamgia`, `hinh_anh`, `luot_mua`) VALUES
(1, 'Áo cầu lông Yonex', 4, 1, 'Áo cầu lông Yonex thiết kế đế chống trượt, phù hợp với các vận động viên chuyên nghiệp.', 1500000.00, 0, 'ao.webp', 5),
(2, 'Áo cầu lông Li-Ning', 3, 1, 'Áo cầu lông Li-Ning thoáng khí, phù hợp cho các vận động viên', 600000.00, 400000, 'ao1.jpg', 6),
(3, 'Áo cầu lông Yonex 1', 4, 1, 'Áo cầu lông Yonex với chất liệu thoáng khí, giúp bạn vận động thoải mái.', 550000.00, 0, 'ao2.jpg', 4),
(4, 'Vợt cầu lông Victor 2', 14, 2, 'Áo cầu lông Victor siêu nhẹ, dễ dàng vận động, phù hợp cho các giải đấu.', 580000.00, 0, 'caulong.webp', 1),
(5, 'Giày cầu lông Adidas ', 15, 3, 'Áo cầu lông Adidas, thiết kế thời trang, chất liệu thấm hút mồ hôi tốt.', 590000.00, 0, 'giay.jpg', 5),
(6, 'Áo cầu lông Li-Ning 4', 4, 1, 'Áo cầu lông Li-Ning với thiết kế hiện đại, thoáng mát, sử dụng cho các môn thể thao.', 620000.00, 0, 'ao3.jpg', 6),
(8, 'Áo cầu lông Yonex 6', 9, 1, 'Áo cầu lông Yonex với công nghệ chống mồ hôi, mang lại sự thoải mái khi thi đấu.', 560000.00, 400000, 'ao4.jpg', 1),
(9, 'Áo cầu lông Victor 8', 7, 1, 'Áo cầu lông Victor phù hợp cho các trận đấu căng thẳng, với chất liệu thoáng khí.', 570000.00, 0, 'ao5.jpg', 3),
(10, 'Vợt cầu lông Victor Thruster K 12', 9, 2, 'Vợt cầu lông với sức mạnh vượt trội, phù hợp cho người chơi tấn công.', 3800000.00, 0, 'vot1.jpg', 6),
(11, 'Vợt cầu lông Lining Turbo X90', 15, 2, 'Vợt cầu lông bền bỉ, phù hợp cho người chơi phong trào.', 2500000.00, 0, 'vot2.jpg', 0),
(12, 'Vợt cầu lông Mizuno JPX 8.1', 14, 2, 'Vợt cầu lông nhẹ, linh hoạt, phù hợp cho người chơi kiểm soát.', 3200000.00, 0, 'vot3.jpg', 1),
(15, 'Giày cầu lông Yonex Power Cushion 65Z3', 10, 3, 'Giày cầu lông với công nghệ giảm chấn tiên tiến.', 2800000.00, 2490000, 'giay1.jpg', 0),
(16, 'Giày cầu lông Victor A960', 15, 3, 'Giày cầu lông bám sân tốt, hỗ trợ di chuyển linh hoạt.', 2600000.00, 0, 'giay2.jpg', 0),
(19, 'Vợt cầu lông Yonex Astrox 100ZZ', 15, 2, 'Vợt cầu lông cao cấp dành cho người chơi chuyên nghiệp.', 4500000.00, 0, 'vot4.jpg', 0),
(20, 'Giày Nike Air Max', 10, 3, 'Giày chạy bộ nhẹ, êm ái.', 2200000.00, 10, 'giay3.jpg', 0),
(21, 'Giày Adidas Ultraboost', 15, 3, 'Giày thể thao chuyên dụng cao cấp.', 2500000.00, 15, 'giay4.jpg', 0),
(22, 'Giày Puma Ignite', 12, 3, 'Thiết kế năng động, phù hợp mọi hoạt động.', 1800000.00, 5, 'giay5.jpg', 0),
(23, 'Giày Asics Gel Kayano', 15, 3, 'Giày hỗ trợ chạy đường dài.', 2700000.00, 20, 'giay6.jpg', 0),
(24, 'Giày Mizuno Wave Rider', 15, 3, 'Bền bỉ, ôm chân tốt.', 2300000.00, 0, 'giay7.jpg', 0),
(25, 'Giày New Balance 1080', 15, 3, 'Thoải mái, phong cách hiện đại.', 2400000.00, 8, 'giay8.jpg', 0),
(26, 'Áo Nike Dri-FIT', 10, 1, 'Áo thun thể thao thấm hút mồ hôi.', 550000.00, 10, 'ao6.jpg', 0),
(27, 'Áo Adidas Training', 10, 1, 'Áo tập luyện chất lượng cao.', 600000.00, 12, 'ao7.jpg', 0),
(28, 'Áo Under Armour HeatGear', 10, 1, 'Vải nhẹ, co giãn, thoáng khí.', 500000.00, 5, 'nu.jpg', 0),
(29, 'Vợt Yonex Astrox 99', 15, 2, 'Vợt cầu lông cho người chơi chuyên nghiệp.', 3100000.00, 15, 'vot5.jpg', 0),
(30, 'Vợt Wilson Pro Staff', 15, 2, 'Vợt tennis kiểm soát tốt.', 4500000.00, 10, 'vot6.jpg', 0),
(31, 'Vợt Lining Turbo X90', 0, 2, 'Cân bằng giữa sức mạnh và điều khiển.', 2900000.00, 8, 'vot7.jpg', 0),
(32, 'Vợt Babolat Pure Drive', 15, 2, 'Công nghệ tối ưu hóa độ xoáy.', 4200000.00, 5, 'vot8.jpg', 0),
(33, 'Băng quấn tay', 30, 4, 'Hỗ trợ cổ tay khi vận động.', 120000.00, 0, 'bangtay.jpg', 0),
(34, 'Túi đựng giày', 9, 4, 'Gọn nhẹ, chống nước.', 250000.00, 10, 'tui.jpg', 1),
(35, 'Vớ thể thao Nike', 50, 4, 'Thoáng khí, co giãn.', 90000.00, 5, 'vo.jpg', 0),
(36, 'Dây giày co giãn', 25, 4, 'Tiện lợi, dễ mang.', 60000.00, 0, 'day.jpg', 0),
(37, 'Mũ thể thao Adidas', 12, 4, 'Chống nắng, thoáng mát.', 200000.00, 15, 'mu.jpg', 0),
(38, 'Bình nước 1L', 19, 4, 'Nhựa BPA free, an toàn.', 150000.00, 5, 'binh.jpg', 1),
(39, 'Khăn tập gym', 18, 4, 'Mềm mại, thấm hút tốt.', 80000.00, 0, 'khan.jpg', 0),
(40, 'Bọc cán vợt Yonex', 40, 4, 'Chống trơn trượt.', 50000.00, 0, 'boc.jpg', 0),
(41, 'Balo thể thao', 15, 4, 'Đa năng, nhiều ngăn tiện dụng.', 350000.00, 10, 'balo.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`) VALUES
(1, 'admin'),
(2, 'manager'),
(3, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `sdt` varchar(20) DEFAULT NULL,
  `dia_chi` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `sdt`, `dia_chi`, `role_id`) VALUES
(10, 'gun', '$2y$10$I7ynrnykwiKkUqgZ.VSNieMrskFNsxvMNzBKlzr59AMB3ivqVogfK', 'lengodonggun@gmail.com', '0399167895', 'phuyen', 3),
(11, 'chuong', '$2y$10$BeLsUemtUZAut3nkZvIVLu5Vd/VQgrIqeM97aL5jjO1I2drG1L8Py', 'chuongngu@gmail.com', '123456', 'trocuavinh', 3),
(12, 'hung', '$2y$10$wFhXWGEU9/Qfx92e0N/loeWKVSr2X55VVQdSc.QfsQKJNmp9h7NCe', 'hung@gmail.com', '987654', 'gialai', 3),
(13, 'thien', '$2y$10$tMzIxUP2bFDa/ExQ5kLnjOajmifF4tcN1s3PvQmMqn2y1QzdeLyLm', 'thuanthien2109@gmail.com', '0321456789', 'phucat', 1),
(15, 'myhoi', '$2y$10$AVFhMtQMgxRhq35f08BfWOtr1LjLsN3EU46haUkEbfX377ug.p4Eq', 'phanthimyhoifpt47@gmail.com', '0999999999', '12345', 1),
(16, 'myhoii', '$2y$10$yZqtD.MUqX0rcSKcsDDKr.E/RsURNLEuYBw9GXBf/vpuPKQ3C1aJy', 'phanthimyhoi@gmail.com', '0333333334', '12as3', 3),
(18, 'myhoiii', '$2y$10$zWGnRClD8aQ7FIE3s3bSMOVvS0yOh8QeNlekn/CTtjnCJG9c0pqie', 'myhoi@example.com', '0328175565', '142 Tran Luong', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chi_tiet_don_hang`
--
ALTER TABLE `chi_tiet_don_hang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `don_hang_id` (`don_hang_id`);

--
-- Indexes for table `don_hang`
--
ALTER TABLE `don_hang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `fk_users_role` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT for table `chi_tiet_don_hang`
--
ALTER TABLE `chi_tiet_don_hang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `don_hang`
--
ALTER TABLE `don_hang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chi_tiet_don_hang`
--
ALTER TABLE `chi_tiet_don_hang`
  ADD CONSTRAINT `chi_tiet_don_hang_ibfk_1` FOREIGN KEY (`don_hang_id`) REFERENCES `don_hang` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
