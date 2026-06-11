import 'package:quickslot/core/network/config/api_end_points.dart';
import 'package:quickslot/core/network/services/base_api_service.dart';
import 'package:quickslot/core/network/services/network_api_service.dart';
import 'package:dio/dio.dart';

class ProductConfigService {
  // Singleton instance
  static final ProductConfigService _instace = ProductConfigService._internal();
  ProductConfigService._internal();
  factory ProductConfigService() => _instace;

  final BaseApiService _networkApiService = NetworkApiService();

  Future<Response> fetchProductConfigTyep() async {
    try {
      Response response = await _networkApiService.getRequest(
        ApiEndPoints.URI_COMPANY_CONFIG_READ_BY_BORROWER,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
