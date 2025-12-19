<?php

include "../../connect.php";

$name = filterRequest('name');
$nameAR = filterRequest('name_ar');
$id = filterRequest('id');
$imageOld=filterRequest('image_old');


$res = imageUpload("../../uploadImages/categories", 'files');

if ($res == "empty") {
    $data = array(
        "categories_name" => $name,
        "categories_name_ar" => $nameAR,
        // "categories_image"=>$imageName

    );
} else {
    deleteFile("../../uploadImages/categories",$imageOld);

    $data = array(
        "categories_name" => $name,
        "categories_name_ar" => $nameAR,
        "categories_image" => $res

    );
}





updateData('categories', $data, "categories_id='$id'");
