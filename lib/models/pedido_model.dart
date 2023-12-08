import 'dart:convert';

PedidoModel pedidoModelFromJson(String str) =>
    PedidoModel.fromJson(json.decode(str));

String pedidoModelToJson(PedidoModel data) => json.encode(data.toJson());

class PedidoModel {
  String? sId;
  String? idPedido;
  String? idUsuario;
  List<ListaArticulosPedido>? listaArticulos;
  int? precioPedido;
  String? fechaPedido;
  String? estadoPedido;

  PedidoModel(
      {this.sId,
      this.idPedido,
      this.idUsuario,
      this.listaArticulos,
      this.precioPedido,
      this.fechaPedido,
      this.estadoPedido});

  PedidoModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    idPedido = json['id_pedido'];
    idUsuario = json['id_usuario'];
    if (json['lista_articulos'] != null) {
      listaArticulos = <ListaArticulosPedido>[];
      json['lista_articulos'].forEach((v) {
        listaArticulos!.add(new ListaArticulosPedido.fromJson(v));
      });
    }
    precioPedido = json['precio_pedido'];
    fechaPedido = json['fecha_pedido'];
    estadoPedido = json['estado_pedido'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['id_pedido'] = this.idPedido;
    data['id_usuario'] = this.idUsuario;
    if (this.listaArticulos != null) {
      data['lista_articulos'] =
          this.listaArticulos!.map((v) => v.toJson()).toList();
    }
    data['precio_pedido'] = this.precioPedido;
    data['fecha_pedido'] = this.fechaPedido;
    data['estado_pedido'] = this.estadoPedido;
    return data;
  }
}

class ListaArticulosPedido {
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

  ListaArticulosPedido(
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

  ListaArticulosPedido.fromJson(Map<String, dynamic> json) {
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
