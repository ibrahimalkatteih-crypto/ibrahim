<?php
include '../../connect.php';


$email = filterRequest("email");

$verifiycode = rand(10000, 99999);

$data = array(
    'admin_verfiycode'=>$verifiycode
);

updateData('admin',$data,"admin_email='$email'");
sendmail($email, "verifiycode ecomers APP ibrahim", "virfiycode code $verifiycode");

