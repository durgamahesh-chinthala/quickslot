import 'package:quickslot/core/network/models/dtos/borrower_dto.dart';
import 'package:quickslot/core/network/models/dtos/common_dtos/base_dto.dart';
import 'package:quickslot/core/network/models/dtos/loan/loan_data_dto.dart';

class EmiDto extends BaseDto {
  String? loanId;
  String? borrowerId;
  double? amount;
  DateTime? emiDate;
  double? collectedAmount;
  double? submittedAmount;
  double? pendingHandoverAmt;
  String? collectedDate;
  String? verifiedDate;
  String? approvedDate;
  String? emiStatus;
  String? paymentMethod;
  String? borrowerName;
  double? emiAmount;
  double? loanAmount;
  int? dueDate;
  String? dueDateDisp;
  int? tenure;
  BorrowerDto? borrowerDto;
  LoanDataDto? loanDataDto;
  String? loanStatus;
  int? emiSeq;
  int? noOfDays;
  double? latePaymentFee;

  EmiDto({
    this.loanId,
    this.borrowerId,
    this.amount,
    this.emiDate,
    this.collectedAmount,
    this.submittedAmount,
    this.pendingHandoverAmt,
    this.collectedDate,
    this.verifiedDate,
    this.approvedDate,
    this.emiStatus,
    this.paymentMethod,
    this.borrowerName,
    this.emiAmount,
    this.loanAmount,
    this.dueDate,
    this.dueDateDisp,
    this.tenure,
    this.borrowerDto,
    this.loanDataDto,
    this.loanStatus,
    this.emiSeq,
    this.noOfDays,
    this.latePaymentFee,
  });

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'loanId': loanId,
      'borrowerId': borrowerId,
      'amount': amount,
      'emiDate': emiDate?.millisecondsSinceEpoch,
      'collectedAmount': collectedAmount,
      'submittedAmount': submittedAmount,
      'pendingHandoverAmt': pendingHandoverAmt,
      'collectedDate': collectedDate,
      'verifiedDate': verifiedDate,
      'approvedDate': approvedDate,
      'emiStatus': emiStatus,
      'paymentMethod': paymentMethod,
      'borrowerName': borrowerName,
      'emiAmount': emiAmount,
      'loanAmount': loanAmount,
      'dueDate': dueDate,
      'dueDateDisp': dueDateDisp,
      'tenure': tenure,
      'borrowerDto': borrowerDto?.toJson(),
      'loanDataDto': loanDataDto?.toJson(),
      'loanStatus': loanStatus,
      'emiSeq': emiSeq,
      'noOfDays': noOfDays,
      'latePaymentFee': latePaymentFee,
      ...super.toJson(),
    };
  }

  factory EmiDto.fromJson(Map<String, dynamic> json) {
    return EmiDto(
      loanId: json['loanId'],
      borrowerId: json['borrowerId'],
      amount: json['amount'],
      emiDate: json['emiDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['emiDate'])
          : null,
      collectedAmount: json['collectedAmount'],
      submittedAmount: json['submittedAmount'],
      pendingHandoverAmt: json['pendingHandoverAmt'],
      collectedDate: json['collectedDate'],
      verifiedDate: json['verifiedDate'],
      approvedDate: json['approvedDate'],
      emiStatus: json['emiStatus'],
      paymentMethod: json['paymentMethod'],
      borrowerName: json['borrowerName'],
      emiAmount: json['emiAmount'],
      loanAmount: json['loanAmount'],
      dueDate: json['dueDate'],
      dueDateDisp: json['dueDateDisp'],
      tenure: json['tenure'],
      borrowerDto: json['borrowerDto'] != null
          ? BorrowerDto.fromJson(json['borrowerDto'])
          : null,
      loanDataDto: json['loanDataDto'] != null
          ? LoanDataDto.fromJson(json['loanDataDto'])
          : null,
      loanStatus: json['loanStatus'],
      emiSeq: json['emiSeq'],
      noOfDays: json['noOfDays'],
      latePaymentFee: json['latePaymentFee'],
    );
  }

  @override
  String toString() {
    return 'EmiDto(loanId: $loanId, borrowerId: $borrowerId, amount: $amount, emiDate: $emiDate, collectedAmount: $collectedAmount, submittedAmount: $submittedAmount, pendingHandoverAmt: $pendingHandoverAmt, collectedDate: $collectedDate, verifiedDate: $verifiedDate, approvedDate: $approvedDate, emiStatus: $emiStatus, paymentMethod: $paymentMethod, borrowerName: $borrowerName, emiAmount: $emiAmount, loanAmount: $loanAmount, dueDate: $dueDate, dueDateDisp: $dueDateDisp, tenure: $tenure, borrowerDto: $borrowerDto, loanDataDto: $loanDataDto, loanStatus: $loanStatus, emiSeq: $emiSeq, noOfDays: $noOfDays, latePaymentFee: $latePaymentFee)';
  }
}
