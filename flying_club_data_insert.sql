--will join back to flying_club.sql


INSERT INTO 'passenger' ('passenger_id', 'first_name', 'last_name','age','gender','phone', 'email') VALUES 
('P001', 'Aline', 'Stewart','25','M','0141-848-1825', 'AlineStewart@email.com');
('P002', 'Mary', 'Tregear','30','F','01224-196720', 'MaryTregear@email.com');
('P003', 'Mike', 'Ritchie','35','M','01475-392178', 'MikeRitchie@email.com');
('P004', 'John', 'Kay','40','M','0207-774-5632', 'JohnKay@email.com');
--data from dreamhome3.sql
-- ('CR56', 'Aline', 'Stewart', '0141-848-1825', 'Flat', 350),
-- ('CR62', 'Mary', 'Tregear', '01224-196720', 'Flat', 600),
-- ('CR74', 'Mike', 'Ritchie', '01475-392178', 'House', 750),
-- ('CR76', 'John', 'Kay', '0207-774-5632', 'Flat', 425);



INSERT INTO 'Pilot'('pilot_id','first_name','last_name','age','gender','phone','email','pilot_role') VALUES
('PI001', 'Ann', 'Beech','30','F','0141-848-1825', 'AnnBeech@email.com', 'Officer');
('PI002', 'Mary', 'Howe','35','F','01224-196720', 'MaryHowe@email.com', 'Officer');
('PI003', 'David', 'Ford','40','M','01475-392178', 'DavidFord@email.com', 'Officer');
('PI004', 'Susan', 'Brand','45','F','0207-774-5632', 'SusanBrand@email.com', 'Chief Officer');
('PI005', 'John', 'White','50','M','0207-774-5632', 'JohnWhite@email.com', 'Chief Officer');
('PI006', 'Julie', 'Lee','55','F','0207-774-5632', 'JulieLee@email.com', 'Captain');


--INSERT INTO `staff` (`StaffNo`, `Fname`, `Lname`, `Position`, `Sex`, `DOB`, `Salary`, `BranchNo`) VALUES
--('SG37', 'Ann', 'Beech', 'Assistant', 'F', '1960-10-11 00:00:00', 12000, 'B005'),
--('SA9', 'Mary', 'Howe', 'Assistant', 'F', '1970-02-19 00:00:00', 9000, 'B007'),
--('SG14', 'David', 'Ford', 'Supervisor', 'M', '1958-03-24 00:00:00', 18000, 'B003'),
--('SG5', 'Susan', 'Brand', 'Manager', 'F', '1940-06-03 00:00:00', 24000, 'B003'),
--('SL21', 'John', 'White', 'Manager', 'M', '1945-10-01 00:00:00', 30000, 'B005'),
--('SL41', 'Julie', 'Lee', 'Assistant', 'F', '1965-06-13 00:00:00', 90000, 'B005');
