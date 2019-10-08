-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 08, 2019 at 09:20 PM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nekret`
--

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `name` varchar(127) NOT NULL,
  `country` varchar(127) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `country`) VALUES
(1, 'Mostar', 'Bosnia and Herzegovina'),
(2, 'Sarajevo', 'Bosnia and Herzegovina'),
(3, 'London', NULL),
(4, 'giug', NULL),
(5, 'hoiun', NULL),
(6, 'ikhil', NULL),
(7, 'Berlin', NULL),
(8, 'Paris', NULL),
(9, 'Los Angeles', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `folder` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`id`, `name`, `folder`) VALUES
(4, 'CvI91570374800.jpeg', 'wGIX7fwqv7'),
(5, '8dOy1570374889.jpeg', 'fgIzy4QWWH'),
(6, '6E7X1570518174.jpeg', 'LCc2DJJo4F'),
(7, 'z4p41570518220.jpeg', 'HnkknBDMD1'),
(8, 'O0d31570518262.jpeg', '8aK5BtqbtB'),
(9, 'xkb21570518304.jpeg', '1i8U05u1h7'),
(11, 'JYbP1570521736.jpeg', 'iEbpPNSK5k'),
(12, 'QAeO1570521738.jpeg', 'iEbpPNSK5k'),
(13, 'JzAh1570521740.jpeg', 'iEbpPNSK5k');

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `description` text,
  `filename` varchar(255) NOT NULL,
  `location_id` int(11) NOT NULL,
  `cover` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `user_id`, `title`, `price`, `description`, `filename`, `location_id`, `cover`) VALUES
(52, 5, 'vhuv', '54€', 'bkibo', 'kKw1eQ4GsL', 2, NULL),
(53, 5, 'Loken', '60€', '...', 'wGIX7fwqv7', 1, 'CvI91570374800.jpeg'),
(54, 5, 'Parkley\'s', '180€', '...', 'fgIzy4QWWH', 3, '8dOy1570374889.jpeg'),
(55, 10, 'Deller', '120€', '...', 'LCc2DJJo4F', 7, '6E7X1570518174.jpeg'),
(56, 10, 'Rondo', '145€', NULL, 'HnkknBDMD1', 3, 'z4p41570518220.jpeg'),
(57, 10, 'Oak Lake', '130€', NULL, '8aK5BtqbtB', 8, 'O0d31570518262.jpeg'),
(58, 10, 'Marge', '300€', '...', '1i8U05u1h7', 9, 'xkb21570518304.jpeg'),
(60, 10, 'Perkins\'', '220€', NULL, 'iEbpPNSK5k', 8, 'JYbP1570521736.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `date` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`id`, `property_id`, `date`, `user_id`) VALUES
(5, 54, '2019-10-23T15:29:00.000Z', 7),
(6, 54, '2019-10-24T10:55:00.000Z', 5);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `email` varchar(32) NOT NULL,
  `password` varchar(128) NOT NULL,
  `role` int(11) NOT NULL DEFAULT '1',
  `updated_at` text NOT NULL,
  `created_at` text NOT NULL,
  `phone_number` varchar(64) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `updated_at`, `created_at`, `phone_number`, `location_id`) VALUES
(3, 'lula', 'CBy8KC4naE@gmail.com', '$2y$10$Mr6SyHii8qvVz0JruUkm4eFpmDC4cbcv1zRm4yc9sjcgUUaxmGJrq', 2, '2019-09-16 09:45:50', '2019-09-16 09:45:50', NULL, NULL),
(4, 'hnuhu', 'joli@kii.lo', '$2y$10$RLR2HQ8jBtXljyoia0lpIui9XJxgUFQFxpiQ8E5.u9SMKPPcU0SGe', 1, '2019-09-16 09:45:50', '2019-09-16 09:45:50', NULL, NULL),
(5, 'test', 'test@test.com', '$2y$10$I8KtGe6KWsSP5OhkPQIKOe3clmq.Z4.x86M2Ief9JPjsI1MoR211i', 1, '2019-09-16 09:52:50', '2019-09-16 09:52:50', NULL, NULL),
(6, 'testin', 'testin@test.com', '$2y$10$mvwYwMkFS6Gj8QiUYR4TmOOQ1vg64CRmUE9KHOZYROn9RBHgy7nLG', 1, '2019-09-16 09:58:12', '2019-09-16 09:58:12', NULL, NULL),
(7, 'lulal', 'jukl@ki.col', '$2y$10$.2pnbkpdxT7JBa0BPRJPOeQ4raD39IN9X8T8EM6qud5AAdZ7T3NDm', 1, '2019-09-16 14:02:45', '2019-09-16 14:02:45', NULL, NULL),
(8, 'admin', 'admin@admin.com', '$2y$10$txrMgyqyUMeqKV3brlyYh.vZlgRQxicObABosergJakHCCkiQ7/vy', 2, '2019-09-17 11:47:37', '2019-09-17 11:47:37', NULL, NULL),
(9, 'test', 'uuigui@jnk', '$2y$10$7wF7WVvA7l.pRmCo.DK2g.z.D.KGsWYap7zqSlz1FjnPWYwRG2Ppe', 1, '2019-09-18 11:14:57', '2019-09-18 11:14:57', NULL, NULL),
(10, 'user', 'user@user.com', '$2y$10$lLuRoURwPaytsTDJpg5Nz.Yt1U/CPzusKrKnUD/HL2FmRBUJyJ2J6', 1, '2019-10-08 07:00:24', '2019-10-08 07:00:24', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_fk` (`user_id`),
  ADD KEY `location_fk` (`location_id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `property_fk` (`property_id`),
  ADD KEY `reservation_user_fk` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_location_fk` (`location_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `properties`
--
ALTER TABLE `properties`
  ADD CONSTRAINT `location_fk` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  ADD CONSTRAINT `user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `property_fk` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`),
  ADD CONSTRAINT `reservation_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `user_location_fk` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
