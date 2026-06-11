import 'package:quickslot/core/network/models/dtos/borrower_bank_dto.dart';
import 'package:quickslot/core/network/models/dtos/common_dtos/base_dto.dart';
import 'package:quickslot/core/network/models/dtos/loan/loan_data_doc_dto.dart';
import 'package:quickslot/core/network/models/dtos/loan/loan_data_dto.dart';
import 'package:quickslot/features/kyc_steps/dto/borrower_address_dto.dart';
import 'package:quickslot/features/kyc_steps/dto/emp_info_dto.dart';
import 'package:quickslot/features/kyc_steps/dto/gst_in_advance_res_dto.dart';
import 'package:quickslot/features/kyc_steps/dto/verify_cin_res_dto.dart';
import 'package:quickslot/features/kyc_steps/enum/address_proof_type_enum.dart';
import 'package:quickslot/features/kyc_steps/enum/employer_kyc_status_enum.dart';
import 'package:quickslot/features/kyc_steps/enum/kyc_status_enum.dart';

class BorrowerDto extends BaseDto {
  String? category; // CustomerType
  String? gender; // GenderType
  String? name;
  String? fsname;
  String? mobile;
  String? mobileOtp;
  String? pan;
  String? gst;
  String? gstOtp;
  String? occupation; // EmpOccupation
  String? address;
  String? adhrAddress;
  String? adhrPic;
  bool? isCurrentAddressSameAsAadhaar;
  String? nomineeName;
  String? nomineeMobile;
  String? nomineeMobileOtp;
  String? nomineeAadhaar;
  String? email;
  String? emailOtp;
  bool? resendOtp;
  String? nomineeRelation; // RelationType
  String? accountNumber;
  String? ifsc;
  bool? isAutoDeductOpt;
  bool? isRepaymentAndCreditAccSame;
  String? repaymentAccNum;
  String? repaymentAccIfsc;
  String? selfie;
  bool? isImageUpdated;
  String? signUpStep; // BorrowerSignUpStep
  String? kycStep; // BorrowerKycStep
  String? signUpStatus; // SignUpStatus
  String? aadhaar;
  String? aadhaarOtp;
  KycStatusEnum? kycStatus; // KycStatus
  String? genderType; // GenderType
  String? dob;
  String? aadhaarResponse;
  bool? aadhaarVerifyStatus;
  bool? emailVerifyStatus;
  EmploymentKycStatusEnum? emptVerifyStatus;
  // Fixed: Changed from bool? to String? to match enum string from backend
  bool? selfieVerifyStatus;
  bool? bankVerifyStatus;
  bool? panVerifyStatus;

  String? addrVerifyStatus;
  String? addrDocStatus; // AddressDocStatus
  DateTime? addrUpdatedTime;

  DateTime? panUpdatedTime;
  String? panAddr;
  bool? panLinkedWithAadhaar;
  String? panAadhaar;
  String? panName;
  DateTime? panDob;
  String? panCategory;
  String? careOf;
  int? emailOtpRetryCount;
  DateTime? emailOtpTime;
  bool? emailOtpVerified;
  int? kycPercentage;
  String? city;
  String? street;
  String? state;
  String? pincode;
  String? location;
  String? house;

  AddressProofTypeEnum? addrDocType; // AddressProofDocType
  String? addrDocUuid;

  String? emptCompanyName;
  String? emptCompanyAddress;
  String? borrowerBankId;
  bool? isActiveEmp;
  bool? isManual;
  String? bank;
  int? kycCount;

  double? confidence;
  bool? selfieMatchStatus;
  String? aadhaarClientId;

  String? adhrCountry;
  String? adhrDist;
  String? adhrState;
  String? adhrPo;
  String? adhrPinCode;
  String? adhrHouse;
  String? adhrLoc;
  String? adhrVtc;
  String? adhrSubdist;
  String? adhrStreet;
  String? adhrLandmark;

