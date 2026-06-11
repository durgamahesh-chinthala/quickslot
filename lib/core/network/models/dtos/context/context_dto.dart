class ContextDto {
  String? podId;
  String? companyId;
  String? zoneId;
  String? branchId;
  String? tellerId;
  String? linerId;
  String? podName;
  String? groupName;
  String? companyName;
  String? zoneName;
  String? branchName;
  String? tellerName;
  String? linerName;
  String? kycProvider;

  ContextDto({
    this.podId,
    this.companyId,
    this.zoneId,
    this.branchId,
    this.tellerId,
    this.linerId,
    this.podName,
    this.groupName,
    this.companyName,
    this.zoneName,
    this.branchName,
    this.tellerName,
    this.linerName,
    this.kycProvider,
  });

  factory ContextDto.fromJson(Map<String, dynamic> json) {
    return ContextDto(
      podId: json['podId'],
      companyId: json['companyId'],
      zoneId: json['zoneId'],
      branchId: json['branchId'],
      tellerId: json['tellerId'],
      linerId: json['linerId'],
      podName: json['podName'],
      groupName: json["groupName"],
      companyName: json['companyName'],
      zoneName: json['zoneName'],
      branchName: json['branchName'],
      tellerName: json['tellerName'],
      linerName: json['linerName'],
      kycProvider: json['kycProvider'],
    );
  }

  Map<String, dynamic> toJson() => {
    'podId': podId,
    'companyId': companyId,
    'zoneId': zoneId,
    'branchId': branchId,
    'tellerId': tellerId,
    'linerId': linerId,
    'podName': podName,
    'groupName': groupName,
    'companyName': companyName,
    'zoneName': zoneName,
    'branchName': branchName,
    'tellerName': tellerName,
    'linerName': linerName,
    'kycProvider': kycProvider,
  };

  static List<ContextDto> listFromJson(List<dynamic> list) {
    return list.map((e) => ContextDto.fromJson(e)).toList();
  }
}
