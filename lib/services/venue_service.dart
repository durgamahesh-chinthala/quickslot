import 'dart:convert';

import 'package:quickslot/core/network/services/network_api_service.dart';
import 'package:quickslot/core/network/config/api_end_points.dart';
import '../models/venue.dart';

class VenueService {
  final NetworkApiService _api = NetworkApiService();

  /// Fetches venue list from server
  Future<List<Venue>> getVenues() async {
    try {
      final resp = await _api.getRequest(ApiEndPoints.URI_VENUES);
      if (resp is Map || resp is List) {
        final data = resp is String ? jsonDecode(resp) : resp;
        final list = data is List ? data : [];
        return list.map<Venue>((e) {
          final map = Map<String, dynamic>.from(e);
          map['id'] = map['id']?.toString();
          map['imageUrl'] = map['imageUrl'] ?? '';
          return Venue.fromMap(map);
        }).toList();
      } else if (resp is dynamic && resp.data != null) {
        final data = resp.data is String ? jsonDecode(resp.data) : resp.data;
        final list = data is List ? data : [];
        return list.map<Venue>((e) {
          final map = Map<String, dynamic>.from(e);
          map['id'] = map['id']?.toString();
          map['imageUrl'] = map['imageUrl'] ?? '';
          return Venue.fromMap(map);
        }).toList();
      }
      return [];
    } catch (e) {
      throw 'Failed to fetch venues: $e';
    }
  }

  Future<Venue?> getVenue(String venueId) async {
    try {
      final resp = await _api.getRequest('${ApiEndPoints.URI_VENUES}/$venueId');
      if (resp is dynamic && resp.data != null) {
        final data = resp.data is String ? jsonDecode(resp.data) : resp.data;
        final map = Map<String, dynamic>.from(data);
        map['id'] = map['id']?.toString();
        map['imageUrl'] = map['imageUrl'] ?? '';
        return Venue.fromMap(map);
      }
      return null;
    } catch (e) {
      throw 'Failed to fetch venue: $e';
    }
  }

  /// No-op for seeding in client; server is responsible for seeding
  Future<void> seedVenues() async {
    return;
  }
}
