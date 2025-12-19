<?php

include '../connect.php';

$userId=filterRequest('userId');

getAllData(
    'myfavorite',
    "favorite_users_id= ? ",
    array($userId)
);