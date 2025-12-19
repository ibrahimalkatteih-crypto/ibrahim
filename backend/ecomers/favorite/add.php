<?php

include "../connect.php";

$itemsid = filterRequest('itemsId');
$userid = filterRequest('usersid');

$data = array(
'favorite_users_id' => $userid,
 'favorite_items_id' => $itemsid);

insertData('favorite', $data);
