class TripModel {
  final int id;
  final String title;
  final String photo;
  final List<String> photos;
  final int price;
  final double rating;
  final int reviews;
  final String type;
  final String description;
  final List<String> includes;
  final List<String> excludes;
  final String terms;
  final Pax totalPax;

  TripModel({
    required this.id,
    required this.title,
    required this.photo,
    required this.photos,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.type,
    required this.description,
    required this.includes,
    required this.excludes,
    required this.terms,
    required this.totalPax,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      id: json['id'] as int,
      title: json['title'] as String,
      photo: json['photo'] as String,
      photos: List<String>.from(json['photos'] ?? []),
      price: json['price'] as int,
      rating: (json['rating'] as num).toDouble(),
      reviews: json['reviews'] as int,
      type: json['type'] as String,
      description: json['description'] as String,
      includes: List<String>.from(json['includes'] ?? []),
      excludes: List<String>.from(json['excludes'] ?? []),
      terms: json['terms'] as String,
      totalPax: Pax.fromJson(json['total_pax'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'photo': photo,
      'photos': photos,
      'price': price,
      'rating': rating,
      'reviews': reviews,
      'type': type,
      'description': description,
      'includes': includes,
      'excludes': excludes,
      'terms': terms,
      'total_pax': totalPax.toJson(),
    };
  }
}

class Pax {
  final int min;
  final int max;

  Pax({required this.min, required this.max});

  factory Pax.fromJson(Map<String, dynamic> json) {
    return Pax(
      min: json['min'] as int,
      max: json['max'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'min': min,
      'max': max,
    };
  }
}
