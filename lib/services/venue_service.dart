import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/venue.dart';

class VenueService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Venue>> getVenues() async {
    try {
      final snapshot = await _firestore.collection('venues').get();
      return snapshot.docs
          .map((doc) => Venue.fromMap({...doc.data(), 'id': doc.id}))
          .toList();
    } catch (e) {
      throw 'Failed to fetch venues: $e';
    }
  }

  Future<Venue?> getVenue(String venueId) async {
    try {
      final doc = await _firestore.collection('venues').doc(venueId).get();
      if (doc.exists) {
        return Venue.fromMap({...doc.data()!, 'id': doc.id});
      }
      return null;
    } catch (e) {
      throw 'Failed to fetch venue: $e';
    }
  }

  Future<void> seedVenues() async {
    try {
      final venues = await _firestore.collection('venues').get();
      if (venues.docs.isNotEmpty) return; // Already seeded

      final List<Map<String, dynamic>> venuesList = [
        {
          'name': 'Court A',
          'location': 'Downtown',
          'imageUrl': '',
          'rating': 4.5,
        },
        {
          'name': 'Court B',
          'location': 'Midtown',
          'imageUrl': '',
          'rating': 4.2,
        },
        {
          'name': 'Court C',
          'location': 'Uptown',
          'imageUrl': '',
          'rating': 4.8,
        },
      ];

      for (var venue in venuesList) {
        await _firestore.collection('venues').add(venue);
      }
    } catch (e) {
      throw 'Failed to seed venues: $e';
    }
  }
}
