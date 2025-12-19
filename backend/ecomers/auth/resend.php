<?php
include '../connect.php';


$email = filterRequest("email");

$verifiycode = rand(10000, 99999);

$data = array(
    'users_virfiycode'=>$verifiycode
);

updateData('users',$data,"users_email='$email'");
sendmail($email, "verifiycode ecomers APP ibrahim", "virfiycode code $verifiycode");

