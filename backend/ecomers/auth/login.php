<?php

include '../connect.php';


$email = filterRequest('email');
$password = sha1(filterRequest('password'));


// $stmt = $con->prepare("SELECT * FROM `users` WHERE `users_email`='$email' AND `users_password`='$password' AND `users_approve`=1");
// $stmt->execute();
// $count = $stmt->rowCount();
// printResult($count);


getData("users", "`users_email`=? AND `users_password`=?", array($email, $password));
