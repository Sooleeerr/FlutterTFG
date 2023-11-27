import 'package:flutter/material.dart';
import 'package:tfg/models/ArticuloModel.dart';
import 'package:tfg/widgets/detalleArticulo.dart';
import 'package:tfg/constants.dart';

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
            color: Color(0xFFF5F6F9),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            /*border: Border.all(
                color: articulo.articuloPromocion == "yes"
                    ? Color.fromARGB(255, 219, 123, 5)
                    : Color.fromARGB(255, 171, 172, 170),
                width: 2),*/
          ),
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
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: (articulo.articuloPromocion == "yes")
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.end,
                children: [
                  if (articulo.articuloPromocion == "yes")
                    Text(
                      articulo.precioArticuloAnterior.toString() + "€",
                      style: TextStyle(
                        color: kSecondaryColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  Text(
                    articulo.precioArticulo.toString() + "€",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
