import 'dart:convert';

List<ArticuloModel> articuloModelFromJson(String str) =>
    List<ArticuloModel>.from(
        json.decode(str).map((x) => ArticuloModel.fromJson(x)));

String articuloModelToJson(List<ArticuloModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

ArticuloModel singleArticuloModelFromJson(String str) =>
    ArticuloModel.fromJson(json.decode(str));

String singleArticuloModelToJson(ArticuloModel data) =>
    json.encode(data.toJson());

class ArticuloModel {
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
  String? descripcionArticulo;
  int? precioArticuloAnterior;
  int? stock;

  ArticuloModel(
      {this.sId,
      this.nombreArticulo,
      this.marcaArticulo,
      this.modeloArticulo,
      this.precioArticulo,
      this.colorArticulo,
      this.almacenamientoArticulo,
      this.fotoArticulo,
      this.idArticulo,
      this.articuloPromocion,
      this.descripcionArticulo,
      this.precioArticuloAnterior,
      this.stock});

  ArticuloModel.fromJson(Map<String, dynamic> json) {
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
    descripcionArticulo = json['descripcion_articulo'];
    precioArticuloAnterior = json['precio_articulo_anterior'];
    stock = json['stock'];
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
    data['descripcion_articulo'] = this.descripcionArticulo;
    data['precio_articulo_anterior'] = this.precioArticuloAnterior;
    data['stock'] = this.stock;
    return data;
  }
}
