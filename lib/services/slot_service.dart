import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/slot.dart';

class SlotService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Slot>> getSlotsByVenueAndDate(
    String venueId,
    DateTime date,
  ) async {
    try {
      final startOfDay = DateTime(date.year, date.month, date.day);
      final endOfDay = DateTime(date.year, date.month, date.day, 23, 59, 59);

      final snapshot = await _firestore
          .collection('slots')
          .where('venueId', isEqualTo: venueId)
          .where(
            'startTime',
            isGreaterThanOrEqualTo: startOfDay.toIso8601String(),
          )
          .where('startTime', isLessThanOrEqualTo: endOfDay.toIso8601String())
          .orderBy('startTime')
          .get();

      return snapshot.docs
          .map((doc) => Slot.fromMap({...doc.data(), 'id': doc.id}))
          .toList();
    } catch (e) {
      throw 'Failed to fetch slots: $e';
    }
  }

  Future<void> seedSlotsForVenue(String venueId) async {
    try {
      final existingSlots = await _firestore
          .collection('slots')
          .where('venueId', isEqualTo: venueId)
          .limit(1)
          .get();

      if (existingSlots.docs.isNotEmpty) return; // Already seeded

      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);

      for (int day = 0; day < 7; day++) {
        final slotDate = today.add(Duration(days: day));

        for (int hour = 6; hour < 22; hour++) {
          final startTime = DateTime(
            slotDate.year,
            slotDate.month,
            slotDate.day,
            hour,
          );
          final endTime = startTime.add(const Duration(hours: 1));

          await _firestore.collection('slots').add({
            'venueId': venueId,
            'startTime': startTime.toIso8601String(),
            'endTime': endTime.toIso8601String(),
            'isBooked': false,
            'bookedByUserId': null,
          });
        }
      }
    } catch (e) {
      throw 'Failed to seed slots: $e';
    }
  }

  Future<Slot?> getSlot(String slotId) async {
    try {
      final doc = await _firestore.collection('slots').doc(slotId).get();
      if (doc.exists) {
        return Slot.fromMap({...doc.data()!, 'id': doc.id});
      }
      return null;
    } catch (e) {
      throw 'Failed to fetch slot: $e';
    }
  }
}
