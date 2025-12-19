<?php


include "../../connect.php";

$deliveryId = filterRequest("delivery_id");
getAllData('ordersview', "1=1 AND order_status=3 AND order_delivery=$deliveryId");
