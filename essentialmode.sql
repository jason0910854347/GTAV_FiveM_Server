-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2020-09-12 14:46:21
-- 伺服器版本： 10.4.14-MariaDB
-- PHP 版本： 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `essentialmode`
--

DELIMITER $$
--
-- 程序
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ADD_COLUMN_IF_NOT_EXISTS` (IN `dbName` TINYTEXT, IN `tableName` TINYTEXT, IN `fieldName` TINYTEXT, IN `fieldDef` TEXT)  BEGIN
  IF NOT EXISTS (
    SELECT * FROM information_schema.COLUMNS
    WHERE `column_name`  = fieldName
    AND   `table_name`   = tableName
    AND   `table_schema` = dbName
  )
  THEN
    SET @ddl=CONCAT('ALTER TABLE ', dbName, '.', tableName, ' ADD COLUMN ', fieldName, ' ', fieldDef);
    PREPARE stmt from @ddl;
    EXECUTE stmt;
  END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- 資料表結構 `accounts`
--

CREATE TABLE `accounts` (
  `name` varchar(255) NOT NULL,
  `owner` varchar(64) DEFAULT NULL,
  `money` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `addon_account`
--

CREATE TABLE `addon_account` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 傾印資料表的資料 `addon_account`
--

INSERT INTO `addon_account` (`id`, `name`, `label`, `shared`) VALUES
(2, 'society_realestateagent', 'Agent immobilier', 1),
(3, 'society_state', 'State', 1),
(6, 'caution', 'Caution', 0),
(8, 'society_police', 'Police', 1),
(10, 'society_unicorn', 'Unicorn', 1),
(11, 'society_mecano', 'Mécano', 1),
(12, 'society_Mafiaf', 'Mafiaf', 1),
(15, 'society_cardealer', 'Concessionnaire', 1),
(16, 'property_black_money', 'Argent Sale Propriété', 0),
(17, 'society_mafia', 'Mafia', 1),
(18, 'society_ambulance', 'Ambulance', 1),
(19, 'society_mafia', 'Mafia', 1),
(20, 'society_police', 'Police', 1),
(21, 'society_Mafiaf', 'Mafiaf', 1),
(24, 'society_casino', 'Kasyno', 1),
(34, 'society_taxi', 'taxi', 1),
(35, 'society_nightclub', '夜總會', 1),
(37, 'society_bmdealer', 'Black Market Cardealer', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `addon_account_data`
--

CREATE TABLE `addon_account_data` (
  `id` int(11) NOT NULL,
  `account_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` double NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- 資料表結構 `addon_inventory`
--

CREATE TABLE `addon_inventory` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 傾印資料表的資料 `addon_inventory`
--

INSERT INTO `addon_inventory` (`id`, `name`, `label`, `shared`) VALUES
(2, 'society_state', 'State', 1),
(6, 'society_police', 'Police', 1),
(8, 'society_unicorn', 'Unicorn', 1),
(9, 'society_unicorn_fridge', 'Unicorn (frigo)', 1),
(10, 'society_mecano', 'Mécano', 1),
(11, 'society_Mafiaf', 'Mafiaf', 1),
(12, 'society_bmdealer', 'Cardealer', 1),
(14, 'society_cardealer', 'Concesionnaire', 1),
(15, 'property', 'Propriété', 0),
(16, 'society_mafia', 'Mafia', 1),
(17, 'society_ambulance', 'Ambulance', 1),
(21, 'society_cardealer', 'Concesionnaire', 1),
(22, 'society_casino', 'Kasyno', 1),
(23, 'society_casino_fridge', 'Casino (lodowka)', 1),
(29, 'society_nightclub', '夜總會', 1),
(30, 'society_nightclub_fridge', '夜總會(吧檯)', 1),
(33, 'society_bmdealer', 'Cardealer', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `addon_inventory_items`
--

CREATE TABLE `addon_inventory_items` (
  `id` int(11) NOT NULL,
  `inventory_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- 資料表結構 `billing`
--

CREATE TABLE `billing` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `sender` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `target_type` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- 資料表結構 `boats`
--

CREATE TABLE `boats` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- 資料表結構 `boat_categories`
--

CREATE TABLE `boat_categories` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 傾印資料表的資料 `boat_categories`
--

INSERT INTO `boat_categories` (`name`, `label`) VALUES
('boat', 'Boats'),
('subs', 'Submersibles');

-- --------------------------------------------------------

--
-- 資料表結構 `cardealer_vehicles`
--

