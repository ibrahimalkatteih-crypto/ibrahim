<?php
include '../connect.php';


$email = filterRequest("email");

$verifiycode = filterRequest("virfiycode");


$stmt = $con->prepare("SELECT * FROM `users` WHERE `users_email` = '$email' AND `users_virfiycode` = '$verifiycode'");
$stmt->execute();
$count = $stmt->rowCount();

// echo $count;
printResult($count);
