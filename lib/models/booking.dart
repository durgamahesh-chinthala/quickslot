class Booking {
  final String id;
  final String userId;
  final String venueId;
  final String slotId;
  final DateTime bookedAt;
  final DateTime startTime;
  final DateTime endTime;
  final String venueName;

  Booking({
    required this.id,
    required this.userId,
    required this.venueId,
    required this.slotId,
    required this.bookedAt,
    required this.startTime,
    required this.endTime,
    required this.venueName,
  });

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      id: map['id'] as String,
      userId: map['userId'] as String,
      venueId: map['venueId'] as String,
      slotId: map['slotId'] as String,
      bookedAt: DateTime.parse(map['bookedAt'] as String),
      startTime: DateTime.parse(map['startTime'] as String),
      endTime: DateTime.parse(map['endTime'] as String),
      venueName: map['venueName'] as String,
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'userId': userId,
    'venueId': venueId,
    'slotId': slotId,
    'bookedAt': bookedAt.toIso8601String(),
    'startTime': startTime.toIso8601String(),
    'endTime': endTime.toIso8601String(),
    'venueName': venueName,
  };
}
