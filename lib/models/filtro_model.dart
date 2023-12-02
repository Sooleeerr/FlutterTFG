import 'dart:core';

class FiltroModel {
  List<String> valoresMarca = [];
  List<String> valoresModelo = [];
  List<String> valoresAlmacenamiento = [];
  List<String> valoresColor = [];
  int ordenacion = 0;
  double precioMin = 0;
  double precioMax = 1000;
  double _defaultPrecioMin = 0;
  double _defaultPrecioMax = 1000;
  List<String> get getValoresMarca => this.valoresMarca;

  set setValoresMarca(List<String> valoresMarca) =>
      this.valoresMarca = valoresMarca;

  get getValoresModelo => this.valoresModelo;

  set setValoresModelo(valoresModelo) => this.valoresModelo = valoresModelo;

  get getValoresAlmacenamiento => this.valoresAlmacenamiento;

  set setValoresAlmacenamiento(valoresAlmacenamiento) =>
      this.valoresAlmacenamiento = valoresAlmacenamiento;

  get getValoresColor => this.valoresColor;

  set setValoresColor(valoresColor) => this.valoresColor = valoresColor;

  get getOrdenacion => this.ordenacion;

  set setOrdenacion(ordenacion) => this.ordenacion = ordenacion;

  bool getFiltroAplicado() {
    if (valoresMarca.isEmpty &&
        valoresAlmacenamiento.isEmpty &&
        valoresColor.isEmpty &&
        valoresModelo.isEmpty &&
        precioMin == _defaultPrecioMin &&
        precioMax == _defaultPrecioMax)
      return false;
    else
      return true;
  }
}
