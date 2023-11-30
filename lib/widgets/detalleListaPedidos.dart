// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tfg/constants.dart';
import 'package:tfg/models/ListaPedidosModel.dart';
import 'package:tfg/widgets/components/RoundedContainer.dart';
import 'package:tfg/widgets/detallePedido.dart';

class DetalleListaPedidos extends StatelessWidget {
  final ListaPedidosModel listaPedidosModel;
  const DetalleListaPedidos({Key? key, required this.listaPedidosModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => detallePedido(
              numPedido: listaPedidosModel.idPedido.toString(),
              vieneCompra: false,
            ),
          ),
        );
      },
      child: RoundedContainer(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  dateFormatter.format(
                      DateTime.parse(listaPedidosModel.fechaPedido.toString())),
                  style: TextStyle(fontSize: 11),
                ),
              ),
              Expanded(
                child: Text("${listaPedidosModel.idPedido}"),
              ),
              Expanded(
                child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                        "${numberFormatter.format(listaPedidosModel.precioPedido)} €",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: kTextColor,
                        ))),
              ),
              SizedBox(
                width: 20,
                height: 40,
              ),
              const Icon(
                Icons.arrow_forward,
                color: kPrimaryColor,
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
