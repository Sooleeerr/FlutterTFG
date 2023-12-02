import 'package:flutter/material.dart';
import 'package:tfg/constants.dart';
import 'package:tfg/models/pedido_model.dart';
import 'package:tfg/services/ApiService.dart';
import 'package:tfg/widgets/articuloDetallePedido.dart';

class detallePedido extends StatefulWidget {
  final String numPedido;
  final bool vieneCompra;
  const detallePedido(
      {Key? key, required this.numPedido, required this.vieneCompra})
      : super(key: key);

  @override
  State<detallePedido> createState() => _detallePedidoState();
}

class _detallePedidoState extends State<detallePedido> {
  late PedidoModel detallePedido = PedidoModel();
  @override
  void initState() {
    super.initState();

    _getDetallePedido();
  }

  void _getDetallePedido() async {
    detallePedido = (await ApiService().getPedido(widget.numPedido))!;

    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return detallePedido.idPedido == null
        ? Scaffold(
            backgroundColor: const Color(0xFFF5F6F9),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            extendBody: false,
            extendBodyBehindAppBar: false,
            backgroundColor: const Color(0xFFF5F6F9),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (widget.vieneCompra) {
                      int count = 0;
                      Navigator.of(context).popUntil((_) => count++ >= 2);
                    } else
                      Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: EdgeInsets.zero,
                    elevation: 0,
                    backgroundColor: Colors.white,
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ),
            ),
            body: Column(
              children: [
                if (widget.vieneCompra)
                  Column(
                    children: [
                      Text(
                        "Ya tenemos tu pedido en nuestras manos",
                        style: TextStyle(color: Colors.black),
                      ),
                      Image.asset("assets/images/success.png", scale: 8),
                      SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                const Text(
                  "Tu pedido",
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  "Nº de pedido: ${detallePedido.idPedido}",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: detallePedido.listaArticulos?.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ArticuloDetallePedido(
                          articuloPedido: detallePedido.listaArticulos![index]),
                    ),
                  ),
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
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text.rich(
                                TextSpan(
                                  text: "Fecha de pedido:\n",
                                  children: [
                                    TextSpan(
                                      text:
                                          "${dateFormatter.format(DateTime.parse(detallePedido.fechaPedido!))} ",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text.rich(
                                TextSpan(
                                  text: "Total:\n",
                                  children: [
                                    TextSpan(
                                      text:
                                          "${numberFormatter.format(detallePedido.precioPedido)} €",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
