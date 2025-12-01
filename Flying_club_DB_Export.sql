-- phpMyAdmin SQL Dump
-- version 5.2.3-1.el9
-- https://www.phpmyadmin.net/
--
-- Host: mysql.abdn.ac.uk
-- Generation Time: Dec 01, 2025 at 05:50 PM
-- Server version: 10.3.32-MariaDB-log
-- PHP Version: 8.3.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u03wk24_SQL`
--

-- --------------------------------------------------------

--
-- Table structure for table `Crew`
--

CREATE TABLE `Crew` (
  `Crew_ID` int(11) NOT NULL,
  `flight_id` int(11) NOT NULL,
  `pilot_id` int(11) NOT NULL,
  `role` enum('First','Second') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Crew`
--

INSERT INTO `Crew` (`Crew_ID`, `flight_id`, `pilot_id`, `role`) VALUES
(4372001, 46001, 5069003, 'First'),
(4372002, 46001, 5069009, 'Second'),
(4372003, 46002, 5069004, 'First'),
(4372004, 46002, 5069001, 'Second'),
(4372005, 46003, 5069005, 'First'),
(4372006, 46003, 5069002, 'Second'),
(4372007, 46004, 5069006, 'First'),
(4372008, 46004, 5069008, 'Second'),
(4372009, 46005, 5069007, 'First'),
(4372010, 46005, 5069010, 'Second');

-- --------------------------------------------------------

--
-- Table structure for table `Flight`
--

