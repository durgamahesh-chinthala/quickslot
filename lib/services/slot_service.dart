import 'dart:convert';

import 'package:quickslot/core/network/services/network_api_service.dart';
import 'package:quickslot/core/network/config/api_end_points.dart';
import '../models/slot.dart';

class SlotService {
  final NetworkApiService _api = NetworkApiService();

  Future<List<Slot>> getSlotsByVenueAndDate(
    String venueId,
    DateTime date,
  ) async {
    try {
      final dateStr =
          '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
      final resp = await _api.getRequest(
        '${ApiEndPoints.URI_VENUES}/$venueId/slots',
        queryParameters: {'date': dateStr},
      );

      if (resp is dynamic && resp.data != null) {
        final data = resp.data is String ? jsonDecode(resp.data) : resp.data;
        final list = data is List ? data : [];
        return list.map<Slot>((e) {
          final map = Map<String, dynamic>.from(e);
          map['id'] = map['id']?.toString();
          map['venueId'] = map['venueId']?.toString();
          return Slot.fromMap(map);
        }).toList();
      }
      return [];
    } catch (e) {
      throw 'Failed to fetch slots: $e';
    }
  }

  /// No-op for seeding on client
  Future<void> seedSlotsForVenue(String venueId) async => Future.value();

  Future<Slot?> getSlot(String slotId) async {
    try {
      final resp = await _api.getRequest(
        '${ApiEndPoints.URI_API_SLOTS}/$slotId',
      );
      if (resp is dynamic && resp.data != null) {
        final data = resp.data is String ? jsonDecode(resp.data) : resp.data;
        final map = Map<String, dynamic>.from(data);
        map['id'] = map['id']?.toString();
        map['venueId'] = map['venueId']?.toString();
        return Slot.fromMap(map);
      }
      return null;
    } catch (e) {
      throw 'Failed to fetch slot: $e';
    }
  }
}
