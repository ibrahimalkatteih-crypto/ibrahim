<?php

include "../../connect.php";

$id=filterRequest('id');
$imageName=filterRequest('image_name');
deleteFile("../../uploadImages/Items",$imageName);

deleteData('items',"items_id='$id'");