-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2025 at 08:23 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecomers`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `address_users_id` int(11) NOT NULL,
  `address_name` varchar(255) NOT NULL,
  `address_city` varchar(255) NOT NULL,
  `address_street` varchar(255) NOT NULL,
  `address_lat` double NOT NULL,
  `address_lang` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `address_users_id`, `address_name`, `address_city`, `address_street`, `address_lat`, `address_lang`) VALUES
(9, 1, 'Ggggg', 'Ggg', 'Ffff', 37.4219983, -122.084);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_email` varchar(100) NOT NULL,
  `admin_username` varchar(100) NOT NULL,
  `admin_password` varchar(100) NOT NULL,
  `admin_approve` tinyint(4) NOT NULL DEFAULT 0,
  `admin_verfiycode` int(11) NOT NULL,
  `admin_phone` varchar(100) NOT NULL,
  `admin_datatime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_email`, `admin_username`, `admin_password`, `admin_approve`, `admin_verfiycode`, `admin_phone`, `admin_datatime`) VALUES
(1, 'brro@gmail.com', 'brro', '123456789', 1, 21703, '0981718315', '2025-12-17 13:38:32');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `cart_users_id` int(11) NOT NULL,
  `cart_items_id` int(11) NOT NULL,
  `cart_order` int(11) NOT NULL DEFAULT 0,
  `cart_price_now` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `cart_users_id`, `cart_items_id`, `cart_order`, `cart_price_now`) VALUES
(121, 1, 1, 1, 0),
(122, 1, 1, 1, 0),
(123, 1, 1, 1, 0),
(126, 1, 1, 2, 0),
(127, 1, 3, 3, 0),
(128, 1, 1, 5, 0),
(129, 1, 1, 6, 0),
(130, 1, 1, 7, 0),
(131, 1, 1, 7, 0),
(132, 1, 1, 8, 0),
(133, 1, 1, 8, 0),
(134, 1, 1, 9, 0),
(135, 1, 3, 10, 0),
(136, 1, 1, 11, 0),
(137, 1, 1, 11, 0),
(138, 1, 2, 12, 0),
(139, 1, 1, 13, 0),
(140, 1, 1, 13, 0),
(141, 1, 1, 14, 0),
(142, 1, 1, 14, 0),
(143, 1, 1, 15, 2810),
(144, 1, 1, 15, 2810),
(145, 1, 1, 16, 1410),
(146, 1, 1, 17, 2110),
(147, 1, 1, 18, 2810);

-- --------------------------------------------------------

