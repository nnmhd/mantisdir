-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 08, 2025 at 02:13 AM
-- Server version: 8.0.35
-- PHP Version: 8.2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: mantisdir
--

-- --------------------------------------------------------

--
-- Table structure for table continental_species
--

CREATE TABLE continental_species (
  continental_id int NOT NULL,
  continent varchar(50) NOT NULL,
  species_name varchar(100) NOT NULL,
  common_name varchar(100) DEFAULT NULL,
  continent_traits text,
  image_path varchar(255) DEFAULT NULL,
  biomes varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table continental_species
--

INSERT INTO continental_species (continental_id, continent, species_name, common_name, continent_traits, image_path, biomes) VALUES
(1, 'Europe', 'Mantis religiosa', 'European Mantis', 'Medium-sized, green or brown, thrives in temperate climates.', 'images/Mantis_religiosa.jpg', 'images/europe_1.jpg'),
(2, 'Asia', 'Tenodera sinensis', 'Chinese Mantis', 'Large-sized, aggressive, common in East Asia.', 'images/Tenodera_sinensis.jpg', 'images/asia_1.jpg'),
(3, 'North America', 'Stagmomantis carolina', 'Carolina Mantis', 'Smaller size, native to southeastern US.', 'images/Stagmomantis_carolina.jpg', 'images/northamerica.jpg'),
(4, 'Africa', 'Sphodromantis viridis', 'African Mantis', 'Robust build, bright green, suited to tropical areas.', 'images/Sphodromantis_viridis.jpg', 'images/africa_1.jpg'),
(5, 'South America', 'Stagmomantis theophila', 'South American Mantis', 'Slender body, green, found in rainforests.', 'images/Stagmomantis_theophila.jpg', 'images/southamerica.jpg'),
(6, 'Australia', 'Archimantis latistyla', 'Australian Stick Mantis', 'Elongated body, mimics sticks, arid-adapted.', 'images/Archimantis_latistyla.jpg', 'images/australia.jpg'),
(7, 'Asia', 'Hierodula patellifera', 'Giant Asian Mantis', 'Very large, green or brown, widespread in Southeast Asia.', 'images/Hierodula_patellifera.jpg', 'images/asia_2.jpg'),
(8, 'Africa', 'Miomantis paykullii', 'Egyptian Mantis', 'Small, agile, common in dry regions.', 'images/Miomantis_paykullii.jpg', 'images/africa_2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table subspecies
--

CREATE TABLE subspecies (
  subspecies_id int NOT NULL,
  continental_id int DEFAULT NULL,
  subspecies_name varchar(100) NOT NULL,
  region varchar(100) DEFAULT NULL,
  specific_traits text,
  image_path varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table subspecies
--

INSERT INTO subspecies (subspecies_id, continental_id, subspecies_name, region, specific_traits, image_path) VALUES
(1, 1, 'Religiosa', 'Southern Europe', 'Green form, Mediterranean climate.', 'images/Religiosa.jpg'),
(2, 1, 'Caucasica', 'Caucasus Region', 'Brownish tones, cooler areas.', 'images/Caucasica.jpg'),
(3, 1, 'Polonica', 'Poland', 'Smaller size, adapted to northern climates.', 'images/Polonica.jpg'),
(4, 2, 'Sinensis', 'Eastern China', 'Large green variant, highly predatory.', 'images/Sinensis.jpg'),
(5, 2, 'Aridifolia', 'Japan', 'Brown variant, suited to drier regions.', 'images/Aridifolia.jpg'),
(6, 2, 'Koreana', 'Korea', 'Slightly smaller, cold-tolerant.', 'images/Koreana.jpg'),
(7, 3, 'Carolina', 'Southeastern US', 'Green or gray, blends with vegetation.', 'images/Carolina.jpg'),
(8, 3, 'Floridensis', 'Florida', 'Brighter green, humid-adapted.', 'images/Floridensis.jpg'),
(9, 4, 'Viridis', 'West Africa', 'Bright green, rainforest camouflage.', 'images/Viridis.jpg'),
(10, 4, 'Centralis', 'Central Africa', 'Larger size, darker green.', 'images/Centralis.jpg'),
(11, 4, 'Saharensis', 'Sahara Border', 'Lighter green, desert edge survivor.', 'images/Saharensis.jpg'),
(12, 5, 'Theophila', 'Amazon Basin', 'Green, excellent climber.', 'images/Theophila.jpg'),
(13, 5, 'Peruana', 'Peru', 'Slightly brown, Andean foothills.', 'images/Peruana.jpg'),
(14, 6, 'Latistyla', 'Central Australia', 'Stick-like, brown, arid specialist.', 'images/Latistyla.jpg'),
(15, 6, 'Queenslandica', 'Queensland', 'Greenish tint, coastal areas.', 'images/Queenslandica.jpg'),
(16, 7, 'Patellifera', 'Thailand', 'Large green form, forest dweller.', 'images/Patellifera.jpg'),
(17, 7, 'Borneensis', 'Borneo', 'Brownish, rainforest-adapted.', 'images/Borneensis.jpg'),
(18, 7, 'Indica', 'India', 'Smaller, dry region variant.', 'images/Indica.jpg'),
(19, 8, 'Paykullii', 'Egypt', 'Small, sandy-colored, desert-adapted.', 'images/Paykullii.jpg'),
(20, 8, 'Sudanensis', 'Sudan', 'Slightly larger, reddish tint.', 'images/Sudanensis.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table continental_species
--
ALTER TABLE continental_species
  ADD PRIMARY KEY (continental_id),
  ADD UNIQUE KEY species_name (species_name);

--
-- Indexes for table subspecies
--
ALTER TABLE subspecies
  ADD PRIMARY KEY (subspecies_id),
  ADD UNIQUE KEY subspecies_name (subspecies_name),
  ADD KEY continental_id (continental_id);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table continental_species
--
ALTER TABLE continental_species
  MODIFY continental_id int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table subspecies
--
ALTER TABLE subspecies
  MODIFY subspecies_id int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table subspecies
--
ALTER TABLE subspecies
  ADD CONSTRAINT subspecies_ibfk_1 FOREIGN KEY (continental_id) REFERENCES continental_species (continental_id) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
