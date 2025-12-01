-- 1. List all the trainee officers piloting a flight on a given day.
SELECT p.pilot_id, p.first_name, p.last_name, r.rank_name, f.flight_id, f.flight_date
FROM `Pilot` p
JOIN `Crew` c ON p.pilot_id = c.pilot_id
JOIN `Flight` f ON c.flight_id = f.flight_id
JOIN `Rank` r ON p.rank_id = r.rank_id
WHERE r.rank_name = 'Officer' AND f.flight_date = '2024-08-01';



-- 2. List all the pilots on a given pleasure flight.
SELECT p.pilot_id, p.first_name, p.last_name, r.rank_name, f.flight_id, f.flight_date
FROM `Pilot` p
JOIN `Crew` c ON p.pilot_id = c.pilot_id
JOIN `Rank` r ON p.rank_id = r.rank_id
JOIN `Flight` f ON c.flight_id = f.flight_id
WHERE f.flight_type = 'pleasure';



-- 3. List all the pleasure flights a given pilot undertakes.
SELECT f.flight_id, f.flight_date, f.start_time, f.duration, f.route
FROM `Flight` f
JOIN `Crew` c ON f.flight_id = c.flight_id
WHERE c.pilot_id = 5069003 AND f.flight_type = 'pleasure'; 


-- 4. List the phone number of a given passenger.
SELECT phone
FROM `Passenger`
WHERE first_name = 'Aline' AND last_name = 'Stewart'; 



-- 5. List all the training flights for a given instructor on a given date.
SELECT f.flight_id, f.flight_date, f.start_time
FROM `Flight` f
JOIN `TrainingFlight` tf ON f.flight_id = tf.flight_id
WHERE tf.instructor_id = 4906001 AND f.flight_date = '2024-08-01';