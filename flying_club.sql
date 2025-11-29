CREATE TABLE `Pilot` (
   `pilot_id` INT NOT NULL AUTO_INCREMENT,
   `first_name` VARCHAR(50) NOT NULL,
   `last_name` VARCHAR(50) NOT NULL,
   `age` INT NOT NULL,
   `date_of_birth` DATE NOT NULL,
   `gender` VARCHAR(10) NOT NULL,
   `phone` VARCHAR(15) NOT NULL,
   `email` VARCHAR(50) NOT NULL UNIQUE,
   `pilot_role` ENUM('Captain', 'Chief Officer', 'Officer') NOT NULL,
   PRIMARY KEY (`pilot_id`)
);

INSERT INTO 'Pilot'('pilot_id','first_name','last_name','age','date_of_birth','gender','phone','email','pilot_role') VALUES
('5069001', 'Ann', 'Beech','30','1990-01-01','F','0141-848-1825', 'AnnBeech@email.com', 'Officer');
('5069002', 'Mary', 'Howe','35','1985-02-02','F','01224-196720', 'MaryHowe@email.com', 'Officer');
('5069003', 'David', 'Ford','40','1980-03-03','M','01475-392178', 'DavidFord@email.com', 'Officer');
('5069004', 'Susan', 'Brand','45','1975-04-04','F','0207-774-5632', 'SusanBrand@email.com', 'Chief Officer');
('5069005', 'John', 'White','50','1970-05-05','M','0207-774-5632', 'JohnWhite@email.com', 'Chief Officer');
('5069006', 'Julie', 'Lee','55','1965-06-06','F','0207-774-5632', 'JulieLee@email.com', 'Captain');

CREATE TABLE `Instructor` (
   `instructor_id` INT NOT NULL AUTO_INCREMENT,
   `pilot_id` INT NOT NULL,
   PRIMARY KEY (`instructor_id`),
   FOREIGN KEY(`pilot_id`) REFERENCES `Pilot`(`pilot_id`)
);


CREATE TABLE `Passenger` (
   `passenger_id` INT NOT NULL AUTO_INCREMENT,
   `first_name` VARCHAR(50) NOT NULL,
   `last_name` VARCHAR(50) NOT NULL,
   `age` INT NOT NULL,
   `date_of_birth` DATE NOT NULL,
   `gender` VARCHAR(10) NOT NULL,
   `phone` VARCHAR(15) NOT NULL,
   `email` VARCHAR(50) NOT NULL UNIQUE,
   PRIMARY KEY (`passenger_id`)
);

INSERT INTO 'passenger' ('passenger_id', 'first_name', 'last_name','age','date_of_birth','gender','phone', 'email') VALUES 
('5061001', 'Aline', 'Stewart','25','1999-01-01','M','0141-848-1825', 'AlineStewart@email.com');
('5061002', 'Mary', 'Tregear','30','1994-02-02','F','01224-196720', 'MaryTregear@email.com');
('5061003', 'Mike', 'Ritchie','35','1990-03-03','M','01475-392178', 'MikeRitchie@email.com');
('5061004', 'John', 'Kay','40','1985-04-04','M','0207-774-5632', 'JohnKay@email.com');


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