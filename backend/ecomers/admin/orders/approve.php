<?php

include "../../connect.php";

$orderId = filterRequest('order_id');

$usersId = filterRequest('users_id');

$data = array(
    "order_status" => 1,
);
// sendGCM("success", "the order has been approved", "brroa", "", "");


$count=updateData('`order`', $data, "order_id='$orderId' AND order_status=0");

insertNotification("success", "the order has been approved", $usersId, "brro$usersId", "none", "order");



// $result = sendGCM("test", "brro1 إشعار تجريبي", "brro$usersId", "none", "order");
// echo json_encode($result);
