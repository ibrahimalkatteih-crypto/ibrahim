<?php

include "../../connect.php";

$email = filterRequest('email');
$virfiyCode = rand(10000, 99999);

$stmt = $con->prepare("SELECT * From `admin` WHERE `admin_email`='$email' AND `admin_approve`=1");

$stmt->execute();
$count = $stmt->rowCount();

printResult($count);


if ($count > 0) {

    $data = array('admin_verfiycode' => $virfiyCode);
    updateData('admin', $data, "`admin_email`='$email'", false);
    sendmail($email, "verifiycode ecomers APP ibrahim", "virfiycode code $virfiyCode");
}