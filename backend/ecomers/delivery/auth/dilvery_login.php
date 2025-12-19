<?php

include '../../connect.php';


$email = filterRequest('email');
$password =sha1( filterRequest('password'));

getData('delivary', "delivary_email='$email' AND delivary_password='$password'");


