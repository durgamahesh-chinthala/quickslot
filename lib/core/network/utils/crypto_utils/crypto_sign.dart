class CryptoSign {
  String? uuid;
  String? algorithm;
  String? secretKey;
  String? salt;
  int? iterationCount;

  CryptoSign(
      {this.uuid,
      this.algorithm,
      this.secretKey,
      this.salt,
      this.iterationCount});

  CryptoSign fromJson(json) {
    return CryptoSign(
        uuid: json['uuid'],
        algorithm: json['algorithm'],
        secretKey: json['secretKey'],
        salt: json['salt'],
        iterationCount: json['iterationCount']);
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'algorithm': algorithm,
      'secretKey': secretKey,
      'salt': salt,
      "iterationCount": iterationCount
    };
  }
}
