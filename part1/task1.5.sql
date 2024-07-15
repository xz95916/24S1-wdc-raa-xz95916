-- Assuming the current user's location is stored in a variable
SET @current_user_location = 'Sydney';

-- Query to retrieve detailed information of all 2-bed rooms in the same suburb as the current user, ordered from cheapest to most expensive
SELECT r.room_id, h.hotel_name, h.location, r.price_per_night, r.number_of_beds, r.description
FROM Rooms r
JOIN Hotels h ON r.hotel_id = h.hotel_id
WHERE r.number_of_beds = 2
  AND h.location = @current_user_location
ORDER BY r.price_per_night ASC;