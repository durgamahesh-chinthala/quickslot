import 'package:quickslot/core/network/models/dtos/common_dtos/base_dto.dart';

class BorrowerBankDto extends BaseDto {
  String? ifsc;
  String? accNum;
  String? bankInfo;
  String? name;
  bool? isManual;
  bool? enachEnabled;
  bool? primaryAcc;
  String? bank;
  String? bankAccHolderName;
  String? branch;

  BorrowerBankDto({
    this.ifsc,
    this.accNum,
    this.bankInfo,
    this.name,
    this.isManual,
    this.enachEnabled,
    this.primaryAcc,
    this.bank,
    this.bankAccHolderName,
    this.branch,
    super.id,
  });

  factory BorrowerBankDto.fromJson(Map<String, dynamic> json) {
    return BorrowerBankDto(
      ifsc: json['ifsc'],
      accNum: json['accNum'],
      bankInfo: json['bankInfo'],
      name: json['name'],
      isManual: json['isManual'],
      enachEnabled: json['enachEnabled'],
      id: json['id'],
      primaryAcc: json['primaryAcc'],
      bank: json['bank'],
      bankAccHolderName: json['bankAccHolderName'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ifsc': ifsc,
      'accNum': accNum,
      'bankInfo': bankInfo,
      'name': name,
      'isManual': isManual,
      'enachEnabled': enachEnabled,
      'primaryAcc': primaryAcc,
      'bank': bank,
      'bankAccHolderName': bankAccHolderName,
      ...super.toJson(),
    };
  }

  @override
  String toString() {
    return 'BorrowerBankDto(ifsc: $ifsc, accNum: $accNum, bankInfo: $bankInfo, name: $name, isManual: $isManual, enachEnabled: $enachEnabled, primaryAcc: $primaryAcc, bank: $bank, bankAccHolderName: $bankAccHolderName)';
  }
}
