<?php
include '../../connect.php';


$email = filterRequest("email");

$verifiycode = rand(10000, 99999);

$data = array(
    'delivary_verfiycode'=>$verifiycode
);

updateData('delivary',$data,"delivary_email='$email'");
sendmail($email, "verifiycode ecomers APP ibrahim", "virfiycode code $verifiycode");

