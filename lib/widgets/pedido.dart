import 'package:flutter/material.dart';
import 'package:tfg/widgets/detallePedido.dart';

class Pedido extends StatelessWidget {
  const Pedido({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => detallePedido()),
        );
      },
      child: Row(
        children: [
          Expanded(
            child: Text("numero_pedido"),
          ),
          Expanded(
            child: Container(
                alignment: Alignment.centerRight, child: Text("precio_total")),
          )
        ],
      ),
    );
  }
}
