import 'dart:convert';

class CarritoModel {
  String? sId;
  String? idUsuario;
  List<ListaArticulos>? listaArticulos;
  int? precioTotal;
  String? estado;
  int? numeroArticulos;

  CarritoModel(
      {this.sId,
      this.idUsuario,
      this.listaArticulos,
      this.precioTotal,
      this.estado,
      this.numeroArticulos});

  CarritoModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    idUsuario = json['id_usuario'];
    if (json['lista_articulos'] != null) {
      listaArticulos = <ListaArticulos>[];
      json['lista_articulos'].forEach((v) {
        listaArticulos!.add(new ListaArticulos.fromJson(v));
      });
    }
    precioTotal = json['precio_total'];
    estado = json['estado'];
    numeroArticulos = json['numero_articulos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['id_usuario'] = this.idUsuario;
    if (this.listaArticulos != null) {
      data['lista_articulos'] =
          this.listaArticulos!.map((v) => v.toJson()).toList();
    }
    data['precio_total'] = this.precioTotal;
    data['estado'] = this.estado;
    data['numero_articulos'] = this.numeroArticulos;
    return data;
  }
}

class ListaArticulos {
  String? idArticulo;
  String? nombreArticulo;
  String? marcaArticulo;
  String? modeloArticulo;
  String? precioArticulo;
  String? colorArticulo;
  String? almacenamientoArticulo;
  String? fotoArticulo;
  String? articuloPromocion;
  int? cantidadArticulo;
  int? precioTotalArticulo;

  ListaArticulos(
      {this.idArticulo,
      this.nombreArticulo,
      this.marcaArticulo,
      this.modeloArticulo,
      this.precioArticulo,
      this.colorArticulo,
      this.almacenamientoArticulo,
      this.fotoArticulo,
      this.articuloPromocion,
      this.cantidadArticulo,
      this.precioTotalArticulo});

  ListaArticulos.fromJson(Map<String, dynamic> json) {
    idArticulo = json['id_articulo'];
    nombreArticulo = json['nombre_articulo'];
    marcaArticulo = json['marca_articulo'];
    modeloArticulo = json['modelo_articulo'];
    precioArticulo = json['precio_articulo'];
    colorArticulo = json['color_articulo'];
    almacenamientoArticulo = json['almacenamiento_articulo'];
    fotoArticulo = json['foto_articulo'];
    articuloPromocion = json['articulo_promocion'];
    cantidadArticulo = json['cantidad_articulo'];
    precioTotalArticulo = json['precio_total_articulo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_articulo'] = this.idArticulo;
    data['nombre_articulo'] = this.nombreArticulo;
    data['marca_articulo'] = this.marcaArticulo;
    data['modelo_articulo'] = this.modeloArticulo;
    data['precio_articulo'] = this.precioArticulo;
    data['color_articulo'] = this.colorArticulo;
    data['almacenamiento_articulo'] = this.almacenamientoArticulo;
    data['foto_articulo'] = this.fotoArticulo;
    data['articulo_promocion'] = this.articuloPromocion;
    data['cantidad_articulo'] = this.cantidadArticulo;
    data['precio_total_articulo'] = this.precioTotalArticulo;
    return data;
  }
}
