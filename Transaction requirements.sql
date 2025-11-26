-- 1. List all the trainee officers piloting a flight on a given day.
-- This query finds all pilots with the role 'Officer' who are scheduled for a flight on a specific date.
SELECT p.pilot_id, p.first_name, p.last_name, f.flight_id, f.flight_date
FROM Pilot p
JOIN FlightCrew fc ON p.pilot_id = fc.pilot_id
JOIN Flight f ON fc.flight_id = f.flight_id
WHERE p.pilot_role = 'Officer' AND f.flight_date = 'YYYY-MM-DD'; -- Replace 'YYYY-MM-DD' with the desired date.

-- 2. List all the pilots on a given pleasure flight.
-- This query retrieves the details of all pilots assigned to a specific pleasure flight.
SELECT p.pilot_id, p.first_name, p.last_name, p.pilot_role
FROM Pilot p
JOIN FlightCrew fc ON p.pilot_id = fc.pilot_id
WHERE fc.flight_id = 123; -- Replace 123 with the desired flight_id.

-- 3. List all the pleasure flights a given pilot undertakes.
-- This query lists all pleasure flights that a specific pilot is assigned to.
SELECT f.flight_id, f.flight_date, f.start_time, f.duration, f.route
FROM Flight f
JOIN FlightCrew fc ON f.flight_id = fc.flight_id
WHERE fc.pilot_id = 456 AND f.flight_type = 'pleasure'; -- Replace 456 with the desired pilot_id.

-- 4. List the phone number of a given passenger.
-- This query retrieves the phone number for a passenger with a given name.
SELECT phone
FROM Passenger
WHERE first_name = 'John' AND last_name = 'Doe'; -- Replace 'John' and 'Doe' with the passenger's name.

-- 5. List all the training flights for a given instructor on a given date.
-- This query finds all training flights assigned to a specific instructor on a particular date.
SELECT f.flight_id, f.flight_date, f.start_time
FROM Flight f
WHERE f.instructor_id = 789 AND f.flight_date = 'YYYY-MM-DD'; -- Replace 789 with the instructor_id and 'YYYY-MM-DD' with the date.