import 'package:flutter/material.dart';

class ArticuloDetallePedido extends StatelessWidget {
  const ArticuloDetallePedido({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Flexible(
            flex: 4,
            child: Container(
              child: Image(
                image: NetworkImage(
                    "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg"),
              ),
            ),
          ),
          Flexible(
            flex: 6,
            child: Container(
              alignment: Alignment.center,
              child: Column(children: [
                Text("nombre_articulo"),
                Text("precio_articulo"),
                SizedBox(
                  height: 10,
                ),
                Text("cantidad_articulo"),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
