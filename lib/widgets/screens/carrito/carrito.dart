import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tfg/constants.dart';
import 'package:tfg/models/carrito_model.dart';
import 'package:tfg/models/respuesta.dart';
import 'package:tfg/models/respuesta_creacion_pedido.dart';
import 'package:tfg/providers/CarritoProvider.dart';

import 'package:tfg/widgets/screens/carrito/components/articuloCarrito.dart';
import 'package:tfg/widgets/screens/detallePedido/detallePedido.dart';

import '../../../services/ApiService.dart';

//TODO Integrar Checkout

class Carrito extends StatefulWidget {
  final CarritoProvider carrito;
  final Function(int) callback;
  const Carrito({Key? key, required this.carrito, required this.callback})
      : super(key: key);

  @override
  State<Carrito> createState() => _CarritoState();
}

class _CarritoState extends State<Carrito> {
  String _usuario = "";
  late SharedPreferences _prefs;
  late CarritoModel carritoModel;

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

  void modificaArticulosCallBack(anadirBool, idArticulo, precioArticulo) async {
    Respuesta registroOK = (await ApiService().modificarCarrito(
        _usuario, idArticulo, anadirBool ? "+1" : "-1", precioArticulo));
    _getCarrito();
  }

  Future<String?> _aceptarPedido() async {
    RespuestaCreacionPedidoModel? registroOK =
        await ApiService().realizarPedido(_usuario);
    if (registroOK != null) {
      _getCarrito();
      // ignore: avoid_single_cascade_in_expression_statements
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetallePedido(
                numPedido: registroOK.idPedido.toString(),
                vieneCompra: true,
              )))
        ..then((value) => widget.callback(0));
      return registroOK.idPedido;
    }
    return null;
  }

  Future<void> _realizarPedido(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
              '¿Acepta el pago de ${numberFormatter.format(carritoModel.precioTotal)} €?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Future<String?> _respuesta = _aceptarPedido();

                    ;
                  },
                  child: const Text('Pagar'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancelar'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    CarritoProvider carrito = Provider.of<CarritoProvider>(context);
    carritoModel = carrito.carritoModel;
    return Column(children: [
      SizedBox(
        height: 30,
      ),
      const Text(
        "Tu carrito",
        style: TextStyle(color: Colors.black),
      ),
      (carritoModel.numeroArticulos) != null
          ? Text(
              "${carritoModel.numeroArticulos.toString()} artículos",
              style: Theme.of(context).textTheme.bodySmall,
            )
          : const SizedBox(),
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
                    callback: modificaArticulosCallBack,
                  ),
                ),
              ),
            )
          : Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Vaya, todavía no has añadido ningún artículo a tu carrito...",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                const Icon(
                  Icons.remove_shopping_cart,
                  size: 150,
                  color: kPrimaryColor,
                ),
              ],
            ),
      Container(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
        // height: 174,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -15),
              blurRadius: 20,
              color: const Color(0xFFDADADA).withOpacity(0.15),
            )
          ],
        ),
        child: SafeArea(
          child: (carrito.carritoModel.numeroArticulos != 0 &&
                  carrito.carritoModel.numeroArticulos != null)
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              text: "Total:\n",
                              children: [
                                TextSpan(
                                  text: carrito.carritoModel.precioTotal != null
                                      ? "${numberFormatter.format(carrito.carritoModel.precioTotal)} €"
                                      : "0",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              _realizarPedido(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Pagar con  "),
                                Image.asset(
                                  'assets/images/paypal.png',
                                  scale: 4,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : SizedBox(),
        ),
      ),
    ]);
  }
}
