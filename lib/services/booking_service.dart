import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/booking.dart';

class BookingService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Concurrency-safe booking using Firestore transactions
  /// Returns booking ID on success, throws specific error on conflict
  Future<String> bookSlot({
    required String userId,
    required String venueId,
    required String slotId,
    required String venueName,
    required DateTime startTime,
    required DateTime endTime,
  }) async {
    try {
      String? bookingId;
      
      // Use transaction for atomic operation - prevents double-booking
      await _firestore.runTransaction((transaction) async {
        final slotRef = _firestore.collection('slots').doc(slotId);
        final slotDoc = await transaction.get(slotRef);

        if (!slotDoc.exists) {
          throw 'Slot not found';
        }

        final isBooked = slotDoc['isBooked'] as bool;
        if (isBooked) {
          throw 'SLOT_ALREADY_BOOKED'; // Specific error for UI handling
        }

        // Create booking
        final bookingRef = _firestore.collection('bookings').doc();
        bookingId = bookingRef.id;

        transaction.set(bookingRef, {
          'userId': userId,
          'venueId': venueId,
          'slotId': slotId,
          'bookedAt': DateTime.now().toIso8601String(),
          'startTime': startTime.toIso8601String(),
          'endTime': endTime.toIso8601String(),
          'venueName': venueName,
        });

        // Mark slot as booked
        transaction.update(slotRef, {
          'isBooked': true,
          'bookedByUserId': userId,
        });
      });

      return bookingId!;
    } on FirebaseException catch (e) {
      if (e.message?.contains('SLOT_ALREADY_BOOKED') ?? false) {
        throw 'This slot was just booked. Please refresh and try another.';
      }
      throw 'Booking failed: ${e.message}';
    } catch (e) {
      if (e.toString().contains('SLOT_ALREADY_BOOKED')) {
        throw 'This slot was just booked. Please refresh and try another.';
      }
      throw 'Booking failed: $e';
    }
  }

  Future<List<Booking>> getUserBookings(String userId) async {
    try {
      final snapshot = await _firestore
          .collection('bookings')
          .where('userId', isEqualTo: userId)
          .orderBy('startTime', descending: true)
          .get();

      return snapshot.docs.map((doc) => Booking.fromMap({...doc.data(), 'id': doc.id})).toList();
    } catch (e) {
      throw 'Failed to fetch bookings: $e';
    }
  }

  Future<void> cancelBooking(String bookingId, String slotId) async {
    try {
      await _firestore.runTransaction((transaction) async {
        transaction.delete(_firestore.collection('bookings').doc(bookingId));
        transaction.update(
          _firestore.collection('slots').doc(slotId),
          {'isBooked': false, 'bookedByUserId': null},
        );
      });
    } catch (e) {
      throw 'Failed to cancel booking: $e';
    }
  }

  Stream<List<Booking>> getUserBookingsStream(String userId) {
    return _firestore
        .collection('bookings')
        .where('userId', isEqualTo: userId)
        .orderBy('startTime', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Booking.fromMap({...doc.data(), 'id': doc.id})).toList());
  }
}
