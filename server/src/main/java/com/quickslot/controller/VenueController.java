package com.quickslot.controller;

import com.quickslot.model.Venue;
import com.quickslot.repository.VenueRepository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/venues")
public class VenueController {
    private final VenueRepository venueRepository;

    public VenueController(VenueRepository venueRepository) {
        this.venueRepository = venueRepository;
    }

    @GetMapping
    public List<Venue> list() {
        return venueRepository.findAll();
    }

    @GetMapping("/{id}")
    public Venue get(@PathVariable Long id) {
        return venueRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Not found"));
    }
}
