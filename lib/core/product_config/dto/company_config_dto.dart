import 'package:quickslot/core/network/models/dtos/common_dtos/base_dto.dart';
import 'package:quickslot/utils/enums/object_state_enum.dart';

class CompanyConfigDto extends BaseDto {
  String? timezone;
  bool? isNativeLms;
  String? lmsProvider;
  String? currency;
  String? hostUrl;
  String? compCode;
  bool? payslipApiEnb;
  bool? isKycVerfReqForLoan;
  String? productType;

  CompanyConfigDto({
    this.timezone,
    this.isNativeLms,
    this.lmsProvider,
    this.currency,
    this.hostUrl,
    this.compCode,
    this.payslipApiEnb,
    this.isKycVerfReqForLoan,
    this.productType,

    // Base Dto
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
      'timezone': timezone,
      'isNativeLms': isNativeLms,
      'lmsProvider': lmsProvider,
      'currency': currency,
      'hostUrl': hostUrl,
      'compCode': compCode,
      'payslipApiEnb': payslipApiEnb,
      'isKycVerfReqForLoan': isKycVerfReqForLoan,
      'productType': productType,
      ...super.toJson(),
    };
  }

  factory CompanyConfigDto.fromJson(Map<String, dynamic> json) {
    return CompanyConfigDto(
      timezone: json['timezone'],
      isNativeLms: json['isNativeLms'],
      lmsProvider: json['lmsProvider'],
      currency: json['currency'],
      hostUrl: json['hostUrl'],
      compCode: json['compCode'],
      payslipApiEnb: json['payslipApiEnb'],
      isKycVerfReqForLoan: json['isKycVerfReqForLoan'],
      productType: json['productType'],

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
    return 'CompanyConfigDto(timezone: $timezone, isNativeLms: $isNativeLms, lmsProvider: $lmsProvider, currency: $currency, hostUrl: $hostUrl, compCode: $compCode, payslipApiEnb: $payslipApiEnb, isKycVerfReqForLoan: $isKycVerfReqForLoan, productType: $productType)';
  }
}
