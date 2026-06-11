// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserMetaDataDto {
  String? userName;
  String? otp;
  String? compCode;
  bool? isLogin;
  String? os;
  String? deviceToken;

  UserMetaDataDto({
    this.userName,
    this.otp,
    this.compCode,
    this.isLogin,
    this.os,
    this.deviceToken,
  });

  UserMetaDataDto.fromJson(Map<String, dynamic> json)
    : userName = json["userName"],
      otp = json["otp"],
      isLogin = json["isLogin"],
      compCode = json['compCode'],
      os = json['os'],
      deviceToken = json["deviceToken"];

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'otp': otp,
      'compCode': compCode,
      'isLogin': isLogin,
      'os': os,
      'deviceToken': deviceToken,
    };
  }

  @override
  String toString() {
    return 'UserMetaDataDto(userName: $userName, otp: $otp, compCode: $compCode, isLogin: $isLogin, os: $os, deviceToken: $deviceToken)';
  }
}
