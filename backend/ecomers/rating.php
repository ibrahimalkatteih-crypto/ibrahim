<?php
include"connect.php";

$orderId =filterRequest("orders_id");
$orderRating=filterRequest("orders_rating");
$orderRatingNote=filterRequest("orders_rating_note");

$data=array(
    "order_reting"=>$orderRating,
    "order_note_reting"=>$orderRatingNote
);

updateData(
    '`order`',
    $data,
    "order_id='$orderId'"
);