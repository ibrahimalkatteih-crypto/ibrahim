<?php

include '../connect.php';

$users_id = filterRequest('users_id');
$items_id = filterRequest('items_id');


$stmt = $con->prepare("SELECT COUNT(cart.cart_id) AS countitems FROM `cart` WHERE cart_users_id='$users_id'  AND cart_items_id='$items_id' AND cart_order=0");

$stmt->execute();

$count = $stmt->rowCount();

$data = $stmt->fetchColumn();

if ($count > 0) {
    echo json_encode(array("status" => "success", "data" => $data));
} else {
    echo json_encode(array("status" => "success", "data" => 0));
}
