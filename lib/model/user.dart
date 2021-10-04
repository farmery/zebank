import 'dart:convert';

class User {
  String displayName;
  String id;
  String dateCreated;
  User({
    required this.displayName,
    required this.id,
    this.dateCreated = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'displayName': displayName,
      'id': id,
      'dateCreated': DateTime.now().toIso8601String()
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      displayName: map['displayName'],
      id: map['id'],
      dateCreated: map['dateCreated'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() =>
      'User(displayName: $displayName, id: $id, dateCreated: $dateCreated)';
}
