<?php

include "../../connect.php";

$orderId = filterRequest('order_id');

$usersId = filterRequest('users_id');

$type = filterRequest('order_type');


$idUsers = $usersId;

if ($type == "0") {
    $data = array(
        "order_status" => 2,
    );
} else {
    $data = array(
        "order_status" => 4,
    );
}
// sendGCM("success", "the order has been approved", "brroa", "", "");


$count = updateData('`order`', $data, "order_id='$orderId' AND order_status=1");


if ($type == "0") {
    insertNotification("success", "the order has been prepare", $usersId, "admin$usersId", "none", "order");

    sendGCM("alert...", "there is a orders awaiting approve", "delivery", "none", "none");
} else {
    insertNotification("success", "welcom", $usersId, "admin$usersId", "none", "order");
}


// $result = sendGCM("test", "brro1 إشعار تجريبي", "brro$usersId", "none", "order");
// echo json_encode($result);
