-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2022 at 07:01 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerceapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `is_active`) VALUES
(9, 'admin', 'admin@gmail.com', '$2y$10$T9gYZUDOZ4FdAggPmxvQCuKxmkENcW95RtlKlEZJbMEi6/vYO/Mx6', '0');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(2, 'Samsung'),
(3, 'Apple'),
(6, 'OnePlus+'),
(11, 'Amazon');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(1, 4, '::1', 4, 1),
(2, 1, '::1', 7, 1),
(3, 2, '::1', 7, 1),
(4, 2, '::1', 8, 1),
(5, 1, '::1', 9, 1),
(6, 2, '::1', 9, 1),
(7, 5, '::1', 9, 1),
(8, 1, '::1', 10, 1),
(9, 27, '::1', 10, 1),
(10, 4, '::1', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(2, 'Electronics'),
(3, 'Home & Kitchen'),
(6, 'Clothings'),
(12, 'Mobiles'),
(13, 'Automotive Parts & Accessories'),
(14, 'Toys');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 1, 1, 1, '9L434522M7706801A', 'Completed'),
(2, 1, 2, 1, '9L434522M7706801A', 'Completed'),
(3, 1, 3, 1, '9L434522M7706801A', 'Completed'),
(4, 1, 1, 1, '8AT7125245323433N', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(11) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_qty`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 12, 2, 'Samsung Galaxy Z Fold 2', 249999, 5, 'Last yearâ€™s Galaxy Fold was a sort of experiment in the field of foldable phones. The idea was an innovative one but the phone faced a lot of durability issues. Its launch was postponed multiple times because of Samsungâ€™s inability to solve all the problems. Samsung will likely avoid those situations with its successor.', '1616500092_sm-zfold.jpg', 'samsung, mobile, galaxy fold'),
(2, 12, 3, 'Iphone 12 Pro Max', 187000, 7, '5G goes Pro. A14 Bionic rockets past every other smartphone chip. The Pro camera system takes low-light photography to the next level â€” with an even bigger jump on iPhone 12 Pro Max. And Ceramic Shield delivers four times better drop performance.', '1616499931_iph12pm.jpg', 'apple, iphone'),
(4, 12, 2, 'Samsung Galaxy S21 Ultra', 155000, 10, 'This is a demo', '1616492395_Samsung-Galaxy-S21-Ultra-1608287647-0-0.jpg', 'samsung, s21, s21 ultra'),
(5, 12, 6, 'OnePlus 8T', 86000, 13, 'On spec-sheet, the OnePlus 8T boasts plenty of improvements from its predecessor i.e. the OnePlus 8. For instance, its 6.55-inch 1080p OLED display now comes with a faster 120Hz refresh rate. In comparison, the OnePlus 8 had a 90Hz refresh rate. This upgrade seems huge. However, users will agree that you canâ€™t really find much of a difference between 90Hz to 120Hz on a smartphone screen.', '1616500410_OnePlus-8T-5G-Lunar-Silver-8GB-RAM-128GB-Storage-image-4.jpg', 'one plus, oneplus8'),
(21, 6, 11, 'SweatShirt', 400, 10, 'Sweatshirt', '1652549262_sshirt.jpg', 'shirt'),
(27, 2, 11, 'Telekonnectors Astral ', 2995, 5, 'Single cable binaural design; Dual color tone\r\nSuperior reception with great user comfort\r\nProfessional-grade noise cancellation transmit\r\nBacked with unparalleled “after sales support”', '1652603711_61O8aE5-5JL._SY741_.jpg', 'headphones'),
(28, 2, 11, 'VERTIV Liebert ITON CX 600VA ', 2945, 10, 'Excellent microprocessorcontrol guarantees highreliability\r\nAVR boost and buck forvoltage stabilisation\r\nAuto restart while AC isrecovering\r\nSimulated sine wave\r\nAuto charging at Off-mode\r\nUPS run for Router/modem load', '1652603788_91FDSfm-6FL._SX679_.jpg', 'CPU'),
(29, 2, 11, 'AmazonBasics Gaming Headset', 2705, 10, 'Works with devices with a 3.5mm jack\r\nCrystal clear sound quality and communication\r\nSoft, breathable ear pads and headband for extended gaming use\r\n2-way communication headset for exciting video game play\r\nCompatible with a wide variety of gaming platforms including PC, Switch, Xbox, PS4 and more', '1652603847_71sR5UpSI8L._SX679_.jpg', 'Headphone'),
(30, 2, 11, 'Hoffen (India) Digital Electronic LCD', 849, 50, 'High precision strain gauge sensor system\r\nTempered Glass 280 x 280 mm\r\nCapacity 2.3 -180 Kg\r\nNote: Kindly use the product on flat hard surface', '1652603972_61wrwvM1a6L._SX522_.jpg', ' Personal Health Body Fitness Weighing Scale '),
(31, 2, 11, 'Kidivo LCD Electronic Writing Pad', 180, 10, 'ONE-TOUCH ERASE BUTTON:- The tablet displays your notes until you erase them with the touch of a button. One-touch button erases notes instantly.\r\nCONVENIENT TO WRITE:- The writing tablet allows your writing or drawing to appear immediately. Use the attached plastic stylus or any other suitable instrument to write or draw, even with your fingers.\r\nPRESSURE SENSITIVE SCREEN:- Pressure-sensitive screen lets you create thick and thin lines. Durable cases and recessed screens are safe for school, travel, and home use.\r\nEASY TO USE:- Easy operation and high efficiency, just press the clear button to clear all content.\r\nPROTECT EYESIGHT:- The LCD screen has no radiation, no glare, eye protection, safer and more comfortable working for a long time.', '1652604037_61Pg1H7U15L._SX522_.jpg', 'tab'),
(32, 2, 11, 'Fire TV Stick', 4499, 10, 'Cinematic experience - Watch in vibrant 4K Ultra HD with support for Dolby Vision, HDR, and HDR10+.\r\nHome theater audio with Dolby Atmos - Feel scenes come to life with support for immersive Dolby Atmos audio on select titles with compatible home audio systems\r\nEndless entertainment - Choose from thousands of movies and TV episodes. Enjoy favorites from Prime Video, Disney+ Hotstar, Netflix, Zee5, Sony LIV, Apple TV and others. Subscription fees may apply.\r\nWatch Live TV – TV shows, news, reality shows and more from your favorite TV channels (supported by subscribed Apps), all in one place under Live Tab, direct from Fire TV home screen.\r\nAll-new Alexa Voice Remote - Search and launch content with your voice. Get to favorite apps quickly with preset buttons. Control power and volume with one remote.\r\nControl your smart home - Ask Alexa to check weather, dim the lights, view live camera feeds, stream music and more.\r\nSimple and intuitive - Quickly access your favorite apps, live TV, and things you use most, all from the main menu.\r\nEasy to set up, compact enough to stay hidden - Plug in behind your TV, turn on the TV, and connect to the internet to get set up', '1652604088_61-gWqNvr-L._SX679_.jpg', 'amazon'),
(33, 2, 11, 'COROID International Eco Friendly', 699, 100, 'he mosquito killer lamp can release the light wave of 365 Nm in length, specially designed for attracting mosquitoes.\r\nWorking purely in physical mosquito eradication technique to kill mosquitoes completely.\r\nThe operation is simple and widely used: just plug in the plug, press the button,it is a bug mosquito trap, the mosquito killer can work without noise! Home hospital kitchen warehouse can be used\r\nIt Has a removable tray for easy cleaning\r\nCompact: mosquito killer lamp,very easy to carry and use, very convenient at home or travel', '1652604236_715nIRACFzL._SX679_.jpg', 'amazon'),
(34, 2, 11, 'STRIFF Adjustable Laptop Stand ', 329, 10, 'FOLDABLE, PORTABLE, LIGHTWEIGHT: The Carnation Laptop Stand has a thin, hard plastic frame. It can be easily folded and carried around. Durable enough to withstand the weight of up to 55 lbs (25kg).\r\nOPTIMIZED FOR AIR VENTILATION: To prevent your computer from overheating, the laptop stand has large cut-out vents and adjustable height options that allow air to circulate from all sides. Well vented.\r\nADJUSTABLE HEIGHT 7 OPTIONS: Raise your laptop or tablet to any of seven adjustable heights from 2.7” to 6.7” so you can get a clearer, glare-free view while getting neck pain relief and preventing eye strain.\r\nPHONE STAND, and PURE ERGONOMICS: Easily share the screen with those next to you. No constant reaching for your phone anymore. This means fewer distractions, better concentration. The new meaning of Ergonomic', '1652604321_71Zf9uUp+GL._SX522_.jpg', 'Amazon'),
(35, 2, 11, 'UBON Power Champ ', 400, 10, 'Multi-Socket Extension Board: UBON EXT-106 Cordless Extension Board comes with 3 universal sockets and 2 USB-2.0 ports that can supply stable power to multiple electronic devices at the same time. The EXT-106 offers 240 volts alternating current to enhance efficiency and performance.\r\nPremium and Portable Design: The UBON EXT-106 Extension Board comes in a classic and trendy look. Its portable and ergonomic design raises the standard of the product. You can carry this board wherever you want. Its user-friendly design enhances its efficiency.\r\nUniversal Compatibility and 6 AMP Stable Power Output: EXT-106 Cordless Extension Board is universally compatible with set-top boxes, tablets, LED boards, Televisions, Computers, laptops, and many more electronic peripherals. The EXT-106 supplies 6-amperes of stable power to the connected devices for maximum power.\r\nLED Indicator and On/Off Buttons: The EXT-106 Wireless Extension Board comes with 2 power buttons and LED indicators. You can turn off and on the sockets at will. Connected devices receive safe and maximum power at a 6-ampere power output.\r\nSmart Protection & Low Power Consumption: The EXT-106 extension board is equipped with a smart protection system to guard against short-circuit and improve the safety standard of the extension board. Furthermore, the EXT-106 consumes low energy and delivers maximum powe', '1652604391_71OVmItnA-L._SX522_.jpg', 'amazon'),
(36, 2, 11, 'AREO (Blue) Travel Electronic Bag', 200, 10, 'Material: Made of high quality Dacron material, durable for your us\r\nSize: L * W * H: 24.5 * 18.5 * 10 m (9.65 * 7.28 * 3.94 in). The package includes only one storage bag\r\nProtection bag: the electronics bag is scratch resistant, which can protect the accessories of the electronics in the bag\r\nApplication: suitable for the organization of USB cable, cable, power bank and other electronic accessories\r\nTravel bag: This cable organizer bag is compact that is perfect for carrying along with you when travel', '1652604453_61XM57JToLS._SX679_.jpg', 'amazon');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(7, 'Abhinav', 'Singh', 'singhabhinav.aks@gmail.com', '76876d328dc8d5ee47405defaf536cd9', '7668845085', 'lucknow', 'lucknow'),
(8, 'Tushar', 'Agarwal', 'tus@gmail.com', '89390c3793591aab1a2a9cb5b58ddc81', '7355157213', 'lucknow', 'lucknow'),
(9, 'Prakhar', 'Singh', 'xyz@mail.com', '5aec0675c72762726f04d7de39472d80', '1234567890', 'lko', 'lko'),
(10, 'abc', 'def', 'abc@gmail.com', 'e807f1fcf82d132f9bb018ca6738a19f', '1234567890', 'lko', 'lko');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_product_cat` (`product_cat`),
  ADD KEY `fk_product_brand` (`product_brand`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_product_brand` FOREIGN KEY (`product_brand`) REFERENCES `brands` (`brand_id`),
  ADD CONSTRAINT `fk_product_cat` FOREIGN KEY (`product_cat`) REFERENCES `categories` (`cat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
