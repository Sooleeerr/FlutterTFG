import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:tfg/constants.dart';
import 'package:tfg/models/lista_pedidos_model.dart';
import 'package:tfg/widgets/components/RoundedContainer.dart';
import 'package:tfg/widgets/screens/detallePedido/detallePedido.dart';

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
            builder: (context) => DetallePedido(
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
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      dateFormatter.format(DateTime.parse(
                          listaPedidosModel.fechaPedido.toString())),
                      style: const TextStyle(fontSize: 11),
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  StepProgressIndicator(
                    totalSteps: 4,
                    currentStep: int.parse(listaPedidosModel.estadoPedido!),
                    selectedColor: Colors.green,
                    unselectedColor: Colors.grey,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(estadoPedido[
                      int.parse(listaPedidosModel.estadoPedido!) - 1]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
