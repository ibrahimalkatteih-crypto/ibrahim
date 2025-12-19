<?php
include "../../connect.php";
$email = filterRequest('email');
$password =sha1(filterRequest('password'));



$stmt = $con->prepare("SELECT `admin_password` FROM `admin` WHERE `admin_email`='$email'");
$stmt->execute();
$virfiy = $stmt->fetchColumn();



if ($password == $virfiy) {

    printFailure("لا يمكنك استعمال نفس كلمة السر ");
} else {

    $data=array("admin_password"=>$password);

    updateData('admin', $data, "admin_email='$email' ");
}
