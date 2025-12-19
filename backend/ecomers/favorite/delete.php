<?php

include "../connect.php";

$itemsid = filterRequest('itemsId');
$userid = filterRequest('usersid');


deleteData('favorite', "favorite_users_id='$userid' AND favorite_items_id='$itemsid'",);
