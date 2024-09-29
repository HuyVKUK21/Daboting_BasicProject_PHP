<?php
$idOrder = $_GET['idOrder'];
$Status = $_GET['Status'];
include '../config.php';
if ($Status == 1) {
    $query = "UPDATE `orders` SET `status` = 'Đang Vận chuyển' WHERE `id` = $idOrder";
}else {
    $query = "UPDATE `orders` SET `status` = 'Đã giao hàng' WHERE `id` = $idOrder";
}
mysqli_query($conn, $query);
header("location: ../index.php?page=Order");
?>