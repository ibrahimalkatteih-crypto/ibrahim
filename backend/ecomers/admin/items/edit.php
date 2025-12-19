<?php

include "../../connect.php";

$name = filterRequest('name');
$nameAR = filterRequest('name_ar');
$id = filterRequest('id');
$imageOld = filterRequest('image_old');



$desc = filterRequest('desc');
$decsAR = filterRequest('decsAR');
$count = filterRequest('count');
$active = filterRequest('active');
$price = filterRequest('price');
$descount = filterRequest('descount');
$catid = filterRequest('catid');
// $datetime = filterRequest('date_now');


$res = imageUpload("../../uploadImages/Items", 'files');

if ($res == "empty") {
    $data = array(
        "items_name" => $name,
        "items_name_ar" => $nameAR,
        "items_desc" => $desc,
        "items_desc_ar" => $decsAR,
        // "items_image" => $imageName,

        "items_count" => $count,
        "items_active" => $active,
        "items_price" => $price,
        "items_descount" => $descount,
        "items_ca" => $catid,
        // "items_datetime" => $datetime,




    );
} else {
    deleteFile("../../uploadImages/Items", $imageOld);
    

    $data = array(
        "items_name" => $name,
        "items_name_ar" => $nameAR,
        "items_desc" => $desc,
        "items_desc_ar" => $decsAR,
        "items_image" => $res,

        "items_count" => $count,
        "items_active" => $active,
        "items_price" => $price,
        "items_descount" => $descount,
        "items_ca" => $catid,
        // "items_datetime" => $datetime,




    );
}





updateData('items1view', $data, "items_id='$id'");
