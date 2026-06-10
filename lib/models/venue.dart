class Venue {
  final String id;
  final String name;
  final String location;
  final String imageUrl;
  final double rating;

  Venue({
    required this.id,
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.rating,
  });

  factory Venue.fromMap(Map<String, dynamic> map) {
    return Venue(
      id: map['id'] as String,
      name: map['name'] as String,
      location: map['location'] as String,
      imageUrl: map['imageUrl'] as String? ?? '',
      rating: (map['rating'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'location': location,
    'imageUrl': imageUrl,
    'rating': rating,
  };
}
