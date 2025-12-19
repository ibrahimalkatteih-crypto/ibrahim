<?php

include"connect.php";

$usersId=filterRequest('users_id');


getAllData('notification',"notification_users_id='$usersId'");