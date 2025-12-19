<?php

include "connect.php";


$allData = array();


$users=getAllData('users',"1=1",null,null);
$delivery=getAllData('delivary',"1=1",null,null);


$allData['status'] = 'success';

$allData['users'] = $users;

$allData['delivary'] = $delivery;




echo json_encode($allData);