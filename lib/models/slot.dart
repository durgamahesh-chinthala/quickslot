class Slot {
  final String id;
  final String venueId;
  final DateTime startTime;
  final DateTime endTime;
  final bool isBooked;
  final String? bookedByUserId;

  Slot({
    required this.id,
    required this.venueId,
    required this.startTime,
    required this.endTime,
    required this.isBooked,
    this.bookedByUserId,
  });

  factory Slot.fromMap(Map<String, dynamic> map) {
    return Slot(
      id: map['id'] as String,
      venueId: map['venueId'] as String,
      startTime: DateTime.parse(map['startTime'] as String),
      endTime: DateTime.parse(map['endTime'] as String),
      isBooked: map['isBooked'] as bool,
      bookedByUserId: map['bookedByUserId'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'venueId': venueId,
    'startTime': startTime.toIso8601String(),
    'endTime': endTime.toIso8601String(),
    'isBooked': isBooked,
    'bookedByUserId': bookedByUserId,
  };
}
