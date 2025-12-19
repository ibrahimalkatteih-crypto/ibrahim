<?php

include "../../connect.php";

$email = filterRequest('email');
$virfiyCode = rand(10000, 99999);

$stmt = $con->prepare("SELECT * From `delivary` WHERE `delivary_email`='$email' AND `delivary_approve`=1");

$stmt->execute();
$count = $stmt->rowCount();

printResult($count);


if ($count > 0) {

    $data = array('delivary_verfiycode' => $virfiyCode);
    updateData('delivary', $data, "`delivary_email`='$email'", false);
    sendmail($email, "verifiycode ecomers APP ibrahim", "virfiycode code $virfiyCode");
}