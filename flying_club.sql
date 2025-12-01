CREATE TABLE `Rank` (
    `rank_id` INT NOT NULL,
    `rank_name` VARCHAR(25) NOT NULL,
    `max_daily_flight` INT NOT NULL,
    PRIMARY KEY (`rank_id`)
);

INSERT INTO `Rank` (`rank_id`, `rank_name`, `max_daily_flight`) VALUES
(1, 'Captain', 2),
(2, 'Chief Officer', 2),
(3, 'Officer', 1);

-- Table for pilots
CREATE TABLE `Pilot` (
   `pilot_id` INT NOT NULL AUTO_INCREMENT,
   `first_name` VARCHAR(50) NOT NULL,
   `last_name` VARCHAR(50) NOT NULL,
   `age` INT NOT NULL,
   `phone` VARCHAR(15) NOT NULL,
   `email` VARCHAR(50) NOT NULL UNIQUE,
   `rank_id` INT NOT NULL,
   PRIMARY KEY (`pilot_id`),
   FOREIGN KEY (`rank_id`) REFERENCES `Rank`(`rank_id`)
);

-- Set the starting value for pilot_id
ALTER TABLE `Pilot` AUTO_INCREMENT = 5069001;

-- Insert data into the Pilot table
INSERT INTO `Pilot` (`first_name`, `last_name`, `age`, `phone`, `email`, `rank_id`) VALUES
('Ann', 'Beech', 30, '0141-848-1825', 'AnnBeech@email.com', 3),
('Mary', 'Howe', 35, '01224-196720', 'MaryHowe@email.com', 3),
('David', 'Ford', 40, '01475-392178', 'DavidFord@email.com',1),
('Susan', 'Brand', 45, '0207-774-5632', 'SusanBrand@email.com',1),
('John', 'White', 50, '0207-774-5632', 'JohnWhite@email.com',1),
('Julie', 'Lee', 55, '0207-774-5632', 'JulieLee@email.com',1),
('Peter', 'Jones', 28, '0131-445-1234', 'PeterJones@email.com', 3),
('Brian', 'Smith', 52, '0141-887-4321', 'BrianSmith@email.com', 1),
('Michael', 'Brown', 38, '0161-123-4567', 'MichaelBrown@email.com', 2),
('Sarah', 'Davis', 42, '0113-987-6543', 'SarahDavis@email.com', 2);


-- Table for instructors, who are also pilots
CREATE TABLE `Instructor` (
   `instructor_id` INT NOT NULL AUTO_INCREMENT,
   `first_name` VARCHAR(50) NOT NULL,
   `last_name` VARCHAR(50) NOT NULL,
   `age` INT NOT NULL,
   `phone` VARCHAR(15) NOT NULL,
   `email` VARCHAR(50) NOT NULL UNIQUE,
   PRIMARY KEY (`instructor_id`)
);
ALTER TABLE `Instructor` AUTO_INCREMENT = 4906001;
INSERT INTO `Instructor` (`first_name`, `last_name`, `age`, `phone`, `email`) VALUES
('Jane', 'Doe', 40, '0207-774-5632', 'JaneDoe@email.com'),
('Laura', 'Wilson', 38, '01224-555-666', 'LauraWilson@email.com'),
('Robert', 'Miller', 45, '0141-333-4444', 'RobertMiller@email.com'),
('Linda', 'Taylor', 50, '0131-555-7777', 'LindaTaylor@email.com'),
('James', 'Anderson', 35, '0161-888-9999', 'JamesAnderson@email.com');

CREATE TABLE `Party` (
    `party_id` INT NOT NULL AUTO_INCREMENT,
    `point_of_contact_ID` VARCHAR(10) NOT NULL,
    `booking_Fname` VARCHAR(50) NOT NULL,
    `booking_Lname` VARCHAR(50) NOT NULL,
    `phone` VARCHAR(15) NOT NULL,
    `email` VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY (`party_id`)
);
ALTER TABLE `Party` AUTO_INCREMENT = 5072001;

INSERT INTO `Party` (`point_of_contact_ID`, `booking_Fname`, `booking_Lname`, `phone`, `email`) VALUES
('PC-001', 'Aline', 'Stewart', '0141-848-1825', 'AlineStewart@email.com'),
('PC-002', 'John', 'Kay', '0207-774-5632', 'JohnKay@email.com'),
('PC-003', 'Chris', 'Green', '0131-222-3333', 'ChrisGreen@email.com'),
('PC-004', 'Patricia', 'Clark', '0141-999-8888', 'PatriciaClark@email.com'),
('PC-005', 'George', 'Harris', '01224-111-2222', 'GeorgeHarris@email.com');

-- Table for passengers
CREATE TABLE `Passenger` (
   `passenger_id` INT NOT NULL AUTO_INCREMENT,
   `first_name` VARCHAR(50) NOT NULL,
   `last_name` VARCHAR(50) NOT NULL,
   `age` INT NOT NULL,
   `phone` VARCHAR(15) NOT NULL,
   `email` VARCHAR(50) NOT NULL UNIQUE,
   `party_id` INT,
   `adult_need` varchar(3) AS (IF(age <= 18, 'Yes', 'No')),
   PRIMARY KEY (`passenger_id`),
   FOREIGN KEY (`party_id`) REFERENCES `Party`(`party_id`)
);

