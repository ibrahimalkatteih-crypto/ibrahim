<?php

include '../../connect.php';


$email = filterRequest('email');
$password = filterRequest('password');

getData('admin', "admin_email='$email' AND admin_password='$password'");


