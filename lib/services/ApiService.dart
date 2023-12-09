import 'dart:convert';
import 'dart:developer';
//import 'dart:html';

import 'package:http/http.dart' as http;
import 'package:tfg/models/articulos_relacionados_model.dart';
import 'package:tfg/models/articulos_visitados_model.dart';
import 'package:tfg/models/filtro_model.dart';
import 'package:tfg/models/lista_pedidos_model.dart';
import 'package:tfg/models/pedido_model.dart';
import 'package:tfg/models/respuesta.dart';
import 'package:tfg/models/respuesta_creacion_pedido.dart';
import 'package:tfg/models/usuario_model.dart';
import 'package:tfg/models/carrito_model.dart';

import '../models/ArticuloModel.dart';

class Constants {
  //static String baseUrl = 'https://apis-tfg.onrender.com';
  //static String baseUrl = 'https://apistfg.onrender.com';
  static String baseUrl = 'http://10.0.2.2:4040';
  static String loginEndpoint = '/inicioSesion';
  static String listaArticulosEndpoint = '/listaArticulos';
  static String listaArticulosPromocionEndpoint = "/articulosPromocion";
  static String registroUsuarioEndpoint = "/registroUsuario";
  static String modificarUsuarioEndpoint = "/modificacionDatosUsuario";
  static String carritoEndpoint = "/listaCarrito";
  static String detalleArticuloEndpoint = "/detalleArticulo";
  static String visitaArticuloEndpoint = "/visitaArticulo";
  static String listaArticulosRelacionadosEndpoint = "/articulosRelacionados";
  static String modificarCarritoEndpoint = "/anadirArticuloCarrito";
  static String realizarPedidoEndpoint = "/realizarPedido";
  static String detallePedidoEndpoint = "/detallePedido";
  static String listaPedidosEndpoint = "/listaPedidos";
  static String mantenimientoPedidosEndpoint = "/listaPedidosAdmin";
  static String filtradoOpcionesEndpoint = "/filtradoOpciones";
  static String contarListaArticulosEndpoint = "/contarListaArticulos";
  static String listaArticulosVisitadosEndpoint = "/articulosVisitados";

  static String adminArticuloEndpoint = "/adminArticulo";
  static String modificaEstadoPedidoEndpoint = "/modificaEstadoPedido";
}

class ApiService {
  Map<String, String>? _getHeader(String token) {
    Map<String, String> header = {
      'Authorization':
          'Bearer $token', // Agrega el token JWT al encabezado 'Authorization'
      'Content-Type':
          'application/json', // El tipo de contenido de tu solicitud
    };
    return header;
  }

