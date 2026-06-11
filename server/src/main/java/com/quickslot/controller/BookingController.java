package com.quickslot.controller;

import com.quickslot.model.Slot;
import com.quickslot.repository.SlotRepository;
import com.quickslot.service.BookingService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/bookings")
public class BookingController {
    private final BookingService bookingService;
    private final SlotRepository slotRepository;

    public BookingController(BookingService bookingService, SlotRepository slotRepository) {
        this.bookingService = bookingService;
        this.slotRepository = slotRepository;
    }

    @GetMapping("/user/{userId}")
    public ResponseEntity<?> listUserBookings(@PathVariable("userId") String userId) {
        List<Slot> bookings = slotRepository.findAll().stream()
                .filter(s -> userId.equals(s.getBookedByUserId()))
                .toList();
        return ResponseEntity.ok(bookings);
    }

    @DeleteMapping("/{slotId}")
    public ResponseEntity<?> cancelBooking(@PathVariable Long slotId,
                                           @RequestHeader(value = "X-User-Id", required = false) String userId,
                                           @org.springframework.web.bind.annotation.RequestBody(required = false) java.util.Map<String, Object> body) {
        try {
            String finalUserId = userId;
            if ((finalUserId == null || finalUserId.isEmpty()) && body != null && body.get("userId") != null) {
                finalUserId = body.get("userId").toString();
            }
            if (finalUserId == null || finalUserId.isEmpty()) {
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Missing user id");
            }

            // Load slot with lock
            Slot slot = slotRepository.findById(slotId).orElseThrow(() -> new IllegalArgumentException("Slot not found"));
            if (!slot.isBooked() || !finalUserId.equals(slot.getBookedByUserId())) {
                return ResponseEntity.status(HttpStatus.CONFLICT).body("No booking found for this user");
            }

            slot.setBooked(false);
            slot.setBookedByUserId(null);
            slotRepository.save(slot);

            return ResponseEntity.ok().build();
        } catch (IllegalArgumentException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        }
    }

    @PostMapping
    public ResponseEntity<?> book(@RequestParam(required = false) Long slotId,
                                  @RequestHeader(value = "X-User-Id", required = false) String userId,
                                  @org.springframework.web.bind.annotation.RequestBody(required = false) java.util.Map<String, Object> body) {
        try {
            // allow slotId in query param or body
            Long finalSlotId = slotId;
            if (finalSlotId == null && body != null && body.get("slotId") != null) {
                finalSlotId = Long.valueOf(body.get("slotId").toString());
            }

            // allow userId in header or body
            String finalUserId = userId;
            if ((finalUserId == null || finalUserId.isEmpty()) && body != null && body.get("userId") != null) {
                finalUserId = body.get("userId").toString();
            }

            if (finalSlotId == null) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("slotId is required");
            }
            if (finalUserId == null || finalUserId.isEmpty()) {
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Missing user id");
            }

            Slot booked = bookingService.bookSlot(finalSlotId, finalUserId);
            return ResponseEntity.ok(booked);
        } catch (IllegalStateException e) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body(e.getMessage());
        } catch (IllegalArgumentException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        }
    }
}
