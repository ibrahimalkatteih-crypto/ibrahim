<?php
include '../connect.php';

$email =filterRequest("email");
$password = sha1(filterRequest("password"));

$stmt = $con->prepare("SELECT `users_password` FROM `users` WHERE `users_email`='$email'");
$stmt->execute();
$virfiy = $stmt->fetchColumn();


if ($password == $virfiy) {

    printFailure("لا يمكنك استعمال نفس كلمة السر ");
} else {

    $data = array(
        'users_password' => $password,
    );

    updateData('users', $data, "users_email='$email' ");
}
