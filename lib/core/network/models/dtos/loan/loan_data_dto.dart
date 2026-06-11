import 'package:quickslot/core/network/models/dtos/borrower_dto.dart';
import 'package:quickslot/core/network/models/dtos/common_dtos/base_dto.dart';
import 'package:quickslot/core/network/models/dtos/loan/emi_dto.dart';
import 'package:quickslot/core/network/models/dtos/loan/loan_data_doc_dto.dart';
import 'package:quickslot/features/enach/dto/enach_dto.dart';
import 'package:quickslot/features/home/dto/loan_charge_dto.dart';
import 'package:quickslot/features/loan/dto/loan_nominee_dto.dart';
import 'package:quickslot/features/loan/dto/loan_products_dto.dart';
import 'package:quickslot/utils/enums/object_state_enum.dart';

class LoanDataDto extends BaseDto {
  double? amount;
  int? tenure;
  int? emiDay;
  String? sign;
  bool? tncAccepted;
  String? otp;
  double? emiAmt;
  String? emiDt;
  double? overdueAmt;
  String? type;
  double? interest;
  String? accountNum;
  String? ifsc;
  String? loanStatus;
  List<String>? docs;
  List<LoanDataDocDto>? loanDataDocList;
  List<EmiDto>? emiList;
  double? loanCmptpctl;
  int? closedTime;
  String? loanTenureDisp;
  String? borrowerName;
  double? gstCharges;
  double? procCharges;
  String? loanId;
  List<LoanChargeDto>? loanChargeList;
  String? loanStatusDisp;
  String? borrowerId;
  int? dueDate;
  String? dueDateDisp;
  int? emiCount;
  String? prevLoanStatusDisp;
  String? loanInstallmentGenType;
  String? remarks;
  BorrowerDto? borrowerDto;
  String? interestFreq;
  bool? hasEmi;
  String? emiFreq;
  bool? hasLatePaymentFee;
  double? latePaymentFee;
  double? paybackAmount;
  double? outstandingAmt;
  double? salary;
  double? expenditure;
  String? incProofType;
  DateTime? repayDate;
  bool? isEnachRequired;
  String? loanReasonType;
  bool? loanAgmtAccepted;
  LoanProductDto? loanProduct;
  String? cancelReason;
  String? rejectReason;
  double? eligibleAmt;
  EnachDto? enachDto;
  String? repayType;
  double? disbursedAmt;
  double? sanctionedAmount;
  double? interestAmt;
  String? policyId;
  String? loanDocReason;
  LoanNomineeDto? nomineeDto;
  DateTime? sanctionedDate;
  String? docStr;
  String? docExt;
  double? repayAmt;
  String? loanAgmtUuid;
  bool? isSanctionedAllowed;
  String? loanAppliedReason;
  String? loanExpireReason;
  DateTime? loanExpireTime;
  bool? isLoanFreez;

