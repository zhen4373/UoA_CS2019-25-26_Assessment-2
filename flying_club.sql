CREATE DATABASE flying_club;
USE flying_club;

-- Table for pilots
CREATE TABLE `Pilot` (
   `pilot_id` INT NOT NULL AUTO_INCREMENT,
   `first_name` VARCHAR(50) NOT NULL,
   `last_name` VARCHAR(50) NOT NULL,
   `age` INT NOT NULL,
   `gender` VARCHAR(10) NOT NULL,
   `phone` VARCHAR(15) NOT NULL,
   `email` VARCHAR(50) NOT NULL UNIQUE,
   `pilot_role` ENUM('Captain', 'Chief Officer', 'Officer') NOT NULL,
   PRIMARY KEY (`pilot_id`)
);

-- Table for instructors, who are also pilots
CREATE TABLE `Instructor` (
   `instructor_id` INT NOT NULL AUTO_INCREMENT,
   `pilot_id` INT NOT NULL,
   PRIMARY KEY (`instructor_id`),
   FOREIGN KEY(`pilot_id`) REFERENCES `Pilot`(`pilot_id`)
);

-- Table for passengers
CREATE TABLE `Passenger` (
   `passenger_id` INT NOT NULL AUTO_INCREMENT,
   `first_name` VARCHAR(50) NOT NULL,
   `last_name` VARCHAR(50) NOT NULL,
   `age` INT NOT NULL,
   `gender` VARCHAR(10) NOT NULL,
   `phone` VARCHAR(15) NOT NULL,
   `email` VARCHAR(50) NOT NULL UNIQUE,
   PRIMARY KEY (`passenger_id`)
);

-- Table for all flights
CREATE TABLE `Flight` (
   `flight_id` INT NOT NULL AUTO_INCREMENT,
   `flight_type` ENUM('pleasure', 'training') NOT NULL,
   `flight_date` DATE NOT NULL,
   `start_time` TIME NOT NULL,
   `time_slot` ENUM('morning', 'afternoon') NOT NULL,
   `duration` ENUM('30min', '60min', '120min', 'half-day'), -- Null for training flights
   `route` VARCHAR(50),
   `status` ENUM('scheduled', 'cancelled', 'completed') NOT NULL,
   `instructor_id` INT, -- Null for pleasure flights
   PRIMARY KEY (`flight_id`),
   FOREIGN KEY(`instructor_id`) REFERENCES `Instructor`(`instructor_id`),
   CONSTRAINT chk_flight_rules CHECK (
       (flight_type = 'training' AND instructor_id IS NOT NULL AND duration IS NULL) OR
       (flight_type = 'pleasure' AND instructor_id IS NULL AND duration IS NOT NULL)
   )
);

-- Table to assign pilots to flights
CREATE TABLE `FlightCrew` (
    `flight_id` INT NOT NULL,
    `pilot_id` INT NOT NULL,
    PRIMARY KEY (`flight_id`, `pilot_id`),
    FOREIGN KEY (`flight_id`) REFERENCES `Flight`(`flight_id`) ON DELETE CASCADE,
    FOREIGN KEY (`pilot_id`) REFERENCES `Pilot`(`pilot_id`)
);

-- Table for booking parties for pleasure flights
CREATE TABLE `BookingParty` (
    `party_id` INT NOT NULL AUTO_INCREMENT,
    `flight_id` INT NOT NULL,
    `contact_passenger_id` INT NOT NULL,
    PRIMARY KEY (`party_id`),
    FOREIGN KEY (`flight_id`) REFERENCES `Flight`(`flight_id`),
    FOREIGN KEY (`contact_passenger_id`) REFERENCES `Passenger`(`passenger_id`)
);

-- Table to link passengers to a booking party
CREATE TABLE `PartyMember` (
    `party_id` INT NOT NULL,
    `passenger_id` INT NOT NULL,
    PRIMARY KEY (`party_id`, `passenger_id`),
    FOREIGN KEY (`party_id`) REFERENCES `BookingParty`(`party_id`) ON DELETE CASCADE,
    FOREIGN KEY (`passenger_id`) REFERENCES `Passenger`(`passenger_id`)
);

-- Views for convenience
CREATE OR REPLACE VIEW `pleasure_flights_view` AS
    SELECT * FROM `Flight` WHERE `flight_type` = 'pleasure';

CREATE OR REPLACE VIEW `training_flights_view` AS
    SELECT * FROM `Flight` WHERE `flight_type` = 'training';