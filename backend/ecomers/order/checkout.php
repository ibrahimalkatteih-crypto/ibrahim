<?php

include '../connect.php';


$usersId = filterRequest('users_id');
$addressId = filterRequest('address_id');
$orderType = filterRequest('order_type');
$priceDelivery = filterRequest('price_delivery');
$orderPrice = filterRequest('order_price');
$couponId = filterRequest('coupon_id');
$paymentMethod = filterRequest('payment_method');
$couponDiscount = filterRequest('coupon_discount');
$priceOrderNow = filterRequest('price_order_now');



if ($orderType == "1") {
    $priceDelivery = 0;
}




//check coupon

$totalPrice = $orderPrice + $priceDelivery;

$now = date("Y-m-d H:i:s");

$count = getData('coupon', "coupon_id='$couponId'AND coupon_expiredate > '$now' AND coupon_count >0 ", null, false);





if ($count > 0) {
    $totalPrice -= $orderPrice * $couponDiscount / 100;
    $stmt = $con->prepare("UPDATE `coupon` SET `coupon_count`=`coupon_count`-1 WHERE coupon_id='$couponId'");
    $stmt->execute();
}

$data = array(
    "order_users_id" => $usersId,
    "order_address" => $addressId,
    "order_type" => $orderType,
    "order_price_delivery" => $priceDelivery,
    "order_price" => $orderPrice,
    "order_total_price" => $totalPrice,
    "order_coupon" => $couponId,
    "order_paymentMethod" => $paymentMethod

);


$count = insertData('`order`', $data, false);

if ($count > 0) {
    $stmt = $con->prepare("SELECT MAX(order_id) FROM `order`");
    $stmt->execute();
    $maxid = $stmt->fetchColumn();

    $data = array(
        'cart_order' => $maxid,
        "cart_price_now" => $totalPrice

    );
    updateData('cart', $data, "cart_users_id='$usersId' AND cart_order=0");
} else {
}
