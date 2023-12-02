import 'dart:convert';

ValoresUnicosModel valoresUnicosModelFromJson(String str) =>
    ValoresUnicosModel.fromJson(json.decode(str));

String valoresUnicosModelToJson(ValoresUnicosModel data) =>
    json.encode(data.toJson());

class ValoresUnicosModel {
  String? valorUnico;

  ValoresUnicosModel({this.valorUnico});

  ValoresUnicosModel.fromJson(Map<String, dynamic> json) {
    valorUnico = json['valorUnico'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['valorUnico'] = this.valorUnico;
    return data;
  }
}
