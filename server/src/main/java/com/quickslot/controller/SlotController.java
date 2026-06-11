package com.quickslot.controller;

import com.quickslot.model.Slot;
import com.quickslot.repository.SlotRepository;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

@RestController
@RequestMapping("/api/venues")
public class SlotController {
    private final SlotRepository slotRepository;

    public SlotController(SlotRepository slotRepository) {
        this.slotRepository = slotRepository;
    }

    @GetMapping("/{venueId}/slots")
    public List<Slot> listSlots(
            @PathVariable Long venueId,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate date) {
        LocalDate d = date == null ? LocalDate.now() : date;
        LocalDateTime start = LocalDateTime.of(d, LocalTime.MIN);
        LocalDateTime end = LocalDateTime.of(d, LocalTime.MAX);
        return slotRepository.findByVenueIdAndStartTimeBetween(venueId, start, end);
    }
}
