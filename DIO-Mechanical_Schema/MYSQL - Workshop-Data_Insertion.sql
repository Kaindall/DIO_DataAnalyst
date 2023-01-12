INSERT INTO client (Cname, Csurname, document, email, phone, adress)
VALUES 	("Gabriel", "Souza", 11122233344, NULL, 11955443322, NULL),
		("Gisele", "Silva", 44433322211, NULL, 11912345678, NULL),
        ("Giovana", "Santos", 99988877766, NULL, 11987654321, NULL),
        ("GT Veiculos", NULL, "123456789101112", NULL, 11955555555, NULL);

INSERT INTO worker (Wname, Wsurname, document, phone, adress, daily_cost)
VALUES 	("Zeca", "Pagodinho", 11111111111,  11955443322, NULL, 100),
		("Alexandre", "Pires", 22222222222,  11944332211, NULL, 175),
        ("Zezé", "Camargo", 33333333333,  11933221100, NULL, 150),
        ("Luciano", "Camargo", 44444444444,  11922110099, NULL, 150),
        ("Pixote", "da Silva", 55555555555,  11911009988, NULL, 200),
        ("Bruno", "Marrom", 66666666666,  11900998877, NULL, 250),
        ("Victor", "Leonardo dos Santos", 77777777777,  11999887766, NULL, 250),
        ("Cesar", "Menorzin", 888888888888888, 11988776655, NULL, 100);

INSERT INTO supplier (Sname, document, email, phone, adress)
VALUES 	("Autopeças Joquinha", 999988887777666,  "contato@joquinha.com", NULL, NULL),
		("Tinturas Josefina", 111122223333444,  "suporte@josefina.com.br", NULL, NULL),
        ("Jagunço Trucks", 555566667777888,  "contato@trucks.com", NULL, NULL);

INSERT INTO service (Scname, category, days_estimated, needs_license)
VALUES	("Change Wheels", "Basic", 0, 1),
		("Change Steering Wheel", "Mechanical", 10, 1),
        ("Install radio", "Eletrical", 2, 0),
        ("Clean the motor", "Basic", 0, 0),
        ("Apply insulfilm", "Aesthetic", 5, 1),
        ("Repair Bodywork", "Aesthetic", 7, 0),
        ("Change battery", "Eletrical", 5, 0),
        ("Paint", "Aesthetic", 15, 1),
        ("Repair Control Panel", "Eletrical", 15, 0),
        ("Install Secret", "Mechanical", 7, 1),
        ("Calibrate Wheels", "Basic", 0, 1);
        
INSERT INTO skill (idWorker, Sname, Stype)
VALUES 	(1, "Basic Course", "Basic"),
		(2, "Basic Course", "Basic"),
        (3, "Basic Course", "Basic"),
        (4, "Basic Course", "Basic"),
        (5, "Basic Course", "Basic"),
        (6, "Basic Course", "Basic"),
        (7, "Basic Course", "Basic"),
        (8, "Basic Course", "Basic"),
        (2, "Advanced Degree to Every Vehicle", "Eletrical"),
        (2, "Advanced Degree to Every Vehicle", "Mechanical"),
        (5, "Advanced Degree to Every Vehicle", "Eletrical"),
        (5, "Advanced Degree to Every Vehicle", "Mechanical"),
        (7, "Advanced Degree to Every Vehicle", "Eletrical"),
        (7, "Advanced Degree to Every Vehicle", "Mechanical"),
        (6, "Advanced Degree to Every Vehicle", "Eletrical"),
        (6, "Advanced Degree to Every Vehicle", "Mechanical"),
        (6, "Leadership and Teamwork", "Other"),
        (7, "Human Resources", "Other"),
        (3, "How to make a beautiful vehicle", "Aesthetic"),
        (4, "Applying Advance Paints", "Aesthetic"),
        (2, "How to collaborate in a team", "Other");
        
