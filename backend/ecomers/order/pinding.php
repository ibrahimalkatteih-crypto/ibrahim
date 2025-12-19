<?php


include "../connect.php";

$usersId=filterRequest('users_id');

getAllData('ordersview',"order_users_id='$usersId' AND order_status!=4");