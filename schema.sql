# Dimension Tables

CREATE TABLE CustomerDim (
    CustomerID INTEGER PRIMARY KEY,
    Name TEXT,
    Location TEXT,
    Age INTEGER,
    Gender TEXT
);

CREATE TABLE ProductDim (
    ProductID INTEGER PRIMARY KEY,
    ProductName TEXT,
    Category TEXT,
    UnitPrice REAL
);

CREATE TABLE TimeDim (
    TimeID INTEGER PRIMARY KEY,
    Date TEXT,
    Month INTEGER,
    Quarter INTEGER,
    Year INTEGER
);

-- Fact Table

CREATE TABLE SalesFact (
    SaleID INTEGER PRIMARY KEY,
    CustomerID INTEGER,
    ProductID INTEGER,
    TimeID INTEGER,
    Quantity INTEGER,
    SalesAmount REAL,
    FOREIGN KEY (CustomerID) REFERENCES CustomerDim(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES ProductDim(ProductID),
    FOREIGN KEY (TimeID) REFERENCES TimeDim(TimeID)
);
