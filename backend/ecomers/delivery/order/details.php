<?php
include "../../connect.php";


$orderId=filterRequest('order_id');

getAllData('orderDetailsview',"cart_order='$orderId'");