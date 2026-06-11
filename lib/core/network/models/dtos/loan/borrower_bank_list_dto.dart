import 'package:quickslot/core/network/models/dtos/borrower_bank_dto.dart';
import 'package:quickslot/core/network/models/dtos/common_dtos/base_dto.dart';

class BorrowerBankListDto extends BaseDto {
  List<BorrowerBankDto> borrowerBankList;

  BorrowerBankListDto({
    required this.borrowerBankList,

    super.id,
    super.randomNumber,
    super.pagesize,
    super.currentPage,
    super.totalPage,
    super.startItem,
    super.endItem,
    super.totalItem,
  });

  @override
  Map<String, dynamic> toJson() => {
    "borrowerBankList": borrowerBankList.map((x) => x.toJson()).toList(),
    ...super.toJson(),
  };

  factory BorrowerBankListDto.fromJson(Map<String, dynamic> json) {
    return BorrowerBankListDto(
      borrowerBankList: List<BorrowerBankDto>.from(
        json["borrowerBankList"].map((x) => BorrowerBankDto.fromJson(x)),
      ),
      id: json["id"],
      randomNumber: json["randomNumber"],
      pagesize: json["pagesize"],
      currentPage: json["currentPage"],
      totalPage: json["totalPage"],
      startItem: json["startItem"],
      endItem: json["endItem"],
      totalItem: json["totalItem"],
    );
  }
}
