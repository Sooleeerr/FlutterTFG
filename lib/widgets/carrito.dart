import 'package:flutter/material.dart';
import 'package:tfg/widgets/articuloCarrito.dart';

class Carrito extends StatelessWidget {
  const Carrito({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: GridView.count(
        crossAxisCount: 1,
        padding: EdgeInsets.all(20),
        mainAxisSpacing: 10,
        childAspectRatio: 2.5,
        children: <Widget>[
          articuloCarrito(),
          articuloCarrito(),
          articuloCarrito(),
          articuloCarrito(),
          articuloCarrito(),
          articuloCarrito(),
          articuloCarrito(),
          articuloCarrito(),
        ],
      ),
    );
  }
}
