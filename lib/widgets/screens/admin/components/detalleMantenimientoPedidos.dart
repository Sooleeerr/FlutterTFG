import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:tfg/constants.dart';
import 'package:tfg/models/lista_pedidos_model.dart';
import 'package:tfg/models/respuesta.dart';
import 'package:tfg/services/ApiService.dart';
import 'package:tfg/widgets/components/RoundedContainer.dart';
import 'package:tfg/widgets/screens/detallePedido/detallePedido.dart';

class DetalleMantenimientoPedidos extends StatefulWidget {
  final ListaPedidosModel listaPedidosModel;

  DetalleMantenimientoPedidos({Key? key, required this.listaPedidosModel})
      : super(key: key);

  @override
  State<DetalleMantenimientoPedidos> createState() =>
      _DetalleMantenimientoPedidosState();
}

class _DetalleMantenimientoPedidosState
    extends State<DetalleMantenimientoPedidos> {
  Respuesta registroOK = Respuesta();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetallePedido(
              numPedido: widget.listaPedidosModel.idPedido.toString(),
              vieneCompra: false,
            ),
          ),
        );
      },
      child: RoundedContainer(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      dateFormatter.format(DateTime.parse(
                          widget.listaPedidosModel.fechaPedido.toString())),
                      style: const TextStyle(fontSize: 11),
                    ),
                  ),
                  Expanded(
                    child: Text("${widget.listaPedidosModel.idPedido}"),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "${numberFormatter.format(widget.listaPedidosModel.precioPedido)} €",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: kTextColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                    height: 40,
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    color: kPrimaryColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(widget.listaPedidosModel.idUsuario!),
                  const SizedBox(
                    width: 20,
                  ),
                  DropdownMenu(
                      initialSelection:
                          int.parse(widget.listaPedidosModel.estadoPedido!),
                      dropdownMenuEntries: estadoPedido
                          .asMap()
                          .entries
                          .map<DropdownMenuEntry<int>>((entry) {
                        return DropdownMenuEntry<int>(
                          value: entry.key + 1, // Índice como valor
                          label: entry
                              .value, // Texto del estadoPedido como etiqueta
                        );
                      }).toList(),
                      onSelected: (Object? value) {
                        int selectedIndex = value as int;
                        _modificar((selectedIndex).toString());
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _actualizaEstadoPedido(String? value) async {
    registroOK = (await ApiService()
        .modificarEstadoPedido(widget.listaPedidosModel.idPedido, value));
    return registroOK.respuestaCorrecta;
  }

  _modificar(String? value) async {
    String textoSnackBar;
    Future<bool> res = _actualizaEstadoPedido(value);

    if (await res) {
      textoSnackBar = "Cambios realizados";
    } else {
      textoSnackBar = registroOK.mensajeRespuesta;
    }
    final snackBar = SnackBar(
      content: Text(textoSnackBar),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
