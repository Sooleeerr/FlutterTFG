import 'package:flutter/material.dart';

class articuloCarrito extends StatelessWidget {
  const articuloCarrito({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 8,
          child: Image(
            image: NetworkImage(
                "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg"),
          ),
        ),
        Flexible(
          flex: 4,
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
    );
  }
}