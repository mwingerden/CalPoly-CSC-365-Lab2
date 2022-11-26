-- Lab 2
-- mwingerd
-- Oct 5, 2022

--USE `mwingerd`;
--BAKERY
CREATE TABLE customers (
    CId INTEGER NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    FirstName VARCHAR(50) NOT NULL,

    PRIMARY KEY (CId)
);

CREATE TABLE goods (
    GId VARCHAR(20) NOT NULL,
    Flavor VARCHAR(50) NOT NULL,
    Food VARCHAR(50) NOT NULL,
    Price DECIMAL(18,2) NOT NULL,

    PRIMARY KEY (GId),
    UNIQUE(Flavor, Food)
);

CREATE TABLE receipts (
    RNumber INTEGER NOT NULL,
    SaleDate DATE NOT NULL,
    Customer INTEGER NOT NULL,

    PRIMARY KEY (RNumber),
    FOREIGN KEY (Customer)
        REFERENCES customers(CId)
);

CREATE TABLE items (
    Receipt INTEGER NOT NULL,
    Ordinal INTEGER NOT NULL,
    Item VARCHAR(20) NOT NULL,

    FOREIGN KEY (Item)
        REFERENCES goods(GId),
    FOREIGN KEY (Receipt)
        REFERENCES receipts(RNumber),
    UNIQUE(Receipt, Ordinal, Item)
);