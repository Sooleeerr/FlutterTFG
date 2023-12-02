import 'dart:convert';

import 'package:tfg/models/ArticuloModel.dart';

List<ArticulosRelacionadosModel> articulosRelacionadosModelFromJson(
        String str) =>
    List<ArticulosRelacionadosModel>.from(
        json.decode(str).map((x) => ArticulosRelacionadosModel.fromJson(x)));

String articulosRelacionadosModelToJson(
        List<ArticulosRelacionadosModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ArticulosRelacionadosModel {
  String? sId;
  String? idArticulo1;
  String? idArticulo2;
  List<ArticuloModel>? detalleArticulo;
  ArticulosRelacionadosModel(
      {this.sId, this.idArticulo1, this.idArticulo2, this.detalleArticulo});

  ArticulosRelacionadosModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    idArticulo1 = json['id_articulo1'];
    idArticulo2 = json['id_articulo2'];
    if (json['detalle_articulo'] != null) {
      detalleArticulo = <ArticuloModel>[];
      json['detalle_articulo'].forEach((v) {
        detalleArticulo!.add(new ArticuloModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['id_articulo1'] = this.idArticulo1;
    data['id_articulo2'] = this.idArticulo2;
    if (this.detalleArticulo != null) {
      data['detalle_articulo'] =
          this.detalleArticulo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
