<?php

include "../../connect.php";

$id=filterRequest('id');
$imageName=filterRequest('image_name');
deleteFile("../../uploadImages/categories",$imageName);

deleteData('categories',"categories_id='$id'");