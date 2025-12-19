<?php

include "../connect.php";


$categoriesId = filterRequest("id");
// getAllData(
//     'items1view',
//     "`categories_id`=$categoriesId",
// );
$usersid = filterRequest("usersid");

$stmt = $con->prepare("SELECT items1view.*, 1 AS favorite,(items_price-(items_price * items_descount/100)) AS itemsPriceDescount
FROM items1view
INNER JOIN favorite ON favorite.favorite_items_id = items1view.items_id
AND favorite.favorite_users_id = $usersid
WHERE `categories_id`=$categoriesId

UNION ALL

SELECT items1view.*, 0 AS favorite, (items_price-(items_price * items_descount/100)) AS itemsPriceDescount
FROM items1view
WHERE `categories_id`=$categoriesId AND items_id NOT IN (
  SELECT favorite.favorite_items_id
  FROM favorite
  WHERE favorite.favorite_users_id = $usersid
)");

$stmt->execute();

$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count  = $stmt->rowCount();

if ($count > 0) {
    echo json_encode(array("status" => "success", "data" => $data));
} else {
    echo json_encode(array("status" => "failure"));
}