  LoanDataDto({
    this.amount,
    this.tenure,
    this.emiDay,
    this.sign,
    this.tncAccepted,
    this.otp,
    this.emiAmt,
    this.emiDt,
    this.overdueAmt,
    this.type,
    this.interest,
    this.accountNum,
    this.ifsc,
    this.loanStatus,
    this.docs,
    this.loanDataDocList,
    this.emiList,
    this.loanCmptpctl,
    this.closedTime,
    this.loanTenureDisp,
    this.borrowerName,
    this.gstCharges,
    this.procCharges,
    this.loanId,
    this.loanChargeList,
    this.loanStatusDisp,
    this.borrowerId,
    this.dueDate,
    this.dueDateDisp,
    this.emiCount,
    this.prevLoanStatusDisp,
    this.loanInstallmentGenType,
    this.remarks,
    this.borrowerDto,
    this.interestFreq,
    this.hasEmi,
    this.emiFreq,
    this.hasLatePaymentFee,
    this.latePaymentFee,
    this.paybackAmount,
    this.outstandingAmt,
    this.enachDto,
    this.salary,
    this.expenditure,
    this.incProofType,
    this.repayDate,
    this.isEnachRequired,
    this.loanReasonType,
    this.loanAgmtAccepted,
    this.loanProduct,
    this.cancelReason,
    this.rejectReason,
    this.eligibleAmt,
    this.repayType,
    this.disbursedAmt,
    this.interestAmt,
    this.policyId,
    this.loanDocReason,
    this.nomineeDto,
    this.sanctionedAmount,
    this.sanctionedDate,
    this.docStr,
    this.docExt,
    this.repayAmt,
    this.loanAgmtUuid,
    this.isSanctionedAllowed,
    this.loanAppliedReason,
    this.loanExpireReason,
    this.loanExpireTime,
    this.isLoanFreez,

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
      'amount': amount,
      'tenure': tenure,
      'emiDay': emiDay,
      'sign': sign,
      'tncAccepted': tncAccepted,
      'otp': otp,
      'emiAmt': emiAmt,
      'emiDt': emiDt,
      'overdueAmt': overdueAmt,
      'type': type,
      'interest': interest,
      'accountNum': accountNum,
      'ifsc': ifsc,
      'loanStatus': loanStatus,
      'docs': docs,
      'loanDataDocList': loanDataDocList?.map((e) => e.toJson()).toList(),
      'emiList': emiList?.map((e) => e.toJson()).toList(),
      'loanCmptpctl': loanCmptpctl,
      'closedTime': closedTime,
      'loanTenureDisp': loanTenureDisp,
      'borrowerName': borrowerName,
      'gstCharges': gstCharges,
      'procCharges': procCharges,
      'loanId': loanId,
      'loanChargeList': loanChargeList?.map((e) => e.toJson()).toList(),
      'loanStatusDisp': loanStatusDisp,
      'borrowerId': borrowerId,
      'dueDate': dueDate,
      'dueDateDisp': dueDateDisp,
      'emiCount': emiCount,
      'prevLoanStatusDisp': prevLoanStatusDisp,
      'loanInstallmentGenType': loanInstallmentGenType,
      'remarks': remarks,
      'borrowerDto': borrowerDto?.toJson(),
      'interestFreq': interestFreq,
      'hasEmi': hasEmi,
      'emiFreq': emiFreq,
      'hasLatePaymentFee': hasLatePaymentFee,
      'latePaymentFee': latePaymentFee,
      'paybackAmount': paybackAmount,
      'outstandingAmt': outstandingAmt,
      'enachDto': enachDto?.toJson(),
      'salary': salary,
      'expenditure': expenditure,
      'incProofType': incProofType,
      'repayDate': repayDate?.millisecondsSinceEpoch,
      'isEnachRequired': isEnachRequired,
      'loanReasonType': loanReasonType,
      'loanAgmtAccepted': loanAgmtAccepted,
      'loanProduct': loanProduct?.toJson(),
      'cancelReason': cancelReason,
      'rejectReason': rejectReason,
      'eligibleAmt': eligibleAmt,
      'repayType': repayType,
      'disbursedAmt': disbursedAmt,
      'interestAmt': interestAmt,
      'policyId': policyId,
      'loanDocReason': loanDocReason,
      'nomineeDto': nomineeDto?.toJson(),
      'sanctionedAmount': sanctionedAmount,
      'sanctionedDate': sanctionedDate?.millisecondsSinceEpoch,
      'docStr': docStr,
      'docExt': docExt,
      'repayAmt': repayAmt,
      'loanAgmtUuid': loanAgmtUuid,
      'isSanctionedAllowed': isSanctionedAllowed,
      'loanAppliedReason': loanAppliedReason,
      'loanExpireReason': loanExpireReason,
      'loanExpireTime': loanExpireTime?.millisecondsSinceEpoch,
      'isLoanFreez': isLoanFreez,
      ...super.toJson(),
    };
  }

