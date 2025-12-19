<?php
include '../connect.php';

$serch = filterRequest('serch');
getAllData('items1view', "items_name LIKE '%$serch%' OR items_name_ar LIKE '%$serch%'");