INSERT INTO vehicle
VALUES	("SBP55E4", 3, NULL, "Car", "Golf GTI", 40000),
		("GAF21D5", 2, NULL, "Motorcycle", "Pop500", 12000),
        ("HBO36Q7", 1, "ABS55567789", "Bus", "Mercedez Benz", 250000),
        ("JJA74D2", 4, NULL, "Truck", "Volvo 6x2", 200000),
        ("KAZ10A1", 4, NULL, "Truck", "Volvo 6x2", 200000),
        ("BEN10B3", 4, "KAY7788899", "Truck", "Volvo 6x4", 270000),
        ("KKZ64Q2", 3, NULL, "Car", "Golf GTI", 40000),
		("FAL55Z9", 3, NULL, "Car", "Fox Fusion", 60000),
        ("WNY91L6", 3, NULL, "Car", "New Beatle", 50000), 
        ("FIM79Y8", 3, NULL, "Car", "Sandero 1.4", 47500), 
        ("HDI21D9", 3, NULL, "Car", "Palio 2023", 35000), 
        ("VGA89F4", 3, NULL, "Car", "Uno 2022 2.0", 63000), 
        ("SEN45A2", 3, NULL, "Car", "Fusca Raiz", 16000);
        
INSERT INTO team (idLeader)
VALUES (6), (7), (5);

INSERT INTO convocation (idWorker, idTeam, integration)
VALUES	(1, 1, STR_TO_DATE("30-03-2022", "%d-%m-%Y")),
		(2, 1, STR_TO_DATE("30-03-2022", "%d-%m-%Y")),
        (3, 1, STR_TO_DATE("30-03-2022", "%d-%m-%Y")),
        (6, 1, STR_TO_DATE("30-03-2022", "%d-%m-%Y")),
        (8, 2, STR_TO_DATE("30-03-2022", "%d-%m-%Y")),
        (7, 2, STR_TO_DATE("30-03-2022", "%d-%m-%Y")),
        (4, 2, STR_TO_DATE("30-03-2022", "%d-%m-%Y")),
        (5, 2, STR_TO_DATE("30-03-2022", "%d-%m-%Y"));

INSERT INTO convocation
VALUES	(5, 3, STR_TO_DATE("12-04-2022", "%d-%m-%Y"), STR_TO_DATE("20-04-2022", "%d-%m-%Y")),
        (1, 3, STR_TO_DATE("12-04-2022", "%d-%m-%Y"), STR_TO_DATE("20-04-2022", "%d-%m-%Y")),
		(8, 3, STR_TO_DATE("12-04-2022", "%d-%m-%Y"), STR_TO_DATE("20-04-2022", "%d-%m-%Y")),
		(3, 3, STR_TO_DATE("12-04-2022", "%d-%m-%Y"), STR_TO_DATE("20-04-2022", "%d-%m-%Y"));
        
INSERT INTO material (idSupplier, Mname, detail, price)
VALUES	(1, "Car Wheel", NULL, 150),
		(1, "Car Wheel", "Recycled", 100),
		(3, "Truck Wheel", "Aluminum", 400),
        (3, "Truck Wheel", "High Steel", 300),
        (1, "Motorcycle Wheel", NULL,  125),
        (2, "Orange Dye", "Matte", 75),
        (2, "Orange Dye", "Metallic", 75),
        (2, "Black Dye", NULL, 75),
        (2, "White Dye", NULL, 75),
        (2, "Blue Dye", "Metallic", 75),
        (2, "Green Dye", "Matte", 75),
        (1, "Car Steering Wheel", "Rubber Finish", 250),
        (1, "Car Steering Wheel", "Design optimized", 400),
        (3, "Truck Steering Wheel", "Rubber Finish", 600),
        (3, "Truck Steering Wheel", "Metallic Finish", 650),
		(3, "Truck Steering Wheel", "Rubber Designed Finish", 800),
        (1, "Radio", "FM/AM, CD & USB", 250),
        (1, "Radio Bluetooth", "FM/AM, CD, USB, HDMI & Bluetooth", 400),
        (1, "GPS", NULL, 400),
        (1, "GPS w/ Radio Integrate", NULL, 750);
        
