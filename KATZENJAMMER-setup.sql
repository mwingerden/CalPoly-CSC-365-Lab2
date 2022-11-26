-- Lab 2
-- mwingerd
-- Oct 5, 2022

--USE `mwingerd`;
--KATZENJAMMER
CREATE TABLE Albums (
    AId INTEGER NOT NULL,
    Title VARCHAR(100) NOT NULL,
    Year INTEGER NOT NULL,
    Label VARCHAR(50),
    Type VARCHAR(10),

    PRIMARY KEY (AId)
);

CREATE TABLE Band (
    Id INTEGER NOT NULL,
    Firstname VARCHAR(50) NOT NULL,
    Lastname VARCHAR(50) NOT NULL,

    PRIMARY KEY (Id)
);

CREATE TABLE Songs(
    SongId INTEGER NOT NULL,
    Title VARCHAR(100),

    PRIMARY KEY (SongId)
);

CREATE TABLE Instruments (
    SongId INTEGER NOT NULL,
    BandmateId INTEGER NOT NULL,
    Instrument VARCHAR(50) NOT NULL,

    UNIQUE(SongId, BandmateId, Instrument),
    FOREIGN KEY (SongId)
        REFERENCES Songs(SongId),
    FOREIGN KEY (BandmateId)
        REFERENCES Band(Id)
);

CREATE TABLE Performance (
    SongId INTEGER NOT NULL,
    Bandmate INTEGER NOT NULL,
    StagePosition VARCHAR(10) NOT NULL,

    UNIQUE(SongId, Bandmate),
    FOREIGN KEY (SongId)
        REFERENCES Songs(SongId),
    FOREIGN KEY (Bandmate)
        REFERENCES Band(Id)
);

CREATE TABLE Tracklists (
    AlbumId INTEGER NOT NULL,
    Position INTEGER NOT NULL,
    SongId INTEGER NOT NULL,

    FOREIGN KEY (AlbumId)
        REFERENCES Albums(AId),
    FOREIGN KEY (SongId)
        REFERENCES Songs(SongId)
);

CREATE TABLE Vocals (
    SongId INTEGER,
    Bandmate INTEGER,
    Type VARCHAR(10),

    FOREIGN KEY (SongId)
        REFERENCES Songs(SongId),
    FOREIGN KEY (Bandmate)
        REFERENCES Band(Id)
);