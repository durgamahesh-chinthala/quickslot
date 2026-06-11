import 'package:quickslot/core/network/models/dtos/common_dtos/base_dto.dart';
import 'package:quickslot/core/network/models/dtos/loan/loan_data_dto.dart';

class LoanDataListDto extends BaseDto {
  List<LoanDataDto> loanDataList;

  LoanDataListDto({
    required this.loanDataList,

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
    "loanDataList": loanDataList.map((x) => x.toJson()).toList(),
    ...super.toJson(),
  };

  factory LoanDataListDto.fromJson(Map<String, dynamic> json) {
    return LoanDataListDto(
      loanDataList: List<LoanDataDto>.from(
        json["loanDataList"].map((x) => LoanDataDto.fromJson(x)),
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

  @override
  String toString() => 'LoanDataListDto(loanDataList: $loanDataList)';
}
