CREATE DATABASE IF NOT EXISTS workshop;
USE workshop;

CREATE TABLE IF NOT EXISTS client (
	idClient INT AUTO_INCREMENT PRIMARY KEY,
    Cname VARCHAR (15),
    Csurname VARCHAR (45),
    document VARCHAR(15) NOT NULL,
    email VARCHAR (50),
    phone VARCHAR(11) NOT NULL,
    adress VARCHAR(255),
    CONSTRAINT uniq_document UNIQUE (document));

CREATE TABLE IF NOT EXISTS worker (
	idWorker INT AUTO_INCREMENT PRIMARY KEY,
    Wname VARCHAR (15) NOT NULL,
    Wsurname VARCHAR (45),
    document VARCHAR(15) NOT NULL,
    phone VARCHAR(11) NOT NULL,
    adress VARCHAR (255),
    daily_cost FLOAT NOT NULL,
    CONSTRAINT uniq_worker_doc UNIQUE (document));

CREATE TABLE IF NOT EXISTS supplier (
	idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    Sname VARCHAR (45),
    document CHAR(15) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(11),
    adress VARCHAR(255),
    CONSTRAINT uniq_supplierdoc UNIQUE (document));

CREATE TABLE IF NOT EXISTS service (
	idService INT AUTO_INCREMENT PRIMARY KEY,
    Scname VARCHAR (25),
    category ENUM("Eletrical", "Mechanical", "Review", "Aesthetic", "Total Loss", "Basic", "Complex"),
    days_estimated INT NOT NULL,
    needs_license BOOL DEFAULT false);
    
CREATE TABLE IF NOT EXISTS skill (
	idSkill INT AUTO_INCREMENT,
    idWorker INT,
    Sname VARCHAR (45),
    Stype ENUM("Eletrical", "Mechanical", "Review", "Aesthetic", "Total Loss", "Basic", "Complex", "Other") NOT NULL,
    PRIMARY KEY (idSkill, idWorker),
    CONSTRAINT fk_worker_skill FOREIGN KEY (idWorker) REFERENCES worker(idWorker));
    
CREATE TABLE IF NOT EXISTS vehicle (
	license_plate CHAR(7) NOT NULL,
    idClient INT NOT NULL,
    license CHAR(11),
    category ENUM ("Motorcycle", "Truck", "Pickup Truck", "Bus", "Van", "Motorhome", "Car", "SUV") NOT NULL,
    model VARCHAR(45) NOT NULL,
    price FLOAT NOT NULL,
    CONSTRAINT uniq_licplate UNIQUE (license_plate),
    CONSTRAINT uniq_license UNIQUE (license),
    CONSTRAINT fk_vehicleowner FOREIGN KEY (idClient) REFERENCES client(idClient));
    
CREATE TABLE IF NOT EXISTS team (
	idTeam INT AUTO_INCREMENT PRIMARY KEY,
    idLeader INT,
    creation DATE,
    CONSTRAINT fk_teamleader FOREIGN KEY (idLeader) REFERENCES worker(idWorker));
    
CREATE TABLE IF NOT EXISTS convocation (
	idWorker INT,
    idTeam INT,
    integration DATE,
    validity DATE,
    CONSTRAINT fk_workerconvocated FOREIGN KEY (idWorker) REFERENCES worker(idWorker),
    CONSTRAINT fk_teamconvocate FOREIGN KEY (idTeam) REFERENCES team(idTeam));
    
CREATE TABLE IF NOT EXISTS material (
	idMaterial INT AUTO_INCREMENT,
    idSupplier INT,
    Mname VARCHAR (45) NOT NULL,
    detail VARCHAR (150),
    price FLOAT NOT NULL,
    PRIMARY KEY (idMaterial, idSupplier),
    CONSTRAINT fk_supplierofmaterial FOREIGN KEY (idSupplier) REFERENCES supplier(idSupplier));
    
CREATE TABLE IF NOT EXISTS orders (
	idOrder INT AUTO_INCREMENT,
    idTeam INT,
    started DATE NOT NULL,
    finishes DATE,
    progress ENUM("Waiting Analysis", "Choosing Team", "Buying Materials", "Working", "Finished") DEFAULT "Waiting Analysis",
    license_plate CHAR(7),
    revenue FLOAT,
    PRIMARY KEY (idOrder, license_plate, idTeam),
    CONSTRAINT fk_orderteam FOREIGN KEY (idTeam) REFERENCES team(idTeam),
    CONSTRAINT fk_vehicleorder FOREIGN KEY (license_plate) REFERENCES vehicle(license_plate));

CREATE TABLE IF NOT EXISTS servicebyos(
	idOS INT,
    idService INT,
    started DATE NOT NULL,
    end_prevision DATE,
    progress ENUM("Buying Materials", "Working", "Finished") DEFAULT "Buying Materials",
    CONSTRAINT fk_what_os FOREIGN KEY (idOS) REFERENCES orders(idOrder),
    CONSTRAINT fk_whatservice FOREIGN KEY (idService) REFERENCES service(idService));

CREATE TABLE IF NOT EXISTS necessity (
	idOS INT,
    idMaterial INT,
    quantity INT NOT NULL,
    PRIMARY KEY (idOS, idMaterial),
    CONSTRAINT fk_whoneeds FOREIGN KEY (idOS) REFERENCES orders(idOrder),
    CONSTRAINT fk_whatneeds FOREIGN KEY (idMaterial) REFERENCES material(idMaterial));
    
