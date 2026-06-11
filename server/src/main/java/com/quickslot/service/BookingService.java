package com.quickslot.service;

import com.quickslot.model.Slot;
import com.quickslot.repository.SlotRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
public class BookingService {
    private final SlotRepository slotRepository;

    public BookingService(SlotRepository slotRepository) {
        this.slotRepository = slotRepository;
    }

    @Transactional
    public Slot bookSlot(Long slotId, String userId) {
        Optional<Slot> opt = slotRepository.findByIdForUpdate(slotId);
        Slot slot = opt.orElseThrow(() -> new IllegalArgumentException("Slot not found"));
        if (slot.isBooked()) {
            throw new IllegalStateException("Slot already booked");
        }
        slot.setBooked(true);
        slot.setBookedByUserId(userId);
        return slotRepository.save(slot);
    }
}
