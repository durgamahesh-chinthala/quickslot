// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:typed_data';
import 'package:pointycastle/api.dart';
import 'package:pointycastle/block/aes_fast.dart';
import 'package:pointycastle/block/modes/ecb.dart';
import 'package:pointycastle/padded_block_cipher/padded_block_cipher_impl.dart';
import 'package:pointycastle/paddings/pkcs7.dart';

class Crypto {
  static ECBBlockCipher cipher = ECBBlockCipher(AESFastEngine());
  PaddedBlockCipher paddedCipher =
      PaddedBlockCipherImpl(PKCS7Padding(), cipher);

  Digest? digest;
  Uint8List? key;
  PaddedBlockCipherParameters<CipherParameters, CipherParameters>?
      paddingParams;

  generateKey(String secretKey, String digestStr) {
    try {
      digest = Digest(digestStr);
      key = digest?.process(utf8.encode(secretKey)).sublist(0, 16);
      paddingParams = PaddedBlockCipherParameters(KeyParameter(key!), null);
    } catch (e) {
      rethrow;
    }
  }

  decrypt(String secretKey, String encryptedMessage, String digestStr) {
    try {
      generateKey(secretKey, digestStr);
      Uint8List ciphertext = base64.decode(encryptedMessage);
      paddedCipher.init(false, paddingParams);
      Uint8List plainText = paddedCipher.process(ciphertext);
      return utf8.decode(plainText);
    } catch (e) {
      rethrow;
    }
  }

  encrypt(String secretKey, String plainText, String digestStr) {
    try {
      generateKey(secretKey, digestStr);
      var text = utf8.encode(plainText);
      paddedCipher.init(true, paddingParams);
      Uint8List cipher = paddedCipher.process(text);
      return base64.encode(cipher);
    } catch (e) {
      rethrow;
    }
  }
}
