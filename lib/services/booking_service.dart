import 'package:dio/dio.dart';
import 'package:quickslot/core/network/services/network_api_service.dart';
import '../models/booking.dart';

class BookingService {
  final _api = NetworkApiService();

  /// Book a slot via REST API. Returns slot id if success.
  Future<String> bookSlot({
    required String userId,
    required String venueId,
    required String slotId,
    required String venueName,
    required DateTime startTime,
    required DateTime endTime,
  }) async {
    try {
      final dio = _api.dio;
      final resp = await dio.post(
        '/api/bookings',
        data: {
          'slotId': slotId,
          'venueId': venueId,
          'venueName': venueName,
          'startTime': startTime.toIso8601String(),
          'endTime': endTime.toIso8601String(),
          'userId': userId,
        },
        options: Options(headers: {'X-User-Id': userId}),
      );

      if (resp.statusCode == 200) {
        return resp.data['id']?.toString() ?? slotId;
      } else if (resp.statusCode == 409) {
        throw 'This slot was just booked. Please refresh and try another.';
      } else if (resp.statusCode == 404) {
        throw 'Slot not found.';
      }

      throw 'Booking failed: ${resp.statusMessage}';
    } on DioException catch (e) {
      if (e.response?.statusCode == 409) {
        throw 'This slot was just booked. Please refresh and try another.';
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Booking>> getUserBookings(String userId) async {
    try {
      final dio = _api.dio;
      final resp = await dio.get(
        '/api/bookings/user/$userId',
        options: Options(headers: {'X-User-Id': userId}),
      );

      if (resp.statusCode == 200) {
        final List<dynamic> data = resp.data as List<dynamic>;
        return data
            .map((e) => Booking.fromMap(Map<String, dynamic>.from(e)))
            .toList();
      }
      throw 'Failed to fetch bookings';
    } catch (e) {
      rethrow;
    }
  }

  Future<void> cancelBooking(String slotId, String userId) async {
    try {
      final dio = _api.dio;
      final resp = await dio.delete(
        '/api/bookings/$slotId',
        data: {'userId': userId},
        options: Options(headers: {'X-User-Id': userId}),
      );
      if (resp.statusCode == 200) return;
      throw 'Failed to cancel booking';
    } catch (e) {
      rethrow;
    }
  }

  // Streaming via REST is not supported; clients should poll or use websockets.
  Stream<List<Booking>> getUserBookingsStream(String userId) async* {
    yield await getUserBookings(userId);
  }
}
