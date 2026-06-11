import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

import 'package:quickslot/core/network/config/api_end_points.dart';
import 'package:quickslot/core/network/models/dtos/login/login_dto.dart';
import 'package:quickslot/core/network/services/base_api_service.dart';
import 'package:quickslot/core/network/services/network_api_service.dart';
import 'package:quickslot/core/network/utils/crypto_utils/crypto.dart';
import 'package:quickslot/core/network/utils/crypto_utils/crypto_blocks.dart';
import 'package:quickslot/core/network/utils/crypto_utils/crypto_constants.dart';
import 'package:quickslot/core/network/utils/crypto_utils/crypto_sign.dart';

class AnonymousLoginService {
  BaseApiService networkApiService = NetworkApiService();

  String concatedStr = "#@@#";

  Future<Response> invokeAnonymusLoginAPI() async {
    try {
      Crypto crypto = Crypto();
      CryptoBlocks cryptoBlocks = CryptoBlocks();
      var uuid = const Uuid().v4();
      CryptoSign cryptoSign = cryptoBlocks.registerEncMethod!;
      String encryptedText = crypto.encrypt(
        cryptoSign.secretKey!,
        "$uuid$concatedStr${DateTime.now().millisecondsSinceEpoch}",
        DIGEST_ALGORITHIM,
      );
      LoginDto loginUser = LoginDto(
        username:
            "${cryptoSign.uuid!}$concatedStr$uuid$concatedStr$encryptedText",
        password: uuid,
      );
      Response response = await NetworkApiService().postRequest(
        ApiEndPoints.LOGIN,
        body: loginUser,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
