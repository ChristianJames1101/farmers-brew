-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2025 at 05:28 PM
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
-- Database: `farmers_brew`
--

-- --------------------------------------------------------

--
-- Table structure for table `cancellation_requests`
--

CREATE TABLE `cancellation_requests` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `reason` text NOT NULL,
  `request_date` datetime DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cancellation_requests`
--

INSERT INTO `cancellation_requests` (`id`, `order_id`, `customer_name`, `reason`, `request_date`, `status`) VALUES
(6, 90, 'Christian James ', 'I ordered an excess item', '2025-05-22 13:15:18', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `added_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `quantity`, `added_at`) VALUES
(76, 3, 75, 1, '2025-05-22 12:14:57'),
(77, 3, 76, 1, '2025-05-22 12:15:19'),
(78, 3, 72, 1, '2025-05-22 12:15:24'),
(80, 3, 74, 1, '2025-05-22 12:49:30');

-- --------------------------------------------------------

--
-- Table structure for table `completed_orders`
--

CREATE TABLE `completed_orders` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` varchar(50) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `completed_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `completed_orders`
--

INSERT INTO `completed_orders` (`id`, `name`, `contact_number`, `address`, `product_name`, `quantity`, `total_price`, `status`, `total`, `completed_date`) VALUES
(1, 'John Cruz', '09171234567', 'Bocaue, Bulacan', 'Iced Vanilla', 2, 158.00, 'Completed', 158.00, '2025-05-01 00:00:00'),
(2, 'Maria Santos', '09181234567', 'Guiguinto, Bulacan', 'Thai Milk Tea', 1, 119.00, 'Completed', 119.00, '2025-05-02 00:00:00'),
(3, 'Leo Mendoza', '09991234567', 'Malolos, Bulacan', 'Strawberry Latte', 3, 285.00, 'Completed', 285.00, '2025-05-02 00:00:00'),
(4, 'Anna Reyes', '09193456789', 'Balagtas, Bulacan', 'Dark Mocha Frappe', 2, 238.00, 'Completed', 238.00, '2025-05-03 00:00:00'),
(5, 'Karl Dela Cruz', '09051234567', 'Plaridel, Bulacan', 'Corned Beef Pandesal', 5, 195.00, 'Completed', 195.00, '2025-05-03 00:00:00'),
(6, 'Jenny Navarro', '09221234567', 'San Rafael, Bulacan', 'Hot White Mocha', 1, 95.00, 'Completed', 95.00, '2025-05-04 00:00:00'),
(7, 'Miguel Fernandez', '09061234567', 'San Ildefonso, Bulacan', 'Choco Cake Ring', 1, 130.00, 'Completed', 130.00, '2025-05-04 00:00:00'),
(8, 'Lara De Vera', '09172345678', 'Angat, Bulacan', 'Nachos', 2, 170.00, 'Completed', 170.00, '2025-05-05 00:00:00'),
(9, 'Bianca Ramos', '09391234567', 'Meycauayan, Bulacan', 'Tuna Pandesal', 3, 105.00, 'Completed', 105.00, '2025-05-05 00:00:00'),
(10, 'Daniel Lee', '09211234567', 'Marilao, Bulacan', 'Strawberry Frappe', 1, 129.00, 'Completed', 129.00, '2025-05-06 00:00:00'),
(11, 'Chris Lim', '09183456789', 'Baliuag, Bulacan', 'Iced Caramel', 2, 178.00, 'Completed', 178.00, '2025-05-06 00:00:00'),
(12, 'Ella Gutierrez', '09998887777', 'Pulilan, Bulacan', 'Iced Matcha', 1, 119.00, 'Completed', 119.00, '2025-05-07 00:00:00'),
(13, 'Francis Salvador', '09172345679', 'Obando, Bulacan', 'Hot Latte', 2, 120.00, 'Completed', 120.00, '2025-05-07 00:00:00'),
(14, 'Ariel Vega', '09451234567', 'Santa Maria, Bulacan', 'Hot Vanilla Latte', 1, 69.00, 'Completed', 69.00, '2025-05-08 00:00:00'),
(15, 'Nina dela Paz', '09381234567', 'Norzagaray, Bulacan', 'Iced Salted Caramel', 1, 89.00, 'Completed', 89.00, '2025-05-08 00:00:00'),
(16, 'Jose Ramos', '09175678901', 'San Jose del Monte, Bulacan', 'Lychee Fruit Soda', 4, 196.00, 'Completed', 196.00, '2025-05-09 00:00:00'),
(17, 'Alex Manalo', '09264567890', 'Hagonoy, Bulacan', 'Strawberry Soda', 2, 98.00, 'Completed', 98.00, '2025-05-09 00:00:00'),
(18, 'Angel Garcia', '09181239876', 'Bocaue, Bulacan', 'Hot Dark Mocha', 1, 95.00, 'Completed', 95.00, '2025-05-10 00:00:00'),
(19, 'Brian Ocampo', '09082345671', 'Guiguinto, Bulacan', 'Iced White Mocha', 3, 237.00, 'Completed', 237.00, '2025-05-10 00:00:00'),
(20, 'Catherine Uy', '09212345678', 'Malolos, Bulacan', 'Iced Sea Salt', 2, 178.00, 'Completed', 178.00, '2025-05-11 00:00:00'),
(21, 'Jerome Santiago', '09071234567', 'Marilao, Bulacan', 'Hot Americano', 1, 50.00, 'Completed', 50.00, '2025-05-11 00:00:00'),
(22, 'Dianne Tolentino', '09196543210', 'Plaridel, Bulacan', 'Iced Spanish Latte', 1, 89.00, 'Completed', 89.00, '2025-05-12 00:00:00'),
(23, 'Kenneth Cruz', '09213456789', 'San Miguel, Bulacan', 'Iced Americano', 2, 178.00, 'Completed', 178.00, '2025-05-13 00:00:00'),
(24, 'Faith Mariano', '09371234567', 'Angat, Bulacan', 'Carbonara', 2, 260.00, 'Completed', 260.00, '2025-05-14 00:00:00'),
(25, 'Rico Tan', '09185674321', 'San Ildefonso, Bulacan', 'Strawberry Frappe', 1, 129.00, 'Completed', 129.00, '2025-05-14 00:00:00'),
(26, 'Tricia Delos Reyes', '09275678901', 'Baliuag, Bulacan', 'Hot Latte', 1, 60.00, 'Completed', 60.00, '2025-05-15 00:00:00'),
(27, 'Nathan Villanueva', '09093456789', 'Guiguinto, Bulacan', 'Dark Mocha Frappe', 1, 119.00, 'Completed', 119.00, '2025-05-16 00:00:00'),
(28, 'Hazel Domingo', '09396543210', 'Malolos, Bulacan', 'Corned Beef Pandesal', 4, 156.00, 'Completed', 156.00, '2025-05-17 00:00:00'),
(29, 'Ian Morales', '09457678901', 'Pulilan, Bulacan', 'Thai Milk Tea', 2, 238.00, 'Completed', 238.00, '2025-05-18 00:00:00'),
(30, 'Louise Garcia', '09174567890', 'Bocaue, Bulacan', 'Iced Dark Mocha', 2, 178.00, 'Completed', 178.00, '2025-05-22 00:00:00'),
(89, 'Christian James ', '0912345678', 'Batia Bocaue Bulacan', 'Iced Dark Mocha', 1, 89.00, 'completed', 89.00, '2025-05-22 12:39:47');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `product` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `order_id`, `name`, `product`, `message`, `is_read`, `created_at`) VALUES
(12, 89, 'Christian James ', 'Iced Dark Mocha', 'Changes in estimated delivery: \"Christian James \", your order #89 (Iced Dark Mocha) is being processed. Estimated delivery: 2025-05-23.', 0, '2025-05-22 04:36:26'),
(13, 89, 'Christian James ', 'Iced Dark Mocha', 'Your order #89 (Iced Dark Mocha) has been completed.', 0, '2025-05-22 04:39:47');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` varchar(50) NOT NULL,
  `order_date` datetime DEFAULT current_timestamp(),
  `total` decimal(10,2) NOT NULL,
  `estimated_date` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `contact_number`, `address`, `product_name`, `quantity`, `total_price`, `status`, `order_date`, `total`, `estimated_date`) VALUES
(90, 'Christian James ', '0912345678', 'Batia Bocaue Bulacan', 'Iced Americano', 1, 60.00, 'Pending', '2025-05-22 12:51:24', 60.00, NULL),
(91, 'Christian James ', '0912345678', 'Batia Bocaue Bulacan', 'Carbonara', 1, 130.00, 'Pending', '2025-05-22 13:13:04', 130.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `stock`, `image`, `created_at`) VALUES
(56, 'Iced Vanilla', 'We start with a layer of foam, followed by a little ice. Then, we carefully pour in cold milk and rich espresso with Madagascar vanilla syrup. The foam rises through the milk and coffee, resulting in a sweet and creamy iced drink.', 79.00, 20, 'iced-coffee-vanilla-cold-foam.jpg', '2025-05-18 02:44:33'),
(58, 'Iced White Mocha', 'An icy cold take on our decadent White Chocolate Mocha. Smooth white chocolate and rich espresso meet cold milk, ice foam, and a dollop of whipped cream.', 89.00, 15, 'cropped-IcedWhiteMocha3-1200x1600-1.jpg', '2025-05-18 02:52:33'),
(59, 'Iced Dark Mocha', 'We blend dark cocoa with milk, ice and coffee for an extraordinarily chocolatey experience that\'s then topped with a swirl of whipped cream.', 89.00, 14, '20240904030209-white-20chocolate-20mocha.webp', '2025-05-18 02:53:23'),
(60, 'Iced Caramel', 'An iced caramel macchiato is a cold coffee drink that combines espresso, milk, vanilla syrup, ice and caramel sauce.', 89.00, 17, 'Iced-Caramel-Macchiato-recipe-4.jpg', '2025-05-18 02:56:32'),
(61, 'Iced Salted Caramel', 'A chocolatier named Henri Le Roux was making caramel when he accidentally added some fleur de sel, a type of French sea salt, to the mixture.', 89.00, 12, 'Salted-Caramel-Latte.jpg.webp', '2025-05-18 02:59:04'),
(62, 'Thai Milk Tea', 'Thai tea milk tea is made of spiced black tea, sweetened condensed milk, and evaporated milk. Some variations might include additional spices and flavorings to enhance the taste.', 119.00, 8, 'Thai-Iced-Tea.jpg', '2025-05-18 03:01:40'),
(63, 'Iced Matcha', 'Matcha Milk Tea is a boba based on matcha – high-grade green tea ground into powdered form. It also has milk and one of our bubble tea toppings – typically crystal boba or tapioca pearls, though you can choose a different add-on.', 119.00, 10, 'stitches-15-scaled.webp', '2025-05-18 03:02:43'),
(64, 'Iced Spanish Latte', 'Spanish Latte is basically espresso-based coffee with milk, sweetened using condensed milk. While it\'s sweeter than an unsweetened latte, it\'s still less sweet than flavored ones. You can also use textured milk (optional) for additional body.', 89.00, 12, 'images.jfif', '2025-05-18 03:03:53'),
(65, 'Iced Americano', 'An iced Americano is a chilled black coffee made by adding espresso to cold water and serving it over ice. It\'s a refreshing and less intense version of a regular espresso, as the cold water and ice dilute the strength of the coffee. ', 60.00, 23, 'iced-americano-sq.jpg', '2025-05-18 03:05:40'),
(66, 'Iced Sea Salt', 'Start by whipping heavy cream with a little sugar and a pinch of fine sea salt until it\'s thick enough to float on top of the latte. Use strong espresso and lightly sweetened milk for the base. The goal is to achieve a harmonious blend of sweet and salty that suits your palate.', 119.00, 9, 'Iced-Sea-Salt-Coffee-with-Salted-Cream.jpg', '2025-05-18 03:07:01'),
(67, 'Hot Americano', 'An Americano primarily consists of two simple ingredients: an espresso and hot water. Compared to other drinks, creating an Americano is relatively easy as long as you have the right equipment on hand.', 50.00, 23, 'images (1).jfif', '2025-05-18 03:08:38'),
(68, 'Hot Latte', 'A true latte will be made of one or two shots of espresso, steamed milk and a final, thin layer of frothed milk on top. These elements combined result in a balanced milky coffee that\'s aesthetically pleasing with a smooth texture.', 60.00, 18, 'latte.avif', '2025-05-18 03:11:31'),
(69, 'Hot Vanilla Latte', 'where fluffy frothed milk and delicious vanilla syrup come together over a shot of espresso for a drink that\'s smooth, delicious and invigorating.', 69.00, 13, '16oz-Hot-latte_-Hot-vanilla-latte_-Hot-Spanish-latte.webp', '2025-05-18 03:13:25'),
(70, 'Hot White Mocha', 'White Mochas typically have one or two shots of espresso, white chocolate syrup or melted white chocolate, and steamed milk.', 79.00, 12, 'white mocha.jfif', '2025-05-18 03:15:11'),
(71, 'Hot Dark Mocha', 'Dark Mochas typically have one or two shots of espresso, white chocolate syrup or melted white chocolate, and steamed milk.', 79.00, 12, 'dark mocha.jfif', '2025-05-18 03:15:36'),
(72, 'Nachos ', 'Pico de gallo (store bought or fresh), guacamole, sour cream, sliced jalapeños, diced onions and tomatoes, and fresh cilantro are classic fresh nacho toppings to sprinkle over top.', 85.00, 6, 'nachos.jfif', '2025-05-18 03:27:13'),
(73, 'Lychee Fruit Soda', 'A lightly sweetened sparkling water with a flavor for every palate. Discover your Chi. Our star flavor featuring elegant tropical fruit with a rosy, floral aroma and just the right amount of sweetness.', 49.00, 14, 'lychee.jfif', '2025-05-18 03:28:35'),
(74, 'Strawberry Latte', 'Only three ingredients– Strawberry milk or cream, espresso shots or strong coffee, and ice; that\'s it! Add homemade whipped cream or a handheld frother to make cold foam. Stunning results– Treat yourself to this gorgeous coffee or serve it at brunch.', 95.00, 11, 'strawberry latte.jfif', '2025-05-18 03:30:17'),
(75, 'Dark Mocha Frappe', 'For serious chocolate lovers: We blend dark cocoa with milk, ice and coffee for an extraordinarily chocolatey experience that\'s then topped with a swirl of whipped cream.', 119.00, 133, 'dark mocha frappe.jfif', '2025-05-18 03:31:05'),
(76, 'Strawberry Frappe', 'A strawberry frappe is a cold, blended beverage, typically featuring a base of milk, ice, and strawberry puree or sauce, resulting in a smooth, creamy, and sweet fruit-flavored drink.', 129.00, 9, 'strawberry praffe.jfif', '2025-05-18 03:32:31'),
(77, 'Strawberry Soda', 'soft drink, any of a class of nonalcoholic beverages, usually but not necessarily carbonated, normally containing a natural or artificial sweetening agent, edible acids, natural or artificial flavours, and sometimes juice. Natural flavours are derived from fruits, nuts, berries, roots, herbs, and other plant sources.', 49.00, 17, 'strawberry soda.jfif', '2025-05-18 03:34:23'),
(78, 'Choco Cake Ring', 'Chocolate cake or chocolate gâteau (from French: gâteau au chocolat) is a cake flavored with melted chocolate, cocoa powder, or both. It can also have other ingredients such as fudge, vanilla creme, and other sweeteners.', 55.00, 10, 'choco ring.webp', '2025-05-18 03:36:11'),
(79, 'Corned Beef Pandesal', 'Corned beef pandesal is a Filipino bread roll filled with seasoned corned beef. It\'s a savory and delicious snack or meal, perfect for breakfast, merienda, or a quick bite. Pandesal, which is the Filipino bread roll, is often filled with various savory ingredients, including corned beef', 39.00, 24, 'corned-beef-pandesal-buns-1.jpg', '2025-05-18 03:37:09'),
(80, 'Tuna Pandesal', 'Tuna Pandesal is a popular Filipino snack that features a soft, salted bread roll (pandesal) filled with a savory tuna mixture. It\'s a simple and satisfying option, often enjoyed as a light meal or snack. ', 39.00, 8, 'IMG_4772.webp', '2025-05-18 03:38:00'),
(81, 'Carbonara', 'Carbonara is a traditional Italian pasta dish, typically made with spaghetti, featuring a creamy sauce of eggs, cheese (usually Pecorino Romano or Parmesan), and cured pork, such as guanciale or pancetta.', 130.00, 5, 'u3317447599_httpss.mj_.runpJELX4osoW4_top_down_view_of_Filipin_e77ad871-3b69-47a4-8264-d1ac4177dffa_0.jpg', '2025-05-18 03:39:32'),
(82, 'Baked Mac', 'Macaroni casserole in northern Europe, imaqarrun in Malta. Macaroni schotel in Indonesia. Pastitsio, oven macaroni, or bechamel macaroni, in Greek, Cypriot, Egyptian, and Maltese cuisine. Baked ziti in Italian-American cuisine. Giouvetsi in Greek cuisine.', 145.00, 5, 'baked.jfif', '2025-05-18 04:24:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('customer','admin') DEFAULT 'customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `last_name`, `first_name`, `middle_name`, `contact_number`, `address`, `email`, `password`, `role`) VALUES
(1, 'admin', 'admin', 'admin', '0912345678', 'admin', 'admin@mail.com', '$2y$10$qjJ.bxNchTJCNOe/q6qq4OXl.8bmE45cqzeVSM.NGANWliz70vq6K', 'admin'),
(2, 'Dela Cruz', 'Santos', 'Jose', '09234576', 'Taguig City Manila', 'juan@mail.com', '$2y$10$.zOtH47Tdost42XlaGd04OHNjpYBYWDFKEbaAoGUubziyPIX1GDEi', 'customer'),
(3, 'Tuano', 'Christian James ', 'Espena', '0912345678', 'Batia Bocaue Bulacan', 'christian@mail.com', '$2y$10$rr6odixRObKM8pH46AxvGOJVreDX4rwVWUICefPO0viRHILOJY96G', 'customer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cancellation_requests`
--
ALTER TABLE `cancellation_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `completed_orders`
--
ALTER TABLE `completed_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cancellation_requests`
--
ALTER TABLE `cancellation_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `completed_orders`
--
ALTER TABLE `completed_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
