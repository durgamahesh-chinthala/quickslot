class AadhaarDataDto {
  String? clientId;
  String? token;
  String? expirySeconds;
  String? url;

  AadhaarDataDto({this.clientId, this.token, this.expirySeconds, this.url});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'clientId': clientId,
      'token': token,
      'expirySeconds': expirySeconds,
      'url': url,
    };
  }

  factory AadhaarDataDto.fromJson(Map<String, dynamic> json) {
    return AadhaarDataDto(
      clientId: json['clientId'],
      token: json['token'],
      expirySeconds: json['expirySeconds'],
      url: json['url'],
    );
  }

  @override
  String toString() =>
      'AadhaarDataDto(clientId: $clientId, token: $token, expirySeconds: $expirySeconds)';
}
