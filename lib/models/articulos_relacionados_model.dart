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
  //List<DetalleArticulo>? detalleArticulo;
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

class DetalleArticulo {
  String? sId;
  String? nombreArticulo;
  String? marcaArticulo;
  String? modeloArticulo;
  int? precioArticulo;
  String? colorArticulo;
  String? almacenamientoArticulo;
  String? fotoArticulo;
  String? idArticulo;
  String? articuloPromocion;

  DetalleArticulo(
      {this.sId,
      this.nombreArticulo,
      this.marcaArticulo,
      this.modeloArticulo,
      this.precioArticulo,
      this.colorArticulo,
      this.almacenamientoArticulo,
      this.fotoArticulo,
      this.idArticulo,
      this.articuloPromocion});

  DetalleArticulo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    nombreArticulo = json['nombre_articulo'];
    marcaArticulo = json['marca_articulo'];
    modeloArticulo = json['modelo_articulo'];
    precioArticulo = json['precio_articulo'];
    colorArticulo = json['color_articulo'];
    almacenamientoArticulo = json['almacenamiento_articulo'];
    fotoArticulo = json['foto_articulo'];
    idArticulo = json['id_articulo'];
    articuloPromocion = json['articulo_promocion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['nombre_articulo'] = this.nombreArticulo;
    data['marca_articulo'] = this.marcaArticulo;
    data['modelo_articulo'] = this.modeloArticulo;
    data['precio_articulo'] = this.precioArticulo;
    data['color_articulo'] = this.colorArticulo;
    data['almacenamiento_articulo'] = this.almacenamientoArticulo;
    data['foto_articulo'] = this.fotoArticulo;
    data['id_articulo'] = this.idArticulo;
    data['articulo_promocion'] = this.articuloPromocion;
    return data;
  }
}
