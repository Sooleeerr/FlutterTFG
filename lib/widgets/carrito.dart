import 'package:flutter/material.dart';
import 'package:tfg/widgets/articuloCarrito.dart';
//TODO Integración API
//TODO Diseño
//TODO Meter el total+hacer pedido
//TODO Meter fucionalidad +/-
//TODO [A] Navegar a Detalle Articulo

class Carrito extends StatelessWidget {
  const Carrito({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return /*Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Text("Total:"),
                Text("100€"),
                ElevatedButton(
                  onPressed: () {
                    // Acción a realizar cuando se presiona el botón
                    print('Botón presionado');
                  },
                  child: Text("Comprar"),
                ),
              ],
            ),
          ),
          GridView.count(
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
        ],
      ),
    );*/

        Container(
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
