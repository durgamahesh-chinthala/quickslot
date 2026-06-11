import 'package:quickslot/utils/enums/object_state_enum.dart';

class BaseDto {
  String? id;
  int? randomNumber;
  String? updateComment;
  String? removeComment;
  int? pagesize;
  int? currentPage;
  int? totalPage;
  int? startItem;
  int? endItem;
  int? totalItem;

  int? createdTime;
  String? formattedUpdatedTime;
  int? sortedTime;
  String? createdUserId;
  String? updatedUserId;
  String? createdUserName;
  String? updatedUserName;

  String? podName;
  String? companyName;
  String? zoneName;
  String? branchName;
  String? tellerName;
  String? linerName;

  String? podMobile;
  String? companyMobile;
  String? zoneMobile;
  String? branchMobile;
  String? tellerMobile;
  String? linerMobile;

  String? podId;
  String? companyId;
  String? zoneId;
  String? branchId;
  String? tellerId;
  String? linerId;
  bool? isSelected;
  int? updatedTime;
  String? formattedCreatedTime;
  ObjectState? objState;

  BaseDto({
    this.id,
    this.randomNumber,
    this.updateComment,
    this.removeComment,
    this.pagesize,
    this.currentPage,
    this.totalPage,
    this.startItem,
    this.endItem,
    this.totalItem,
    this.createdTime,
    this.formattedUpdatedTime,
    this.sortedTime,
    this.createdUserId,
    this.updatedUserId,
    this.createdUserName,
    this.updatedUserName,
    this.podName,
    this.companyName,
    this.zoneName,
    this.branchName,
    this.tellerName,
    this.linerName,
    this.podMobile,
    this.companyMobile,
    this.zoneMobile,
    this.branchMobile,
    this.tellerMobile,
    this.linerMobile,
    this.podId,
    this.companyId,
    this.zoneId,
    this.branchId,
    this.tellerId,
    this.linerId,
    this.isSelected,
    this.updatedTime,
    this.formattedCreatedTime,
    this.objState,
  });

  factory BaseDto.fromJson(Map<String, dynamic> json) => BaseDto(
    id: json["id"],
    randomNumber: json["randomNumber"],
    updateComment: json["updateComment"],
    removeComment: json["removeComment"],
    createdUserId: json["createdUserId"],
    createdUserName: json["createdUserName"],
    createdTime: json["createdTime"],
    formattedUpdatedTime: json["formattedUpdatedTime"],
    updatedUserName: json["updatedUserName"],
    pagesize: json["pagesize"],
    currentPage: json["currentPage"],
    totalPage: json["totalPage"],
    startItem: json["startItem"],
    endItem: json["endItem"],
    totalItem: json["totalItem"],
    podName: json["podName"],
    companyName: json["companyName"],
    zoneName: json["zoneName"],
    branchName: json["branchName"],
    tellerName: json["tellerName"],
    linerName: json["linerName"],
    podMobile: json["podMobile"],
    companyMobile: json["companyMobile"],
    zoneMobile: json["zoneMobile"],
    branchMobile: json["branchMobile"],
    tellerMobile: json["tellerMobile"],
    linerMobile: json["linerMobile"],
    podId: json["podId"],
    companyId: json["companyId"],
    zoneId: json["zoneId"],
    branchId: json["branchId"],
    tellerId: json["tellerId"],
    linerId: json["linerId"],
    isSelected: json["isSelected"] ?? false,
    updatedTime: json["updatedTime"],
    formattedCreatedTime: json["formattedCreatedTime"],
    objState: json["objState"] != null
        ? ObjectState.values.firstWhere(
            (e) => e.toString() == 'ObjectState.${json["objState"]}',
            orElse: () => ObjectState.ACTIVE,
          )
        : null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "randomNumber": randomNumber,
    "updateComment": updateComment,
    "removeComment": removeComment,
    "createdUserId": createdUserId,
    "createdUserName": createdUserName,
    "createdTime": createdTime,
    "formattedUpdatedTime": formattedUpdatedTime,
    "updatedUserName": updatedUserName,
    "pagesize": pagesize,
    "currentPage": currentPage,
    "totalPage": totalPage,
    "startItem": startItem,
    "endItem": endItem,
    "totalItem": totalItem,
    "podName": podName,
    "companyName": companyName,
    "zoneName": zoneName,
    "branchName": branchName,
    "tellerName": tellerName,
    "linerName": linerName,
    "podMobile": podMobile,
    "companyMobile": companyMobile,
    "zoneMobile": zoneMobile,
    "branchMobile": branchMobile,
    "tellerMobile": tellerMobile,
    "linerMobile": linerMobile,
    "podId": podId,
    "companyId": companyId,
    "zoneId": zoneId,
    "branchId": branchId,
    "tellerId": tellerId,
    "linerId": linerId,
    "isSelected": isSelected,
    "updatedTime": updatedTime,
    "formattedCreatedTime": formattedCreatedTime,
    "objState": objState?.toString().split('.').last,
  };

  checkAndReturnEnumValue(String? value) {
    if (value == null || value.isEmpty) return null;
    return value;
  }

  @override
  String toString() {
    return 'BaseDto(id: $id, randomNumber: $randomNumber, updateComment: $updateComment, removeComment: $removeComment, pagesize: $pagesize, currentPage: $currentPage, totalPage: $totalPage, startItem: $startItem, endItem: $endItem, totalItem: $totalItem, createdTime: $createdTime, formattedUpdatedTime: $formattedUpdatedTime, sortedTime: $sortedTime, createdUserId: $createdUserId, updatedUserId: $updatedUserId, createdUserName: $createdUserName, updatedUserName: $updatedUserName, podName: $podName, companyName: $companyName, zoneName: $zoneName, branchName: $branchName, tellerName: $tellerName, linerName: $linerName, podMobile: $podMobile, companyMobile: $companyMobile, zoneMobile: $zoneMobile, branchMobile: $branchMobile, tellerMobile: $tellerMobile, linerMobile: $linerMobile, podId: $podId, companyId: $companyId, zoneId: $zoneId, branchId: $branchId, tellerId: $tellerId, linerId: $linerId, isSelected: $isSelected, updatedTime: $updatedTime, formattedCreatedTime: $formattedCreatedTime)';
  }
}
