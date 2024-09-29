<?php
session_start();
include '../database/config.php';
if (!empty($_SESSION)) {
    $idUser = $_SESSION['IDUser'];
}
if (!empty($_POST)) {
    $name = $_POST['name'];
    $address = $_POST['address'];
    $phone = $_POST['phone'];
    $email = $_POST['email'];
    $total = $_POST['total'];
    $idOrderDetailSend = $_POST['idOrderDetailSend'];
}
if (!empty($_POST['idProductSend'])) {
    echo 1;
    $idProductReceive = $_POST['idProductSend'];
    $querydisplay = "SELECT * FROM product WHERE id = $idProductReceive";
    $resultdisplay = mysqli_query($conn, $querydisplay);
    $rowdisplay = mysqli_fetch_array($resultdisplay);
    $price = $rowdisplay['price'] - ceil($rowdisplay['price'] * $rowdisplay['discount'] / 100);
    // thêm vào giỏ hàng
    $queryOrder_Detail = "INSERT INTO `order_details` (`user_id` , `product_id`, `price`, `num`, `total_money`) 
        VALUES ('$idUser', '$idProductReceive', '$price', '1', `price` * `num`)";
    mysqli_query($conn, $queryOrder_Detail);
    $idod = $conn->insert_id;
    //thêm vào đơn hàng
    $queryPaymentOrder =
        "INSERT INTO `orders` (`user_id`, `fullname`, `email`, `phone_number`, `address`, `order_date`, `status`, `total_money`) 
        VALUES ('$idUser', '$name', '$email', '$phone', '$address', CURRENT_TIMESTAMP(), 'Đang xử lý', '$total')";
    mysqli_query($conn, $queryPaymentOrder);
    $ido = $conn->insert_id;
    $queryUpdateOrderDetail = "UPDATE order_details SET order_id = $ido WHERE id = $idod AND user_id = $idUser";
    mysqli_query($conn, $queryUpdateOrderDetail);
    // cập nhật số lượng sản phẩm
    mysqli_query($conn, "UPDATE product SET quantity_purchased = quantity_purchased + 1 WHERE id = $idProductReceive");
    mysqli_query($conn, "UPDATE product SET quantity = quantity - 1  WHERE id = $idProductReceive");
} else {
    echo 2;
    $queryPaymentOrder =
        "INSERT INTO `orders` (`user_id`, `fullname`, `email`, `phone_number`, `address`, `order_date`, `status`, `total_money`) 
        VALUES ('$idUser', '$name', '$email', '$phone', '$address', CURRENT_TIMESTAMP(), 'Đang xử lý', '$total')";
    mysqli_query($conn, $queryPaymentOrder);
    $id = $conn->insert_id;
    $listIDOD = explode(" ", $idOrderDetailSend);
    $condition = "";
    foreach ($listIDOD as $key => $value) {
        if ($key < (count($listIDOD) - 2)) {
            $condition .= "id = $value OR  ";
        }
    }
    $condition .= $condition  . " id = " . $listIDOD[count($listIDOD) - 2] . " AND user_id = $idUser";
    $queryUpdateOrderDetail = "UPDATE order_details SET order_id = $id WHERE $condition";
    mysqli_query($conn, $queryUpdateOrderDetail);
    // cập nhật số lượng sản phẩm
    $quantity_purchased = 0;
    foreach ($listIDOD as $key => $value) {
        if ($key < count($listIDOD) - 1) {
            $querydisplay = "SELECT * FROM order_details WHERE id = $value";
            $resultdisplay = mysqli_query($conn, $querydisplay);
            $rowdisplay = mysqli_fetch_array($resultdisplay);
            $quantity_purchased = $rowdisplay['num'];
            mysqli_query($conn, "UPDATE product SET quantity_purchased = quantity_purchased + $quantity_purchased WHERE id = ".$rowdisplay['product_id']."");
            mysqli_query($conn, "UPDATE product SET quantity = quantity - $quantity_purchased WHERE id = ".$rowdisplay['product_id'].""); 
        }
    }
}
header("location: ../user/index.php");