CREATE TABLE `Flight` (
  `flight_id` int(11) NOT NULL,
  `flight_type` enum('pleasure','training') COLLATE utf8mb4_unicode_ci NOT NULL,
  `flight_date` date NOT NULL,
  `start_time` time NOT NULL,
  `duration` enum('30min','60min','120min','half-day') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Flight`
--

INSERT INTO `Flight` (`flight_id`, `flight_type`, `flight_date`, `start_time`, `duration`, `route`) VALUES
(46001, 'pleasure', '2024-08-01', '10:00:00', '60min', 'Coastal Tour'),
(46002, 'training', '2024-08-01', '14:00:00', '120min', 'Training Area B'),
(46003, 'pleasure', '2024-08-02', '11:00:00', '30min', 'City Overview'),
(46004, 'pleasure', '2024-08-03', '09:00:00', '60min', 'Loch Lomond View'),
(46005, 'training', '2024-08-03', '13:00:00', '120min', 'Training Area A'),
(46006, 'training', '2024-08-04', '10:00:00', '60min', 'Training Area C'),
(46007, 'training', '2024-08-04', '14:00:00', '120min', 'Training Area B'),
(46008, 'training', '2024-08-05', '09:00:00', '60min', 'Training Area A'),
(46009, 'pleasure', '2024-08-05', '11:00:00', '30min', 'River Clyde Run'),
(46010, 'pleasure', '2024-08-06', '15:00:00', '60min', 'Castle Tour');

-- --------------------------------------------------------

--
-- Table structure for table `Instructor`
--

CREATE TABLE `Instructor` (
  `instructor_id` int(11) NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Instructor`
--

INSERT INTO `Instructor` (`instructor_id`, `first_name`, `last_name`, `age`, `phone`, `email`) VALUES
(4906001, 'Jane', 'Doe', 40, '0207-774-5632', 'JaneDoe@email.com'),
(4906002, 'Laura', 'Wilson', 38, '01224-555-666', 'LauraWilson@email.com'),
(4906003, 'Robert', 'Miller', 45, '0141-333-4444', 'RobertMiller@email.com'),
(4906004, 'Linda', 'Taylor', 50, '0131-555-7777', 'LindaTaylor@email.com'),
(4906005, 'James', 'Anderson', 35, '0161-888-9999', 'JamesAnderson@email.com');

-- --------------------------------------------------------

--
-- Table structure for table `Party`
--

CREATE TABLE `Party` (
  `party_id` int(11) NOT NULL,
  `point_of_contact_ID` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_Fname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_Lname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Party`
--

INSERT INTO `Party` (`party_id`, `point_of_contact_ID`, `booking_Fname`, `booking_Lname`, `phone`, `email`) VALUES
(5072001, 'PC-001', 'Aline', 'Stewart', '0141-848-1825', 'AlineStewart@email.com'),
(5072002, 'PC-002', 'John', 'Kay', '0207-774-5632', 'JohnKay@email.com'),
(5072003, 'PC-003', 'Chris', 'Green', '0131-222-3333', 'ChrisGreen@email.com'),
(5072004, 'PC-004', 'Patricia', 'Clark', '0141-999-8888', 'PatriciaClark@email.com'),
(5072005, 'PC-005', 'George', 'Harris', '01224-111-2222', 'GeorgeHarris@email.com');

-- --------------------------------------------------------

--
-- Table structure for table `Passenger`
--

CREATE TABLE `Passenger` (
  `passenger_id` int(11) NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `party_id` int(11) DEFAULT NULL,
  `adult_need` varchar(3) GENERATED ALWAYS AS (if(`age` <= 18,'Yes','No')) VIRTUAL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Passenger`
--

INSERT INTO `Passenger` (`passenger_id`, `first_name`, `last_name`, `age`, `phone`, `email`, `party_id`) VALUES
(5061001, 'Aline', 'Stewart', 25, '0141-848-1825', 'AlineStewart@email.com', 5072001),
(5061002, 'Mary', 'Tregear', 30, '01224-196720', 'MaryTregear@email.com', 5072001),
(5061003, 'Mike', 'Ritchie', 35, '01475-392178', 'MikeRitchie@email.com', 5072001),
(5061004, 'John', 'Kay', 40, '0207-774-5632', 'JohnKay@email.com', 5072002),
(5061005, 'Julie', 'White', 55, '0207-774-5632', 'JulieWhite@email.com', 5072002),
(5061006, 'Aydan', 'White', 15, '0207-774-5632', 'AydanWhite@email.com', 5072002),
(5061007, 'Chris', 'Green', 42, '0131-222-3333', 'ChrisGreen@email.com', 5072003),
(5061008, 'Emma', 'Green', 12, '0131-222-3333', 'EmmaGreen@email.com', 5072003);

-- --------------------------------------------------------

--
-- Table structure for table `Pilot`
--

CREATE TABLE `Pilot` (
  `pilot_id` int(11) NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rank_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Pilot`
--

INSERT INTO `Pilot` (`pilot_id`, `first_name`, `last_name`, `age`, `phone`, `email`, `rank_id`) VALUES
(5069001, 'Ann', 'Beech', 30, '0141-848-1825', 'AnnBeech@email.com', 3),
(5069002, 'Mary', 'Howe', 35, '01224-196720', 'MaryHowe@email.com', 3),
(5069003, 'David', 'Ford', 40, '01475-392178', 'DavidFord@email.com', 1),
(5069004, 'Susan', 'Brand', 45, '0207-774-5632', 'SusanBrand@email.com', 1),
(5069005, 'John', 'White', 50, '0207-774-5632', 'JohnWhite@email.com', 1),
(5069006, 'Julie', 'Lee', 55, '0207-774-5632', 'JulieLee@email.com', 1),
(5069007, 'Peter', 'Jones', 28, '0131-445-1234', 'PeterJones@email.com', 3),
(5069008, 'Brian', 'Smith', 52, '0141-887-4321', 'BrianSmith@email.com', 1),
(5069009, 'Michael', 'Brown', 38, '0161-123-4567', 'MichaelBrown@email.com', 2),
(5069010, 'Sarah', 'Davis', 42, '0113-987-6543', 'SarahDavis@email.com', 2);

-- --------------------------------------------------------

--
-- Table structure for table `PleasureFlight`
--

CREATE TABLE `PleasureFlight` (
  `flight_id` int(11) NOT NULL,
  `status` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_passengers` int(11) NOT NULL,
  `party_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `PleasureFlight`
--

INSERT INTO `PleasureFlight` (`flight_id`, `status`, `max_passengers`, `party_id`) VALUES
(46001, 'scheduled', 3, 5072001),
(46003, 'completed', 2, 5072002),
(46004, 'scheduled', 2, 5072003),
(46009, 'scheduled', 4, 5072004),
(46010, 'scheduled', 2, 5072005);

-- --------------------------------------------------------

--
-- Table structure for table `Rank`
--

CREATE TABLE `Rank` (
  `rank_id` int(11) NOT NULL,
  `rank_name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_daily_flight` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Rank`
--

INSERT INTO `Rank` (`rank_id`, `rank_name`, `max_daily_flight`) VALUES
(1, 'Captain', 2),
(2, 'Chief Officer', 2),
(3, 'Officer', 1);

-- --------------------------------------------------------

--
-- Table structure for table `TrainingFlight`
--

CREATE TABLE `TrainingFlight` (
  `flight_id` int(11) NOT NULL,
  `instructor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `TrainingFlight`
--

INSERT INTO `TrainingFlight` (`flight_id`, `instructor_id`) VALUES
(46002, 4906001),
(46005, 4906002),
(46006, 4906003),
(46007, 4906004),
(46008, 4906005);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Crew`
--
ALTER TABLE `Crew`
  ADD PRIMARY KEY (`Crew_ID`),
  ADD KEY `flight_id` (`flight_id`),
  ADD KEY `pilot_id` (`pilot_id`);

--
-- Indexes for table `Flight`
--
ALTER TABLE `Flight`
  ADD PRIMARY KEY (`flight_id`);

--
-- Indexes for table `Instructor`
--
ALTER TABLE `Instructor`
  ADD PRIMARY KEY (`instructor_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `Party`
--
ALTER TABLE `Party`
  ADD PRIMARY KEY (`party_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `Passenger`
--
ALTER TABLE `Passenger`
  ADD PRIMARY KEY (`passenger_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `party_id` (`party_id`);

--
-- Indexes for table `Pilot`
--
ALTER TABLE `Pilot`
  ADD PRIMARY KEY (`pilot_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `rank_id` (`rank_id`);

--
-- Indexes for table `PleasureFlight`
--
ALTER TABLE `PleasureFlight`
  ADD PRIMARY KEY (`flight_id`),
  ADD KEY `party_id` (`party_id`);

--
-- Indexes for table `Rank`
--
ALTER TABLE `Rank`
  ADD PRIMARY KEY (`rank_id`);

--
-- Indexes for table `TrainingFlight`
--
ALTER TABLE `TrainingFlight`
  ADD PRIMARY KEY (`flight_id`),
  ADD KEY `instructor_id` (`instructor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Crew`
--
ALTER TABLE `Crew`
  MODIFY `Crew_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4372011;

--
-- AUTO_INCREMENT for table `Flight`
--
ALTER TABLE `Flight`
  MODIFY `flight_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46011;

--
-- AUTO_INCREMENT for table `Instructor`
--
ALTER TABLE `Instructor`
  MODIFY `instructor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4906006;

--
-- AUTO_INCREMENT for table `Party`
--
ALTER TABLE `Party`
  MODIFY `party_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5072006;

--
-- AUTO_INCREMENT for table `Passenger`
--
ALTER TABLE `Passenger`
  MODIFY `passenger_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5061009;

--
-- AUTO_INCREMENT for table `Pilot`
--
ALTER TABLE `Pilot`
  MODIFY `pilot_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5069011;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Crew`
--
ALTER TABLE `Crew`
  ADD CONSTRAINT `Crew_ibfk_1` FOREIGN KEY (`flight_id`) REFERENCES `Flight` (`flight_id`),
  ADD CONSTRAINT `Crew_ibfk_2` FOREIGN KEY (`pilot_id`) REFERENCES `Pilot` (`pilot_id`);

--
-- Constraints for table `Passenger`
--
ALTER TABLE `Passenger`
  ADD CONSTRAINT `Passenger_ibfk_1` FOREIGN KEY (`party_id`) REFERENCES `Party` (`party_id`);

--
-- Constraints for table `Pilot`
--
ALTER TABLE `Pilot`
  ADD CONSTRAINT `Pilot_ibfk_1` FOREIGN KEY (`rank_id`) REFERENCES `Rank` (`rank_id`);

--
-- Constraints for table `PleasureFlight`
--
ALTER TABLE `PleasureFlight`
  ADD CONSTRAINT `PleasureFlight_ibfk_1` FOREIGN KEY (`flight_id`) REFERENCES `Flight` (`flight_id`),
  ADD CONSTRAINT `PleasureFlight_ibfk_2` FOREIGN KEY (`party_id`) REFERENCES `Party` (`party_id`);

--
-- Constraints for table `TrainingFlight`
--
ALTER TABLE `TrainingFlight`
  ADD CONSTRAINT `TrainingFlight_ibfk_1` FOREIGN KEY (`flight_id`) REFERENCES `Flight` (`flight_id`),
  ADD CONSTRAINT `TrainingFlight_ibfk_2` FOREIGN KEY (`instructor_id`) REFERENCES `Instructor` (`instructor_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