--
-- Stand-in structure for view `cartview`
-- (See below for the actual view)
--
CREATE TABLE `cartview` (
`itemsPrice` double
,`countItems` bigint(21)
,`cart_id` int(11)
,`cart_users_id` int(11)
,`cart_items_id` int(11)
,`cart_order` int(11)
,`items_id` int(11)
,`items_name` varchar(100)
,`items_name_ar` varchar(100)
,`items_desc` varchar(255)
,`items_desc_ar` varchar(255)
,`items_image` varchar(255)
,`items_count` int(11)
,`items_active` tinyint(4)
,`items_price` float
,`items_descount` float
,`items_datetime` timestamp
,`items_ca` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categories_id` int(11) NOT NULL,
  `categories_name` varchar(100) NOT NULL,
  `categories_name_ar` varchar(100) NOT NULL,
  `categories_image` varchar(255) NOT NULL,
  `categories_datatime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categories_id`, `categories_name`, `categories_name_ar`, `categories_image`, `categories_datatime`) VALUES
(1, 'laptob', 'لابتوب', 'laptop.svg', '2025-10-06 11:08:10'),
(2, 'camera', 'كاميرا', 'camera.svg', '2025-10-06 11:08:10'),
(3, 'mobile', 'موبايل', 'mobile.svg', '2025-10-06 11:08:10'),
(4, 'shose', 'أحذية', 'shose.svg', '2025-10-06 11:08:10'),
(5, 'dress', 'فستان', 'dress.svg', '2025-10-06 11:08:10');

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE `coupon` (
  `coupon_id` int(11) NOT NULL,
  `coupon_name` varchar(255) NOT NULL,
  `coupon_count` int(11) NOT NULL,
  `coupon_expiredate` datetime NOT NULL,
  `coupon_discount` smallint(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `coupon`
--

INSERT INTO `coupon` (`coupon_id`, `coupon_name`, `coupon_count`, `coupon_expiredate`, `coupon_discount`) VALUES
(1, 'brro', 1, '2025-11-30 22:22:03', 10);

-- --------------------------------------------------------

--
-- Table structure for table `delivary`
--

CREATE TABLE `delivary` (
  `delivary_id` int(11) NOT NULL,
  `delivary_username` varchar(255) NOT NULL,
  `delivary_email` varchar(255) NOT NULL,
  `delivary_phone` varchar(100) NOT NULL,
  `delivary_verfiycode` varchar(100) NOT NULL,
  `delivary_approve` tinyint(4) NOT NULL DEFAULT 0,
  `delivary_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `delivary_password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `delivary`
--

INSERT INTO `delivary` (`delivary_id`, `delivary_username`, `delivary_email`, `delivary_phone`, `delivary_verfiycode`, `delivary_approve`, `delivary_datetime`, `delivary_password`) VALUES
(1, 'brro', 'brro@gmail.com', '0981718315', '87008', 1, '2025-12-18 12:51:18', '7c222fb2927d828af22f592134e8932480637c0d');

-- --------------------------------------------------------

--
-- Table structure for table `favorite`
--

CREATE TABLE `favorite` (
  `favorite_id` int(11) NOT NULL,
  `favorite_users_id` int(11) NOT NULL,
  `favorite_items_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `favorite`
--

INSERT INTO `favorite` (`favorite_id`, `favorite_users_id`, `favorite_items_id`) VALUES
(19, 1, 3),
(20, 1, 2),
(21, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `items_id` int(11) NOT NULL,
  `items_name` varchar(100) NOT NULL,
  `items_name_ar` varchar(100) NOT NULL,
  `items_desc` varchar(255) NOT NULL,
  `items_desc_ar` varchar(255) NOT NULL,
  `items_image` varchar(255) NOT NULL,
  `items_count` int(11) NOT NULL,
  `items_active` tinyint(4) NOT NULL DEFAULT 0,
  `items_price` float NOT NULL,
  `items_descount` float NOT NULL,
  `items_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `items_ca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`items_id`, `items_name`, `items_name_ar`, `items_desc`, `items_desc_ar`, `items_image`, `items_count`, `items_active`, `items_price`, `items_descount`, `items_datetime`, `items_ca`) VALUES
(1, 'asus tuf f15', 'اسوس توف f15', 'It features a powerful processor and a separate graphics card dedicated to gaming.', 'يتميز بمعالج قوي وكرت شاشة منفصل مخصص للالعاب', 'laptop.png', 10, 1, 4000, 30, '2025-10-06 11:12:48', 1),
(2, 'kanon', 'كانون', 'Amazing lens', 'عدسة مذهلة', 'camera.png', 10, 0, 730, 10, '2025-10-06 11:14:35', 2),
(3, 'A 12', 'A 12', 'It has high RAM and good processor.', 'رام عالي ومعالج جيد', 'mobile.png', 10, 0, 40, 3, '2025-10-06 11:16:13', 3);

-- --------------------------------------------------------

--
-- Stand-in structure for view `items1view`
-- (See below for the actual view)
--
CREATE TABLE `items1view` (
`items_id` int(11)
,`items_name` varchar(100)
,`items_name_ar` varchar(100)
,`items_desc` varchar(255)
,`items_desc_ar` varchar(255)
,`items_image` varchar(255)
,`items_count` int(11)
,`items_active` tinyint(4)
,`items_price` float
,`items_descount` float
,`items_datetime` timestamp
,`items_ca` int(11)
,`categories_id` int(11)
,`categories_name` varchar(100)
,`categories_name_ar` varchar(100)
,`categories_image` varchar(255)
,`categories_datatime` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `itemstopselling`
-- (See below for the actual view)
--
CREATE TABLE `itemstopselling` (
`countItems` bigint(21)
,`cart_id` int(11)
,`cart_users_id` int(11)
,`cart_items_id` int(11)
,`cart_order` int(11)
,`items_id` int(11)
,`items_name` varchar(100)
,`items_name_ar` varchar(100)
,`items_desc` varchar(255)
,`items_desc_ar` varchar(255)
,`items_image` varchar(255)
,`items_count` int(11)
,`items_active` tinyint(4)
,`items_price` float
,`items_descount` float
,`items_datetime` timestamp
,`items_ca` int(11)
,`itemsPriceDescount` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `myfavorite`
-- (See below for the actual view)
--
CREATE TABLE `myfavorite` (
`favorite_id` int(11)
,`favorite_users_id` int(11)
,`favorite_items_id` int(11)
,`items_id` int(11)
,`items_name` varchar(100)
,`items_name_ar` varchar(100)
,`items_desc` varchar(255)
,`items_desc_ar` varchar(255)
,`items_image` varchar(255)
,`items_count` int(11)
,`items_active` tinyint(4)
,`items_price` float
,`items_descount` float
,`items_datetime` timestamp
,`items_ca` int(11)
,`users_id` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notification_id` int(11) NOT NULL,
  `notification_title` varchar(255) NOT NULL,
  `notification_body` varchar(255) NOT NULL,
  `notification_users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`notification_id`, `notification_title`, `notification_body`, `notification_users_id`) VALUES
(1, 'success', 'the order has been approved', 0),
(2, 'success', 'the order has been approved', 1),
(3, 'success', 'the order has been approved', 1),
(4, 'success', 'the order has been approved', 1),
(5, 'success', 'the order has been approved', 1),
(6, 'success', 'the order has been approved', 1),
(7, 'success', 'your order is on the way', 1),
(8, 'success', 'your order is on the way', 1),
(9, 'success', 'your order is on the way', 1),
(10, 'success', 'your order is on the way', 1),
(11, 'success', 'your order is on the way', 1);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `order_users_id` int(11) NOT NULL,
  `order_address` int(11) NOT NULL,
  `order_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>deilvery;1=>resive',
  `order_price_delivery` int(11) NOT NULL DEFAULT 0,
  `order_price` int(11) NOT NULL,
  `order_total_price` double NOT NULL DEFAULT 0,
  `order_coupon` int(11) NOT NULL DEFAULT 0,
  `order_reting` tinyint(4) NOT NULL DEFAULT 0,
  `order_note_reting` varchar(255) NOT NULL DEFAULT 'none',
  `order_paymentMethod` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>cash;1=>card',
  `order_status` tinyint(4) NOT NULL DEFAULT 0,
  `order_delivery` int(11) NOT NULL DEFAULT 0,
  `order_datatime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`order_id`, `order_users_id`, `order_address`, `order_type`, `order_price_delivery`, `order_price`, `order_total_price`, `order_coupon`, `order_reting`, `order_note_reting`, `order_paymentMethod`, `order_status`, `order_delivery`, `order_datatime`) VALUES
(13, 1, 0, 1, 0, 1022, 1022, 0, 3, 'Vvv', 0, 4, 1, '2025-11-06 14:16:27'),
(14, 1, 9, 1, 0, 1022, 1022, 0, 0, 'none', 0, 3, 1, '2025-11-16 09:34:01'),
(15, 1, 9, 0, 10, 2800, 2810, 0, 0, 'none', 0, 3, 1, '2025-12-12 05:31:34'),
(17, 1, 9, 0, 10, 2100, 2110, 0, 0, 'none', 0, 0, 0, '2025-12-12 06:04:45'),
(18, 1, 9, 0, 10, 2800, 2810, 0, 0, 'none', 0, 0, 0, '2025-12-18 05:09:53');

-- --------------------------------------------------------

--
-- Stand-in structure for view `orderdetailsview`
-- (See below for the actual view)
--
CREATE TABLE `orderdetailsview` (
`itemsPrice` double
,`countItems` bigint(21)
,`cart_id` int(11)
,`cart_users_id` int(11)
,`cart_items_id` int(11)
,`cart_order` int(11)
,`cart_price_now` double
,`items_id` int(11)
,`items_name` varchar(100)
,`items_name_ar` varchar(100)
,`items_desc` varchar(255)
,`items_desc_ar` varchar(255)
,`items_image` varchar(255)
,`items_count` int(11)
,`items_active` tinyint(4)
,`items_price` float
,`items_descount` float
,`items_datetime` timestamp
,`items_ca` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ordersview`
-- (See below for the actual view)
--
CREATE TABLE `ordersview` (
`order_id` int(11)
,`order_users_id` int(11)
,`order_address` int(11)
,`order_type` tinyint(4)
,`order_price_delivery` int(11)
,`order_price` int(11)
,`order_total_price` double
,`order_coupon` int(11)
,`order_reting` tinyint(4)
,`order_note_reting` varchar(255)
,`order_paymentMethod` tinyint(4)
,`order_status` tinyint(4)
,`order_delivery` int(11)
,`order_datatime` datetime
,`address_id` int(11)
,`address_users_id` int(11)
,`address_name` varchar(255)
,`address_city` varchar(255)
,`address_street` varchar(255)
,`address_lat` double
,`address_lang` double
);

-- --------------------------------------------------------

--
-- Table structure for table `textsetting`
--

CREATE TABLE `textsetting` (
  `textSetting_id` int(11) NOT NULL,
  `textSetting_title` varchar(255) NOT NULL,
  `textSetting_body` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `textsetting`
--

INSERT INTO `textsetting` (`textSetting_id`, `textSetting_title`, `textSetting_body`) VALUES
(1, 'A Summer Surprise ', 'Discount 40%');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `users_id` int(11) NOT NULL,
  `users_name` varchar(100) NOT NULL,
  `users_email` varchar(100) NOT NULL,
  `users_phone` varchar(100) NOT NULL,
  `users_virfiycode` varchar(1000) NOT NULL,
  `users_approve` tinyint(4) NOT NULL DEFAULT 0,
  `users_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `users_password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`users_id`, `users_name`, `users_email`, `users_phone`, `users_virfiycode`, `users_approve`, `users_datetime`, `users_password`) VALUES
(1, 'Ibrahim', 'ibrahim@gmail.com', '0981718315', '15582', 1, '2025-10-06 19:35:30', '7c222fb2927d828af22f592134e8932480637c0d'),
(2, 'majda', 'majd@gmail.com', '0934601589', '67560', 1, '2025-10-17 11:00:04', '8cb2237d0679ca88db6464eac60da96345513964'),
(3, 'Brrro', 'brrro@gmail.com', '0938194522', '76127', 1, '2025-10-17 11:22:47', '8cb2237d0679ca88db6464eac60da96345513964');

-- --------------------------------------------------------

--
-- Structure for view `cartview`
--
DROP TABLE IF EXISTS `cartview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cartview`  AS SELECT sum(`items`.`items_price` - `items`.`items_price` * `items`.`items_descount` / 100) AS `itemsPrice`, count(`cart`.`cart_items_id`) AS `countItems`, `cart`.`cart_id` AS `cart_id`, `cart`.`cart_users_id` AS `cart_users_id`, `cart`.`cart_items_id` AS `cart_items_id`, `cart`.`cart_order` AS `cart_order`, `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_descount` AS `items_descount`, `items`.`items_datetime` AS `items_datetime`, `items`.`items_ca` AS `items_ca` FROM (`cart` join `items` on(`items`.`items_id` = `cart`.`cart_items_id`)) WHERE `cart`.`cart_order` = 0 GROUP BY `cart`.`cart_items_id`, `cart`.`cart_users_id`, `cart`.`cart_order` ;

-- --------------------------------------------------------

--
-- Structure for view `items1view`
--
DROP TABLE IF EXISTS `items1view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `items1view`  AS SELECT `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_descount` AS `items_descount`, `items`.`items_datetime` AS `items_datetime`, `items`.`items_ca` AS `items_ca`, `categories`.`categories_id` AS `categories_id`, `categories`.`categories_name` AS `categories_name`, `categories`.`categories_name_ar` AS `categories_name_ar`, `categories`.`categories_image` AS `categories_image`, `categories`.`categories_datatime` AS `categories_datatime` FROM (`items` join `categories` on(`items`.`items_ca` = `categories`.`categories_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `itemstopselling`
--
DROP TABLE IF EXISTS `itemstopselling`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `itemstopselling`  AS SELECT count(`cart`.`cart_id`) AS `countItems`, `cart`.`cart_id` AS `cart_id`, `cart`.`cart_users_id` AS `cart_users_id`, `cart`.`cart_items_id` AS `cart_items_id`, `cart`.`cart_order` AS `cart_order`, `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_descount` AS `items_descount`, `items`.`items_datetime` AS `items_datetime`, `items`.`items_ca` AS `items_ca`, `items`.`items_price`- `items`.`items_price` * `items`.`items_descount` / 100 AS `itemsPriceDescount` FROM (`cart` join `items` on(`items`.`items_id` = `cart`.`cart_items_id`)) WHERE `cart`.`cart_order` <> 0 GROUP BY `cart`.`cart_items_id` ;

-- --------------------------------------------------------

--
-- Structure for view `myfavorite`
--
DROP TABLE IF EXISTS `myfavorite`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `myfavorite`  AS SELECT `favorite`.`favorite_id` AS `favorite_id`, `favorite`.`favorite_users_id` AS `favorite_users_id`, `favorite`.`favorite_items_id` AS `favorite_items_id`, `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_descount` AS `items_descount`, `items`.`items_datetime` AS `items_datetime`, `items`.`items_ca` AS `items_ca`, `users`.`users_id` AS `users_id` FROM ((`favorite` join `users` on(`users`.`users_id` = `favorite`.`favorite_users_id`)) join `items` on(`items`.`items_id` = `favorite`.`favorite_items_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `orderdetailsview`
--
DROP TABLE IF EXISTS `orderdetailsview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `orderdetailsview`  AS SELECT sum(`items`.`items_price` - `items`.`items_price` * `items`.`items_descount` / 100) AS `itemsPrice`, count(`cart`.`cart_items_id`) AS `countItems`, `cart`.`cart_id` AS `cart_id`, `cart`.`cart_users_id` AS `cart_users_id`, `cart`.`cart_items_id` AS `cart_items_id`, `cart`.`cart_order` AS `cart_order`, `cart`.`cart_price_now` AS `cart_price_now`, `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_descount` AS `items_descount`, `items`.`items_datetime` AS `items_datetime`, `items`.`items_ca` AS `items_ca` FROM (`cart` join `items` on(`items`.`items_id` = `cart`.`cart_items_id`)) WHERE `cart`.`cart_order` <> 0 GROUP BY `cart`.`cart_items_id`, `cart`.`cart_users_id`, `cart`.`cart_order` ;

-- --------------------------------------------------------

--
-- Structure for view `ordersview`
--
DROP TABLE IF EXISTS `ordersview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ordersview`  AS SELECT `order`.`order_id` AS `order_id`, `order`.`order_users_id` AS `order_users_id`, `order`.`order_address` AS `order_address`, `order`.`order_type` AS `order_type`, `order`.`order_price_delivery` AS `order_price_delivery`, `order`.`order_price` AS `order_price`, `order`.`order_total_price` AS `order_total_price`, `order`.`order_coupon` AS `order_coupon`, `order`.`order_reting` AS `order_reting`, `order`.`order_note_reting` AS `order_note_reting`, `order`.`order_paymentMethod` AS `order_paymentMethod`, `order`.`order_status` AS `order_status`, `order`.`order_delivery` AS `order_delivery`, `order`.`order_datatime` AS `order_datatime`, `address`.`address_id` AS `address_id`, `address`.`address_users_id` AS `address_users_id`, `address`.`address_name` AS `address_name`, `address`.`address_city` AS `address_city`, `address`.`address_street` AS `address_street`, `address`.`address_lat` AS `address_lat`, `address`.`address_lang` AS `address_lang` FROM (`order` left join `address` on(`address`.`address_id` = `order`.`order_address`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `address_users_id` (`address_users_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_users_id` (`cart_users_id`),
  ADD KEY `cart_items_id` (`cart_items_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categories_id`);

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`coupon_id`),
  ADD UNIQUE KEY `coupon_name` (`coupon_name`);

--
-- Indexes for table `delivary`
--
ALTER TABLE `delivary`
  ADD PRIMARY KEY (`delivary_id`);

--
-- Indexes for table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`favorite_id`),
  ADD KEY `favorite_items_id` (`favorite_items_id`),
  ADD KEY `favorite_users_id` (`favorite_users_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`items_id`),
  ADD KEY `items_ca` (`items_ca`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `textsetting`
--
ALTER TABLE `textsetting`
  ADD PRIMARY KEY (`textSetting_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`users_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categories_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `coupon`
--
ALTER TABLE `coupon`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `delivary`
--
ALTER TABLE `delivary`
  MODIFY `delivary_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `favorite`
--
ALTER TABLE `favorite`
  MODIFY `favorite_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `items_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `textsetting`
--
ALTER TABLE `textsetting`
  MODIFY `textSetting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `users_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`address_users_id`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`cart_users_id`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`cart_items_id`) REFERENCES `items` (`items_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`favorite_items_id`) REFERENCES `items` (`items_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`favorite_users_id`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`items_ca`) REFERENCES `categories` (`categories_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
