CREATE TABLE stations (
    number INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE personnel (
    number INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    station_number INT,
    FOREIGN KEY (station_number) REFERENCES stations(number)
    ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE doctors (
    personnel_number INT PRIMARY KEY,
    area VARCHAR(255) NOT NULL,
    rank VARCHAR(255) NOT NULL,
    FOREIGN KEY (personnel_number) REFERENCES personnel(number)
    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE caregivers (
    personnel_number INT PRIMARY KEY,
    qualification VARCHAR(255) NOT NULL,
    FOREIGN KEY (personnel_number) REFERENCES personnel(number)
    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE rooms (
    id INT PRIMARY KEY,
    number VARCHAR(50) NOT NULL,
    beds INT NOT NULL,
    station_number INT,
    FOREIGN KEY (station_number) REFERENCES stations(number)
    ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE patients (
    number INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    disease VARCHAR(255) NOT NULL,
    doctor_number INT,
    FOREIGN KEY (doctor_number) REFERENCES doctors(personnel_number)
    ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE admissions (
    id INT PRIMARY KEY,
    patient_number INT,
    room_id INT,
    "from" TIMESTAMP NOT NULL,
    "to" TIMESTAMP,
    FOREIGN KEY (patient_number) REFERENCES patients(number)
    ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (room_id) REFERENCES rooms(id)
    ON UPDATE CASCADE ON DELETE CASCADE
);
