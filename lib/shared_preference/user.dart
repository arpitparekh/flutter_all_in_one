import 'dart:convert';

class User {
  String name;
  String age;
  String address;
  String path;

  User(this.name, this.age, this.address, this.path);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
      'address': address,
      'path': path,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      map['name'] as String,
      map['age'] as String,
      map['address'] as String,
      map['path'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
