class IdValueDto {
  String? id;
  String? value;

  IdValueDto({
    this.id,
    this.value,
  });

  factory IdValueDto.fromJson(Map<String, dynamic> json) {
    return IdValueDto(
      id: json['id'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'value': value,
      };

  static List<IdValueDto> listFromJson(List<dynamic> list) {
    return list.map((e) => IdValueDto.fromJson(e)).toList();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IdValueDto && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
