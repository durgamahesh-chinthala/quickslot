-- Seed data for quickslot

INSERT INTO users (id, name) VALUES ('user-1', 'Demo User');
INSERT INTO users (id, name) VALUES ('user-2', 'Alice');
INSERT INTO users (id, name) VALUES ('user-3', 'Bob');

INSERT INTO venues (id, name, location, rating) VALUES (1, 'City Sports Center', 'Downtown', 4.5);
INSERT INTO venues (id, name, location, rating) VALUES (2, 'Lakeside Courts', 'Lakeside', 4.2);

-- Create slots for two venues for the next day (09:00-10:00 and 10:00-11:00)
INSERT INTO slots (venue_id, start_time, end_time, is_booked) VALUES (1, DATE_ADD(DATE_ADD(NOW(), INTERVAL 1 DAY), INTERVAL 9 HOUR), DATE_ADD(DATE_ADD(NOW(), INTERVAL 1 DAY), INTERVAL 10 HOUR), false);
INSERT INTO slots (venue_id, start_time, end_time, is_booked) VALUES (1, DATE_ADD(DATE_ADD(NOW(), INTERVAL 1 DAY), INTERVAL 10 HOUR), DATE_ADD(DATE_ADD(NOW(), INTERVAL 1 DAY), INTERVAL 11 HOUR), false);
INSERT INTO slots (venue_id, start_time, end_time, is_booked) VALUES (2, DATE_ADD(DATE_ADD(NOW(), INTERVAL 1 DAY), INTERVAL 9 HOUR), DATE_ADD(DATE_ADD(NOW(), INTERVAL 1 DAY), INTERVAL 10 HOUR), false);
INSERT INTO slots (venue_id, start_time, end_time, is_booked) VALUES (2, DATE_ADD(DATE_ADD(NOW(), INTERVAL 1 DAY), INTERVAL 10 HOUR), DATE_ADD(DATE_ADD(NOW(), INTERVAL 1 DAY), INTERVAL 11 HOUR), false);

-- Note: The JPA layer will create the tables automatically; this seed file assumes tables exist.
