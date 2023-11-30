import 'dart:convert';

List<ListaPedidosModel> listaPedidosModelFromJson(String str) =>
    List<ListaPedidosModel>.from(
        json.decode(str).map((x) => ListaPedidosModel.fromJson(x)));

String listaPedidosModelToJson(List<ListaPedidosModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListaPedidosModel {
  String? sId;
  String? idPedido;
  String? idUsuario;
  List<ListaArticulos>? listaArticulos;
  int? precioPedido;
  String? fechaPedido;

  ListaPedidosModel(
      {this.sId,
      this.idPedido,
      this.idUsuario,
      this.listaArticulos,
      this.precioPedido,
      this.fechaPedido});

  ListaPedidosModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    idPedido = json['id_pedido'];
    idUsuario = json['id_usuario'];
    if (json['lista_articulos'] != null) {
      listaArticulos = <ListaArticulos>[];
      json['lista_articulos'].forEach((v) {
        listaArticulos!.add(new ListaArticulos.fromJson(v));
      });
    }
    precioPedido = json['precio_pedido'];
    fechaPedido = json['fecha_pedido'];
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
    return data;
  }
}

class ListaArticulos {
  String? idArticulo;
  int? cantidadArticulo;
  String? precioArticulo;

  ListaArticulos({this.idArticulo, this.cantidadArticulo, this.precioArticulo});

  ListaArticulos.fromJson(Map<String, dynamic> json) {
    idArticulo = json['id_articulo'];
    cantidadArticulo = json['cantidad_articulo'];
    precioArticulo = json['precio_articulo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_articulo'] = this.idArticulo;
    data['cantidad_articulo'] = this.cantidadArticulo;
    data['precio_articulo'] = this.precioArticulo;
    return data;
  }
}
