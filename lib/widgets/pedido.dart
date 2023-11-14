import 'package:flutter/material.dart';

class Pedido extends StatelessWidget {
  const Pedido({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text("numero_pedido"),
        ),
        Expanded(
          child: Container(
              alignment: Alignment.centerRight, child: Text("precio_total")),
        )
      ],
    );
  }
}
