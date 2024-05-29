import 'dart:convert';

List<Decunica> fromJson(String str) =>
    List<Decunica>.from(json.decode(str).map((x) => Decunica.fromJson(x)));

String toJson(List<Decunica> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Decunica {
  String? id;
  String? cliente;
  String? via;
  String? canal;
  String? regimen;
  String? fecha_llegada;
  String? fecha_declaracion;
  String? fecha_levante;
  String? fecha_retiro;
  String? dam;

  Decunica({
      this.id,
      this.cliente,
      this.via,
      this.canal,
      this.regimen,
      this.fecha_llegada,
      this.fecha_declaracion,
      this.fecha_levante,
      this.fecha_retiro,
      this.dam});

  factory Decunica.fromJson(Map<String, dynamic> json) {
    return Decunica(
        id: json["id"] ?? '',
        cliente: json["cliente"] ?? '',
        via: json["via"] ?? '',
        canal: json["canal"] ?? '',
        regimen: json["regimen"] ?? '',
        fecha_llegada: json["fecha_llegada"] ?? '',
        fecha_declaracion: json["fecha_declaracion"] ?? '',
        fecha_levante: json["fecha_levante"] ?? '',
        fecha_retiro: json["fecha_retiro"] ?? '',
        dam: json["dam"] ?? ''
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'cliente': cliente,
        'via': via,
        'canal': canal,
        'regimen': regimen,
        'fecha_llegada': fecha_llegada,
        'fecha_declaracion': fecha_declaracion,
        'fecha_levante': fecha_levante,
        'fecha_retiro': fecha_retiro,
        'dam': dam
      };
}
