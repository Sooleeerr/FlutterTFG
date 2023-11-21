import 'package:flutter/material.dart';
import 'package:tfg/models/ArticuloModel.dart';
import 'package:tfg/widgets/detalleArticulo.dart';

class articuloCarrito extends StatelessWidget {
  const articuloCarrito({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetalleArticulo(
                    articulo: ArticuloModel(),
                  )),
        );
      },
      child: Row(
        children: [
          Flexible(
            flex: 8,
            child: Image(
              image: NetworkImage(
                  "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg"),
            ),
          ),
          Flexible(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("nombre_articulo"),
                Text("precio_articulo"),
                Row(
                  children: [
                    Column(
                      children: [
                        IconButton(
                          iconSize: 12,
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            print('Botón presionado');
                            ;
                          },
                        ),
                        IconButton(
                          iconSize: 12,
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            print('Botón presionado');
                            ;
                          },
                        ),
                      ],
                    ),
                    Container(alignment: Alignment.center, child: Text("1")),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
