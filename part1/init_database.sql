-- Create the database
CREATE DATABASE HotelBookingSystem;
USE HotelBookingSystem;

-- Create Users table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    registration_date DATE NOT NULL,
    location VARCHAR(100)
);

-- Create Hotels table
CREATE TABLE Hotels (
    hotel_id INT AUTO_INCREMENT PRIMARY KEY,
    hotel_name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    description TEXT
);

-- Create Rooms table
CREATE TABLE Rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    hotel_id INT,
    price_per_night DECIMAL(10, 2) NOT NULL,
    number_of_beds INT NOT NULL,
    description TEXT,
    FOREIGN KEY (hotel_id) REFERENCES Hotels(hotel_id)
);

-- Create Facilities table
CREATE TABLE Facilities (
    facility_id INT AUTO_INCREMENT PRIMARY KEY,
    facility_name VARCHAR(100) NOT NULL
);

-- Create RoomFacilities table
CREATE TABLE RoomFacilities (
    room_id INT,
    facility_id INT,
    PRIMARY KEY (room_id, facility_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id),
    FOREIGN KEY (facility_id) REFERENCES Facilities(facility_id)
);

-- Create Bookings table
CREATE TABLE Bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    room_id INT,
    booking_start_date DATE NOT NULL,
    booking_end_date DATE NOT NULL,
    number_of_people INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);

-- Create Reviews table
CREATE TABLE Reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    hotel_id INT,
    room_id INT,
    booking_id INT,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    text TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (hotel_id) REFERENCES Hotels(hotel_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

-- Insert test data into Users table
INSERT INTO Users (username, password, email, registration_date, location)
VALUES ('john_doe', 'securepassword', 'john@example.com', '2024-01-15', 'Sydney');

-- Insert test data into Hotels table
INSERT INTO Hotels (hotel_name, location, description)
VALUES ('Grand Hotel', 'Sydney', 'A luxurious hotel in the heart of the city.');

-- Insert test data into Rooms table
INSERT INTO Rooms (hotel_id, price_per_night, number_of_beds, description)
VALUES (1, 200.00, 2, 'A spacious room with a great view.');

-- Insert test data into Facilities table
INSERT INTO Facilities (facility_name)
VALUES ('Gym'), ('Pool'), ('Laundry');

-- Insert test data into RoomFacilities table
INSERT INTO RoomFacilities (room_id, facility_id)
VALUES (1, 1), (1, 2);

-- Insert test data into Bookings table
INSERT INTO Bookings (user_id, room_id, booking_start_date, booking_end_date, number_of_people)
VALUES (1, 1, '2024-07-24', '2024-07-28', 2);

-- Insert test data into Reviews table
INSERT INTO Reviews (user_id, hotel_id, room_id, booking_id, rating, text)
VALUES (1, 1, 1, 1, 5, 'Amazing stay with excellent service.');