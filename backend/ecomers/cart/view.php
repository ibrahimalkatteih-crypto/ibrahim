<?php

include '../connect.php';


$users_id = filterRequest('users_id');

$data = getAllData('cartview', "cart_users_id='$users_id'", null, false);

$stmt = $con->prepare("SELECT SUM(itemsPrice)AS totalPrice ,Count(countItems) AS totalCount FROM `cartview`
WHERE cartview.cart_users_id='$users_id'
GROUP BY cartview.cart_users_id");

$stmt->execute();

// $count=$stmt->rowCount();

//جيب كونت و برايس 
$countPrice = $stmt->fetch(PDO::FETCH_ASSOC);

echo json_encode(array(
    "status" => "success",
    "data_cart" => $data,
    "countPrice" => $countPrice
));
