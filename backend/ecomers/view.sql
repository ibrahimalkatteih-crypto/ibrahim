

// انشاء جدول وهمي 
CREATE VIEW itemsview AS 
SELECT items.* ,categories.* FROM items 
INNER JOIN categories on items.items_ca =categories.categories_id


// بجيب العناصر المفضلة وغير المفضلة 
SELECT items1view.*, 1 AS favorite
FROM items1view
INNER JOIN favorite ON favorite.favorite_items_id = items1view.items_id
AND favorite.favorite_users_id = 1

UNION ALL

SELECT items1view.*, 0 AS favorite
FROM items1view
WHERE items_id NOT IN (
  SELECT favorite.favorite_items_id
  FROM favorite
  WHERE favorite.favorite_users_id = 1
)

//مشان نجيب الغراض يلي جوت المفضلة
CREATE OR REPLACE VIEW myFavorite AS 


SELECT favorite.*,items.*,users.users_id FROM favorite
INNER JOIN users ON users.users_id= favorite_users_id
INNER JOIN items ON items.items_id=favorite_items_id



//مشان نشوف سعر المنتجات وعددن بالسلة

CREATE OR REPLACE VIEW cartview AS 
SELECT SUM(items.items_price-items.items_price*items.items_descount/100) AS itemsPrice,COUNT(cart.cart_items_id) AS countItems, `cart`.* ,`items`.* FROM `cart`
INNER JOIN `items` ON items.items_id=cart.cart_items_id
WHERE `cart_order`=0
GROUP BY cart.cart_items_id,cart.cart_users_id,cart.cart_order


// مشان نجيب الادريسس للمستخدم بorederview
CREATE OR REPLACE VIEW ordersview AS 
SELECT `order`.* , address.* FROM `order`
LEFT JOIN address ON address.address_id=`order`.`order_address`



//هي مشان نربط الكارت مع الاورديرس ديلتلس فيو نجيب المعلومات كاملة
CREATE OR REPLACE VIEW orderDetailsview AS 
SELECT SUM(items.items_price-items.items_price*items.items_descount/100) AS itemsPrice,COUNT(cart.cart_items_id) AS countItems, `cart`.* ,`items`.* FROM `cart`
INNER JOIN `items` ON items.items_id=cart.cart_items_id

WHERE `cart_order`!=0
GROUP BY cart.cart_items_id,cart.cart_users_id,cart.cart_order


//منجيب المنتجات الاكثر مبيعا

CREATE OR REPLACE VIEW  itemsTopSelling AS


SELECT COUNT(cart_id) AS countItems,cart.*,items.*,(items_price-(items_price * items_descount/100)) AS itemsPriceDescount FROM cart
INNER JOIN items ON items.items_id=cart.cart_items_id

WHERE cart_order!=0 
GROUP BY cart_items_id

