<?php
include "../../connect.php";
$email = filterRequest('email');
$password =sha1(filterRequest('password'));



$stmt = $con->prepare("SELECT `delivary_password` FROM `delivary` WHERE `delivary_email`='$email'");
$stmt->execute();
$virfiy = $stmt->fetchColumn();



if ($password == $virfiy) {

    printFailure("لا يمكنك استعمال نفس كلمة السر ");
} else {

    $data=array("delivary_password"=>$password);

    updateData('delivary', $data, "delivary_email='$email' ");
}
