<?php

include "connect.php";


// getAllData(
//     'items1view',
//     "`categories_id`=$categoriesId",
// );

$stmt = $con->prepare("SELECT items1view.*, 1 AS favorite,(items_price-(items_price * items_descount/100)) AS itemsPriceDescount
FROM items1view
INNER JOIN favorite ON favorite.favorite_items_id = items1view.items_id

WHERE `items_descount`!=0

UNION ALL

SELECT items1view.*, 0 AS favorite, (items_price-(items_price * items_descount/100)) AS itemsPriceDescount
FROM items1view
WHERE `items_descount`!=0 AND items_id Not IN(
  SELECT items1view.items_id FROM items1view
  INNER JOIN favorite ON favorite.favorite_items_id = items1view.items_id
)");



$stmt->execute();

$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count  = $stmt->rowCount();

if ($count > 0) {
    echo json_encode(array("status" => "success", "data" => $data));
} else {
    echo json_encode(array("status" => "failure"));
}
