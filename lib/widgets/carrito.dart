// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tfg/providers/CarritoProvider.dart';

import 'package:tfg/widgets/articuloCarrito.dart';
import '../services/ApiService.dart';

//TODO Meter el total+hacer pedido
//TODO Meter en la API de Hacer Pedido el envio de email
//TODO Meter fucionalidad +/-
//TODO DIseño carrito vacio
//TODO OPCIONAL total cantidad articulo
//TODO Integrar Checkout

class Carrito extends StatefulWidget {
  final CarritoProvider carrito;
  const Carrito({Key? key, required this.carrito}) : super(key: key);

  @override
  State<Carrito> createState() => _CarritoState();
}

class _CarritoState extends State<Carrito> {
  String _usuario = "";
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();

    _getCarrito();
  }

  void _getCarrito() async {
    _prefs = await SharedPreferences.getInstance();
    _usuario = _prefs.getString('correo_usuario') ?? '';

    widget.carrito.actualizarCarrito(await ApiService().getCarrito(_usuario));
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    CarritoProvider carrito = Provider.of<CarritoProvider>(context);
    return Column(children: [
      const Text(
        "Tu carrito",
        style: TextStyle(color: Colors.black),
      ),
      (carrito.carritoModel.numeroArticulos) != null
          ? Text(
              "${carrito.carritoModel.numeroArticulos.toString()} artículos",
              style: Theme.of(context).textTheme.bodySmall,
            )
          : Text(
              "Vacío",
              style: Theme.of(context).textTheme.bodySmall,
            ),
      carrito.carritoModel.numeroArticulos != 0 &&
              carrito.carritoModel.numeroArticulos != null
          ? Expanded(
              child: ListView.builder(
                itemCount: carrito.carritoModel.listaArticulos?.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ArticuloCarrito(
                    articuloCarrito:
                        carrito.carritoModel.listaArticulos![index],
                  ),
                ),
              ),
            )
          : Text("No tienes artículos en tu carrito"),
    ]);
  }
}
