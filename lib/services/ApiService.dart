import 'dart:developer';

import 'package:http/http.dart' as http;

import '../models/ArticuloModel.dart';

class Constants {
  static String baseUrl = 'https://apis-tfg.onrender.com';
  static String listaArticulosEndpoint = '/listaArticulos';
  static String listaArticulosPromocionEndpoint = "/articulosPromocion";
}

class ApiService {
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
  }
}
