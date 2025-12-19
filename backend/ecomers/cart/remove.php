<?php

include '../connect.php';

$users_id = filterRequest('users_id');
$items_id = filterRequest('items_id');

deleteData('cart', "cart_id=(SELECT cart_id FROM cart WHERE cart_users_id ='$users_id' AND cart_items_id ='$items_id' AND cart_order=0 LIMIT 1)");
