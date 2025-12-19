<?php

include "../../connect.php";

$orderId = filterRequest('order_id');

$usersId = filterRequest('users_id');

$idUsers = $usersId;
$data = array(
    "order_status" => 4,
);
// sendGCM("success", "the order has been approved", "brroa", "", "");


$count = updateData('`order`', $data, "order_id='$orderId' AND order_status=3");

insertNotification("success", "your order has been delivery", "delivery$usersId", "brro$usersId", "none", "order");

sendGCM("alert...", "the order has been delivered to the customers", "admin", "none", "none");

// $result = sendGCM("test", "brro1 إشعار تجريبي", "brro$usersId", "none", "order");
// echo json_encode($result);
