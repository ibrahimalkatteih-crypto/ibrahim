<?php

include "connect.php";


$allData = array();

$categories = getAllData(
    'categories',
    null,
    null,
    false,
);

$items = getAllData(
    'itemstopselling',
    '1=1 ORDER BY countItems DESC',
    null,
    false,
);  


$textSetting = getAllData(
    'textsetting',
    '1=1',
    null,
    false,
);

$allData['status'] = 'success';

$allData['textsetting'] = $textSetting;

$allData['categories'] = $categories;

$allData['items'] = $items;



echo json_encode($allData);
