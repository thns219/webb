<?php
session_start();
include 'db.php';

//  Kiểm tra đăng nhập
if (!isset($_SESSION['user_id'])) {
    echo "<a href='DangNhap.php'>Vui lòng đăng nhập để xem giỏ hàng</a>";
    exit();
}

$user_id = $_SESSION['user_id'];

// Truy vấn các sản phẩm trong giỏ hàng của người dùng
$sql = "
    SELECT c.product_id, c.quantity, p.ten_san_pham, p.gia, p.hinh_anh, p.Giamgia
    FROM cart c
    JOIN products p ON c.product_id = p.id
    WHERE c.user_id = $user_id
";
// Tăng/giảm số lượng
if (isset($_GET['action']) && isset($_GET['id'])) {
    $id = $_GET['id'];
    if ($_GET['action'] == 'increase') {
        $_SESSION['cart'][$id]['soluong']++;
    } elseif ($_GET['action'] == 'decrease') {
        if ($_SESSION['cart'][$id]['soluong'] > 1) {
            $_SESSION['cart'][$id]['soluong']--;
        }
    }
    header('Location: giohang.php');
    exit();
}

$result = mysqli_query($conn, $sql);
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Giỏ Hàng Của Bạn</title>
    <link rel="stylesheet" href="csstest.css">
</head>
<body>
<?php include 'header.php'; ?>

<div class="main-content">
    <div class="products">
        <h2>Giỏ Hàng Của Bạn</h2>

        <?php
        if (mysqli_num_rows($result) > 0) {
            echo "<table class='cart-table'>";
            echo "<tr><th>Hình ảnh</th><th>Tên sản phẩm</th><th>Giá</th><th>Số lượng</th><th>Thành tiền</th><th>Xóa</th></tr>";

            $tong_tien = 0;

            while ($row = mysqli_fetch_assoc($result)) {
                
                // $thanhtien = $row['gia'] * $row['quantity'];
                // $tong_tien += $thanhtien;

                echo "<tr>";
                echo "<td><img src='image/" . htmlspecialchars($row['hinh_anh']) . "' width='100'></td>";
                echo "<td>" . htmlspecialchars($row['ten_san_pham']) . "</td>";
                if ($row['Giamgia'] > 0) {
                    echo "<td>" . number_format($row['Giamgia'], 0, ',', '.') . " VND</td>";
                    $thanhtien = $row['Giamgia'] * $row['quantity'];
                } else {
                    echo "<td>" . number_format($row['gia'], 0, ',', '.') . " VND</td>";
                    $thanhtien = $row['gia'] * $row['quantity'];
                }
                $tong_tien += $thanhtien;
             echo "<td>
             <a href='capnhatsl.php?action=decrease&product_id=" . $row['product_id'] . "'>-</a>
             " . $row['quantity'] . "
            <a href='capnhatsl.php?action=increase&product_id=" . $row['product_id'] . "'>+</a>
            </td>";


                echo "<td>" . number_format($thanhtien, 0, ',', '.') . " VND</td>";
                echo "<td><a href='xoasp.php?product_id=" . $row['product_id'] . "' onclick='return confirm(\"Bạn có chắc muốn xóa sản phẩm này?\")'>Xóa</a></td>";
                echo "</tr>";
            }

            echo "<tr><td colspan='6' style='text-align:right'><strong>Tổng tiền: " . number_format($tong_tien, 0, ',', '.') . " VND</strong></td></tr>";
            echo "</table>";
        } else {
            echo "<p>Giỏ hàng của bạn đang trống.</p>";
        }
        ?>
    </div>
</div>
<form action="thanhtoan.php" method="post">
    <button type="submit" name="thanhtoan">Thanh toán</button>
</form>

</body>
</html>


<div style="margin-top: 20px;">
    <a href="index.php" class="btn">⬅ Quay lại trang chủ</a>
</div>

<style>
/* Tổng thể body */
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(to right, #f2f6fc, #e0ecff);
    color: #333;
}

.main-content {
    max-width: 1000px;
    margin: 40px auto;
    background: #ffffff;
    padding: 40px 50px;
    box-shadow: 0 15px 40px rgba(0, 0, 0, 0.08);
    border-radius: 16px;
    animation: fadeIn 0.4s ease-in-out;
}

h2 {
    text-align: center;
    color:rgb(27, 108, 196);
    font-size: 32px;
    margin-bottom: 30px;
    font-weight: 700;
}

.cart-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    font-size: 16px;
}

.cart-table th, .cart-table td {
    padding: 16px 20px;
    text-align: center;
    border-bottom: 1px solid #e0e0e0;
}

.cart-table th {
    background-color: #007bff;
    color: white;
    font-size: 16px;
    text-transform: uppercase;
    letter-spacing: 1px;
}

.cart-table tr:hover {
    background-color: #f8faff;
}

.cart-table img {
    border-radius: 8px;
    object-fit: cover;
    max-height: 80px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
}

.cart-table a {
    display: inline-block;
    width: 30px;
    height: 28px;
    line-height: 26px;
    text-align: center;
    margin: 0 3px;
    background-color: #007bff;
    color: white;
    text-decoration: none;
    font-weight: bold;
    border-radius: 25%;
    font-size: 13px;
    transition: background-color 0.3s ease, transform 0.2s ease;
}

.cart-table a:hover {
    background-color: #0056b3;
    transform: scale(1.1);
}


button[name="thanhtoan"] {
    margin: 35px auto 20px;
    display: block;
    padding: 14px 40px;
    background-color: #28a745;
    color: white;
    border: none;
    border-radius: 40px;
    font-size: 18px;
    font-weight: 600;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.2s ease;
    box-shadow: 0 8px 20px rgba(0, 128, 0, 0.1);
}

button[name="thanhtoan"]:hover {
    background-color: #218838;
    transform: translateY(-2px);
}

.btn {
    display: inline-block;
    padding: 12px 24px;
    margin: 30px auto 10px;
    background-color: #007bff;
    color: white;
    text-decoration: none;
    border-radius: 30px;
    font-weight: 600;
    transition: background-color 0.3s ease, transform 0.2s ease;
    text-align: center;
}

.btn:hover {
    background-color: #0056b3;
    transform: translateY(-1px);
}



</style>