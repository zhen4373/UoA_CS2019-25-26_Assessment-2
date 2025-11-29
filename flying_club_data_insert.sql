USE flying_club;

-- Insert data into the Pilot table
INSERT INTO `Pilot` (`first_name`, `last_name`, `age`, `gender`, `phone`, `email`, `pilot_role`) VALUES
('Ann', 'Beech', 30, 'F', '0141-848-1825', 'AnnBeech@email.com', 'Officer'),
('Mary', 'Howe', 35, 'F', '01224-196720', 'MaryHowe@email.com', 'Officer'),
('David', 'Ford', 40, 'M', '01475-392178', 'DavidFord@email.com', 'Officer'),
('Susan', 'Brand', 45, 'F', '0207-774-5632', 'SusanBrand@email.com', 'Chief Officer'),
('John', 'White', 50, 'M', '0207-774-5632', 'JohnWhite@email.com', 'Chief Officer'),
('Julie', 'Lee', 55, 'F', '0207-774-5632', 'JulieLee@email.com', 'Captain');

-- Insert data into the Passenger table
INSERT INTO `Passenger` (`first_name`, `last_name`, `age`, `gender`, `phone`, `email`) VALUES
('Aline', 'Stewart', 25, 'M', '0141-848-1825', 'AlineStewart@email.com'),
('Mary', 'Tregear', 30, 'F', '01224-196720', 'MaryTregear@email.com'),
('Mike', 'Ritchie', 35, 'M', '01475-392178', 'MikeRitchie@email.com'),
('John', 'Kay', 40, 'M', '0207-774-5632', 'JohnKay@email.com');