-- Set the starting value for passenger_id
ALTER TABLE `Passenger` AUTO_INCREMENT = 5061001;

-- Insert data into the Passenger table
INSERT INTO `Passenger` (`first_name`, `last_name`, `age`, `phone`, `email`, `party_id`) VALUES
('Aline', 'Stewart', 25, '0141-848-1825', 'AlineStewart@email.com', 5072001),
('Mary', 'Tregear', 30, '01224-196720', 'MaryTregear@email.com', 5072001),
('Mike', 'Ritchie', 35, '01475-392178', 'MikeRitchie@email.com', 5072001),
('John', 'Kay', 40, '0207-774-5632', 'JohnKay@email.com', 5072002),
('Julie', 'White', 55, '0207-774-5632', 'JulieWhite@email.com', 5072002),
('Aydan','White', 15, '0207-774-5632', 'AydanWhite@email.com', 5072002),
('Chris', 'Green', 42, '0131-222-3333', 'ChrisGreen@email.com', 5072003),
('Emma', 'Green', 12, '0131-222-3333', 'EmmaGreen@email.com', 5072003);

CREATE TABLE `Flight` (
   `flight_id` INT NOT NULL AUTO_INCREMENT,
   `flight_type` ENUM('pleasure', 'training') NOT NULL,
   `flight_date` DATE NOT NULL,
   `start_time` TIME NOT NULL,
   `duration` ENUM('30min', '60min', '120min', 'half-day'),
   `route` VARCHAR(50),
   PRIMARY KEY (`flight_id`)
);
ALTER TABLE `Flight` AUTO_INCREMENT = 46001;

INSERT INTO `Flight` (`flight_type`, `flight_date`, `start_time`, `duration`, `route`) VALUES
('pleasure', '2024-08-01', '10:00:00', '60min', 'Coastal Tour'),
('training', '2024-08-01', '14:00:00', '120min', 'Training Area B'),
('pleasure', '2024-08-02', '11:00:00', '30min', 'City Overview'),
('pleasure', '2024-08-03', '09:00:00', '60min', 'Loch Lomond View'),
('training', '2024-08-03', '13:00:00', '120min', 'Training Area A'),
('training', '2024-08-04', '10:00:00', '60min', 'Training Area C'),
('training', '2024-08-04', '14:00:00', '120min', 'Training Area B'),
('training', '2024-08-05', '09:00:00', '60min', 'Training Area A'),
('pleasure', '2024-08-05', '11:00:00', '30min', 'River Clyde Run'),
('pleasure', '2024-08-06', '15:00:00', '60min', 'Castle Tour');

CREATE TABLE `TrainingFlight` (
    `flight_id` INT NOT NULL,
    `instructor_id` INT NOT NULL,
    PRIMARY KEY (`flight_id`),
    FOREIGN KEY (`flight_id`) REFERENCES `Flight`(`flight_id`),
    FOREIGN KEY (`instructor_id`) REFERENCES `Instructor`(`instructor_id`)
);

INSERT INTO `TrainingFlight` (`flight_id`, `instructor_id`) VALUES
(46002, 4906001),
(46005, 4906002),
(46006, 4906003),
(46007, 4906004),
(46008, 4906005);

CREATE TABLE `PleasureFlight` (
    `flight_id` INT NOT NULL,
    `status` VARCHAR(25) NOT NULL,
    `max_passengers` INT NOT NULL,
    `party_id` INT,
    PRIMARY KEY (`flight_id`),
    FOREIGN KEY (`flight_id`) REFERENCES `Flight`(`flight_id`),
    FOREIGN KEY (`party_id`) REFERENCES `Party`(`party_id`)
);

INSERT INTO `PleasureFlight` (`flight_id`, `status`, `max_passengers`, `party_id`) VALUES
(46001, 'scheduled', 3, 5072001),
(46003, 'completed', 2, 5072002),
(46004, 'scheduled', 2, 5072003),
(46009, 'scheduled', 4, 5072004),
(46010, 'scheduled', 2, 5072005);

-- Table to assign pilots to flights
CREATE TABLE `Crew` (
    `Crew_ID` INT NOT NULL AUTO_INCREMENT,
    `flight_id` INT NOT NULL,
    `pilot_id` INT NOT NULL,
    `role` ENUM('First', 'Second') NOT NULL,
    PRIMARY KEY (`Crew_ID`),
    FOREIGN KEY (`flight_id`) REFERENCES `Flight`(`flight_id`),
    FOREIGN KEY (`pilot_id`) REFERENCES `Pilot`(`pilot_id`)
);
ALTER TABLE `Crew` AUTO_INCREMENT = 4372001;

INSERT INTO `Crew` (`flight_id`, `pilot_id`, `role`) VALUES
(46001, 5069003, 'First'), 
(46001, 5069009, 'Second'), 
(46002, 5069004, 'First'),
(46002, 5069001, 'Second'),
(46003, 5069005, 'First'), 
(46003, 5069002, 'Second'), 
(46004, 5069006, 'First'), 
(46004, 5069008, 'Second'),
(46005, 5069007, 'First'), 
(46005, 5069010, 'Second');