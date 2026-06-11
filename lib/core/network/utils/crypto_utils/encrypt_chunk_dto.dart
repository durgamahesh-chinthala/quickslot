class EncryptedChunkDto {
  String encMethod;
  String encPayload;

  String? cipher;
  int? version;

  EncryptedChunkDto(
      {required this.encMethod,
      required this.encPayload,
      this.cipher,
      this.version});

  factory EncryptedChunkDto.fromJson(Map<String, dynamic> json) =>
      EncryptedChunkDto(
        encMethod: json["encMethod"],
        encPayload: json["encPayload"],
        cipher: json["cipher"],
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "encMethod": encMethod,
        "encPayload": encPayload,
        "cipher": cipher,
        "version": version,
      };
}
