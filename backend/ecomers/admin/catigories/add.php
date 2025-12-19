<?php

include "../../connect.php";

$name=filterRequest( 'name');
$nameAR=filterRequest( 'name_ar');


$imageName=imageUpload("../../uploadImages/categories",'files');


$data=array(
    "categories_name"=>$name,
    "categories_name_ar"=>$nameAR,
    "categories_image"=>$imageName

);

insertData('categories',$data);