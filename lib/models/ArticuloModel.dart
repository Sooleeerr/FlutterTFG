import 'dart:convert';

List<ArticuloModel> articuloModelFromJson(String str) =>
    List<ArticuloModel>.from(
        json.decode(str).map((x) => ArticuloModel.fromJson(x)));

String articuloModelToJson(List<ArticuloModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ArticuloModel {
  String? _sId;
  String? _nombreArticulo;
  String? _marcaArticulo;
  String? _modeloArticulo;
  int? _precioArticulo;
  String? _colorArticulo;
  String? _almacenamientoArticulo;
  String? _fotoArticulo;
  String? _idArticulo;
  String? _articuloPromocion;

  ArticuloModel(
      {String? sId,
      String? nombreArticulo,
      String? marcaArticulo,
      String? modeloArticulo,
      int? precioArticulo,
      String? colorArticulo,
      String? almacenamientoArticulo,
      String? fotoArticulo,
      String? idArticulo,
      String? articuloPromocion}) {
    if (sId != null) {
      this._sId = sId;
    }
    if (nombreArticulo != null) {
      this._nombreArticulo = nombreArticulo;
    }
    if (marcaArticulo != null) {
      this._marcaArticulo = marcaArticulo;
    }
    if (modeloArticulo != null) {
      this._modeloArticulo = modeloArticulo;
    }
    if (precioArticulo != null) {
      this._precioArticulo = precioArticulo;
    }
    if (colorArticulo != null) {
      this._colorArticulo = colorArticulo;
    }
    if (almacenamientoArticulo != null) {
      this._almacenamientoArticulo = almacenamientoArticulo;
    }
    if (fotoArticulo != null) {
      this._fotoArticulo = fotoArticulo;
    }
    if (idArticulo != null) {
      this._idArticulo = idArticulo;
    }
    if (articuloPromocion != null) {
      this._articuloPromocion = articuloPromocion;
    }
  }

  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get nombreArticulo => _nombreArticulo;
  set nombreArticulo(String? nombreArticulo) =>
      _nombreArticulo = nombreArticulo;
  String? get marcaArticulo => _marcaArticulo;
  set marcaArticulo(String? marcaArticulo) => _marcaArticulo = marcaArticulo;
  String? get modeloArticulo => _modeloArticulo;
  set modeloArticulo(String? modeloArticulo) =>
      _modeloArticulo = modeloArticulo;
  int? get precioArticulo => _precioArticulo;
  set precioArticulo(int? precioArticulo) => _precioArticulo = precioArticulo;
  String? get colorArticulo => _colorArticulo;
  set colorArticulo(String? colorArticulo) => _colorArticulo = colorArticulo;
  String? get almacenamientoArticulo => _almacenamientoArticulo;
  set almacenamientoArticulo(String? almacenamientoArticulo) =>
      _almacenamientoArticulo = almacenamientoArticulo;
  String? get fotoArticulo => _fotoArticulo;
  set fotoArticulo(String? fotoArticulo) => _fotoArticulo = fotoArticulo;
  String? get idArticulo => _idArticulo;
  set idArticulo(String? idArticulo) => _idArticulo = idArticulo;
  String? get articuloPromocion => _articuloPromocion;
  set articuloPromocion(String? articuloPromocion) =>
      _articuloPromocion = articuloPromocion;

  ArticuloModel.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _nombreArticulo = json['nombre_articulo'];
    _marcaArticulo = json['marca_articulo'];
    _modeloArticulo = json['modelo_articulo'];
    _precioArticulo = json['precio_articulo'];
    _colorArticulo = json['color_articulo'];
    _almacenamientoArticulo = json['almacenamiento_articulo'];
    _fotoArticulo = json['foto_articulo'];
    _idArticulo = json['id_articulo'];
    _articuloPromocion = json['articulo_promocion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    data['nombre_articulo'] = this._nombreArticulo;
    data['marca_articulo'] = this._marcaArticulo;
    data['modelo_articulo'] = this._modeloArticulo;
    data['precio_articulo'] = this._precioArticulo;
    data['color_articulo'] = this._colorArticulo;
    data['almacenamiento_articulo'] = this._almacenamientoArticulo;
    data['foto_articulo'] = this._fotoArticulo;
    data['id_articulo'] = this._idArticulo;
    data['articulo_promocion'] = this._articuloPromocion;
    return data;
  }
}
