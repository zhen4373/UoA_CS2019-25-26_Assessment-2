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
ALTER TABLE `Pilot` AUTO_INCREMENT = 5069001;
INSERT INTO `Pilot` (`first_name`, `last_name`, `age`, `phone`, `email`, `rank_id`) VALUES
('Ann', 'Beech', 30, '0141-848-1825', 'AnnBeech@email.com', 3),
('Mary', 'Howe', 35, '01224-196720', 'MaryHowe@email.com', 3),
('David', 'Ford', 40, '01475-392178', 'DavidFord@email.com',1),
('Susan', 'Brand', 45, '0207-774-5632', 'SusanBrand@email.com',1),
('John', 'White', 50, '0207-774-5632', 'JohnWhite@email.com',1),
('Julie', 'Lee', 55, '0207-774-5632', 'JulieLee@email.com',1);


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
('Jane', 'Doe', 40, '0207-774-5632', 'JaneDoe@email.com');

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
('PC001', 'Aline', 'Stewart', '0141-848-1825', 'AlineStewart@email.com'),
('PC002', 'John', 'Kay', '0207-774-5632', 'JohnKay@email.com');

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
ALTER TABLE `Passenger` AUTO_INCREMENT = 5061001;
INSERT INTO `Passenger` (`first_name`, `last_name`, `age`, `phone`, `email`) VALUES
('Aline', 'Stewart', 25, '0141-848-1825', 'AlineStewart@email.com'),
('Mary', 'Tregear', 30, '01224-196720', 'MaryTregear@email.com'),
('Mike', 'Ritchie', 35, '01475-392178', 'MikeRitchie@email.com'),
('John', 'Kay', 40, '0207-774-5632', 'JohnKay@email.com'),
('Julie', 'White', 55, '0207-774-5632', 'JulieWhite@email.com'),
('Aydan','White', 15, '0207-774-5632', 'AydanWhite@email.com');


CREATE TABLE `Flight` (
   `flight_id` INT NOT NULL AUTO_INCREMENT,
   `flight_type` ENUM('pleasure', 'training') NOT NULL,
   `flight_date` DATE NOT NULL,
   `start_time` TIME NOT NULL,
   `duration` ENUM('30min', '60min', '120min', 'half-day'),
   `route` VARCHAR(50),
   `status` ENUM('scheduled', 'cancelled', 'completed') NOT NULL,
   PRIMARY KEY (`flight_id`)
);
ALTER TABLE `Flight` AUTO_INCREMENT = 46001;


CREATE TABLE `TrainingFlight` (
    `flight_id` INT NOT NULL,
    `instructor_id` INT NOT NULL,
    PRIMARY KEY (`flight_id`),
    FOREIGN KEY (`flight_id`) REFERENCES `Flight`(`flight_id`),
    FOREIGN KEY (`instructor_id`) REFERENCES `Instructor`(`instructor_id`)
);

INSERT INTO `TrainingFlight` (`flight_id`, `instructor_id`) VALUES
(46002, 4906001);

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
(46003, 'completed', 2, 5072002);

-- Table to assign pilots to flights
CREATE TABLE `Crew` (
    `Crew_ID` INT NOT NULL,
    `flight_id` INT NOT NULL,
    `pilot_id` INT NOT NULL,
    `role` ENUM('First', 'Second') NOT NULL,
    PRIMARY KEY (`Crew_ID`),
    FOREIGN KEY (`flight_id`) REFERENCES `Flight`(`flight_id`),
    FOREIGN KEY (`pilot_id`) REFERENCES `Pilot`(`pilot_id`)
);
ALTER TABLE `Crew` AUTO_INCREMENT = 4372001;
INSERT INTO `Crew` (`flight_id`, `pilot_id`, `role`) VALUES
(46001, 5069001, 'First'),
(46001, 5069002, 'Second'),
(46003, 5069003, 'First'),
(46003, 5069004, 'Second');



-- Table to link passengers to a booking party
CREATE TABLE `PartyMember` (
    `party_id` INT NOT NULL,
    `passenger_id` INT NOT NULL,
    PRIMARY KEY (`party_id`, `passenger_id`),
    FOREIGN KEY (`party_id`) REFERENCES `Party`(`party_id`) ON DELETE CASCADE,
    FOREIGN KEY (`passenger_id`) REFERENCES `Passenger`(`passenger_id`)
);

INSERT INTO `PartyMember` (`party_id`, `passenger_id`) VALUES
(5072001, 5061001),
(5072001, 5061002),
(5072002, 5061004),
(5072002, 5061005),
(5072002, 5061006);