  factory LoanDataDto.fromJson(Map<String, dynamic> json) {
    return LoanDataDto(
      amount: json['amount'],
      tenure: json['tenure'],
      emiDay: json['emiDay'],
      sign: json['sign'],
      tncAccepted: json['tncAccepted'],
      otp: json['otp'],
      emiAmt: json['emiAmt'],
      emiDt: json['emiDt'],
      overdueAmt: json['overdueAmt'],
      type: json['type'],
      interest: json['interest'],
      accountNum: json['accountNum'],
      ifsc: json['ifsc'],
      loanStatus: json['loanStatus'],
      docs: (json['docs'] as List<dynamic>?)?.cast<String>(),
      loanDataDocList: (json['loanDataDocList'] as List<dynamic>?)
          ?.map((item) => LoanDataDocDto.fromJson(item as Map<String, dynamic>))
          .toList(),
      emiList: (json['emiList'] as List<dynamic>?)
          ?.map((e) => EmiDto.fromJson(e))
          .toList(),
      loanCmptpctl: json['loanCmptpctl'],
      closedTime: json['closedTime'],
      loanTenureDisp: json['loanTenureDisp'],
      borrowerName: json['borrowerName'],
      gstCharges: json['gstCharges'],
      procCharges: json['procCharges'],
      loanId: json['loanId'],
      loanChargeList: (json['loanChargeList'] as List<dynamic>?)
          ?.map((e) => LoanChargeDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      loanStatusDisp: json['loanStatusDisp'],
      borrowerId: json['borrowerId'],
      dueDate: json['dueDate'],
      dueDateDisp: json['dueDateDisp'],
      emiCount: json['emiCount'],
      prevLoanStatusDisp: json['prevLoanStatusDisp'],
      loanInstallmentGenType: json['loanInstallmentGenType'],
      remarks: json['remarks'],
      borrowerDto: json['borrowerDto'] != null
          ? BorrowerDto.fromJson(json['borrowerDto'] as Map<String, dynamic>)
          : null,
      interestFreq: json['interestFreq'],
      hasEmi: json['hasEmi'],
      emiFreq: json['emiFreq'],
      hasLatePaymentFee: json['hasLatePaymentFee'],
      latePaymentFee: json['latePaymentFee'],
      paybackAmount: json['paybackAmount'],
      outstandingAmt: json['outstandingAmt'],
      enachDto: json['enachDto'] != null
          ? EnachDto.fromJson(json["enachDto"])
          : null,
      salary: json['salary'],
      expenditure: json['expenditure'],
      incProofType: json['incProofType'],
      repayDate: json['repayDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['repayDate'])
          : null,
      isEnachRequired: json['isEnachRequired'],
      loanReasonType: json['loanReasonType'],
      loanAgmtAccepted: json['loanAgmtAccepted'],
      loanProduct: json['loanProduct'] != null
          ? LoanProductDto.fromJson(json['loanProduct'])
          : null,
      cancelReason: json['cancelReason'],
      rejectReason: json['rejectReason'],
      eligibleAmt: json['eligibleAmt'],
      repayType: json['repayType'],
      disbursedAmt: json['disbursedAmt'],
      interestAmt: json['interestAmt'],
      policyId: json['policyId'],
      loanDocReason: json['loanDocReason'],
      nomineeDto: json['nomineeDto'] != null
          ? LoanNomineeDto.fromJson(json['nomineeDto'])
          : null,
      sanctionedAmount: json['sanctionedAmount'],
      sanctionedDate: json['sanctionedDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['sanctionedDate'])
          : null,
      docStr: json['docStr'],
      docExt: json['docExt'],
      repayAmt: json['repayAmt'],
      loanAgmtUuid: json['loanAgmtUuid'],
      isSanctionedAllowed: json['isSanctionedAllowed'],
      loanAppliedReason: json['loanAppliedReason'],
      loanExpireReason: json['loanExpireReason'],
      loanExpireTime: json['loanExpireTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['loanExpireTime'])
          : null,
      isLoanFreez: json['isLoanFreez'],

      // Base DTO Fields
      id: json['id'],
      randomNumber: json['randomNumber'],
      updateComment: json['updateComment'],
      removeComment: json['removeComment'],
      createdUserId: json['createdUserId'],
      createdUserName: json['createdUserName'],
      createdTime: json['createdTime'],
      formattedUpdatedTime: json['formattedUpdatedTime'],
      updatedUserName: json['updatedUserName'],
      pagesize: json['pagesize'],
      currentPage: json['currentPage'],
      totalPage: json['totalPage'],
      startItem: json['startItem'],
      endItem: json['endItem'],
      totalItem: json['totalItem'],
      podName: json['podName'],
      companyName: json['companyName'],
      zoneName: json['zoneName'],
      branchName: json['branchName'],
      tellerName: json['tellerName'],
      linerName: json['linerName'],
      podMobile: json['podMobile'],
      companyMobile: json['companyMobile'],
      zoneMobile: json['zoneMobile'],
      branchMobile: json['branchMobile'],
      tellerMobile: json['tellerMobile'],
      linerMobile: json['linerMobile'],
      podId: json['podId'],
      companyId: json['companyId'],
      zoneId: json['zoneId'],
      branchId: json['branchId'],
      tellerId: json['tellerId'],
      linerId: json['linerId'],
      isSelected: json['isSelected'] ?? false,
      updatedTime: json['updatedTime'],
      formattedCreatedTime: json['formattedCreatedTime'],
      objState: json['objState'] != null
          ? ObjectState.values.firstWhere(
              (e) => e.toString() == 'ObjectState.${json['objState']}',
              orElse: () => ObjectState.ACTIVE,
            )
          : null,
    );
  }

  @override
  String toString() {
    return 'LoanDataDto(isLoanFreez: $isLoanFreez, loanStatus: $loanStatus, enachDto: $enachDto, id: $id,  loanDataDocList : $loanDataDocList, loanDocReason: $loanDocReason, policyId: $policyId, amount: $amount, tenure: $tenure, emiDay: $emiDay, sign: $sign, tncAccepted: $tncAccepted, otp: $otp, emiAmt: $emiAmt, emiDt: $emiDt, overdueAmt: $overdueAmt, type: $type, interest: $interest, accountNum: $accountNum, ifsc: $ifsc, loanStatus: $loanStatus, docs: $docs, loanDataDocList: $loanDataDocList, emiList: $emiList, loanCmptpctl: $loanCmptpctl, closedTime: $closedTime, loanTenureDisp: $loanTenureDisp, borrowerName: $borrowerName, gstCharges: $gstCharges, procCharges: $procCharges, loanId: $loanId, loanChargeList: $loanChargeList, loanStatusDisp: $loanStatusDisp, borrowerId: $borrowerId, dueDate: $dueDate, dueDateDisp: $dueDateDisp, emiCount: $emiCount, prevLoanStatusDisp: $prevLoanStatusDisp, loanInstallmentGenType: $loanInstallmentGenType, remarks: $remarks, borrowerDto: $borrowerDto, interestFreq: $interestFreq, hasEmi: $hasEmi, emiFreq: $emiFreq, hasLatePaymentFee: $hasLatePaymentFee, latePaymentFee: $latePaymentFee, paybackAmount: $paybackAmount, outstandingAmt: $outstandingAmt, salary: $salary, expenditure: $expenditure, incProofType: $incProofType, repayDate: $repayDate, isEnachRequired: $isEnachRequired, loanReasonType: $loanReasonType, loanAgmtAccepted: $loanAgmtAccepted, loanProduct: $loanProduct, cancelReason: $cancelReason, rejectReason: $rejectReason, eligibleAmt: $eligibleAmt, enachDto: $enachDto, repayType: $repayType, disbursedAmt: $disbursedAmt, interestAmt: $interestAmt, policyId: $policyId)';
  }
}
