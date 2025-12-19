<?php

include "../../connect.php";

$email = filterRequest("email");


$verifiycode=filterRequest('verifiycode');





$stmt = $con->prepare("SELECT * FROM `delivary` WHERE `delivary_email` = '$email' AND `delivary_verfiycode` = '$verifiycode'");
$stmt->execute();
$count = $stmt->rowCount();

// echo $count;
printResult($count);

