SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


CREATE TABLE `inv` (
  `id` int NOT NULL,
  `customername` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `inv` (`id`, `customername`, `date`) VALUES
(1, 'Ahmed', '2/2/2020'),
(2, 'Orabi', '22/4/2020');

le structure for table `invdet`


CREATE TABLE `invdet` (
  `serial` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `inv_id` int NOT NULL,
  `prodid` int NOT NULL,
  `quantity` int NOT NULL,
  `price` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `invdet` (`serial`, `inv_id`, `prodid`, `quantity`, `price`) VALUES
('1020', 1, 1, 5, 25),
('1030', 1, 2, 2, 55),
('1040', 1, 3, 2, 30);


CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'ashraff', '1234');


ALTER TABLE `inv`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `invdet`
  ADD PRIMARY KEY (`prodid`),
  ADD KEY `inv_id` (`inv_id`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `inv`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `invdet`
  ADD CONSTRAINT `invdet_ibfk_1` FOREIGN KEY (`inv_id`) REFERENCES `inv` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

