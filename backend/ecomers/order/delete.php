<?php

include"../connect.php";


$ordersId=filterRequest('orders_id');


deleteData('`order`',"order_id='$ordersId AND order_status=0'");

