import 'dart:convert';

User fromJson(String str) =>
    User.fromJson(json.decode(str));

String toJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  String? nombre;
  String? email;

  User({this.nombre, this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      nombre: json["nombre"] ?? '',
      email: json['email'] ?? '',
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'nombre': nombre,
        'email': email
      };
}
