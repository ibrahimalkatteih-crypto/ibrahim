<?php

include "../connect.php";

$username = filterRequest('username');
$password = sha1(filterRequest('password'));
$email = filterRequest('email');
$phone = filterRequest('phone');
$verifiycode = rand(10000, 99999);
$stmt = $con->prepare('SELECT * FROM `users` WHERE `users_email` = ? OR `users_phone` = ?');
$stmt->execute(array($email, $phone));
$count = $stmt->rowCount();
if ($count > 0) {
    printFailure("phone or email");
    return;
} else {
    $data = array(
        'users_name'     => $username,
        'users_password' => $password,
        'users_email'    => $email,
        'users_phone'    => $phone,
        'users_virfiycode' => $verifiycode,
    );
    sendmail($email, "verifiycode ecomers APP ibrahim", "virfiycode code $verifiycode");
    insertData("users", $data);
}
