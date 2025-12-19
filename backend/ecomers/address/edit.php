<?php

include "../connect.php";

$table = "address";

$address_id = filterRequest('address_id');
$address_name=filterRequest('address_name');


$city = filterRequest('city');
$street = filterRequest('street');
$lat = filterRequest('lat');
$lang = filterRequest('lang');
$data = array(
    "address_name"=>$address_name,
    "address_city" => $city,
    "address_street" => $street,
    "address_lat" => $lat,
    "address_lang" => $lang
);
updateData($table, $data, "address_id='$address_id'");
