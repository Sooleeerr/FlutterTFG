import 'dart:convert';

import 'package:tfg/models/ArticuloModel.dart';

List<ArticulosVisitadosModel> articulosVisitadosModelFromJson(String str) =>
    List<ArticulosVisitadosModel>.from(
        json.decode(str).map((x) => ArticulosVisitadosModel.fromJson(x)));

String articulosVisitadosModelToJson(List<ArticulosVisitadosModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ArticulosVisitadosModel {
  String? sId;
  String? idUsuario;
  String? idArticulo;
  String? timestampVisita;
  List<ArticuloModel>? detalleArticulo;

  ArticulosVisitadosModel(
      {this.sId,
      this.idUsuario,
      this.idArticulo,
      this.timestampVisita,
      this.detalleArticulo});

  ArticulosVisitadosModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    idUsuario = json['id_usuario'];
    idArticulo = json['id_articulo'];
    timestampVisita = json['timestamp_visita'];
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
    data['id_usuario'] = this.idUsuario;
    data['id_articulo'] = this.idArticulo;
    data['timestamp_visita'] = this.timestampVisita;
    if (this.detalleArticulo != null) {
      data['detalle_articulo'] =
          this.detalleArticulo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
