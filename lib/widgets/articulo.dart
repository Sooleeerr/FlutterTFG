import 'package:flutter/material.dart';
import 'package:tfg/models/ArticuloModel.dart';

class Articulo extends StatelessWidget {
  final ArticuloModel articulo;
  const Articulo({required this.articulo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(
                color: Color.fromARGB(255, 172, 170, 170), width: 2)),
        child: Column(
          children: [
            Flexible(
              flex: 8,
              child: Image(
                image: NetworkImage(articulo.fotoArticulo!),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  articulo.nombreArticulo!,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(articulo.precioArticulo.toString() + "€"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