  Future<Respuesta?> nuevoArticulo(ArticuloModel articulo) async {
    try {
      String json = singleArticuloModelToJson(articulo);

      var url = Uri.parse(Constants.baseUrl + Constants.adminArticuloEndpoint);
      log(json);

      //var response = await http.post(url);
      var response = await http.post(url,
          headers: {
            'Content-Type':
                'application/json', // Especifica el tipo de contenido como JSON
          },
          body: json);

      Respuesta _respuesta = Respuesta();
      if (response.statusCode == 200) {
        _respuesta.respuestaCorrecta = true;
        _respuesta.mensajeRespuesta = "Articulo añadido/modificado";
        return _respuesta;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<RespuestaCreacionPedidoModel?> realizarPedido(idUsuario, token) async {
    try {
      var url = Uri.parse(Constants.baseUrl +
          Constants.realizarPedidoEndpoint +
          "/?idUsuario=" +
          idUsuario);

      var response = await http.post(url, headers: _getHeader(token));

      if (response.statusCode == 200) {
        RespuestaCreacionPedidoModel _respuesta =
            respuestaCreacionPedidoModelFromJson(response.body);
        return _respuesta;
      } else {
        RespuestaCreacionPedidoModel _respuesta =
            respuestaCreacionPedidoModelFromJson(response.body);
        return _respuesta;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<Respuesta> modificarUsuario(nombre, email, password, token) async {
    Respuesta respuesta = Respuesta();
    try {
      var url = Uri.parse(Constants.baseUrl +
          Constants.modificarUsuarioEndpoint +
          "/?nombreUsuario=" +
          nombre +
          "&idUsuario=" +
          email +
          "&contrasenaUsuario=" +
          password);
      log(url.toString());
      var response = await http.put(url, headers: _getHeader(token));
      log(response.toString());
      if (response.statusCode == 200) {
        respuesta.respuestaCorrecta = true;
        respuesta.mensajeRespuesta = response.body;
        return Future.value(respuesta);
      } else {
        respuesta.respuestaCorrecta = false;
        respuesta.mensajeRespuesta = response.body;
        return Future.value(respuesta);
      }
    } catch (e) {
      log(e.toString());
    }
    return Future.value(respuesta);
  }

  Future<Respuesta> modificarCarrito(
      idUsuario, idArticulo, cantidadArticulo, precioArticulo) async {
    Respuesta respuesta = Respuesta();
    try {
      var url = Uri.parse(Constants.baseUrl +
          Constants.modificarCarritoEndpoint +
          "/?idUsuario=" +
          idUsuario +
          "&idArticulo=" +
          idArticulo +
          "&cantidadArticulo=" +
          cantidadArticulo.toString() +
          "&precioArticulo=" +
          precioArticulo.toString());

      var response = await http.put(url);

      if (response.statusCode == 200) {
        respuesta.respuestaCorrecta = true;
        respuesta.mensajeRespuesta = response.body;
        return Future.value(respuesta);
      } else {
        respuesta.respuestaCorrecta = false;
        respuesta.mensajeRespuesta = response.body;
        return Future.value(respuesta);
      }
    } catch (e) {
      log(e.toString());
    }
    return Future.value(respuesta);
  }

  Future<UsuarioModel?> login(usuario, password) async {
    try {
      var url = Uri.parse(Constants.baseUrl +
          Constants.loginEndpoint +
          "/?idUsuario=" +
          usuario +
          "&contrasenaUsuario=" +
          password);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        UsuarioModel _usuario = usuarioModelFromJson(response.body);

        return _usuario;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<ArticuloModel?> detalleArticulo(idArticulo) async {
    try {
      var url = Uri.parse(Constants.baseUrl +
          Constants.detalleArticuloEndpoint +
          "/?idArticulo=" +
          idArticulo);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        ArticuloModel _articuloModel =
            singleArticuloModelFromJson(response.body);
        return _articuloModel;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<Respuesta> registro(nombre, email, password) async {
    Respuesta respuesta = Respuesta();
    try {
      var url = Uri.parse(Constants.baseUrl +
          Constants.registroUsuarioEndpoint +
          "/?nombreUsuario=" +
          nombre +
          "&emailUsuario=" +
          email +
          "&contrasenaUsuario=" +
          password);

      var response = await http.post(url);
      if (response.statusCode == 200) {
        respuesta.respuestaCorrecta = true;
        respuesta.mensajeRespuesta = response.body;
        return Future.value(respuesta);
      } else {
        respuesta.respuestaCorrecta = false;
        respuesta.mensajeRespuesta = response.body;
        return Future.value(respuesta);
      }
    } catch (e) {
      log(e.toString());
    }
    return Future.value(respuesta);
  }

  void visitaArticulo(idUsuario, idArticulo) async {
    Respuesta respuesta = Respuesta();
    try {
      var url = Uri.parse(Constants.baseUrl +
          Constants.visitaArticuloEndpoint +
          "/?idUsuario=" +
          idUsuario +
          "&idArticulo=" +
          idArticulo);

      var response = await http.post(url);
      if (response.statusCode == 200) {
        respuesta.respuestaCorrecta = true;
        respuesta.mensajeRespuesta = response.body;
        return;
      } else {
        respuesta.respuestaCorrecta = false;
        respuesta.mensajeRespuesta = response.body;
        return;
      }
    } catch (e) {
      log(e.toString());
    }
    return;
  }

  String parametroListaArticulos(FiltroModel filtro) {
    String parametrosMarca = "";
    String parametrosModelo = "";
    String parametrosColor = "";
    String parametrosAlmacenamiento = "";
    if (filtro.valoresMarca.isNotEmpty) {
      parametrosMarca =
          filtro.valoresMarca.map((item) => 'marcaArticulo=$item').join('&') +
              "&";
    }
    if (filtro.valoresModelo.isNotEmpty) {
      parametrosModelo =
          filtro.valoresModelo.map((item) => 'modeloArticulo=$item').join('&') +
              "&";
    }
    if (filtro.valoresColor.isNotEmpty) {
      parametrosColor =
          filtro.valoresColor.map((item) => 'colorArticulo=$item').join('&') +
              "&";
    }
    if (filtro.valoresAlmacenamiento.isNotEmpty) {
      parametrosAlmacenamiento = filtro.valoresAlmacenamiento
              .map((item) => 'almacenamientoArticulo=$item')
              .join('&') +
          "&";
    }
    return parametrosAlmacenamiento +
        parametrosColor +
        parametrosMarca +
        parametrosModelo +
        "&precioMinimo=${filtro.precioMin}" +
        "&precioMaximo=${filtro.precioMax}";
  }

  Future<List<ArticuloModel>?> getListaArticulos(FiltroModel filtro) async {
    try {
      var url = Uri.parse(Constants.baseUrl +
          Constants.listaArticulosEndpoint +
          "/?sortPrecio=" +
          filtro.ordenacion.toString() +
          "&" +
          parametroListaArticulos(filtro));
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<ArticuloModel> _model = articuloModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<int?> getContarListaArticulos(FiltroModel filtro) async {
    try {
      var url = Uri.parse(Constants.baseUrl +
          Constants.contarListaArticulosEndpoint +
          "/?" +
          parametroListaArticulos(filtro));
      var response = await http.get(url);
      if (response.statusCode == 200) {
        int resultado = int.parse(response.body);
        return resultado;
      }
    } catch (e) {
      log(e.toString());
    }
    return 0;
  }

  Future<List<ArticulosRelacionadosModel>?> getListaArticulosRelacionados(
      String idArticulo) async {
    try {
      var url = Uri.parse(Constants.baseUrl +
          Constants.listaArticulosRelacionadosEndpoint +
          "/?idArticulo=" +
          idArticulo);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<ArticulosRelacionadosModel> _model =
            articulosRelacionadosModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<ArticulosVisitadosModel>?> getListaArticulosVisitados(
      String idUsuario) async {
    try {
      var url = Uri.parse(Constants.baseUrl +
          Constants.listaArticulosVisitadosEndpoint +
          "/?idUsuario=" +
          idUsuario);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<ArticulosVisitadosModel> _model =
            articulosVisitadosModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<ArticuloModel>?> getListaArticulosPromocion() async {
    try {
      var url = Uri.parse(
          Constants.baseUrl + Constants.listaArticulosPromocionEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<ArticuloModel> _model = articuloModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<CarritoModel> getCarrito(usuario) async {
    try {
      var url = Uri.parse(Constants.baseUrl +
          Constants.carritoEndpoint +
          "/?idUsuario=" +
          usuario);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        CarritoModel carrito = carritoModelFromJson(response.body);
        return carrito;
      }
    } catch (e) {
      log(e.toString());
    }
    return CarritoModel();
  }

  Future<PedidoModel?> getPedido(idPedido) async {
    try {
      var url = Uri.parse(Constants.baseUrl +
          Constants.detallePedidoEndpoint +
          "/?idPedido=" +
          idPedido);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        PedidoModel pedido = pedidoModelFromJson(response.body);
        return pedido;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
    return null;
  }

  Future<List<String>?> getFiltradoOpciones(atributo) async {
    try {
      var url = Uri.parse(Constants.baseUrl +
          Constants.filtradoOpcionesEndpoint +
          "/?atributo=" +
          atributo);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<String> valoresUnicos = jsonDecode(response.body).cast<String>();
        return valoresUnicos;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
    return null;
  }

  Future<List<ListaPedidosModel>?> getListaPedidos(idUsuario) async {
    try {
      var url = Uri.parse(Constants.baseUrl +
          Constants.listaPedidosEndpoint +
          "/?idUsuario=" +
          idUsuario);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<ListaPedidosModel> pedido =
            listaPedidosModelFromJson(response.body);
        return pedido;
      }
    } catch (e) {
      log(e.toString());
      return [];
    }
    return [];
  }

  Future<List<ListaPedidosModel>?> getMantenimientoPedidos() async {
    try {
      var url =
          Uri.parse(Constants.baseUrl + Constants.mantenimientoPedidosEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<ListaPedidosModel> pedido =
            listaPedidosModelFromJson(response.body);
        return pedido;
      }
    } catch (e) {
      log(e.toString());
      return [];
    }
    return [];
  }

  Future<Respuesta> modificarEstadoPedido(idPedido, estadoPedido) async {
    Respuesta respuesta = Respuesta();
    try {
      var url = Uri.parse(Constants.baseUrl +
          Constants.modificaEstadoPedidoEndpoint +
          "/?estadoPedido=" +
          estadoPedido +
          "&idPedido=" +
          idPedido);
      log(url.toString());
      var response = await http.put(url);
      log(response.toString());
      if (response.statusCode == 200) {
        respuesta.respuestaCorrecta = true;
        respuesta.mensajeRespuesta = response.body;
        return Future.value(respuesta);
      } else {
        respuesta.respuestaCorrecta = false;
        respuesta.mensajeRespuesta = response.body;
        return Future.value(respuesta);
      }
    } catch (e) {
      log(e.toString());
    }
    return Future.value(respuesta);
  }
}
