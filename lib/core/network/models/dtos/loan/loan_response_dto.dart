import 'package:quickslot/core/network/models/dtos/common_dtos/base_dto.dart';
import 'package:quickslot/utils/enums/object_state_enum.dart';

class LoanResDto extends BaseDto {
  double? minAmt = 0.0;
  double? maxAmt;
  int? minTenure;
  int? maxTenure;
  int? minEmiDay;
  int? maxEmiDay;
  double? roi;
  double? emiAmt;
  double? reqAmt;
  String? repayType;
  double? eligibleAmt;
  String? tenureType;
  String? policyId;
  String? productId;

  LoanResDto({
    this.productId,
    this.minAmt,
    this.maxAmt,
    this.minTenure,
    this.maxTenure,
    this.minEmiDay,
    this.maxEmiDay,
    this.roi,
    this.emiAmt,
    this.reqAmt,
    this.repayType,
    this.eligibleAmt,
    this.tenureType,
    this.policyId,

    // Base DTO Fields
    super.id,
    super.randomNumber,
    super.updateComment,
    super.removeComment,
    super.pagesize,
    super.currentPage,
    super.totalPage,
    super.startItem,
    super.endItem,
    super.totalItem,
    super.createdTime,
    super.formattedUpdatedTime,
    super.sortedTime,
    super.createdUserId,
    super.updatedUserId,
    super.createdUserName,
    super.updatedUserName,
    super.podName,
    super.companyName,
    super.zoneName,
    super.branchName,
    super.tellerName,
    super.linerName,
    super.podMobile,
    super.companyMobile,
    super.zoneMobile,
    super.branchMobile,
    super.tellerMobile,
    super.linerMobile,
    super.podId,
    super.companyId,
    super.zoneId,
    super.branchId,
    super.tellerId,
    super.linerId,
    super.isSelected,
    super.updatedTime,
    super.formattedCreatedTime,
    super.objState,
  });

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'minAmt': minAmt,
      'maxAmt': maxAmt,
      'minTenure': minTenure,
      'maxTenure': maxTenure,
      'minEmiDay': minEmiDay,
      'maxEmiDay': maxEmiDay,
      'roi': roi,
      'emiAmt': emiAmt,
      'repayType': repayType,
      'reqAmt': reqAmt,
      'eligibleAmt': eligibleAmt,
      'tenureType': tenureType,
      'policyId': policyId,
      'productId': productId,
      ...super.toJson(),
    };
  }

  factory LoanResDto.fromJson(Map<String, dynamic> json) {
    return LoanResDto(
      minAmt: json['minAmt'],
      maxAmt: json['maxAmt'],
      minTenure: json['minTenure'],
      maxTenure: json['maxTenure'],
      minEmiDay: json['minEmiDay'],
      maxEmiDay: json['maxEmiDay'],
      roi: json['roi'],
      emiAmt: json['emiAmt'],
      repayType: json['repayType'],
      reqAmt: json['reqAmt'],
      eligibleAmt: json['eligibleAmt'],
      tenureType: json['tenureType'],
      policyId: json['policyId'],
      productId: json['productId'],

      // Base DTO Fields
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
  }

  @override
  String toString() {
    return 'LoanResDto(minAmt: $minAmt, maxAmt: $maxAmt, minTenure: $minTenure, maxTenure: $maxTenure, minEmiDay: $minEmiDay, maxEmiDay: $maxEmiDay, roi: $roi, emiAmt: $emiAmt, reqAmt: $reqAmt, repayType: $repayType, eligibleAmt: $eligibleAmt, tenureType: $tenureType, policyId: $policyId)';
  }
}
