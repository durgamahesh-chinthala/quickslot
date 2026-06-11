import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

import 'package:quickslot/core/network/config/status_codes.dart';
import 'package:quickslot/core/product_config/dto/company_config_dto.dart';
import 'package:quickslot/core/product_config/service/product_config_service.dart';
import 'package:quickslot/store/local_storage.dart';

part 'product_config_controller.g.dart';

class ProductConfigController extends _ProductConfigControllerBase
    with _$ProductConfigController {
  // Singleton instace
  static final ProductConfigController _instance =
      ProductConfigController._internal();
  ProductConfigController._internal();
  factory ProductConfigController() => _instance;
}

abstract class _ProductConfigControllerBase with Store {
  final productConfigService = ProductConfigService();

  @action
  Future<void> fetchProductConfigType() async {
    try {
      Response response = await productConfigService.fetchProductConfigTyep();

      if (response.statusCode == HttpStatusCodes.OK) {
        final companyConfigType = CompanyConfigDto.fromJson(
          jsonDecode(response.data),
        ).productType;

        // Store the Company config type in the local storage
        if (companyConfigType != null && companyConfigType.isNotEmpty) {
          LocalStorage.setCompanyConfigType(companyConfigType);
        }
      } else {
        // Handle failure case
      }
    } catch (e) {
      throw "Failed to fetch the company config type";
    }
  }
}
