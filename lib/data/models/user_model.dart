class UserModel {
  final String firstName;
  final String lastName;
  final String gender;
  final int age;

  final String city;
  final String state;
  final String country;

  final String image;
  final String largeImage;

  final String email;

  final int? matchPercent;

  final String? relationshipStatus;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.age,
    required this.city,
    required this.state,
    required this.country,
    required this.image,
    required this.largeImage,
    required this.email,
    this.matchPercent,
    this.relationshipStatus,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final location = json['location'];
    final dob = json['dob'];
    final picture = json['picture'];

    return UserModel(
      firstName: name['first'],
      lastName: name['last'],
      gender: json['gender'],
      age: dob['age'],
      city: location['city'],
      state: location['state'],
      country: location['country'],
      image: picture['medium'],
      largeImage: picture['large'],
      email: json['email'],
      matchPercent: _readMatchPercent(json),
      relationshipStatus: _readRelationshipStatus(json),
    );
  }

  static int? _readMatchPercent(Map<String, dynamic> json) {
    final raw = json['matchPercent'] ?? json['match'];

    if (raw == null) return null;
    if (raw is num) return raw.toInt();
    return int.tryParse(raw.toString());
  }

  static String? _readRelationshipStatus(Map<String, dynamic> json) {
    final raw = json['relationshipStatus'] ??
        json['relationship'] ??
        json['relationship_status'];

    if (raw == null) return null;
    return raw.toString();
  }

  String get fullName => '$firstName $lastName';

  String get location => '$city, $state';
}