INSERT INTO orders(idTeam, started, finishes, progress, license_plate, amount)
VALUES	(1, STR_TO_DATE("01-11-2022", "%d-%m-%Y"), STR_TO_DATE("07-11-2022", "%d-%m-%Y"), "Finished", "HBO36Q7", 8000),
		(2, STR_TO_DATE("01-11-2022", "%d-%m-%Y"), STR_TO_DATE("07-11-2022", "%d-%m-%Y"), "Finished", "FIM79Y8", 8500),
        (1, STR_TO_DATE("01-11-2022", "%d-%m-%Y"), STR_TO_DATE("07-11-2022", "%d-%m-%Y"), "Finished", "HDI21D9", 7100),
        (2, STR_TO_DATE("01-11-2022", "%d-%m-%Y"), STR_TO_DATE("12-11-2022", "%d-%m-%Y"), "Buying Materials", "BEN10B3", 15000),
        (1, STR_TO_DATE("01-11-2022", "%d-%m-%Y"), STR_TO_DATE("15-11-2022", "%d-%m-%Y"), "Buying Materials", "JJA74D2", 18000),
        (2, STR_TO_DATE("01-11-2022", "%d-%m-%Y"), STR_TO_DATE("01-11-2022", "%d-%m-%Y"), "Finished", "WNY91L6", 3500),
        (1, STR_TO_DATE("01-11-2022", "%d-%m-%Y"), STR_TO_DATE("01-11-2022", "%d-%m-%Y"), "Finished", "GAF21D5", 3200),
        (2, STR_TO_DATE("01-11-2022", "%d-%m-%Y"), STR_TO_DATE("01-11-2022", "%d-%m-%Y"), "Finished", "SBP55E4", 2000),
        (3, STR_TO_DATE("06-11-2022", "%d-%m-%Y"), STR_TO_DATE("22-11-2022", "%d-%m-%Y"), "Buying Materials", "GAF21D5", 9500),
        (3, STR_TO_DATE("06-11-2022", "%d-%m-%Y"), STR_TO_DATE("20-11-2022", "%d-%m-%Y"), "Buying Materials", "SEN45A2", 9200),
        (3, STR_TO_DATE("06-11-2022", "%d-%m-%Y"), STR_TO_DATE("22-11-2022", "%d-%m-%Y"), "Buying Materials", "VGA89F4", 12000);
        
INSERT INTO servicebyos
VALUES 	(1, 6, STR_TO_DATE("01-11-2022", "%d-%m-%Y"), STR_TO_DATE("07-11-2022", "%d-%m-%Y"), "Finished"),
		(2, 6, STR_TO_DATE("01-11-2022", "%d-%m-%Y"), STR_TO_DATE("07-11-2022", "%d-%m-%Y"), "Finished"),
        (3, 6, STR_TO_DATE("01-11-2022", "%d-%m-%Y"), STR_TO_DATE("07-11-2022", "%d-%m-%Y"), "Finished"),
        (4, 6, STR_TO_DATE("01-11-2022", "%d-%m-%Y"), STR_TO_DATE("07-11-2022", "%d-%m-%Y"), "Buying Materials"),
        (5, 2, STR_TO_DATE("01-11-2022", "%d-%m-%Y"), STR_TO_DATE("11-11-2022", "%d-%m-%Y"), "Finished"),
        (5, 6, STR_TO_DATE("11-11-2022", "%d-%m-%Y"), STR_TO_DATE("18-11-2022", "%d-%m-%Y"), "Buying Materials"),
        (6, 1, STR_TO_DATE("01-11-2022", "%d-%m-%Y"), STR_TO_DATE("01-11-2022", "%d-%m-%Y"), "Finished"),
        (6, 4, STR_TO_DATE("01-11-2022", "%d-%m-%Y"), STR_TO_DATE("01-11-2022", "%d-%m-%Y"), "Finished"),
        (7, 1, STR_TO_DATE("01-11-2022", "%d-%m-%Y"), STR_TO_DATE("01-11-2022", "%d-%m-%Y"), "Finished"),
        (8, 1, STR_TO_DATE("01-11-2022", "%d-%m-%Y"), STR_TO_DATE("01-11-2022", "%d-%m-%Y"), "Finished"),
		(9, 8, STR_TO_DATE("06-11-2022", "%d-%m-%Y"), STR_TO_DATE("22-11-2022", "%d-%m-%Y"), "Buying Materials"),
        (10, 10, STR_TO_DATE("06-11-2022", "%d-%m-%Y"), STR_TO_DATE("20-11-2022", "%d-%m-%Y"), "Buying Materials"),
        (10, 8, STR_TO_DATE("06-11-2022", "%d-%m-%Y"), STR_TO_DATE("20-11-2022", "%d-%m-%Y"), "Working"),
        (11, 9, STR_TO_DATE("06-11-2022", "%d-%m-%Y"), STR_TO_DATE("22-11-2022", "%d-%m-%Y"), "Working");
        
INSERT INTO necessity
VALUES	(5, 15, 1),
		(6, 1, 2),
        (7, 3, 2),
        (8, 2, 4),
        (9, 8, 1),
        (10, 6, 2);