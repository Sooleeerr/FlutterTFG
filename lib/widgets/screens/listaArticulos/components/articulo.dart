// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tfg/models/ArticuloModel.dart';
import 'package:tfg/widgets/screens/detalleArticulo/detalleArticulo.dart';
import 'package:tfg/constants.dart';

class Articulo extends StatelessWidget {
  final ArticuloModel articulo;
  final bool miniatura;
  const Articulo({Key? key, required this.articulo, required this.miniatura})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetalleArticulo(
              idArticulo: articulo.idArticulo!,
            ),
          ),
        );
      },
      child: Container(
        padding: (!miniatura) ? EdgeInsets.all(20) : EdgeInsets.all(5),
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color(0xFFF5F6F9),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: Image(
                  image: NetworkImage(articulo.fotoArticulo!),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      articulo.nombreArticulo!,
                      style: TextStyle(
                        color: kTextColor,
                        fontSize: (!miniatura) ? 13.0 : 10.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                        fontSize: (!miniatura) ? 16.0 : 12.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  Text(
                    articulo.precioArticulo.toString() + "€",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: (!miniatura) ? 16.0 : 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              if (articulo.stock! < 10 && articulo.stock! > 0)
                Text(
                  "Últimas unidades",
                  style: TextStyle(
                    color: Colors.red[600],
                    fontSize: (!miniatura) ? 12.0 : 8.0,
                  ),
                ),
              if (articulo.stock! == 0)
                Text(
                  "No hay stock",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: (!miniatura) ? 12.0 : 8.0,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
