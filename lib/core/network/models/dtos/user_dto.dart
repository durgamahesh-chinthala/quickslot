import 'package:quickslot/core/network/models/dtos/common_dtos/base_dto.dart';
import 'package:quickslot/utils/enums/object_state_enum.dart';

class UserDto extends BaseDto {
  String? firstName;
  String? lastName;
  String? loginName;
  String? loginPassword;
  String? loginEncPassword;
  String? loginEncMethod;
  String? email;
  String? mobileNumber;
  String? mobileNumberMask;
  bool? appLogin;
  bool? apiLogin;
  String? roleName;
  String? confirmLoginPassword;
  String? profilePic;
  String? mfaCode;
  String? presentAddress;

  UserDto({
    this.firstName,
    this.lastName,
    this.loginName,
    this.loginPassword,
    this.loginEncPassword,
    this.loginEncMethod,
    this.email,
    this.mobileNumber,
    this.mobileNumberMask,
    this.appLogin,
    this.apiLogin,
    this.roleName,
    this.confirmLoginPassword,
    this.profilePic,
    this.mfaCode,
    this.presentAddress,

    // Base Dto Fields
    super.id,
    super.randomNumber,
    super.createdTime,
    super.sortedTime,
    super.objState,
  });

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'loginName': loginName,
      'loginPassword': loginPassword,
      'loginEncPassword': loginEncPassword,
      'loginEncMethod': loginEncMethod,
      'email': email,
      'mobileNumber': mobileNumber,
      'mobileNumberMask': mobileNumberMask,
      'appLogin': appLogin,
      'apiLogin': apiLogin,
      'roleName': roleName,
      'confirmLoginPassword': confirmLoginPassword,
      'profilePic': profilePic,
      'mfaCode': mfaCode,
      'presentAddress': presentAddress,
      ...super.toJson(),
    };
  }

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      firstName: json['firstName'] != null ? json['firstName'] as String : null,
      lastName: json['lastName'] != null ? json['lastName'] as String : null,
      loginName: json['loginName'] != null ? json['loginName'] as String : null,
      loginPassword: json['loginPassword'] != null
          ? json['loginPassword'] as String
          : null,
      loginEncPassword: json['loginEncPassword'] != null
          ? json['loginEncPassword'] as String
          : null,
      loginEncMethod: json['loginEncMethod'] != null
          ? json['loginEncMethod'] as String
          : null,
      email: json['email'] != null ? json['email'] as String : null,
      mobileNumber: json['mobileNumber'] != null
          ? json['mobileNumber'] as String
          : null,
      mobileNumberMask: json['mobileNumberMask'] != null
          ? json['mobileNumberMask'] as String
          : null,
      appLogin: json['appLogin'] != null ? json['appLogin'] as bool : null,
      apiLogin: json['apiLogin'] != null ? json['apiLogin'] as bool : null,
      roleName: json['roleName'] != null ? json['roleName'] as String : null,
      confirmLoginPassword: json['confirmLoginPassword'] != null
          ? json['confirmLoginPassword'] as String
          : null,
      profilePic: json['profilePic'] != null
          ? json['profilePic'] as String
          : null,
      mfaCode: json['mfaCode'] != null ? json['mfaCode'] as String : null,
      presentAddress: json['presentAddress'] != null
          ? json['presentAddress'] as String
          : null,

      // Base Dto Fields
      id: json["id"],
      randomNumber: json["randomNumber"],
      createdTime: json["createdTime"],
      sortedTime: json["sortedTime"],
      objState: json["objState"] != null
          ? ObjectState.values.firstWhere(
              (e) => e.toString() == 'ObjectState.${json["objState"]}',
              orElse: () => ObjectState.ACTIVE,
            )
          : null,
    );
  }
}
