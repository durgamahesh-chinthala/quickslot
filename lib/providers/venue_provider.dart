import 'package:flutter/material.dart';
import '../models/venue.dart';
import '../services/venue_service.dart';

class VenueProvider extends ChangeNotifier {
  final VenueService _venueService = VenueService();
  List<Venue> _venues = [];
  bool _isLoading = false;
  String? _error;

  List<Venue> get venues => _venues;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadVenues() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await _venueService.seedVenues();
      _venues = await _venueService.getVenues();
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Venue? getVenue(String id) {
    try {
      return _venues.firstWhere((v) => v.id == id);
    } catch (_) {
      return null;
    }
  }
}
