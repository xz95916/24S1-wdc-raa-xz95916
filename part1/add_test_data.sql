-- Insert additional users
INSERT INTO Users (username, password, email, registration_date, location)
VALUES ('jane_doe', 'securepassword2', 'jane@example.com', '2024-02-20', 'Melbourne'),
       ('sam_smith', 'securepassword3', 'sam@example.com', '2024-03-10', 'Brisbane');

-- Insert additional hotels
INSERT INTO Hotels (hotel_name, location, description)
VALUES ('Beachside Hotel', 'Sydney', 'A beautiful beachside hotel.'),
       ('Mountain Retreat', 'Melbourne', 'A peaceful retreat in the mountains.'),
       ('City Central Hotel', 'Brisbane', 'A hotel located in the city center.');

-- Insert additional rooms
INSERT INTO Rooms (hotel_id, price_per_night, number_of_beds, description)
VALUES (1, 150.00, 2, 'A cozy room with a sea view.'),
       (2, 180.00, 2, 'A room with a mountain view.'),
       (2, 220.00, 3, 'A spacious room for a family.'),
       (3, 130.00, 2, 'A standard room with all amenities.'),
       (3, 250.00, 3, 'A deluxe room with city view.');

-- Insert additional facilities (if needed, assuming facilities table already has 'Gym', 'Pool', 'Laundry')
INSERT INTO Facilities (facility_name)
VALUES ('Spa'), ('Restaurant');

-- Insert additional room facilities
INSERT INTO RoomFacilities (room_id, facility_id)
VALUES (1, 3), (2, 1), (2, 4), (3, 2), (3, 5), (4, 3), (4, 5), (5, 2);

-- Insert additional bookings
INSERT INTO Bookings (user_id, room_id, booking_start_date, booking_end_date, number_of_people)
VALUES (2, 2, '2024-08-01', '2024-08-05', 2),
       (3, 4, '2024-09-10', '2024-09-15', 1),
       (1, 1, '2024-07-01', '2024-07-05', 2),
       (2, 3, '2024-07-15', '2024-07-20', 3),
       (3, 5, '2024-10-05', '2024-10-10', 2);

-- Insert additional reviews
INSERT INTO Reviews (user_id, hotel_id, room_id, booking_id, rating, text)
VALUES (2, 2, 2, 2, 4, 'Great view and service.'),
       (3, 3, 4, 3, 3, 'Standard experience, nothing special.'),
       (1, 1, 1, 1, 5, 'Fantastic stay with excellent service.'),
       (2, 2, 3, 4, 4, 'Loved the spacious room and amenities.'),
       (3, 3, 5, 5, 5, 'Amazing city view and comfortable stay.');