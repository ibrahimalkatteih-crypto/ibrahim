<?php

include "../connect.php";

$itemsid = filterRequest('items_id');
$userid = filterRequest('users_id');

$count = getData('cart', "cart_users_id='$userid'AND cart_items_id='$itemsid'AND cart_order=0");


$data = array(
    'cart_users_id' => $userid,
    'cart_items_id' => $itemsid
);

insertData('cart', $data);
