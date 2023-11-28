import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:tfg/models/ArticulosRelacionadosModel.dart';
import 'package:tfg/models/Respuesta.dart';
import 'package:tfg/models/UsuarioModel.dart';
import 'package:tfg/models/CarritoModel.dart';

import '../models/ArticuloModel.dart';

class Constants {
  //static String baseUrl = 'https://apis-tfg.onrender.com';
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
}

class ApiService {
  Future<Respuesta> modificarUsuario(nombre, email, password) async {
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

  Future<List<ArticuloModel>?> getListaArticulos() async {
    try {
      var url = Uri.parse(Constants.baseUrl + Constants.listaArticulosEndpoint);
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
}
