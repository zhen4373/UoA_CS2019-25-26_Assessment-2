-- 1. List all the trainee officers piloting a flight on a given day.
SELECT p.pilot_id, p.first_name, p.last_name, f.flight_id, f.flight_date
FROM Pilot p
JOIN FlightCrew fc ON p.pilot_id = fc.pilot_id
JOIN Flight f ON fc.flight_id = f.flight_id
WHERE p.pilot_role = 'Officer' AND f.flight_date = 'YYYY-MM-DD'; -- Replace 'YYYY-MM-DD' with the desired date.



-- 2. List all the pilots on a given pleasure flight.
SELECT p.pilot_id, p.first_name, p.last_name, p.pilot_role
FROM Pilot p
JOIN FlightCrew fc ON p.pilot_id = fc.pilot_id
WHERE fc.flight_id = (xxx); -- Replace (xxx) with the desired flight_id.



-- 3. List all the pleasure flights a given pilot undertakes.
SELECT f.flight_id, f.flight_date, f.start_time, f.duration, f.route
FROM Flight f
JOIN FlightCrew fc ON f.flight_id = fc.flight_id
WHERE fc.pilot_id = (xxx) AND f.flight_type = 'pleasure'; -- Replace (xxx) with the desired pilot_id.



-- 4. List the phone number of a given passenger.
SELECT phone
FROM Passenger
WHERE first_name = 'first_name' AND last_name = 'last_name'; -- Replace 'first_name' and 'last_name' with the passenger's name.



-- 5. List all the training flights for a given instructor on a given date.
SELECT f.flight_id, f.flight_date, f.start_time
FROM Flight f
WHERE f.instructor_id = (xxx) AND f.flight_date = 'YYYY-MM-DD'; -- Replace (xxx) with the instructor_id and 'YYYY-MM-DD' with the date.