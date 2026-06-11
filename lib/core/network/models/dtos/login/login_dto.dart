class LoginDto {
  String? username;
  String? password;
  String? deviceToken;

  LoginDto({this.username, this.password, this.deviceToken});

  LoginDto.fromJson(Map<String, dynamic> json)
    : username = json["username"],
      password = json['password'],
      deviceToken = json["deviceToken"];

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'deviceToken': deviceToken,
    };
  }

  @override
  String toString() =>
      'LoginDto(username: $username, password: $password, deviceToken: $deviceToken)';
}
