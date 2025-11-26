create database flying_club;

create table pilot (
   pilot_id int, not null,
   first_name varchar(50),not null,
   last_name varchar(50),not null,
   age int, not null,
   gender varchar(10), not null,
   phone varchar(15), not null,
   email varchar(50), not null,
   types_of_pilot varchar(50), not null
   '(Captain,Chief Officer, and Officer)'   
   Max_flights_per_day int, not null,
   'Captain:2,Chief Officer:2,Officer:1'
   primary key (flight_id),

)
create table instructor as 
   select * from pilot
   where types_of_pilot = ''
   instructor_id int, not null,
   primary key (instructor_id)
   foreign key(pilot_id) references pilot(pilot_id)



create table passengers (
   passenger_id int, not null,
   first_name varchar(50), not null,
   last_name varchar(50), not null,
   age int, not null,
   under_18 boolean default false,not null,
   gender varchar(10), not null,
   phone varchar(15), not null,
   email varchar(50), not null,
   PRIMARY key (passenger_id)
)

create table booking (
   booking_id int, not null,
   booking_name varchar(50), not null,
   contact_number int, not null
   flight_id int, not null,
   passenger_id int, not null,
   PRIMARY key(booking_id),
   foreign key(flight_id) references flights(flight_id),
   foreign key(passenger_id) references passengers(passenger_id)
)


create table crew (
   crew_id int, not null,
   pilot_id int, not null,
   role_in_flight varchar(50), not null,
   PRIMARY key (crew_id)
   foreign key(pilot_id) references pilot(pilot_id)
)

create table passengers_flight (

   passenger_id int, not null,
   flight_id int, not null,
   PRIMARY key (passenger_id, flight_id),
   foreign key(passenger_id) references passengers(passenger_id),
   foreign key(flight_id) references flights(flight_id)
)


create table flights (
   flight_id int, not null,
   flight_type varchar(50), not null,
   flight_date date, not null,
   flight_time time, not null,
   duration varchar(10), not null,
   "30min, 60min, 120min, half-day"
   route varchar(50), not null,
   status varchar(50), not null,
   'scheduled, cancelled, completed'
   PRIMARY key (flight_id)
)



create table pleasure_flight as 
   select * from flights, crew
   where flight_type = 'pleasure'
   
create table traning_flight as 
   select * from flights, crew
   where flight_type = 'training'
   

