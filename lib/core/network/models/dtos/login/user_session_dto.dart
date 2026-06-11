// import 'package:com.merusphere.borrower/core/network/models/dtos/common_dtos/base_dto.dart';

// class UserSessionDto extends BaseDto {
//   String userId;
//   String userName;
//   String mobileNumber;
//   String? designation;
//   String? profilePicUuid;
//   String base64EncodedJpegImage;
//   String? emailId;
//   String? encMethod;
//   String? encData;
//   bool? flushData;
//   int? sessionTimeout;
//   int? offlineTimeout;
//   String? employeeId;
//   bool? isUserFirstLogin;

//   bool? isUserRole;

//   UserSessionDto({
//     required this.userId,
//     required this.mobileNumber,
//     required this.userName,
//     required this.profilePicUuid,
//     required this.base64EncodedJpegImage,
//     this.emailId,
//     this.designation,
//     this.encMethod,
//     this.encData,
//     this.flushData,
//     this.sessionTimeout,
//     this.offlineTimeout,
//     this.employeeId,
//     this.isUserFirstLogin,
//     this.isUserRole,

//     // Base Dto fields
//     super.randomNumber,
//     super.updateComment,
//     super.removeComment,
//     super.pagesize,
//     super.currentPage,
//     super.totalPage,
//     super.createdUserId,
//     super.createdUserName,
//     super.createdTime,
//     String? updateUserId,
//     super.updatedUserName,
//     super.formattedUpdatedTime,
//     String? podName,
//     String? companyName,
//     String? zoneName,
//     String? branchName,
//     String? tellerName,
//     String? linerName,
//   }) : super(updatedUserId: updateUserId);

//   factory UserSessionDto.fromJson(Map<String, dynamic> json) => UserSessionDto(
//     userId: json["userId"] ?? "",
//     mobileNumber: json["mobileNumber"] ?? "",
//     userName: json["userName"] ?? "",
//     designation: json["designation"],
//     profilePicUuid: json["profilePicUuid"] ?? "",
//     base64EncodedJpegImage: json["base64EncodedJpegImage"] ?? "",
//     emailId: json["emailId"],
//     encMethod: json["encMethod"],
//     encData: json["encData"],
//     flushData: json["flushData"] ?? false,
//     sessionTimeout: json["sessionTimeout"],
//     offlineTimeout: json["offlineTimeout"],
//     employeeId: json['employeeId'],
//     isUserFirstLogin: json["isUserFirstLogin"],
//     isUserRole: json['isUserRole'],
//     randomNumber: json["randomNumber"],
//     updateComment: json["updateComment"],
//     removeComment: json["removeComment"],

//     pagesize: json["pagesize"],
//     currentPage: json["currentPage"],
//     totalPage: json["totalPage"],
//     createdUserId: json["createdUserId"],
//     createdUserName: json["createdUserName"],
//     createdTime: json["createdTime"],
//     updateUserId: json["updateUserId"],
//     updatedUserName: json["updatedUserName"],
//     formattedUpdatedTime: json["formattedUpdatedTime"],
//     podName: json["podName"],
//     companyName: json["companyName"],
//     zoneName: json["zoneName"],
//     branchName: json["branchName"],
//     tellerName: json["tellerName"],
//     linerName: json["linerName"],
//   );

//   @override
//   Map<String, dynamic> toJson() => {
//     "userId": userId,
//     "mobileNumber": mobileNumber,
//     "designation": designation,
//     "userName": userName,
//     "profilePicUuid": profilePicUuid,
//     "base64EncodedJpegImage": base64EncodedJpegImage,
//     "emailId": emailId,
//     "encMethod": encMethod,
//     "encData": encData,
//     "flushData": flushData,
//     "sessionTimeout": sessionTimeout,
//     "offlineTimeout": offlineTimeout,
//     "employeeId": employeeId,
//     "isUserFirstLogin": isUserFirstLogin,
//     "isUserRole": isUserRole,
//     ...super.toJson(), // Add properties from BaseDto
//   };
// }
