import 'package:flutter/material.dart';
import 'package:tfg/models/ArticuloModel.dart';
import 'package:tfg/widgets/detalleArticulo.dart';

class Articulo extends StatelessWidget {
  final ArticuloModel articulo;
  const Articulo({required this.articulo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetalleArticulo(
                    articulo: articulo,
                  )),
        );
      },
      child: Container(
        padding: EdgeInsets.all(20),
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: articulo.articuloPromocion == "yes"
                  ? Color.fromARGB(255, 54, 244, 149)
                  : Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                  color: Color.fromARGB(255, 171, 172, 170), width: 2)),
          child: Column(
            children: [
              Flexible(
                flex: 8,
                child: Image(
                  image: NetworkImage(articulo.fotoArticulo!),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Flexible(
                flex: 2,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    articulo.nombreArticulo!,
                    style: TextStyle(
                      fontFamily: "Open Sans",
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    articulo.precioArticulo.toString() + "€",
                    style: TextStyle(
                      fontFamily: "Open Sans",
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
