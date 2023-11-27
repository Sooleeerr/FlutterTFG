import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:tfg/models/Respuesta.dart';
import 'package:tfg/models/UsuarioModel.dart';

import '../models/ArticuloModel.dart';

class Constants {
  //static String baseUrl = 'https://apis-tfg.onrender.com';
  static String baseUrl = 'http://10.0.2.2:4040';
  static String loginEndpoint = '/inicioSesion';
  static String listaArticulosEndpoint = '/listaArticulos';
  static String listaArticulosPromocionEndpoint = "/articulosPromocion";
  static String registroUsuarioEndpoint = "/registroUsuario";
  static String modificarUsuarioEndpoint = "/modificacionDatosUsuario";
}
//TODO API Carrito + Model
//TODO API Lista Pedidos+Model

//TODO API Articulos Relacionados - Falta Modificar API NODEJS para traer los detalles de cada articulo
//TODO API Articulos Visitados - Falta Modificar API NODEJS para traer los detalles de cada articulo
//TODO API Realizar Pedido - Falta hacer API NODEJS de creación de pedido
//TODO API Visitar Articulo

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
}
