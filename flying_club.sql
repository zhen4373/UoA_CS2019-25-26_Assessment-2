create table pilot (
   pilot_id int ,
   first_name varchar(50),
   last_name varchar(50),
   age int,
   gender varchar(10),
   phone varchar(15),
   email varchar(50),
   types_of_pilot varchar(50)
   '(Captain,Chief Officer, and Officer)'   
   Max_flights_per_day boolean default true,
   primary key (flight_id),


)


create table passengers (
   passenger_id int,
   first_name varchar(50),
   last_name varchar(50),
   age int,
   superviser_need boolean default false,
   gender varchar(10),
   phone varchar(15),
   email varchar(50),
   PRIMARY key (passenger_id)
)


create table instructors(
   instructor_id int,
   first_name varchar(50),
   last_name varchar(50),
   age int,
   gender varchar(10),
   phone varchar(15),
   email varchar(50),
   types_of_pilot varchar(50)
   '(Captain,Chief Officer, and Officer)'
   primary key (instructor_id)
   foreign key (types_of_pilot) references pilot(types_of_pilot)
)


create table flights(
   flight_id int ,
   flight_date DATE,
   flight_scheduled_Time TIME,
   flight_duration TIME,
   Flight_Type varchar(50)
   '(Training Flight, Pleasure Flight)'
   flight_status varchar(50)
   '(Scheduled, Cancelled, Delayed, Completed)'
   PRIMARY key (flight_id)
)


create table Pleasure_flights (
   flight_id int,
   type_of_pleasure_flight varchar(50)
   '30 minutes, 60 minutes, 2 hours, half-day'
   passenger_id_1 int,
   passenger_id_2 int,
   passenger_id_3 int,
   pilot_id_1 int,
   pilot_id_2 int,
   foreign key (flight_id) references flights(flight_id),
   foreign key (passenger_id_1) references passengers(passenger_id),
   foreign key (passenger_id_2) references passengers(passenger_id),
   foreign key (passenger_id_3) references passengers(passenger_id)
   foreign key(pilot_id_1) references pilot(pilot_id),
   foreign key(pilot_id_2) references pilot(pilot_id),


)
create table Training_flights(
   flight_id int,
   instructor_id int,
   foreign key (flight_id) references flights(flight_id),
   foreign key (instructor_id) references instructors(instructor_id)


)


create table Booking(
   booking_id int,
   Flight_ID int,
   passenger_id int,
   PRIMARY key(booking_id)
   foreign key(flight_id) references flights(flight_id)
   foreign key(passenger_id) references passengers(passenger_id)
)


