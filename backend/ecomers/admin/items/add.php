<?php

include "../../connect.php";

$name = filterRequest('name');
$nameAR = filterRequest('name_ar');
$desc = filterRequest('desc');
$decsAR = filterRequest('decsAR');
$count = filterRequest('count');
// $active = filterRequest('active');
$price = filterRequest('price');
$descount = filterRequest('descount');
$catid = filterRequest('catid');
$datetime = filterRequest('date_now');



$imageName = imageUpload("../../uploadImages/Items", 'files');


$data = array(
    "items_name" => $name,
    "items_name_ar" => $nameAR,
    "items_desc" => $desc,
    "items_desc_ar" => $decsAR,
    "items_image" => $imageName,

    "items_count" => $count,
    "items_active" => 1,
    "items_price" => $price,
    "items_descount" => $descount,
    "items_ca" => $catid,
    "items_datetime" => $datetime,




);

insertData('items', $data);
