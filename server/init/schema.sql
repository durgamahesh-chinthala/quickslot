-- Schema for Quickslot
CREATE DATABASE IF NOT EXISTS quickslot;
USE quickslot;

CREATE TABLE IF NOT EXISTS users (
  id VARCHAR(100) PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS venues (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  location VARCHAR(255),
  rating DOUBLE
);

CREATE TABLE IF NOT EXISTS slots (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  venue_id BIGINT NOT NULL,
  start_time DATETIME NOT NULL,
  end_time DATETIME NOT NULL,
  is_booked BOOLEAN DEFAULT FALSE,
  booked_by_user_id VARCHAR(100),
  CONSTRAINT uq_venue_start UNIQUE (venue_id, start_time),
  CONSTRAINT fk_slot_venue FOREIGN KEY (venue_id) REFERENCES venues(id) ON DELETE CASCADE,
  CONSTRAINT fk_slot_user FOREIGN KEY (booked_by_user_id) REFERENCES users(id) ON DELETE SET NULL
);
