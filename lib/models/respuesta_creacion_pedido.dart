import 'dart:convert';

RespuestaCreacionPedidoModel respuestaCreacionPedidoModelFromJson(String str) =>
    RespuestaCreacionPedidoModel.fromJson(json.decode(str));

String respuestaCreacionPedidoModelToJson(RespuestaCreacionPedidoModel data) =>
    json.encode(data.toJson());

class RespuestaCreacionPedidoModel {
  String? mensaje;
  String? idPedido;

  RespuestaCreacionPedidoModel({this.mensaje, this.idPedido});

  RespuestaCreacionPedidoModel.fromJson(Map<String, dynamic> json) {
    mensaje = json['mensaje'];
    idPedido = json['id_pedido'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mensaje'] = this.mensaje;
    data['id_pedido'] = this.idPedido;
    return data;
  }
}