  List<LoanDataDto>? loanList; // LoanDataDto list
  double? totalLoanAmount;
  int? closedLoanCount;
  int? activeLoanCount;
  int? overdueLoanCount;

  String? verifyComment;
  BorrowerEmpInfoDto? empInfoDto;

  String? addressDocStatus; // AddressDocStatus
  String? empDetailStatus; // EmploymentDetailsStatus
  bool? isEmptManual;
  String? addrVerifyComment;
  String? empInfoVerifyComment;
  String? addrDocExt;
  String? geoLat;
  String? geoLng;
  BorrowerAddressDto? addressDto;

  bool? kycUpdateBlocked;
  bool? bankUpdateBlocked;
  bool? isBankInfoValid;
  BorrowerBankDto? bankDto;
  double? curAddrStayYrs;
  VerifyCinResDto? cinResDto;
  GstInAdvanceResDto? gstResDto;
  bool? isCreditScrEnable;
  String? stepEnum;
  bool? tncAccepted;
  String? docPwd;
  List<LoanDataDocDto>? loanDataDocList;
  String? salaryPayDate;
  String? payslipStatus;
  String? bankStmtStatus;
  bool? isPayslipUploadStep;

  BorrowerDto({
    this.category,
    this.gender,
    this.name,
    this.fsname,
    this.mobile,
    this.mobileOtp,
    this.pan,
    this.gst,
    this.gstOtp,
    this.occupation,
    this.address,
    this.adhrAddress,
    this.adhrPic,
    this.isCurrentAddressSameAsAadhaar,
    this.nomineeName,
    this.nomineeMobile,
    this.nomineeMobileOtp,
    this.nomineeAadhaar,
    this.geoLat,
    this.geoLng,
    this.email,
    this.emailOtp,
    this.resendOtp,
    this.nomineeRelation,
    this.accountNumber,
    this.ifsc,
    this.isAutoDeductOpt,
    this.isRepaymentAndCreditAccSame,
    this.repaymentAccNum,
    this.repaymentAccIfsc,
    this.selfie,
    this.isImageUpdated,
    this.signUpStep,
    this.kycStep,
    this.signUpStatus,
    this.aadhaar,
    this.aadhaarOtp,
    this.kycStatus,
    this.genderType,
    this.dob,
    this.aadhaarResponse,
    this.aadhaarVerifyStatus,
    this.emailVerifyStatus,
    this.emptVerifyStatus,
    this.selfieVerifyStatus,
    this.bankVerifyStatus,
    this.panVerifyStatus,
    this.addrVerifyStatus,
    this.addrDocStatus,
    this.addrUpdatedTime,
    this.panUpdatedTime,
    this.panAddr,
    this.panLinkedWithAadhaar,
    this.panAadhaar,
    this.panName,
    this.panDob,
    this.panCategory,
    this.careOf,
    this.emailOtpRetryCount,
    this.emailOtpTime,
    this.emailOtpVerified,
    this.kycPercentage,
    this.city,
    this.street,
    this.state,
    this.pincode,
    this.location,
    this.house,
    this.addrDocType,
    this.addrDocUuid,
    this.emptCompanyName,
    this.emptCompanyAddress,
    this.borrowerBankId,
    this.isActiveEmp,
    this.isManual,
    this.bank,
    this.kycCount,
    this.confidence,
    this.selfieMatchStatus,
    this.aadhaarClientId,
    this.adhrCountry,
    this.adhrDist,
    this.adhrState,
    this.adhrPo,
    this.adhrPinCode,
    this.adhrHouse,
    this.adhrLoc,
    this.adhrVtc,
    this.adhrSubdist,
    this.adhrStreet,
    this.adhrLandmark,
    this.loanList,
    this.totalLoanAmount,
    this.closedLoanCount,
    this.activeLoanCount,
    this.overdueLoanCount,
    this.verifyComment,
    this.empInfoDto,
    this.addressDocStatus,
    this.empDetailStatus,
    this.isEmptManual,
    this.addrVerifyComment,
    this.empInfoVerifyComment,
    this.addrDocExt,
    this.addressDto,
    this.kycUpdateBlocked,
    this.bankUpdateBlocked,
    this.isBankInfoValid,
    this.bankDto,
    this.curAddrStayYrs,
    this.cinResDto,
    this.gstResDto,
    this.isCreditScrEnable,
    this.stepEnum,
    this.tncAccepted,
    this.docPwd,
    this.loanDataDocList,
    this.salaryPayDate,
    this.payslipStatus,
    this.bankStmtStatus,
    this.isPayslipUploadStep,

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

  factory BorrowerDto.fromJson(Map<String, dynamic> json) {
    return BorrowerDto(
      category: json['category'],
      gender: json['gender'],
      name: json['name'],
      fsname: json['fsname'],
      mobile: json['mobile'],
      mobileOtp: json['mobileOtp'],
      pan: json['pan'],
      gst: json['gst'],
      gstOtp: json['gstOtp'],
      occupation: json['occupation'],
      geoLat: json['geoLat'],
      geoLng: json['geoLng'],
      address: json['address'],
      adhrAddress: json['adhrAddress'],
      adhrPic: json['adhrPic'],
      isCurrentAddressSameAsAadhaar: json['isCurrentAddressSameAsAadhaar'],
      nomineeName: json['nomineeName'],
      nomineeMobile: json['nomineeMobile'],
      nomineeMobileOtp: json['nomineeMobileOtp'],
      nomineeAadhaar: json['nomineeAadhaar'],
      email: json['email'],
      emailOtp: json['emailOtp'],
      resendOtp: json['resendOtp'],
      nomineeRelation: json['nomineeRelation'],
      accountNumber: json['accountNumber'],
      ifsc: json['ifsc'],
      isAutoDeductOpt: json['isAutoDeductOpt'],
      isRepaymentAndCreditAccSame: json['isRepaymentAndCreditAccSame'],
      repaymentAccNum: json['repaymentAccNum'],
      repaymentAccIfsc: json['repaymentAccIfsc'],
      selfie: json['selfie'],
      isImageUpdated: json['isImageUpdated'],
      signUpStep: json['signUpStep'],
      kycStep: json['kycStep'],
      signUpStatus: json['signUpStatus'],
      aadhaar: json['aadhaar'],
      aadhaarOtp: json['aadhaarOtp'],
      kycStatus: _parseKycStatus(json['kycStatus']),
      genderType: json['genderType'],
      dob: json['dob'],
      aadhaarResponse: json['aadhaarResponse'],
      aadhaarVerifyStatus: json['aadhaarVerifyStatus'],
      emailVerifyStatus: json['emailVerifyStatus'],
      addrVerifyStatus: json['addrVerifyStatus'],
      addressDto: json['addressDto'] != null
          ? BorrowerAddressDto.fromJson(json['addressDto'])
          : null,
      emptVerifyStatus: _parseEmploymentKycStatus(json['emptVerifyStatus']),
      selfieVerifyStatus: json['selfieVerifyStatus'],
      bankVerifyStatus: json['bankVerifyStatus'],
      panVerifyStatus: json['panVerifyStatus'],
      addrDocStatus: json['addrDocStatus'],
      addrUpdatedTime: json['addrUpdatedTime'] != null
          ? DateTime.parse(json['addrUpdatedTime'])
          : null,
      panUpdatedTime: json['panUpdatedTime'] != null
          ? DateTime.parse(json['panUpdatedTime'])
          : null,
      panAddr: json['panAddr'],
      panLinkedWithAadhaar: json['panLinkedWithAadhaar'],
      panAadhaar: json['panAadhaar'],
      panName: json['panName'],
      panDob: json['panDob'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['panDob'])
          : null,
      panCategory: json['panCategory'],
      careOf: json['careOf'],
      emailOtpRetryCount: json['emailOtpRetryCount'],
      emailOtpTime: json['emailOtpTime'] != null
          ? DateTime.parse(json['emailOtpTime'])
          : null,
      emailOtpVerified: json['emailOtpVerified'],
      kycPercentage: json['kycPercentage'],
      city: json['city'],
      street: json['street'],
      state: json['state'],
      pincode: json['pincode'],
      location: json['location'],
      house: json['house'],
      addrDocType: _parseAddressProofType(json['addrDocType']),
      addrDocUuid: json['addrDocUuid'],
      emptCompanyName: json['emptCompanyName'],
      emptCompanyAddress: json['emptCompanyAddress'],
      borrowerBankId: json['borrowerBankId'],
      isActiveEmp: json['isActiveEmp'],
      isManual: json['isManual'],
      bank: json['bank'],
      kycCount: json['kycCount'],
      confidence: (json['confidence'] as num?)?.toDouble(),
      selfieMatchStatus: json['selfieMatchStatus'],
      aadhaarClientId: json['aadhaarClientId'],
      adhrCountry: json['adhrCountry'],
      adhrDist: json['adhrDist'],
      adhrState: json['adhrState'],
      adhrPo: json['adhrPo'],
      adhrPinCode: json['adhrPinCode'],
      adhrHouse: json['adhrHouse'],
      adhrLoc: json['adhrLoc'],
      adhrVtc: json['adhrVtc'],
      adhrSubdist: json['adhrSubdist'],
      adhrStreet: json['adhrStreet'],
      adhrLandmark: json['adhrLandmark'],
      loanList: json['loanList'] != null
          ? (json['loanList'] as List<dynamic>?)
                ?.map((item) => LoanDataDto.fromJson(item))
                .toList()
          : null,
      totalLoanAmount: (json['totalLoanAmount'] as num?)?.toDouble(),
      closedLoanCount: json['closedLoanCount'],
      activeLoanCount: json['activeLoanCount'],
      overdueLoanCount: json['overdueLoanCount'],
      verifyComment: json['verifyComment'],
      empInfoDto: json['empInfoDto'] != null
          ? BorrowerEmpInfoDto.fromJson(json['empInfoDto'])
          : null,
      addressDocStatus: json['addressDocStatus'],
      empDetailStatus: json['empDetailStatus'],
      isEmptManual: json['isEmptManual'],
      addrVerifyComment: json['addrVerifyComment'],

      empInfoVerifyComment: json['empInfoVerifyComment'],
      addrDocExt: json['addrDocExt'],
      id: json['id'],
      randomNumber: json['randomNumber'],
      kycUpdateBlocked: json['kycUpdateBlocked'],
      bankUpdateBlocked: json['bankUpdateBlocked'],
      isBankInfoValid: json['isBankInfoValid'],
      bankDto: json['bankDto'] != null
          ? BorrowerBankDto.fromJson(json['bankDto'])
          : null,
      curAddrStayYrs: json['curAddrStayYrs'],
      cinResDto: json['cinResDto'] != null
          ? VerifyCinResDto.fromJson(json['cinResDto'])
          : null,
      gstResDto: json['gstResDto'] != null
          ? GstInAdvanceResDto.fromJson(json['gstResDto'])
          : null,
      isCreditScrEnable: json["isCreditScrEnable"],
      stepEnum: json['stepEnum'],
      tncAccepted: json['tncAccepted'],
      docPwd: json['docPwd'],
      loanDataDocList: (json['loanDataDocList'] as List<dynamic>?)
          ?.map((item) => LoanDataDocDto.fromJson(item as Map<String, dynamic>))
          .toList(),
      salaryPayDate: json['salaryPayDate'],
      payslipStatus: json['payslipStatus'],
      bankStmtStatus: json['bankStmtStatus'],
      isPayslipUploadStep: json['isPayslipUploadStep'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "addrVerifyComment": addrVerifyComment,
      "empInfoVerifyComment": empInfoVerifyComment,
      'addrDocExt': addrDocExt,
      'category': category,
      'gender': gender,
      'name': name,
      'fsname': fsname,
      'mobile': mobile,
      'mobileOtp': mobileOtp,
      'pan': pan,
      'geoLat': geoLat,
      'geoLng': geoLng,
      'gst': gst,
      'gstOtp': gstOtp,
      'occupation': occupation,
      'address': address,
      'adhrAddress': adhrAddress,
      'adhrPic': adhrPic,
      'isCurrentAddressSameAsAadhaar': isCurrentAddressSameAsAadhaar,
      'nomineeName': nomineeName,
      'nomineeMobile': nomineeMobile,
      'nomineeMobileOtp': nomineeMobileOtp,
      'nomineeAadhaar': nomineeAadhaar,
      'email': email,
      'emailOtp': emailOtp,
      'resendOtp': resendOtp,
      'nomineeRelation': nomineeRelation,
      'accountNumber': accountNumber,
      'ifsc': ifsc,
      'isAutoDeductOpt': isAutoDeductOpt,
      'isRepaymentAndCreditAccSame': isRepaymentAndCreditAccSame,
      'repaymentAccNum': repaymentAccNum,
      'repaymentAccIfsc': repaymentAccIfsc,
      'selfie': selfie,
      'isImageUpdated': isImageUpdated,
      'signUpStep': signUpStep,
      'kycStep': kycStep,
      'signUpStatus': signUpStatus,
      'aadhaar': aadhaar,
      'aadhaarOtp': aadhaarOtp,
      'kycStatus': kycStatus?.name,
      'genderType': genderType,
      'dob': dob,
      'aadhaarResponse': aadhaarResponse,
      'aadhaarVerifyStatus': aadhaarVerifyStatus,
      'emailVerifyStatus': emailVerifyStatus,
      'addrVerifyStatus': addrVerifyStatus,
      'emptVerifyStatus': emptVerifyStatus?.name,
      'selfieVerifyStatus': selfieVerifyStatus,
      'bankVerifyStatus': bankVerifyStatus,
      'panVerifyStatus': panVerifyStatus,
      'addrDocStatus': addrDocStatus,
      'addrUpdatedTime': addrUpdatedTime?.toIso8601String(),
      'panUpdatedTime': panUpdatedTime?.toIso8601String(),
      'panAddr': panAddr,
      'panLinkedWithAadhaar': panLinkedWithAadhaar,
      'panAadhaar': panAadhaar,
      'panName': panName,
      'panDob': panDob?.toIso8601String(),
      'panCategory': panCategory,
      'careOf': careOf,
      'emailOtpRetryCount': emailOtpRetryCount,
      'emailOtpTime': emailOtpTime?.toIso8601String(),
      'emailOtpVerified': emailOtpVerified,
      'kycPercentage': kycPercentage,
      'city': city,
      'street': street,
      'state': state,
      'pincode': pincode,
      'location': location,
      'house': house,
      'addrDocType': addrDocType?.name,
      'addrDocUuid': addrDocUuid,
      'emptCompanyName': emptCompanyName,
      'emptCompanyAddress': emptCompanyAddress,
      'borrowerBankId': borrowerBankId,
      'isActiveEmp': isActiveEmp,
      'isManual': isManual,
      'bank': bank,
      'kycCount': kycCount,
      'confidence': confidence,
      'selfieMatchStatus': selfieMatchStatus,
      'aadhaarClientId': aadhaarClientId,
      'adhrCountry': adhrCountry,
      'adhrDist': adhrDist,
      'adhrState': adhrState,
      'adhrPo': adhrPo,
      'adhrPinCode': adhrPinCode,
      'adhrHouse': adhrHouse,
      'adhrLoc': adhrLoc,
      'adhrVtc': adhrVtc,
      'adhrSubdist': adhrSubdist,
      'adhrStreet': adhrStreet,
      'adhrLandmark': adhrLandmark,
      'loanList': loanList?.map((e) => e.toJson()).toList(),
      'totalLoanAmount': totalLoanAmount,
      'closedLoanCount': closedLoanCount,
      'activeLoanCount': activeLoanCount,
      'overdueLoanCount': overdueLoanCount,
      'verifyComment': verifyComment,
      'empInfoDto': empInfoDto?.toJson(),
      'addressDocStatus': addressDocStatus,
      'empDetailStatus': empDetailStatus,
      'isEmptManual': isEmptManual,
      'addressDto': addressDto?.toJson(),
      'kycUpdateBlocked': kycUpdateBlocked,
      'bankUpdateBlocked': bankUpdateBlocked,
      'isBankInfoValid': isBankInfoValid,
      'bankDto': bankDto?.toJson(),
      'curAddrStayYrs': curAddrStayYrs,
      'cinResDto': cinResDto?.toJson(),
      'gstResDto': gstResDto?.toJson(),
      'isCreditScrEnable': isCreditScrEnable,
      'stepEnum': stepEnum,
      'tncAccepted': tncAccepted,
      'docPwd': docPwd,
      'loanDataDocList': loanDataDocList?.map((e) => e.toJson()).toList(),
      'salaryPayDate': salaryPayDate,
      'payslipStatus': payslipStatus,
      'bankStmtStatus': bankStmtStatus,
      'isPayslipUploadStep': isPayslipUploadStep,
      ...super.toJson(),
    };
  }

  @override
  String toString() {
    return 'BorrowerDto(category: $category, gender: $gender, name: $name, fsname: $fsname, mobile: $mobile, mobileOtp: $mobileOtp, pan: $pan, gst: $gst, gstOtp: $gstOtp, occupation: $occupation, address: $address, adhrAddress: $adhrAddress, adhrPic: $adhrPic, isCurrentAddressSameAsAadhaar: $isCurrentAddressSameAsAadhaar, nomineeName: $nomineeName, nomineeMobile: $nomineeMobile, nomineeMobileOtp: $nomineeMobileOtp, nomineeAadhaar: $nomineeAadhaar, email: $email, emailOtp: $emailOtp, resendOtp: $resendOtp, nomineeRelation: $nomineeRelation, accountNumber: $accountNumber, ifsc: $ifsc, isAutoDeductOpt: $isAutoDeductOpt, isRepaymentAndCreditAccSame: $isRepaymentAndCreditAccSame, repaymentAccNum: $repaymentAccNum, repaymentAccIfsc: $repaymentAccIfsc, selfie: $selfie, isImageUpdated: $isImageUpdated, signUpStep: $signUpStep, kycStep: $kycStep, signUpStatus: $signUpStatus, aadhaar: $aadhaar, aadhaarOtp: $aadhaarOtp, kycStatus: $kycStatus, genderType: $genderType, dob: $dob, aadhaarResponse: $aadhaarResponse, aadhaarVerifyStatus: $aadhaarVerifyStatus, emailVerifyStatus: $emailVerifyStatus, emptVerifyStatus: $emptVerifyStatus, selfieVerifyStatus: $selfieVerifyStatus, bankVerifyStatus: $bankVerifyStatus, panVerifyStatus: $panVerifyStatus, addrVerifyStatus: $addrVerifyStatus, addrDocStatus: $addrDocStatus, addrUpdatedTime: $addrUpdatedTime, panUpdatedTime: $panUpdatedTime, panAddr: $panAddr, panLinkedWithAadhaar: $panLinkedWithAadhaar, panAadhaar: $panAadhaar, panName: $panName, panDob: $panDob, panCategory: $panCategory, careOf: $careOf, emailOtpRetryCount: $emailOtpRetryCount, emailOtpTime: $emailOtpTime, emailOtpVerified: $emailOtpVerified, kycPercentage: $kycPercentage, city: $city, street: $street, state: $state, pincode: $pincode, location: $location, house: $house, addrDocType: $addrDocType, addrDocUuid: $addrDocUuid, emptCompanyName: $emptCompanyName, emptCompanyAddress: $emptCompanyAddress, borrowerBankId: $borrowerBankId, isActiveEmp: $isActiveEmp, isManual: $isManual, bank: $bank, kycCount: $kycCount, confidence: $confidence, selfieMatchStatus: $selfieMatchStatus, aadhaarClientId: $aadhaarClientId, adhrCountry: $adhrCountry, adhrDist: $adhrDist, adhrState: $adhrState, adhrPo: $adhrPo, adhrPinCode: $adhrPinCode, adhrHouse: $adhrHouse, adhrLoc: $adhrLoc, adhrVtc: $adhrVtc, adhrSubdist: $adhrSubdist, adhrStreet: $adhrStreet, adhrLandmark: $adhrLandmark, loanList: $loanList, totalLoanAmount: $totalLoanAmount, closedLoanCount: $closedLoanCount, activeLoanCount: $activeLoanCount, overdueLoanCount: $overdueLoanCount, verifyComment: $verifyComment, empInfoDto: $empInfoDto, addressDocStatus: $addressDocStatus, empDetailStatus: $empDetailStatus, isEmptManual: $isEmptManual, addrVerifyComment: $addrVerifyComment, empInfoVerifyComment: $empInfoVerifyComment, addrDocExt: $addrDocExt, geoLat: $geoLat, geoLng: $geoLng, addressDto: $addressDto, kycUpdateBlocked: $kycUpdateBlocked, bankUpdateBlocked: $bankUpdateBlocked, isBankInfoValid: $isBankInfoValid, bankDto: $bankDto, curAddrStayYrs: $curAddrStayYrs, cinResDto: $cinResDto, gstResDto: $gstResDto, isCreditScrEnable: $isCreditScrEnable, stepEnum: $stepEnum, tncAccepted: $tncAccepted, docPwd: $docPwd, loanDataDocList: $loanDataDocList, salaryPayDate: $salaryPayDate)';
  }
}

EmploymentKycStatusEnum? _parseEmploymentKycStatus(dynamic value) {
  if (value == null) return null;
  final str = value.toString().toUpperCase();

  switch (str) {
    case "UNDER_VERIFICATION":
      return EmploymentKycStatusEnum.UNDER_VERIFICATION;
    case "VERIFIED":
      return EmploymentKycStatusEnum.VERIFIED;
    case "REJECTED":
      return EmploymentKycStatusEnum.REJECTED;
    default:
      return null; // unexpected string
  }
}

AddressProofTypeEnum? _parseAddressProofType(dynamic value) {
  if (value == null) return null;
  final str = value.toString().toUpperCase();
  // Assuming backend sends uppercase snake_case like "WATER_BILL"
  switch (str) {
    case "WATER_BILL":
      return AddressProofTypeEnum.WATER_BILL;
    case "ELECTRICITY_BILL":
      return AddressProofTypeEnum.ELECTRICITY_BILL;
    case "GAS_BILL":
      return AddressProofTypeEnum.GAS_BILL;
    case "TELEPHONE_BILL":
      return AddressProofTypeEnum.TELEPHONE_BILL;
    case "INTERNET_BILL":
      return AddressProofTypeEnum.INTERNET_BILL;
    case "POSTPAID_MOBILE_BILL":
      return AddressProofTypeEnum.POSTPAID_MOBILE_BILL;
    case "SALE_LEASE_RENT_AGREEMENT":
      return AddressProofTypeEnum.SALE_LEASE_RENT_AGREEMENT;
    default:
      return null;
  }
}

KycStatusEnum? _parseKycStatus(dynamic value) {
  if (value == null) return null;
  final str = value.toString().toUpperCase();

  switch (str) {
    case "UNDER_VERIFICATION":
      return KycStatusEnum.UNDER_VERIFICATION;
    case "APPROVED":
      return KycStatusEnum.APPROVED;
    case "REJECTED":
      return KycStatusEnum.REJECTED;
    case "OPEN":
      return KycStatusEnum.OPEN;
    default:
      return null; // unexpected string
  }
}
