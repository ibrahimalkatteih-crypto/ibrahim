<?php

include "../../connect.php";

$orderId = filterRequest('order_id');

$usersId = filterRequest('users_id');

$deliveryId=filterRequest("delivery_id");

$idUsers = $usersId;
$data = array(
    "order_status" => 3,
    "order_delivery"=>$deliveryId
);
// sendGCM("success", "the order has been approved", "brroa", "", "");


$count = updateData('`order`', $data, "order_id='$orderId' AND order_status=2");

insertNotification("success", "your order is on the way", $usersId, "delivery$usersId", "none", "order");

sendGCM("alert...", "the order has been approved by delivery", "admin", "none", "none");




sendGCM("alert...", "the order has been approved by delivery '$deliveryId'", "delivery", "none", "none");

// $result = sendGCM("test", "brro1 إشعار تجريبي", "brro$usersId", "none", "order");
// echo json_encode($result);
