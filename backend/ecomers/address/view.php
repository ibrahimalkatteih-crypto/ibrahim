<?php

include '../connect.php';

$users_id=filterRequest('users_id');

getAllData('address',"address_users_id='$users_id'");