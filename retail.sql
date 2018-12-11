drop DATABASE IF EXISTS grocery;



CREATE DATABASE  grocery;


use grocery;
-- the regions within the entire company

CREATE TABLE region ( 
    regionID VARCHAR(20) NOT NULL, 
    numOfStores int NOT NULL, 
    regionManager VARCHAR(50),

    PRIMARY KEY (regionID)
 
);

INSERT INTO region VALUES
('R1', '100', 'Bob Jackson'),
('R2', '76', 'Sean Doody'),
('R3', '45', 'Rachel Schneider'),
('R4', '80', 'Bobby Oakes');
-- the distrcts within each region

CREATE TABLE district ( 
    districtID VARCHAR(20) NOT NULL,
    districtManager VARCHAR(50) NOT NULL, 
    region VARCHAR(20) NOT NULL,
    numOfStores int NOT NULL,

    PRIMARY KEY (districtID), 
    FOREIGN KEY (region) REFERENCES region(regionID)
 
);

INSERT INTO district VALUES 

('D1', 'Mike Baiker', 'R1', '25'),
('D2', 'Nick Medel', 'R2','34'),
('D3', 'Connor Burns', 'R3', '43'),
('D4', 'Michele Recupido', 'R3', '20'),
('D5', 'Bob Doody', 'R4', '20'),
('D6', 'Brenden Castro', 'R4', '20');

-- stores within each district 

CREATE TABLE store ( 
    storeID VARCHAR(20) NOT NULL,
    storeLocation VARCHAR(25) NOT NULL, 
    totalEmployee int NOT NULL, 
    districtID VARCHAR(25) NOT NULL, 
    phoneNumber int,

    PRIMARY KEY (storeID), 
    FOREIGN KEY (districtID) REFERENCES district(districtID)
);

INSERT INTO store  VALUES 

('S237', 'Colorado', '45', 'D1','708-324-6545'),
('S238', 'Colorado', '45', 'D1' ,'708-324-6342'),
('S239', 'Colorado', '45', 'D1', '708-432-6545'),
('S437', 'Kansas', '45', 'D2' ,'783-324-6545'),
('S100', 'Califorina', '45', 'D3','708-324-9845'),
('S82', 'Illinois', '45', 'D5','708-444-6545'),
('S34', 'New York', '45', 'D5','708-324-6445'),
('S300', 'Texas', '45', 'D6','708-324-6555');


-- deparments within each store 

CREATE TABLE department ( 
    departmentID VARCHAR(20) NOT NULL,
    numOfEmployee VARCHAR(25) NOT NULL, 
    depName VARCHAR(25) NOT NULL, 
    storeID VARCHAR(20) NOT NULL,

    PRIMARY KEY (departmentID),
    FOREIGN KEY (storeID) REFERENCES store(storeID)
 
);

INSERT INTO department VALUES 

('D23', '10', 'Dairy', 'S237'),
('F23', '5', 'Floral', 'S237'),
('G23', '38', 'Grocery', 'S237'),
('FR23', '8', 'Frozen', 'S237'),
('P23', '20', 'Pharmacy', 'S237'),
('E23', '28', 'Front End', 'S237');

-- table for the employees

CREATE TABLE employee ( 
    EmployeeID VARCHAR(20) NOT NULL,
    Fname VARCHAR(25) NULL, 
    Lname VARCHAR(25) NULL, 
    DepartmentID VARCHAR(25) NULL, 
    phoneNum VARCHAR(20) NULL,

    PRIMARY KEY (employeeID), 
    FOREIGN KEY (departmentID) REFERENCES department(departmentID)
 
);

INSERT INTO employee VALUES 

('43234', 'Jay', 'Thomas', 'D23', '707-123-4567'),
('35623', 'Robert', 'Rodregez', 'G23','707-321-4543'),
('47546', 'Ryan', 'Mandel', 'E23' , '707-214-4567'),
('73454', 'Sean', 'Bose','FR23', '707-333-4567'),
('46532', 'Eric', 'Sprite', 'F23', '707-111-4567'),
('465212', 'Eric', 'Doody', 'F23', '707-111-4567');



-- tables for the store within each district 


