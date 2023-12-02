import 'package:flutter/material.dart';
import 'package:tfg/models/carrito_model.dart';

class CarritoProvider extends ChangeNotifier {
  CarritoModel carritoModel = CarritoModel(numeroArticulos: 0);
  void actualizarCarrito(CarritoModel carrito) {
    this.carritoModel = carrito;
    notifyListeners();
  }

  void inicializarCarrito() {
    this.carritoModel = CarritoModel(numeroArticulos: 0);
    notifyListeners();
  }
}
