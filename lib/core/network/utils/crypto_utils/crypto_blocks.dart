// ignore_for_file: depend_on_referenced_packages, constant_identifier_names
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:quickslot/core/network/services/base_api_service.dart';
import 'package:quickslot/core/network/utils/crypto_utils/crypto.dart';
import 'package:quickslot/core/network/utils/crypto_utils/crypto_constants.dart';
import 'package:quickslot/core/network/utils/crypto_utils/crypto_sign.dart';
import 'package:quickslot/core/network/utils/crypto_utils/encrypt_chunk_dto.dart';
import 'package:quickslot/main.dart';

class CryptoBlocks {
  static CryptoBlocks? _instance;
  CryptoSign? workerEncMethod;
  CryptoSign? userPasswordEncMethod;
  CryptoSign? userRoleEncMethod;
  CryptoSign? openAPIEncMethod;
  CryptoSign? notifyKeyEncMethod;
  CryptoSign? registerEncMethod;
  CryptoSign? orbitEncMethod;
  CryptoSign? qrtzDbEncMethod;
  CryptoSign? dbEncMethod;
  CryptoSign? systemEncMethod;
  CryptoSign? bKeyEncMethod;
  CryptoSign? passwordEncMethod;
  CryptoSign? pic2PayEncMethod;
  Map<String, dynamic> cryptoblockMap = {};
  bool md5StrVerified = false;
  String environment = ENV_PROD;

  Crypto crypto = Crypto();
  CryptoSign cryptoSign = CryptoSign();

  factory CryptoBlocks() {
    if (_instance == null) {
      _instance = CryptoBlocks._();
      return _instance!;
    }
    return _instance!;
  }

  CryptoBlocks._(); // Private constructor

