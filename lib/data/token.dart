import 'dart:convert';

Token fromJson(String str) =>
    Token.fromJson(json.decode(str));

String toJson(List<Token> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Token {
  String? token;
  bool status;
  String? response;

  Token({this.token, this.status = false, this.response});

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
        token: json["token"] ?? '',
        status: json['status'] ?? false,
        response: json['response'] ?? '',
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'token': token,
        'status': status,
        'response': response
      };
}
