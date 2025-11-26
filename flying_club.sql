create database flying_club;

CREATE TABLE IF NOT EXISTS `Pilot` (
   `pilot_id` int NOT NULL,
   `first_name` varchar(50) NOT NULL,
   `last_name` varchar(50) NOT NULL,
   `age` int NOT NULL,
   `gender` varchar(10) NOT NULL,
   `phone` varchar(15) NOT NULL,
   `email` varchar(50) NOT NULL,
   `types_of_pilot` varchar(50) NOT NULL, -- Captain, Chief Officer, and Officer
   `Max_flights_per_day` int NOT NULL, -- Captain:2, Chief Officer:2, Officer:1
   PRIMARY KEY (`pilot_id`)
);

CREATE TABLE `instructor` (
   `instructor_id` int NOT NULL,
   `pilot_id` int,
   PRIMARY KEY (`instructor_id`),
   FOREIGN KEY(`pilot_id`) REFERENCES `Pilot`(`pilot_id`)
);

CREATE TABLE `passengers` (
   `passenger_id` int NOT NULL,
   `first_name` varchar(50) NOT NULL,
   `last_name` varchar(50) NOT NULL,
   `age` int NOT NULL,
   `under_18` boolean default false NOT NULL,
   `gender` varchar(10) NOT NULL,
   `phone` varchar(15) NOT NULL,
   `email` varchar(50) NOT NULL,
   PRIMARY KEY (`passenger_id`)
);

CREATE TABLE `flights` (
   `flight_id` int NOT NULL,
   `flight_type` varchar(50) NOT NULL,
   `flight_date` date NOT NULL,
   `flight_time` time NOT NULL,
   `duration` varchar(10) NOT NULL, -- "30min, 60min, 120min, half-day"
   `route` varchar(50) NOT NULL,
   `status` varchar(50) NOT NULL, -- 'scheduled, cancelled, completed'
   `crew_id` int NOT NULL,
   PRIMARY KEY (`flight_id`)
   FOREIGN KEY(`crew_id`) REFERENCES `crew`(`crew_id`)
);

CREATE TABLE `booking` (
   `booking_id` int NOT NULL,
   `booking_name` varchar(50) NOT NULL,
   `contact_number` int NOT NULL,
   `flight_id` int NOT NULL,
   `passenger_id` int NOT NULL,
   PRIMARY KEY(`booking_id`),
   FOREIGN KEY(`flight_id`) REFERENCES `flights`(`flight_id`),
   FOREIGN KEY(`passenger_id`) REFERENCES `passengers`(`passenger_id`)
);

CREATE TABLE `crew` (
   `crew_id` int NOT NULL,
   `pilot_id` int NOT NULL,
   `role_in_flight` varchar(50) NOT NULL,
   PRIMARY KEY (`crew_id`),
   FOREIGN KEY(`pilot_id`) REFERENCES `Pilot`(`pilot_id`)
);

CREATE TABLE `passengers_flight` (
   `passenger_id` int NOT NULL,
   `flight_id` int NOT NULL,
   PRIMARY KEY (`passenger_id`, `flight_id`),
   FOREIGN KEY(`passenger_id`) REFERENCES `passengers`(`passenger_id`),
   FOREIGN KEY(`flight_id`) REFERENCES `flights`(`flight_id`)
);

CREATE TABLE `pleasure_flight` AS
   SELECT f.flight_id, f.flight_type, c.crew_id
   FROM flights f, crew c -- This is a CROSS JOIN, consider adding a JOIN condition
   WHERE f.flight_type = 'pleasure';

CREATE TABLE `traning_flight` AS
   SELECT f.flight_id, f.flight_type, c.crew_id
   FROM flights f, crew c -- This is a CROSS JOIN, consider adding a JOIN condition
   WHERE f.flight_type = 'training';