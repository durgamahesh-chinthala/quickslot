import 'package:flutter/material.dart';
import '../models/slot.dart';
import '../models/booking.dart';
import '../services/slot_service.dart';
import '../services/booking_service.dart';

class BookingProvider extends ChangeNotifier {
  final SlotService _slotService = SlotService();
  final BookingService _bookingService = BookingService();

  List<Slot> _currentSlots = [];
  List<Booking> _userBookings = [];
  bool _isLoadingSlots = false;
  bool _isLoadingBookings = false;
  bool _isBooking = false;
  String? _error;
  String? _bookingError;

  // Getters
  List<Slot> get currentSlots => _currentSlots;
  List<Booking> get userBookings => _userBookings;
  bool get isLoadingSlots => _isLoadingSlots;
  bool get isLoadingBookings => _isLoadingBookings;
  bool get isBooking => _isBooking;
  String? get error => _error;
  String? get bookingError => _bookingError;

  Future<void> loadSlots(String venueId, DateTime date) async {
    _isLoadingSlots = true;
    _error = null;
    notifyListeners();

    try {
      await _slotService.seedSlotsForVenue(venueId);
      _currentSlots = await _slotService.getSlotsByVenueAndDate(venueId, date);
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoadingSlots = false;
      notifyListeners();
    }
  }

  Future<bool> bookSlot({
    required String userId,
    required String venueId,
    required String slotId,
    required String venueName,
    required DateTime startTime,
    required DateTime endTime,
  }) async {
    _isBooking = true;
    _bookingError = null;
    notifyListeners();

    try {
      await _bookingService.bookSlot(
        userId: userId,
        venueId: venueId,
        slotId: slotId,
        venueName: venueName,
        startTime: startTime,
        endTime: endTime,
      );

      // Update local slots list
      final slotIndex = _currentSlots.indexWhere((s) => s.id == slotId);
      if (slotIndex >= 0) {
        _currentSlots[slotIndex] = Slot(
          id: _currentSlots[slotIndex].id,
          venueId: _currentSlots[slotIndex].venueId,
          startTime: _currentSlots[slotIndex].startTime,
          endTime: _currentSlots[slotIndex].endTime,
          isBooked: true,
          bookedByUserId: userId,
        );
      }

      _bookingError = null;
      return true;
    } catch (e) {
      _bookingError = e.toString();
      return false;
    } finally {
      _isBooking = false;
      notifyListeners();
    }
  }

  Future<void> loadUserBookings(String userId) async {
    _isLoadingBookings = true;
    _error = null;
    notifyListeners();

    try {
      _userBookings = await _bookingService.getUserBookings(userId);
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoadingBookings = false;
      notifyListeners();
    }
  }

  Future<void> cancelBooking(String bookingId, String slotId) async {
    try {
      await _bookingService.cancelBooking(bookingId, slotId);
      _userBookings.removeWhere((b) => b.id == bookingId);
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  void clearBookingError() {
    _bookingError = null;
    notifyListeners();
  }
}
