-- Lab 2
-- mwingerd
-- Oct 5, 2022

--USE `mwingerd`;
--CUSTOM
CREATE TABLE persons (
    PassangerId INTEGER NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Sex VARCHAR(10) NOT NULL,
    Age INTEGER,

    PRIMARY KEY (PassangerId),
    UNIQUE(PassangerId, Name, Sex, Age)
);

CREATE TABLE survives (
    PassangerId INTEGER NOT NULL,
    Survived INTEGER NOT NULL,

    PRIMARY KEY (PassangerId),
    FOREIGN KEY (PassangerId)
        REFERENCES persons(PassangerId),
    UNIQUE(PassangerId, Survived)
);

CREATE TABLE tickets (
    TicketId INTEGER NOT NULL,
    Ticket VARCHAR(50) NOT NULL,
    Fare DECIMAL(18,5) NOT NULL,

    PRIMARY KEY (TicketId),
    FOREIGN KEY (TicketId)
        REFERENCES persons(PassangerId)
);