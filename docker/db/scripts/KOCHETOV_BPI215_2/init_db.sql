CREATE TABLE regions (
    name VARCHAR(255) PRIMARY KEY
);

CREATE TABLE cities (
    name VARCHAR(255) PRIMARY KEY,
    region_name VARCHAR(255),
    FOREIGN KEY (region_name) REFERENCES regions (name)
    ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE stations (
    name VARCHAR(255) PRIMARY KEY,
    tracks INT NOT NULL,
    city VARCHAR(255),
    FOREIGN KEY (city) REFERENCES cities(name)
    ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE trains (
    number VARCHAR(255) PRIMARY KEY,
    length INT NOT NULL
);

CREATE TABLE station_trains (
    station_name VARCHAR(255),
    train_number VARCHAR(255),
    PRIMARY KEY (station_name, train_number),
    FOREIGN KEY (station_name) REFERENCES stations(name)
    ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (train_number) REFERENCES trains(number)
    ON UPDATE CASCADE ON DELETE CASCADE
);
