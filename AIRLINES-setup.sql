-- Lab 2
-- mwingerd
-- Oct 5, 2022

--USE `mwingerd`;
-- AIRLINES
CREATE TABLE airlines (
    Id INTEGER NOT NULL,
    Airline VARCHAR(50) NOT NULL,
    Abbreviation VARCHAR(50) NOT NULL,
    Country VARCHAR(50) NOT NULL,

    PRIMARY KEY (Id),
    UNIQUE (Abbreviation, Country)
);

CREATE TABLE airports (
    City VARCHAR(100) NOT NULL,
    AirportCode CHAR(3) NOT NULL,
    AirportName VARCHAR(100) NOT NULL,
    Country VARCHAR(100) NOT NULL,
    CountryAbbrev VARCHAR(10) NOT NULL,

    PRIMARY KEY (AirportCode)
);

CREATE TABLE flights (
    Airline INTEGER NOT NULL,
    FlightNo INTEGER NOT NULL,
    SourceAirport CHAR(3) NOT NULL,
    DestAirport CHAR(3) NOT NULL,

    UNIQUE (Airline, FlightNo),
    FOREIGN KEY (Airline)
        REFERENCES airlines(Id),
    FOREIGN KEY (SourceAirport)
        REFERENCES airports(AirportCode),
    FOREIGN KEY (DestAirport)
        REFERENCES airports(AirportCode)

);