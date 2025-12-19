<?php

include "../../connect.php";

$email = filterRequest("email");


$verifiycode=filterRequest('verifiycode');





$stmt = $con->prepare("SELECT * FROM `admin` WHERE `admin_email` = '$email' AND `admin_verfiycode` = '$verifiycode'");
$stmt->execute();
$count = $stmt->rowCount();

// echo $count;
printResult($count);