CREATE TABLE `cardealer_vehicles` (
  `id` int(11) NOT NULL,
  `vehicle` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- 資料表結構 `characters`
--

CREATE TABLE `characters` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `dateofbirth` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `sex` varchar(1) COLLATE utf8mb4_bin NOT NULL DEFAULT 'M',
  `height` varchar(128) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- 資料表結構 `communityservice`
--

CREATE TABLE `communityservice` (
  `identifier` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `actions_remaining` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 傾印資料表的資料 `communityservice`
--

INSERT INTO `communityservice` (`identifier`, `actions_remaining`) VALUES
('steam:11000010a475d91', 5),
('steam:1100001133b9f7c', 10),
('steam:11000011bb4116d', 0),
('steam:1100001321d0d74', 34),
('steam:110000136668484', 31),
('steam:11000013dcf3af5', 0),
('steam:1100001424526a4', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `datastore`
--

CREATE TABLE `datastore` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 傾印資料表的資料 `datastore`
--

INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
('property', 'Propriété', 0),
('society_Mafiaf', 'Mafiaf', 1),
('society_ambulance', '醫護局', 1),
('society_casino', 'Kasyno', 1),
('society_mafia', 'Mafia', 1),
('society_nightclub', '夜總會', 1),
('society_police', '警政署', 1),
('society_state', 'State', 1),
('society_taxi', 'Taxi', 1),
('society_unicorn', 'Unicorn', 1),
('user_ears', 'Ears', 0),
('user_glasses', 'Glasses', 0),
('user_helmet', 'Helmet', 0),
('user_mask', 'Masque', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `datastores`
--

CREATE TABLE `datastores` (
  `name` varchar(255) NOT NULL,
  `owner` varchar(64) DEFAULT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `datastore_data`
--

CREATE TABLE `datastore_data` (
  `id` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- 資料表結構 `dpkeybinds`
--

CREATE TABLE `dpkeybinds` (
  `id` varchar(50) DEFAULT NULL,
  `keybind1` varchar(50) DEFAULT 'num4',
  `emote1` varchar(255) DEFAULT '',
  `keybind2` varchar(50) DEFAULT 'num5',
  `emote2` varchar(255) DEFAULT '',
  `keybind3` varchar(50) DEFAULT 'num6',
  `emote3` varchar(255) DEFAULT '',
  `keybind4` varchar(50) DEFAULT 'num7',
  `emote4` varchar(255) DEFAULT '',
  `keybind5` varchar(50) DEFAULT 'num8',
  `emote5` varchar(255) DEFAULT '',
  `keybind6` varchar(50) DEFAULT 'num9',
  `emote6` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `epc_bolos`
--

CREATE TABLE `epc_bolos` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `apperance` varchar(255) NOT NULL,
  `type_of_crime` varchar(50) NOT NULL,
  `fine` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



-- --------------------------------------------------------

--
-- 資料表結構 `fine_types`
--

CREATE TABLE `fine_types` (
  `id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 傾印資料表的資料 `fine_types`
--

INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
(1, '闖紅燈', 5000, 0),
(2, '違規迴轉', 5000, 0),
(3, '無照駕駛', 7500, 0),
(4, '違規停車 ', 5000, 0),
(5, '製造噪音 ', 5000, 0),
(6, '逆向行駛 ', 9000, 0),
(7, '阻礙路段', 7500, 0),
(9, '危險駕駛', 15000, 0),
(10, '拒絕配合攔查 ', 20000, 1),
(11, '惡意逼車 ', 8000, 0),
(12, '肇事逃逸', 10000, 1),
(13, '行為不受控 ', 5000, 1),
(14, '公然侮辱   ', 20000, 1),
(15, ' 走私汽車', 150000, 1),
(16, '無故揮舞武器', 10000, 1),
(17, '無槍枝許可證擁有槍枝', 10000, 1),
(18, '威脅恐嚇罪', 10000, 1),
(21, '對執法人員不敬', 20000, 2),
(22, '妨礙公務     ', 25000, 2),
(23, '持有非法槍械武器', 300000, 2),
(25, '非法持有大麻  ', 120000, 2),
(26, '非法持有冰毒', 150000, 2),
(27, '非法持有鴉片', 200000, 2),
(30, '綁架執法人員', 250000, 3),
(31, '意圖殺害市民', 300000, 3),
(33, '意圖攻擊&殺害執法人員', 400000, 3),
(35, '搶劫超商', 250000, 3),
(36, '搶劫珠寶店', 300000, 3),
(37, '搶劫銀行', 400000, 3),
(38, '搶劫太平洋', 550000, 3),
(42, '開贓車', 10000, 0),
(43, '竊盜罪', 20000, 0),
(44, '持有黑錢', 150000, 2),
(48, '持有違禁品(珠寶)', 400000, 2),
(49, '非法持有古柯鹼', 300000, 2),
(50, '非法區域逗留', 50000, 2);

-- --------------------------------------------------------

--
-- 資料表結構 `fine_types_mafia`
--

CREATE TABLE `fine_types_mafia` (
  `id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- 資料表結構 `fine_types_mafiaf`
--

CREATE TABLE `fine_types_mafiaf` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `inventories`
--

CREATE TABLE `inventories` (
  `name` varchar(255) NOT NULL,
  `owner` varchar(64) DEFAULT NULL,
  `items` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `items`
--

CREATE TABLE `items` (
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `limit` int(11) NOT NULL DEFAULT -1,
  `rare` int(11) NOT NULL DEFAULT 0,
  `can_remove` int(11) NOT NULL DEFAULT 1,
  `weight` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 傾印資料表的資料 `items`
--

INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`, `weight`) VALUES
('absinthe', '苦艾酒', 5, 0, 1, 0),
('alive_chicken', '活雞', 50, 0, 1, 0),
('bandage', '繃帶', 50, 0, 1, 0),
('beer', '啤酒', 15, 0, 1, 0),
('bottle', '空瓶罐', -1, 0, 1, 0),
('bread', '麵包', 30, 0, 1, 0),
('bulletbox', '子彈箱', 5, 0, 1, 0),
('bulletproof', '防彈背心', 1, 0, 1, 0),
('carokit', '修車包', 30, 0, 1, 0),
('carotool', '身體工具', 5, 0, 1, 0),
('champagne', '香檳酒', 10, 0, 1, 0),
('chips', '芯片', 5, 0, 1, 0),
('chocolate', '巧克力', 10, 0, 1, 0),
('cigarett', '香煙', 20, 0, 1, 0),
('clip', '夾', 10, 0, 1, 0),
('clothe', '衣服', 100, 0, 1, 0),
('cocacola', '可口可樂', 15, 0, 1, 0),
('coffe', '咖啡', 15, 0, 1, 0),
('coke', '古柯鹼', 150, 0, 1, 0),
('coke_pooch', '古柯鹼袋', 30, 0, 1, 0),
('contract', '交易過戶書', -1, 0, 1, 0),
('copper', '銅', 80, 0, 1, 0),
('croquettes', '飼料', 20, 0, 1, 0),
('cupcake', '杯形餅', 15, 0, 1, 0),
('cutted_wood', '切好的木頭', 50, 0, 1, 0),
('diamond', '鑽石', 5, 0, 1, 0),
('drpepper', '博士胡椒\r\n', 5, 0, 1, 0),
('energy', '能量飲料\r\n', 5, 0, 1, 0),
('essence', '汽油', 5, 0, 1, 0),
('fabric', '布', 100, 0, 1, 0),
('fish', '魚', 107, 0, 1, 0),
('fishbait', '魚餌', 30, 0, 1, 0),
('fishingrod', '釣竿', 25, 0, 1, 0),
('fixkit', '修車包', 30, 0, 1, 0),
('fixtool', '修車工具', 5, 0, 1, 0),
('flashlight', '手電筒', 50, 0, 1, 0),
('gazbottle', '氣瓶', 50, 0, 1, 0),
('gintonic', '杜松子酒', 5, 0, 1, 0),
('gold', '黃金', 30, 0, 1, 0),
('golem', '傀儡', 5, 0, 1, 0),
('hamburger', '漢堡', 30, 0, 1, 0),
('handcuffs', '手銬', 1, 0, 1, 0),
('hifi', 'HiFi', 1, 0, 1, 0),
('iron', '鐵', 60, 0, 1, 0),
('jager', '野格酒\r\n', 5, 0, 1, 0),
('jagerbomb', '野格炸彈', 5, 0, 1, 0),
('jagercerbere', '美洲虎', 3, 0, 1, 0),
('jewels', '珠寶', -1, 0, 1, 0),
('jumelles', '望遠鏡', 1, 0, 1, 0),
('jusfruit', '水果', 5, 0, 1, 0),
('leather', '皮革', -1, 0, 1, 0),
('lighter', '打火機', 1, 0, 1, 0),
('limonade', '檸檬水', 5, 0, 1, 0),
('martini', '馬提尼·比安科', 5, 0, 1, 0),
('meat', '肉', -1, 0, 1, 0),
('medikit', '醫療箱', 30, 0, 1, 0),
('meth', '甲基', 150, 0, 1, 0),
('meth_pooch', '甲基袋', 30, 0, 1, 0),
('milk', '牛奶', 30, 0, 1, 0),
('mleko', '牛奶', 30, 0, 1, 0),
('mojito', '莫吉托\r\n', 5, 0, 1, 0),
('moneywashid', '彪悍幣', -1, 0, 1, 0),
('notepad', '筆記本', 1, 0, 1, 0),
('opium', '鴉片', 150, 0, 1, 0),
('opium_pooch', '鴉片袋', 30, 0, 1, 0),
('packaged_chicken', '包裝好的雞', 100, 0, 1, 0),
('packaged_plank', '一包木板', 100, 0, 1, 0),
('petrol', '油', 10, 0, 1, 0),
('petrol_raffin', '精煉油', 10, 0, 1, 0),
('phone', '手機', 1, 0, 1, 0),
('radio', 'radio', 1, 0, 1, 0),
('rhum', '甜酒', 5, 0, 1, 0),
('rhumcoca', '朗姆可樂\r\n', 5, 0, 1, 0),
('rhumfruit', '朗果汁', 5, 0, 1, 0),
('rope', '麻繩', 1, 0, 1, 0),
('sacbillets', '錢袋', 100, 0, 1, 0),
('sandwich', '三明治', 15, 0, 1, 0),
('saucisson', '香腸', 5, 0, 1, 0),
('shark', '鯊魚', 20, 0, 1, 0),
('slaughtered_chicken', '屠宰過的雞肉', 50, 0, 1, 0),
('soda', '蘇打', 5, 0, 1, 0),
('stone', '石', 10, 0, 1, 0),
('teqpaf', '特克帕夫', 5, 0, 1, 0),
('tequila', '龍舌蘭酒', 15, 0, 1, 0),
('turtle', '海龜', 20, 0, 1, 0),
('turtlebait', '龜誘餌', 30, 0, 1, 0),
('vodka', '伏特加', 15, 0, 1, 0),
('vodkaenergy', '伏特加能量', 5, 0, 1, 0),
('vodkafruit', '伏特加果汁', 5, 0, 1, 0),
('washed_stone', '洗過的石頭', 10, 0, 1, 0),
('water', '水', 30, 0, 1, 0),
('weed', '大麻', 150, 0, 1, 0),
('weed_pooch', '大麻袋', 30, 0, 1, 0),
('whisky', '威士忌酒', 15, 0, 1, 0),
('wine', '酒', 10, 0, 1, 0),
('wood', '木', 50, 0, 1, 0),
('wool', '毛', 100, 0, 1, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `jail`
--

CREATE TABLE `jail` (
  `identifier` varchar(100) NOT NULL,
  `jail_time` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `jobs`
--

CREATE TABLE `jobs` (
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 傾印資料表的資料 `jobs`
--

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('Mafiaf', '北管企業', 1),
('ambulance', '醫院', 1),
('brinks', '中央銀行', 0),
('fisherman', '漁夫', 0),
('fueler', '煉油工', 0),
('garbage', '垃圾廠', 0),
('lumberjack', '樵夫', 0),
('mafia', '極罪企業', 1),
('mecano', '霄告車業', 1),
('miner', '礦工', 0),
('offambulance', '下班', 1),
('offpolice', '下班', 1),
('police', '警政署', 1),
('realestateagent', '市政府', 1),
('reporter', '記者', 1),
('slaughterer', '屠夫', 0),
('tailor', '裁縫', 0),
('taxi', '彪悍車行', 1),
('unemployed', '無業', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `job_grades`
--

CREATE TABLE `job_grades` (
  `id` int(11) NOT NULL,
  `job_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `grade` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext COLLATE utf8mb4_bin NOT NULL,
  `skin_female` longtext COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 傾印資料表的資料 `job_grades`
--

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1, 'unemployed', 0, 'unemployed', '市民', 2000, '{}', '{}'),
(13, 'lumberjack', 0, 'employee', '樵夫員', 3000, '{}', '{}'),
(14, 'fisherman', 0, 'employee', '出海員', 3000, '{}', '{}'),
(15, 'fueler', 0, 'employee', '煉油員', 3000, '{}', '{}'),
(16, 'reporter', 0, 'boss', '資深記者', 8000, '{}', '{}'),
(17, 'tailor', 0, 'employee', '裁縫員', 3000, '{\"mask_1\":0,\"arms\":1,\"glasses_1\":0,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":0,\"torso_1\":24,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":0,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":0,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":36,\"tshirt_2\":0,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":48,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}', '{\"mask_1\":0,\"arms\":5,\"glasses_1\":5,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":1,\"torso_1\":52,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":1,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":23,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":42,\"tshirt_2\":4,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":36,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}'),
(18, 'miner', 0, 'employee', '礦工員', 3000, '{}', '{}'),
(19, 'slaughterer', 0, 'employee', '屠仔員', 3000, '{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":67,\"pants_1\":36,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":0,\"torso_1\":56,\"beard_2\":6,\"shoes_1\":12,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":15,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":0,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}', '{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":72,\"pants_1\":45,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":1,\"torso_1\":49,\"beard_2\":6,\"shoes_1\":24,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":9,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":5,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}'),
(36, 'mafia', 0, 'soldato', '小弟', 0, '{}', '{}'),
(37, 'mafia', 1, 'soldato', '成員', 0, '{}', '{}'),
(38, 'mafia', 4, 'boss', '秘書', 0, '{}', '{}'),
(39, 'mafia', 5, 'boss', '人事', 0, '{}', '{}'),
(41, 'police', 1, 'officer', '正式警員', 6000, '{}', '{}'),
(42, 'police', 2, 'sergeant', '小隊長', 8000, '{}', '{}'),
(43, 'police', 4, 'boss', '局長', 10000, '{}', '{}'),
(44, 'police', 5, 'boss', '署長', 12000, '{}', '{}'),
(49, 'realestateagent', 0, 'location', '計程車行政', 20000, '{}', '{}'),
(50, 'realestateagent', 1, 'vendeur', '修車廠行政', 20000, '{}', '{}'),
(51, 'realestateagent', 2, 'gestion', '醫護局行政', 20000, '{}', '{}'),
(53, 'offpolice', 0, 'recruit', '基層警員', 1500, '{}', '{}'),
(54, 'offpolice', 1, 'officer', '正式警員', 2000, '{}', '{}'),
(55, 'offpolice', 2, 'sergeant', '隊長', 2000, '{}', '{}'),
(56, 'offpolice', 4, 'boss', '局長', 2000, '{}', '{}'),
(57, 'offpolice', 5, 'boss', '署長', 2000, '{}', '{}'),
(58, 'offambulance', 0, 'ambulance', '實習醫生', 2000, '{}', '{}'),
(59, 'offambulance', 1, 'doctor', '正式醫生', 2000, '{}', '{}'),
(60, 'offambulance', 4, 'boss', '副院長', 2000, '{}', '{}'),
(61, 'offambulance', 3, 'chief_doctor', '主任醫生', 2000, '{}', '{}'),
(67, 'mecano', 0, 'barman', '實習技工', 4000, '{}', '{}'),
(68, 'mecano', 1, 'dancer', '技工', 6000, '{}', '{}'),
(69, 'mecano', 6, 'boss', '總經理', 10000, '{}', '{}'),
(70, 'mecano', 7, 'boss', '董事長', 12000, '{}', '{}'),
(92, 'ambulance', 0, 'ambulance', '實習醫生', 6000, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(93, 'ambulance', 1, 'ambulance', '正式醫生', 8000, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(94, 'ambulance', 2, 'doctor', '高級醫生', 9000, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(95, 'ambulance', 3, 'chief_doctor', '主任醫生', 10000, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(96, 'ambulance', 4, 'boss', '副院長', 12000, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(97, 'ambulance', 5, 'boss', '院長', 14000, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(106, 'realestateagent', 4, 'loc', '管理員 ', 20000, '{}', '{}'),
(107, 'realestateagent', 5, 'loce', '副市長', 20000, '{}', '{}'),
(108, 'realestateagent', 3, 'boss', '行政管理員', 20000, '{}', '{}'),
(110, 'realestateagent', 6, 'boss', '市長', 20000, '{}', '{}'),
(112, 'mecano', 2, 'viceboss', '技師', 7000, '{}', '{}'),
(113, 'police', 0, 'recruit', '實習警員', 4000, '{}', '{}'),
(114, 'offambulance', 2, 'ems', '高級醫生', 2000, '{}', '{}'),
(115, 'offambulance', 5, 'boss', '院長', 2000, '{}', '{}'),
(116, 'mafia', 2, 'consigliere', '打手', 0, '{}', '{}'),
(129, 'brinks', 0, 'interim', '運鈔員', 3000, '{}', '{}'),
(130, 'garbage', 0, 'employee', '回收員', 3000, '{}', '{}'),
(158, 'taxi', 0, 'recrue', '實習司機', 3000, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":32,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":0,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":27,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(159, 'taxi', 1, 'novice', '司機', 3000, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":32,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":0,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":27,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(160, 'taxi', 2, 'experimente', '組長', 3000, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":26,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":57,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":11,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(161, 'taxi', 3, 'uber', '經理', 8000, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":26,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":57,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":11,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(162, 'taxi', 4, 'boss', '老闆', 10000, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":29,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":1,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":4,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(176, 'police', 3, 'sergeant', '總隊長', 9000, '{}', '{}'),
(177, 'offpolice', 3, 'sergeant', '總隊長', 2000, '{}', '{}'),
(178, 'mecano', 3, 'viceboss', '技師長', 8000, '{}', '{}'),
(179, 'mecano', 4, 'viceboss', '秘書', 9000, '{}', '{}'),
(180, 'mecano', 5, 'viceboss', '經理', 10000, '{}', '{}'),
(182, 'mafia', 3, 'consigliere', '幹部', 0, '{}', ''),
(183, 'mafia', 6, 'boss', '總經理', 0, '{}', '{}'),
(184, 'mafia', 7, 'boss', '副董事長', 0, '{}', '{}'),
(185, 'mafia', 8, 'boss', '董事長', 0, '{}', '{}'),
(186, 'Mafiaf', 0, 'soldato', '小弟', 0, '{}', '{}'),
(187, 'Mafiaf', 1, 'soldato', '成員', 0, '{}', '{}'),
(188, 'Mafiaf', 2, 'soldato', '打手', 0, '{}', '{}'),
(189, 'Mafiaf', 3, 'consigliere', '幹部', 0, '{}', '{}'),
(190, 'Mafiaf', 4, 'consigliere', '秘書', 0, '{}', '{}'),
(191, 'Mafiaf', 5, 'consigliere', '人事', 0, '{}', '{}'),
(192, 'Mafiaf', 6, 'boss', '總經理', 0, '{}', '{}'),
(193, 'Mafiaf', 7, 'boss', '副董事長', 0, '{}', '{}'),
(194, 'Mafiaf', 8, 'boss', '董事長', 0, '{}', '{}');

-- --------------------------------------------------------

--
-- 資料表結構 `licenses`
--

CREATE TABLE `licenses` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 傾印資料表的資料 `licenses`
--

INSERT INTO `licenses` (`id`, `type`, `label`) VALUES
(1, 'dmv', '道路規範'),
(2, 'drive', '駕駛執照'),
(3, 'drive_bike', '摩托車執照'),
(4, 'drive_truck', '卡車執照'),
(5, 'drive_arms', '武器執照'),
(7, 'weapon', '擁有槍執照'),
(9, 'boating', '船隻駕駛');

-- --------------------------------------------------------

--
-- 資料表結構 `meeta_accessory_inventory`
--

CREATE TABLE `meeta_accessory_inventory` (
  `Id` int(11) NOT NULL,
  `owner` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `migrations`
--

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL,
  `module` varchar(64) DEFAULT NULL,
  `last` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `outfits`
--

CREATE TABLE `outfits` (
  `idSteam` varchar(255) NOT NULL,
  `dad` int(11) NOT NULL DEFAULT 0,
  `mum` int(11) NOT NULL DEFAULT 0,
  `dadmumpercent` int(11) NOT NULL DEFAULT 0,
  `skinton` int(11) NOT NULL DEFAULT 0,
  `eyecolor` int(11) NOT NULL DEFAULT 0,
  `acne` int(11) NOT NULL DEFAULT 0,
  `skinproblem` int(11) NOT NULL DEFAULT 0,
  `freckle` int(11) NOT NULL DEFAULT 0,
  `wrinkle` int(11) NOT NULL DEFAULT 0,
  `wrinkleopacity` int(11) NOT NULL DEFAULT 0,
  `eyebrow` int(11) NOT NULL DEFAULT 0,
  `eyebrowopacity` int(11) NOT NULL DEFAULT 0,
  `beard` int(11) NOT NULL DEFAULT 0,
  `beardopacity` int(11) NOT NULL DEFAULT 0,
  `beardcolor` int(11) NOT NULL DEFAULT 0,
  `hair` int(11) NOT NULL DEFAULT 0,
  `hairtext` int(11) NOT NULL DEFAULT 0,
  `torso` int(11) NOT NULL DEFAULT 0,
  `torsotext` int(11) NOT NULL DEFAULT 0,
  `leg` int(11) NOT NULL DEFAULT 0,
  `legtext` int(11) NOT NULL DEFAULT 0,
  `shoes` int(11) NOT NULL DEFAULT 0,
  `shoestext` int(11) NOT NULL DEFAULT 0,
  `accessory` int(11) NOT NULL DEFAULT 0,
  `accessorytext` int(11) NOT NULL DEFAULT 0,
  `undershirt` int(11) NOT NULL DEFAULT 0,
  `undershirttext` int(11) NOT NULL DEFAULT 0,
  `torso2` int(11) NOT NULL DEFAULT 0,
  `torso2text` int(11) NOT NULL DEFAULT 0,
  `prop_hat` int(11) NOT NULL DEFAULT 0,
  `prop_hat_text` int(11) NOT NULL DEFAULT 0,
  `prop_glasses` int(11) NOT NULL DEFAULT 0,
  `prop_glasses_text` int(11) NOT NULL DEFAULT 0,
  `prop_earrings` int(11) NOT NULL DEFAULT 0,
  `prop_earrings_text` int(11) NOT NULL DEFAULT 0,
  `prop_watches` int(11) NOT NULL DEFAULT 0,
  `prop_watches_text` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `owned_properties`
--

CREATE TABLE `owned_properties` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- 資料表結構 `owned_vehicles`
--

CREATE TABLE `owned_vehicles` (
  `owner` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `vehicle` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_bin NOT NULL DEFAULT 'car',
  `job` varchar(20) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `stored` tinyint(1) NOT NULL DEFAULT 0,
  `jamstate` int(11) NOT NULL DEFAULT 0,
  `jamboost` float NOT NULL DEFAULT 1,
  `finance` int(32) NOT NULL DEFAULT 0,
  `financetimer` int(32) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 資料表結構 `phone_app_chat`
--

CREATE TABLE `phone_app_chat` (
  `id` int(11) NOT NULL,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `phone_calls`
--

CREATE TABLE `phone_calls` (
  `id` int(11) NOT NULL,
  `owner` varchar(10) NOT NULL COMMENT 'Num tel proprio',
  `num` varchar(10) NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `phone_messages`
--

CREATE TABLE `phone_messages` (
  `id` int(11) NOT NULL,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `phone_users_contacts`
--

CREATE TABLE `phone_users_contacts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `properties`
--

CREATE TABLE `properties` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `entering` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `exit` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `inside` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `outside` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `ipls` varchar(255) COLLATE utf8mb4_bin DEFAULT '[]',
  `gateway` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `is_single` int(11) DEFAULT NULL,
  `is_room` int(11) DEFAULT NULL,
  `is_gateway` int(11) DEFAULT NULL,
  `room_menu` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 傾印資料表的資料 `properties`
--

INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
(1, 'WhispymoundDrive', '2677 Whispymound Drive', '{\"y\":564.89,\"z\":182.959,\"x\":119.384}', '{\"x\":117.347,\"y\":559.506,\"z\":183.304}', '{\"y\":557.032,\"z\":183.301,\"x\":118.037}', '{\"y\":567.798,\"z\":182.131,\"x\":119.249}', '[]', NULL, 1, 1, 0, '{\"x\":118.748,\"y\":566.573,\"z\":175.697}', 1300000),
(2, 'NorthConkerAvenue2045', '2045 North Conker Avenue', '{\"x\":372.796,\"y\":428.327,\"z\":144.685}', '{\"x\":373.548,\"y\":422.982,\"z\":144.907},', '{\"y\":420.075,\"z\":145.904,\"x\":372.161}', '{\"x\":372.454,\"y\":432.886,\"z\":143.443}', '[]', NULL, 1, 1, 0, '{\"x\":377.349,\"y\":429.422,\"z\":137.3}', 1300000),
(3, 'RichardMajesticApt2', 'Richard Majestic, Apt 2', '{\"y\":-379.165,\"z\":37.961,\"x\":-936.363}', '{\"y\":-365.476,\"z\":113.274,\"x\":-913.097}', '{\"y\":-367.637,\"z\":113.274,\"x\":-918.022}', '{\"y\":-382.023,\"z\":37.961,\"x\":-943.626}', '[]', NULL, 1, 1, 0, '{\"x\":-927.554,\"y\":-377.744,\"z\":112.674}', 1300000),
(4, 'NorthConkerAvenue2044', '2044 North Conker Avenue', '{\"y\":440.8,\"z\":146.702,\"x\":346.964}', '{\"y\":437.456,\"z\":148.394,\"x\":341.683}', '{\"y\":435.626,\"z\":148.394,\"x\":339.595}', '{\"x\":350.535,\"y\":443.329,\"z\":145.764}', '[]', NULL, 1, 1, 0, '{\"x\":337.726,\"y\":436.985,\"z\":140.77}', 1300000),
(5, 'WildOatsDrive', '3655 Wild Oats Drive', '{\"y\":502.696,\"z\":136.421,\"x\":-176.003}', '{\"y\":497.817,\"z\":136.653,\"x\":-174.349}', '{\"y\":495.069,\"z\":136.666,\"x\":-173.331}', '{\"y\":506.412,\"z\":135.0664,\"x\":-177.927}', '[]', NULL, 1, 1, 0, '{\"x\":-174.725,\"y\":493.095,\"z\":129.043}', 1300000),
(6, 'HillcrestAvenue2862', '2862 Hillcrest Avenue', '{\"y\":596.58,\"z\":142.641,\"x\":-686.554}', '{\"y\":591.988,\"z\":144.392,\"x\":-681.728}', '{\"y\":590.608,\"z\":144.392,\"x\":-680.124}', '{\"y\":599.019,\"z\":142.059,\"x\":-689.492}', '[]', NULL, 1, 1, 0, '{\"x\":-680.46,\"y\":588.6,\"z\":136.769}', 1300000),
(7, 'LowEndApartment', 'Appartement de base', '{\"y\":-1078.735,\"z\":28.4031,\"x\":292.528}', '{\"y\":-1007.152,\"z\":-102.002,\"x\":265.845}', '{\"y\":-1002.802,\"z\":-100.008,\"x\":265.307}', '{\"y\":-1078.669,\"z\":28.401,\"x\":296.738}', '[]', NULL, 1, 1, 0, '{\"x\":265.916,\"y\":-999.38,\"z\":-100.008}', 1300000),
(8, 'MadWayneThunder', '2113 Mad Wayne Thunder', '{\"y\":454.955,\"z\":96.462,\"x\":-1294.433}', '{\"x\":-1289.917,\"y\":449.541,\"z\":96.902}', '{\"y\":446.322,\"z\":96.899,\"x\":-1289.642}', '{\"y\":455.453,\"z\":96.517,\"x\":-1298.851}', '[]', NULL, 1, 1, 0, '{\"x\":-1287.306,\"y\":455.901,\"z\":89.294}', 1300000),
(9, 'HillcrestAvenue2874', '2874 Hillcrest Avenue', '{\"x\":-853.346,\"y\":696.678,\"z\":147.782}', '{\"y\":690.875,\"z\":151.86,\"x\":-859.961}', '{\"y\":688.361,\"z\":151.857,\"x\":-859.395}', '{\"y\":701.628,\"z\":147.773,\"x\":-855.007}', '[]', NULL, 1, 1, 0, '{\"x\":-858.543,\"y\":697.514,\"z\":144.253}', 1300000),
(10, 'HillcrestAvenue2868', '2868 Hillcrest Avenue', '{\"y\":620.494,\"z\":141.588,\"x\":-752.82}', '{\"y\":618.62,\"z\":143.153,\"x\":-759.317}', '{\"y\":617.629,\"z\":143.153,\"x\":-760.789}', '{\"y\":621.281,\"z\":141.254,\"x\":-750.919}', '[]', NULL, 1, 1, 0, '{\"x\":-762.504,\"y\":618.992,\"z\":135.53}', 1300000),
(11, 'TinselTowersApt12', 'Tinsel Towers, Apt 42', '{\"y\":37.025,\"z\":42.58,\"x\":-618.299}', '{\"y\":58.898,\"z\":97.2,\"x\":-603.301}', '{\"y\":58.941,\"z\":97.2,\"x\":-608.741}', '{\"y\":30.603,\"z\":42.524,\"x\":-620.017}', '[]', NULL, 1, 1, 0, '{\"x\":-622.173,\"y\":54.585,\"z\":96.599}', 1300000),
(37, 'IntegrityWay', '4 Integrity Way', '{\"x\":-47.804,\"y\":-585.867,\"z\":36.956}', NULL, NULL, '{\"x\":-54.178,\"y\":-583.762,\"z\":35.798}', '[]', NULL, 0, 0, 1, NULL, 1300000),
(38, 'IntegrityWay28', '4 Integrity Way - Apt 28', NULL, '{\"x\":-31.409,\"y\":-594.927,\"z\":79.03}', '{\"x\":-26.098,\"y\":-596.909,\"z\":79.03}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{\"x\":-11.923,\"y\":-597.083,\"z\":78.43}', 1300000),
(39, 'IntegrityWay30', '4 Integrity Way - Apt 30', NULL, '{\"x\":-17.702,\"y\":-588.524,\"z\":89.114}', '{\"x\":-16.21,\"y\":-582.569,\"z\":89.114}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{\"x\":-26.327,\"y\":-588.384,\"z\":89.123}', 1300000);

-- --------------------------------------------------------

--
-- 資料表結構 `rented_vehicles`
--

CREATE TABLE `rented_vehicles` (
  `vehicle` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `player_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(22) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- 資料表結構 `shops`
--

CREATE TABLE `shops` (
  `id` int(11) NOT NULL,
  `store` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `item` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 傾印資料表的資料 `shops`
--

INSERT INTO `shops` (`id`, `store`, `item`, `price`) VALUES
(14, 'RobsLiquor', 'hamburger', 500),
(15, 'LTDgasoline', 'hamburger', 500),
(16, 'TwentyFourSeven', 'cupcake', 300),
(17, 'RobsLiquor', 'cupcake', 300),
(18, 'LTDgasoline', 'cupcake', 300),
(22, 'TwentyFourSeven', 'cocacola', 250),
(23, 'RobsLiquor', 'cocacola', 250),
(24, 'LTDgasoline', 'cocacola', 250),
(28, 'TwentyFourSeven', 'coffe', 250),
(29, 'RobsLiquor', 'coffe', 250),
(30, 'LTDgasoline', 'coffe', 250),
(31, 'TwentyFourSeven', 'milk', 400),
(32, 'RobsLiquor', 'milk', 400),
(33, 'LTDgasoline', 'milk', 400),
(46, 'Bar', 'beer', 500),
(47, 'Bar', 'wine', 800),
(48, 'Bar', 'vodka', 2000),
(49, 'Bar', 'tequila', 1500),
(50, 'Bar', 'whisky', 2000),
(51, 'Bar', 'cigarett', 300),
(52, 'Bar', 'lighter', 500),
(53, 'Disco', 'beer', 500),
(54, 'Disco', 'wine', 800),
(55, 'Disco', 'vodka', 2000),
(56, 'Disco', 'tequila', 1500),
(57, 'Disco', 'whisky', 2000),
(58, 'Disco', 'gintonic', 1000),
(59, 'Disco', 'absinthe', 1500),
(60, 'Disco', 'champagne', 150),
(61, 'Disco', 'cigarett', 300),
(62, 'Disco', 'lighter', 500),
(63, 'TwentyFourSeven', 'bread', 200),
(64, 'RobsLiquor', 'bread', 200),
(65, 'LTDgasoline', 'bread', 200),
(66, 'TwentyFourSeven', 'water', 200),
(67, 'RobsLiquor', 'water', 200),
(68, 'LTDgasoline', 'water', 200),
(69, 'TwentyFourSeven', 'cigarett', 300),
(70, 'RobsLiquor', 'cigarett', 300),
(71, 'LTDgasoline', 'cigarett', 300),
(72, 'TwentyFourSeven', 'lighter', 500),
(73, 'RobsLiquor', 'lighter', 500),
(74, 'LTDgasoline', 'lighter', 500),
(79, 'TwentyFourSeven', 'fishingrod', 1500),
(80, 'RobsLiquor', 'fishingrod', 1500),
(81, 'LTDgasoline', 'fishingrod', 1500),
(82, 'TwentyFourSeven', 'fishbait', 100),
(83, 'RobsLiquor', 'fishbait', 100),
(84, 'LTDgasoline', 'fishbait', 100),
(85, 'TwentyFourSeven', 'turtlebait', 250),
(86, 'RobsLiquor', 'turtlebait', 250),
(87, 'LTDgasoline', 'turtlebait', 250),
(91, 'RobsLiquor', 'sandwich', 450),
(92, 'LTDgasoline', 'sandwich', 450),
(93, 'TwentyFourSeven', 'sandwich', 450),
(104, 'Disco', 'bulletbox', 5000),
(105, 'LTDgasoline', 'bulletbox', 5000),
(106, 'RobsLiquor', 'bulletbox', 5000),
(107, 'TwentyFourSeven', 'bulletbox', 5000),
(112, 'TwentyFourSeven', 'bulletproof', 80000),
(113, 'RobsLiquor', 'bulletproof', 80000),
(114, 'LTDgasoline', 'bulletproof', 80000),
(115, 'Disco', 'bulletproof', 80000);

-- --------------------------------------------------------

--
-- 資料表結構 `society_moneywash`
--

CREATE TABLE `society_moneywash` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `society` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- 資料表結構 `trunk_inventory`
--

CREATE TABLE `trunk_inventory` (
  `id` int(11) NOT NULL,
  `plate` varchar(8) COLLATE utf8mb4_bin NOT NULL,
  `data` text COLLATE utf8mb4_bin NOT NULL,
  `owned` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- 資料表結構 `twitter_accounts`
--

CREATE TABLE `twitter_accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- 資料表結構 `twitter_likes`
--

CREATE TABLE `twitter_likes` (
  `id` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- 資料表結構 `twitter_tweets`
--

CREATE TABLE `twitter_tweets` (
  `id` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `users`
--

CREATE TABLE `users` (
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `skin` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `job` varchar(50) COLLATE utf8mb4_bin DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `position` varchar(36) COLLATE utf8mb4_bin DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `permission_level` int(11) DEFAULT NULL,
  `group` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `lastname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `dateofbirth` varchar(25) COLLATE utf8mb4_bin DEFAULT '',
  `sex` varchar(10) COLLATE utf8mb4_bin DEFAULT '',
  `height` varchar(5) COLLATE utf8mb4_bin DEFAULT '',
  `phone_number` int(11) DEFAULT NULL,
  `isDead` bit(1) DEFAULT b'0',
  `status` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `last_property` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `pet` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `tattoos` varchar(3000) COLLATE utf8mb4_bin DEFAULT NULL,
  `jail` int(11) NOT NULL DEFAULT 0,
  `accounts` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `inventory` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `last_name` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `dob` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `is_male` int(11) DEFAULT 1,
  `accessories` mediumtext COLLATE utf8mb4_bin DEFAULT NULL,
  `first_name` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- 資料表結構 `user_accounts`
--

CREATE TABLE `user_accounts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `money` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- 資料表結構 `user_contacts`
--

CREATE TABLE `user_contacts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- 資料表結構 `user_inventory`
--

CREATE TABLE `user_inventory` (
  `id` int(11) NOT NULL,
  `identifier` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  `item` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- 資料表結構 `user_licenses`
--

CREATE TABLE `user_licenses` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- 資料表結構 `vehicles`
--

CREATE TABLE `vehicles` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 傾印資料表的資料 `vehicles`
--

INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
('Challenger', '16CHALLENGER', 5510000, 'Dodge'),
('760i', '17m760i', 4340000, 'Bmw'),
('18Velar', '18Velar', 800000, 'Land Rover'),
('Huracán EVO', '18performante', 12800000, 'Lamborghini'),
('S650', '19S650', 3800000, 'Benz'),
('gt500', '19gt500', 6850000, 'FORD'),
('rs7', '2016rs7', 9500000, 'Audi'),
('2018s63', '2018s63', 2147483647, 'UPCAR'),
('2019gt3rs', '2019gt3rs', 2147483647, 'UPCAR'),
('370Z', '370Z', 4800000, 'NISSAN'),
('570S', '570S2', 14400000, 'McLaren'),
('599', '599xxevo', 18600000, 'Ferrari'),
('600lt', '600lt', 16500000, 'McLaren'),
('610DTM', '610DTM', 2147483647, 'VIP'),
('63lb', '63lb', 10420000, 'Porsche'),
('650S', '650S', 17600000, 'McLaren'),
('718', '718caymans', 9820000, 'Porsche'),
('720s', '720s', 18900000, 'McLaren'),
('812nlargo', '812nlargo', 2147483647, 'UPCAR'),
('911r', '911r', 2147483647, 'VIP'),
('A8', 'A8FSI', 6800000, 'Audi'),
('阿波羅(太陽之子)', 'APOLLO', 2147483647, 'VIP'),
('M5', 'BMCI', 8200000, 'Bmw'),
('HOMMAGE', 'BMWHOMMAGE', 10120000, 'Bmw'),
('M8', 'BMWM8', 10880000, 'Bmw'),
('BUGATTI', 'BUGATTI', 24500000, 'Bugatt'),
('C63', 'C63', 5800000, 'Benz'),
('CONTSS', 'CONTSS18', 11570000, 'Bentley'),
('M4F82', 'F82', 5200000, 'Bmw'),
('FD2', 'FD2', 1850000, 'honda'),
('FK8', 'FK8', 3680000, 'honda'),
('gogoro2', 'GOGORO2', 50000, 'Newbie'),
('GTCL', 'GTCL', 10650000, 'Ferrari'),
('卡丁車', 'KART', 1500000, 'play'),
('AgeraR', 'KoenigseggAgeraR', 18850000, 'Koenigsegg'),
('電牛', 'LAMtmc', 2147483647, 'VIP'),
('LANEX400', 'LANEX400', 80000, 'Newbie'),
('LP610', 'LP610', 15500000, 'Lamborghini'),
('LykanHypersport', 'LykanHypersport', 35000000, 'Lykan HyperSport'),
('M3', 'M3F80', 5500000, 'Bmw'),
('s63C', 'MERS63C', 8000000, 'Benz'),
('NSX', 'NC1', 8650000, 'honda'),
('RAPTOR150', 'RAPTOR150', 7000000, 'FORD'),
('RCF', 'RCF', 6280000, 'Lexuse'),
('RT70', 'RT70', 5600000, 'Dodge'),
('SCIJO', 'SCIJO', 3250000, 'Volkswagen'),
('SENNA', 'SENNA', 2147483647, 'VIP'),
('R34', 'SKYLINE', 7850000, 'NISSAN'),
('SQ7', 'SQ72016', 8500000, 'Audi'),
('SUPERB', 'SUPERB', 670000, 'Skoda'),
('賽道卡丁', 'SUPERKART', 1800000, 'play'),
('DBSSuperleggera', 'SUPERLEGGERA', 16800000, 'Aston Martin'),
('TT', 'TTRS', 7800000, 'Audi'),
('a45amg', 'a45amg', 4300000, 'Benz'),
('阿法', 'aierfa', 5850000, 'toyota'),
('alfier', 'alfieri', 11500000, 'Maserati'),
('AMG GT-R', 'amggt', 12380000, 'Benz'),
('AMG GT-R', 'amggtrr20', 13580000, 'Benz'),
('ap2', 'ap2', 1000000, 'honda'),
('Vanquish', 'ast', 18800000, 'Aston Martin'),
('LP700S', 'aventadors', 16550000, 'Lamborghini'),
('gt2014', 'bcgt2014', 11250000, 'Bentley'),
('bentayga17', 'bentayga17', 8850000, 'Bentley'),
('bg700w', 'bg700w', 4800000, 'Benz'),
('brabus500', 'brabus500', 2147483647, 'VIP'),
('brabus850', 'brabus850', 2147483647, 'UPCAR'),
('山豬王', 'bugatticentodieci', 2147483647, 'VIP'),
('c7', 'c7', 5650000, 'Chevrolet'),
('c8', 'c8', 10690000, 'Chevrolet'),
('CAMRRY', 'cam8tun', 80000, 'Newbie'),
('cbr650r', 'cbr650r', 2147483647, 'VIP'),
('celisupra', 'celisupra', 1450000, 'toyota'),
('布加迪凱龍', 'centuria', 2147483647, 'VIP'),
('魔龍', 'chironps', 2147483647, 'VIP'),
('chr', 'chr', 1200000, 'toyota'),
('cla45b', 'cla45b', 2147483647, 'UPCAR'),
('gt2013', 'contgt13', 11800000, 'Bentley'),
('crv', 'crv', 800000, 'honda'),
('DB11', 'db11', 15800000, 'Aston Martin'),
('DB9', 'db9v', 14800000, 'Aston Martin'),
('DBS', 'dbs2009', 17800000, 'Aston Martin'),
('divo', 'divo', 25000000, 'Bugatt'),
('e400w213', 'e400w213', 3250000, 'Benz'),
('e63sw213    ', 'e63sw213    ', 6350000, 'Benz'),
('e92lb', 'e92lb', 5200000, 'Bmw'),
('Eclipse GT', 'eclipsegt06', 80000, 'Newbie'),
('evo9mr', 'evo9mr', 80000, 'Newbie'),
('fc15', 'fc15', 15800000, 'Ferrari'),
('fxxk', 'fxxkevo', 23500000, 'Ferrari'),
('FXXK(賽道版)', 'fxxkevo2018', 2147483647, 'VIP'),
('g65amg6x6', 'g63amg6x6', 2147483647, 'UPCAR'),
('g65amg', 'g65amg', 8500000, 'Benz'),
('gle450', 'gle450', 3500000, 'Benz'),
('gsxr1300', 'gsxr1300', 2800000, 'Motorcycle'),
('FORD GT', 'gt17', 2147483647, 'VIP'),
('GTR', 'gtr', 9250000, 'NISSAN'),
('honody', 'honody', 700000, 'honda'),
('LP610(鯊魚塗裝)', 'huralbnormal', 2147483647, 'VIP'),
('hurevo', 'hurevo', 14800000, 'Lamborghini'),
('2019 evos', 'hurevos', 2147483647, 'UPCAR'),
('I8', 'i8', 10600000, 'Bmw'),
('458', 'italia458', 2147483647, 'VIP'),
('j50', 'j50', 15560000, 'Ferrari'),
('LP750', 'lb750sv', 2147483647, 'VIP'),
('lp700r(牛王)', 'lp700r', 2147483647, 'VIP'),
('LP610', 'lwhuracan', 2147483647, 'VIP'),
('m4lb', 'm4lb', 6850000, 'Bmw'),
('m6coupe', 'm6coupe', 9850000, 'Bmw'),
('masgc', 'masgc', 2147483647, 'UPCAR'),
('mc250', 'mc250', 3500000, 'Benz'),
('mgrantur', 'mgrantur2010', 9500000, 'Maserati'),
('models', 'models', 3800000, 'Tesla'),
('MP4 12C', 'mp412c', 12300000, 'McLaren'),
('mr2', 'mr2zzw30', 2450000, 'toyota'),
('m3', 'mz3', 850000, 'Mazda'),
('漢堡車', 'patty', 2800000, 'play'),
('寬體458', 'pd458wb', 2147483647, 'VIP'),
('GT3', 'pgt3', 10600000, 'Porsche'),
('幻影8', 'phantom8', 2147483647, 'VIP'),
('488', 'pista', 18850000, 'Ferrari'),
('488(可開關敞篷)', 'pistaspider19', 2147483647, 'VIP'),
('r1', 'r1ma', 1150000, 'Motorcycle'),
('R32', 'r32', 5450000, 'NISSAN'),
('r8c20', 'r8c20', 2147483647, 'UPCAR'),
('r8v10', 'r8v10', 10800000, 'Audi'),
('Rapide', 'rapide', 14800000, 'Aston Martin'),
('regera', 'regera', 19500000, 'Koenigsegg'),
('bentley', 'rmodbentley1', 11650000, 'Bentley'),
('bentleygt', 'rmodbentleygt', 11860000, 'Bentley'),
('Voiture Noire', 'rmodbugatti', 2147483647, 'VIP'),
('chiron300', 'rmodchiron300', 2147483647, 'VIP'),
('f12', 'rmodf12tdf', 13500000, 'Ferrari'),
('GT63S', 'rmodgt63', 9800000, 'Benz'),
('lp770', 'rmodlp770', 17500000, 'Lamborghini'),
('日納瓦(終極跑車)', 'rmodscg003s', 2147483647, 'VIP'),
('勞斯萊斯', 'rmodsian', 2147483647, 'VIP'),
('毒藥', 'rmodveneno', 2147483647, 'VIP'),
('X6 M', 'rmodx6', 6650000, 'Bmw'),
('rs6', 'rs6pd600', 7500000, 'Audi'),
('rx811', 'rx811', 650000, 'Mazda'),
('s5', 's5', 6800000, 'Audi'),
('s560w222', 's560w222', 3820000, 'Benz'),
('silvias15', 'silvias15', 3560000, 'NISSAN'),
('sls', 'sls', 10420000, 'Benz'),
('911', 'str20', 12200000, 'Porsche'),
('strrv', 'strrv', 680000, 'Land Rover'),
('subisti08', 'subisti08', 1030000, 'SUBARU'),
('suwrxsti', 'suwrxsti', 5684000, 'SUBARU'),
('svj', 'svj63', 19800000, 'Lamborghini'),
('AX', 'teslax', 4350000, 'Tesla'),
('tr22', 'tr22', 9860000, 'Tesla'),
('URUS', 'turus', 11800000, 'Lamborghini'),
('Vantage', 'vantage', 8800000, 'Aston Martin'),
('現代小鋼炮', 'velostern   ', 80000, 'Newbie'),
('venatus', 'venatus', 2147483647, 'UPCAR'),
('GTI', 'vwvr', 8560000, 'Volkswagen'),
('xmax', 'xmax', 800000, 'Motorcycle'),
('z4 Turbo', 'z4bmw', 6680000, 'Bmw'),
('LP770', 'zentenario', 2147483647, 'VIP'),
('zentorno2', 'zentorno2', 17800000, 'Lamborghini'),
('義大利神獸', 'zerouno', 2147483647, 'VIP'),
('風神 敞篷版', 'zondab1', 2147483647, 'VIP'),
('zx10r', 'zx10r', 4200000, 'Motorcycle');

-- --------------------------------------------------------

--
-- 資料表結構 `vehicles_for_sale`
--

CREATE TABLE `vehicles_for_sale` (
  `id` int(11) NOT NULL,
  `seller` varchar(50) NOT NULL,
  `vehicleProps` longtext NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `vehicle_categories`
--

CREATE TABLE `vehicle_categories` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 傾印資料表的資料 `vehicle_categories`
--

INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
('Aston Martin', '奧斯頓馬丁'),
('Audi', '奧迪'),
('Bentley', '賓利'),
('Benz', '賓士'),
('Bmw', '寶馬'),
('Bugatt', '布加迪'),
('Chevrolet', '雪弗蘭'),
('Dodge', '道奇'),
('FORD', '福特'),
('Ferrari', '法拉利'),
('Infiniti', 'Infiniti'),
('Koenigsegg', '柯尼賽克'),
('Lamborghini', '藍寶堅尼'),
('Land Rover', '路虎'),
('Lexuse', '雷瑟斯'),
('Lykan HyperSport', '萊肯'),
('Maserati', '瑪莎拉蒂'),
('Mazda', '馬自達'),
('McLaren', '麥拉倫'),
('Motorcycle', '摩托車'),
('NISSAN', '日產'),
('Newbie', '新手車'),
('Porsche', '保時捷'),
('SUBARU', '速霸陸'),
('Skoda', 'Skoda'),
('Tesla', '特斯拉'),
('UPCAR', '代幣車'),
('VIP', '贊助車'),
('Volkswagen', '福斯'),
('honda', '本田'),
('play', '古靈精怪'),
('toyota', '豐田');

-- --------------------------------------------------------

--
-- 資料表結構 `vehicle_sold`
--

CREATE TABLE `vehicle_sold` (
  `client` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `soldby` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `date` varchar(50) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- 資料表結構 `weashops`
--

CREATE TABLE `weashops` (
  `id` int(11) NOT NULL,
  `zone` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `item` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 傾印資料表的資料 `weashops`
--

INSERT INTO `weashops` (`id`, `zone`, `item`, `price`) VALUES
(1, 'GunShop', 'WEAPON_PISTOL', 100000),
(2, 'BlackWeashop', 'WEAPON_PISTOL', 100000),
(5, 'GunShop', 'WEAPON_GOLFCLUB', 50000),
(6, 'BlackWeashop', 'WEAPON_GOLFCLUB', 50000),
(9, 'GunShop', 'WEAPON_BAT', 50000),
(10, 'BlackWeashop', 'WEAPON_BAT', 50000),
(15, 'GunShop', 'WEAPON_MUSKET', 300000),
(16, 'BlackWeashop', 'WEAPON_MUSKET', 300000),
(17, 'GunShop', 'WEAPON_KNIFE', 50000),
(18, 'BlackWeashop', 'WEAPON_KNIFE', 50000);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`name`);

--
-- 資料表索引 `addon_account`
--
ALTER TABLE `addon_account`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- 資料表索引 `addon_account_data`
--
ALTER TABLE `addon_account_data`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `addon_inventory`
--
ALTER TABLE `addon_inventory`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `boats`
--
ALTER TABLE `boats`
  ADD PRIMARY KEY (`model`);

--
-- 資料表索引 `boat_categories`
--
ALTER TABLE `boat_categories`
  ADD PRIMARY KEY (`name`),
  ADD KEY `name` (`name`);

--
-- 資料表索引 `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `communityservice`
--
ALTER TABLE `communityservice`
  ADD PRIMARY KEY (`identifier`);

--
-- 資料表索引 `datastore`
--
ALTER TABLE `datastore`
  ADD PRIMARY KEY (`name`),
  ADD KEY `name` (`name`);

--
-- 資料表索引 `datastores`
--
ALTER TABLE `datastores`
  ADD PRIMARY KEY (`name`);

--
-- 資料表索引 `datastore_data`
--
ALTER TABLE `datastore_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_datastore_owner_name` (`owner`,`name`),
  ADD KEY `index_datastore_name` (`name`);

--
-- 資料表索引 `epc_bolos`
--
ALTER TABLE `epc_bolos`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `fine_types`
--
ALTER TABLE `fine_types`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `fine_types_mafia`
--
ALTER TABLE `fine_types_mafia`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `fine_types_mafiaf`
--
ALTER TABLE `fine_types_mafiaf`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `inventories`
--
ALTER TABLE `inventories`
  ADD PRIMARY KEY (`name`);

--
-- 資料表索引 `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`name`),
  ADD KEY `name` (`name`);

--
-- 資料表索引 `jail`
--
ALTER TABLE `jail`
  ADD PRIMARY KEY (`identifier`);

--
-- 資料表索引 `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`name`),
  ADD KEY `name` (`name`);

--
-- 資料表索引 `job_grades`
--
ALTER TABLE `job_grades`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `meeta_accessory_inventory`
--
ALTER TABLE `meeta_accessory_inventory`
  ADD PRIMARY KEY (`Id`);

--
-- 資料表索引 `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `owned_properties`
--
ALTER TABLE `owned_properties`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `owned_vehicles`
--
ALTER TABLE `owned_vehicles`
  ADD PRIMARY KEY (`plate`) USING BTREE,
  ADD KEY `plate` (`plate`);

--
-- 資料表索引 `phone_app_chat`
--
ALTER TABLE `phone_app_chat`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `phone_calls`
--
ALTER TABLE `phone_calls`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `phone_messages`
--
ALTER TABLE `phone_messages`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `phone_users_contacts`
--
ALTER TABLE `phone_users_contacts`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- 資料表索引 `rented_vehicles`
--
ALTER TABLE `rented_vehicles`
  ADD PRIMARY KEY (`plate`);

--
-- 資料表索引 `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `society_moneywash`
--
ALTER TABLE `society_moneywash`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- 資料表索引 `trunk_inventory`
--
ALTER TABLE `trunk_inventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plate` (`plate`);

--
-- 資料表索引 `twitter_accounts`
--
ALTER TABLE `twitter_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- 資料表索引 `twitter_likes`
--
ALTER TABLE `twitter_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_twitter_likes_twitter_accounts` (`authorId`),
  ADD KEY `FK_twitter_likes_twitter_tweets` (`tweetId`);

--
-- 資料表索引 `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_twitter_tweets_twitter_accounts` (`authorId`);

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`identifier`);

--
-- 資料表索引 `user_accounts`
--
ALTER TABLE `user_accounts`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `user_contacts`
--
ALTER TABLE `user_contacts`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `user_inventory`
--
ALTER TABLE `user_inventory`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `user_licenses`
--
ALTER TABLE `user_licenses`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`model`);

--
-- 資料表索引 `vehicles_for_sale`
--
ALTER TABLE `vehicles_for_sale`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `vehicle_categories`
--
ALTER TABLE `vehicle_categories`
  ADD PRIMARY KEY (`name`),
  ADD KEY `name` (`name`);

--
-- 資料表索引 `vehicle_sold`
--
ALTER TABLE `vehicle_sold`
  ADD PRIMARY KEY (`plate`);

--
-- 資料表索引 `weashops`
--
ALTER TABLE `weashops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `addon_account`
--
ALTER TABLE `addon_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `addon_account_data`
--
ALTER TABLE `addon_account_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `addon_inventory`
--
ALTER TABLE `addon_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `billing`
--
ALTER TABLE `billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `characters`
--
ALTER TABLE `characters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `datastore_data`
--
ALTER TABLE `datastore_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `epc_bolos`
--
ALTER TABLE `epc_bolos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `fine_types`
--
ALTER TABLE `fine_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `fine_types_mafia`
--
ALTER TABLE `fine_types_mafia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `fine_types_mafiaf`
--
ALTER TABLE `fine_types_mafiaf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `job_grades`
--
ALTER TABLE `job_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `licenses`
--
ALTER TABLE `licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `owned_properties`
--
ALTER TABLE `owned_properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `phone_app_chat`
--
ALTER TABLE `phone_app_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `phone_calls`
--
ALTER TABLE `phone_calls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `phone_messages`
--
ALTER TABLE `phone_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `phone_users_contacts`
--
ALTER TABLE `phone_users_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `shops`
--
ALTER TABLE `shops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `society_moneywash`
--
ALTER TABLE `society_moneywash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `trunk_inventory`
--
ALTER TABLE `trunk_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `twitter_accounts`
--
ALTER TABLE `twitter_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `twitter_likes`
--
ALTER TABLE `twitter_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `user_accounts`
--
ALTER TABLE `user_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `user_contacts`
--
ALTER TABLE `user_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `user_inventory`
--
ALTER TABLE `user_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `user_licenses`
--
ALTER TABLE `user_licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `vehicles_for_sale`
--
ALTER TABLE `vehicles_for_sale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `weashops`
--
ALTER TABLE `weashops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `twitter_likes`
--
ALTER TABLE `twitter_likes`
  ADD CONSTRAINT `FK_twitter_likes_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`),
  ADD CONSTRAINT `FK_twitter_likes_twitter_tweets` FOREIGN KEY (`tweetId`) REFERENCES `twitter_tweets` (`id`) ON DELETE CASCADE;

--
-- 資料表的限制式 `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  ADD CONSTRAINT `FK_twitter_tweets_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