  Future<void> initCryptoBlockMap() async {
    try {
      String env = FlavorType.PROD.name;
      // Use constants in your code
      String cryptoBlockFileName = FILE_NAME;
      String cxModuleFileName = CX_MODULE_FILE_NAME;
      String pathPrefix = !kIsWeb ? ASSETS_PATH_PREFIX : WEB_PATH_PREFIX;
      if (flavorType?.toLowerCase() == FlavorType.TEST.name.toLowerCase() ||
          flavorType?.toLowerCase() == FlavorType.DEV.name.toLowerCase()) {
        env = FlavorType.DEV.name;
      } else if (flavorType?.toLowerCase() ==
          FlavorType.DEMO.name.toLowerCase()) {
        env = FlavorType.DEMO.name;
      } else if (flavorType?.toLowerCase() ==
          FlavorType.PROD.name.toLowerCase()) {
        env = FlavorType.PROD.name;
      } else {
        env = FlavorType.PROD.name;
      }
      String cryptoBlocksFilePath =
          '$pathPrefix/$ENV_PROD/$cryptoBlockFileName';
      String cxModulefilePath = '$pathPrefix/$ENV_PROD/$cxModuleFileName';

      if (env.toLowerCase() == ENV_DEV || env.toLowerCase() == ENV_TEST) {
        cryptoBlocksFilePath = '$pathPrefix/$ENV_DEV/$cryptoBlockFileName';
        cxModulefilePath = '$pathPrefix/$ENV_DEV/$cxModuleFileName';
      } else if (env.toLowerCase() == ENV_DEMO) {
        cryptoBlocksFilePath = '$pathPrefix/$ENV_DEMO/$cryptoBlockFileName';
        cxModulefilePath = '$pathPrefix/$ENV_DEMO/$cxModuleFileName';
      } else if (env.toLowerCase() == ENV_PROD) {
        cryptoBlocksFilePath = '$pathPrefix/$ENV_PROD/$cryptoBlockFileName';
        cxModulefilePath = '$pathPrefix/$ENV_PROD/$cxModuleFileName';
      }

      String cryptoBlockFileContents = await rootBundle.loadString(
        cryptoBlocksFilePath,
      );
      String cxModuleFileContent = await rootBundle.loadString(
        cxModulefilePath,
      );
      List<String> cryptoBlockLines = cryptoBlockFileContents.split('\n');
      List<String> cxModuleFileLines = cxModuleFileContent.split('\n');

      String mdStrCryptoBlockStr = generateMd5String(cryptoBlockLines[0]);
      String mdStrCxModuleStr = generateMd5String(cxModuleFileLines[0]);

      if (mdStrCryptoBlockStr == cryptoBlockLines[1] &&
          mdStrCxModuleStr == cxModuleFileLines[1]) {
        Map<String, dynamic> cxModuleMap = json.decode(
          utf8.decode(base64Decode(cxModuleFileLines[0])),
        );
        CryptoSign cryptoSignDto = cryptoSign.fromJson(cxModuleMap);
        String decryptedPayLoad = crypto.decrypt(
          cryptoSignDto.secretKey ?? "",
          cryptoBlockLines[0],
          DIGEST_ALGORITHIM,
        );

        Map<String, dynamic> cryptoBlocksMap = jsonDecode(decryptedPayLoad);
        cryptoblockMap = cryptoBlocksMap;
        if (env.toLowerCase() == ENV_DEV || env.toLowerCase() == ENV_TEST) {
          environment = FlavorType.DEV.name;
          prepareCryptoSignObjects(FlavorType.DEV.name);
        } else if (env.toLowerCase() == ENV_DEMO) {
          prepareCryptoSignObjects(FlavorType.DEMO.name);
          environment = FlavorType.DEMO.name;
        } else if (env.toLowerCase() == ENV_PROD) {
          prepareCryptoSignObjects(FlavorType.PROD.name);
          environment = FlavorType.PROD.name;
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  void prepareCryptoSignObjects(String envPrefix) {
    try {
      final keys = [
        '_WORKER_001',
        '_USER_PASSWD_001',
        '_USER_ROLE_001',
        '_OPENAPI_001',
        '_NOTIFY_KEY_001',
        '_REGISTER01',
        '_ORBIT01',
        '_QRTZDB_001',
        '_DB_001',
        '_SYSTEM_001',
        '_BKEY',
        '_PIC_2_PAY_001',
      ];

      final methods = [
        (json) => workerEncMethod = CryptoSign().fromJson(json),
        (json) => userPasswordEncMethod = CryptoSign().fromJson(json),
        (json) => userRoleEncMethod = CryptoSign().fromJson(json),
        (json) => openAPIEncMethod = CryptoSign().fromJson(json),
        (json) => notifyKeyEncMethod = CryptoSign().fromJson(json),
        (json) => registerEncMethod = CryptoSign().fromJson(json),
        (json) => orbitEncMethod = CryptoSign().fromJson(json),
        (json) => qrtzDbEncMethod = CryptoSign().fromJson(json),
        (json) => dbEncMethod = CryptoSign().fromJson(json),
        (json) => systemEncMethod = CryptoSign().fromJson(json),
        (json) => bKeyEncMethod = CryptoSign().fromJson(json),
        (json) => pic2PayEncMethod = CryptoSign().fromJson(json),
      ];
      for (var i = 0; i < keys.length; i++) {
        final json = cryptoblockMap['$envPrefix${keys[i]}'];
        methods[i](json);
      }
    } catch (e) {
      throw Exception('Failed to prepare crypto sign objects');
    }
  }

  String generateMd5String(String plainText) {
    try {
      String md5Str = md5.convert(utf8.encode(plainText)).toString();
      return md5Str;
    } catch (e) {
      rethrow;
    }
  }

  CryptoSign? getCryptoObject(String encryptionMethod) {
    try {
      if (environment.toLowerCase() == ENV_PROD) {
        return CryptoSign().fromJson(cryptoblockMap[encryptionMethod]);
      } else if (environment.toLowerCase() == ENV_DEV ||
          environment.toLowerCase() == ENV_TEST) {
        return CryptoSign().fromJson(cryptoblockMap[encryptionMethod]);
      } else if (environment.toLowerCase() == ENV_DEMO) {
        return CryptoSign().fromJson(cryptoblockMap[encryptionMethod]);
      } else {
        return CryptoSign().fromJson(cryptoblockMap[encryptionMethod]);
      }
    } catch (e) {
      rethrow;
    }
  }

  EncryptedChunkDto encrytPayLoad(String plainPayLoad, CryptoSign cryptoSign) {
    try {
      String encryptedText = crypto.encrypt(
        cryptoSign.secretKey ?? "",
        plainPayLoad,
        DIGEST_ALGORITHIM,
      );
      return EncryptedChunkDto(
        encMethod: cryptoSign.uuid ?? "",
        encPayload: encryptedText,
      );
    } catch (e) {
      rethrow;
    }
  }

  decryptPayLoad(EncryptedChunkDto encryptChunkDto) {
    try {
      CryptoSign? cryptoSign = getCryptoObject(encryptChunkDto.encMethod);
      String decryptedPayLoad = crypto.decrypt(
        cryptoSign?.secretKey ?? "",
        encryptChunkDto.encPayload,
        DIGEST_ALGORITHIM,
      );
      return decryptedPayLoad;
    } catch (e) {
      rethrow;
    }
  }

  String? decrtyptString(String? encryptedText, String? encMethod) {
    try {
      CryptoSign? cryptoSign = getCryptoObject(encMethod ?? "");
      String decryptedPayLoad = crypto.decrypt(
        cryptoSign?.secretKey ?? "",
        encryptedText ?? "",
        DIGEST_ALGORITHIM,
      );
      return decryptedPayLoad;
    } catch (e) {
      rethrow;
    }
  }
}
