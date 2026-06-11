Spring Boot + MySQL Implementation Plan (copy-paste ready)

Overview
- Small Spring Boot app (Maven) in `server/` that exposes REST endpoints for venues, slots, bookings and users.
- MySQL for persistence; Docker Compose provided for reproducible environment and seeding.
- Booking is concurrency-safe via a DB transaction using SELECT ... FOR UPDATE and updating slot.booked flag.
- Lightweight header auth: `X-User-Id` required for endpoints that change state.

Project layout (server/)
- src/main/java/com/quickslot/
  - QuickslotApplication.java
  - config/
    - DataSourceConfig.java (optional)
  - controller/
    - VenueController.java
    - BookingController.java
    - UserController.java (for user bookings)
  - service/
    - VenueService.java
    - BookingService.java
    - UserService.java
  - repository/
    - VenueRepository.java
    - SlotRepository.java
    - BookingRepository.java
    - UserRepository.java
  - model/
    - Venue.java
    - Slot.java
    - Booking.java
    - User.java
  - dto/ (simple request/response DTOs)

Key design details
- `slots` table stores slots with `start_time`, `end_time`, `venue_id`, and `is_booked` boolean.
- `bookings` table stores bookings; includes `slot_id`, `user_id`, `created_at`.
- Booking endpoint (POST /bookings) logic (transactional):
  1. Validate user exists (X-User-Id header)
  2. Begin transaction
  3. SELECT * FROM slots WHERE id = ? FOR UPDATE
  4. If slot.is_booked -> rollback & return 409
  5. INSERT INTO bookings(...)
  6. UPDATE slots SET is_booked = 1, booked_by_user_id = ? WHERE id = ?
  7. Commit -> return 201 with booking

Alternative concurrency option
- Add UNIQUE constraint on bookings(slot_id) and attempt to INSERT booking; on duplicate key return 409.
  - This is simpler but then you must also update slot.is_booked in a subsequent transaction or derive availability from bookings.

SQL Schema (MySQL)
```sql
CREATE TABLE users (
  id VARCHAR(64) PRIMARY KEY,
  name VARCHAR(128) NOT NULL
);

CREATE TABLE venues (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  location VARCHAR(255),
  rating DECIMAL(3,2)
);

CREATE TABLE slots (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  venue_id BIGINT NOT NULL,
  start_time DATETIME NOT NULL,
  end_time DATETIME NOT NULL,
  is_booked TINYINT(1) NOT NULL DEFAULT 0,
  booked_by_user_id VARCHAR(64),
  FOREIGN KEY (venue_id) REFERENCES venues(id),
  FOREIGN KEY (booked_by_user_id) REFERENCES users(id),
  UNIQUE KEY venue_time_unique (venue_id, start_time)
);

CREATE TABLE bookings (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  slot_id BIGINT NOT NULL,
  venue_id BIGINT NOT NULL,
  user_id VARCHAR(64) NOT NULL,
  start_time DATETIME NOT NULL,
  end_time DATETIME NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (slot_id) REFERENCES slots(id) ON DELETE CASCADE,
  FOREIGN KEY (venue_id) REFERENCES venues(id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  UNIQUE KEY slot_booking_unique (slot_id)
);
```

Seed data SQL (3 venues, slots 6AM-10PM for next 7 days)
```sql
-- Users
INSERT INTO users (id, name) VALUES ('user1', 'Alice'), ('user2', 'Bob'), ('user3', 'Charlie');

-- Venues
INSERT INTO venues (name, location, rating) VALUES
('Court A', 'Downtown', 4.5),
('Court B', 'Uptown', 4.2),
('Court C', 'Midtown', 4.7);

-- Generate slots (example for 1 venue and 1 day; script recommended)
-- Example: for venue id 1, date '2026-06-11'
INSERT INTO slots (venue_id, start_time, end_time) VALUES
(1, '2026-06-11 06:00:00', '2026-06-11 07:00:00'),
(1, '2026-06-11 07:00:00', '2026-06-11 08:00:00');
-- Recommend writing a small SQL or Java runner to generate for 7 days and 6AM-22PM for each venue
```

REST API endpoints
- GET /venues
  - returns [{id, name, location, rating}]

- GET /venues/{id}/slots?date=YYYY-MM-DD
  - returns [{slotId, startTime, endTime, isBooked}]

- POST /bookings
  - Headers: X-User-Id
  - Body: {slotId, venueId}
  - Responses: 201 (booking created), 409 (slot already booked), 400 (invalid)

- GET /users/{id}/bookings
  - returns user's bookings

- DELETE /bookings/{id}
  - Headers: X-User-Id (must match booking.user_id or admin)
  - Cancels booking and marks slot.is_booked = 0

Controller/service pointers
- BookingService.bookSlot(userId, slotId): annotated with @Transactional
  - Use SlotRepository.findByIdForUpdate(slotId) — implement using native query `SELECT * FROM slots WHERE id = ? FOR UPDATE`
  - Throw custom SlotAlreadyBookedException

Testing concurrency locally
- Use a small script or curl parallel requests to POST /bookings for same slot; only one should succeed (201), others 409.

Integration with Flutter
- Set `BASE_URL` in `lib/config.dart` and call backend endpoints. Replace Firestore booking calls with POST /bookings and handle 409 to show "This slot was just booked." message.

Commands: quick start (dev)
```bash
# from server/
# build and run with Maven
./mvnw spring-boot:run
# or with Docker compose (if you add Dockerfile + compose)
docker compose up -d
# seed DB
mysql -u root -p quickslot < seed.sql
```

Notes & tradeoffs
- Using MySQL + FOR UPDATE is robust and explicit. The unique constraint on `slot_id` in bookings offers an extra guard.
- Keep logic server-side; judges can hit DB directly to attempt writes — the DB constraints + transaction will enforce rules.

If you want, I can now scaffold the full `server/` project (A) or produce a single-file Spring Boot example with controllers and repositories you can paste into a new Spring Initializr project (B1). Which would you prefer?