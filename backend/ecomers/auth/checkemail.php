<?php

include '../connect.php';
$email = filterRequest('email');
$virfiyCode = rand(10000, 99999);

$stmt = $con->prepare("SELECT * From `users` WHERE `users_email`='$email' AND `users_approve`=1");

$stmt->execute();
$count = $stmt->rowCount();

printResult($count);


if ($count > 0) {

    $data = array('users_virfiycode' => $virfiyCode);
    updateData('users', $data, "`users_email`='$email'", false);
    sendmail($email, "verifiycode ecomers APP ibrahim", "virfiycode code $virfiyCode");
}
