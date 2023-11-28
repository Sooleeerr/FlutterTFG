// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tfg/models/ArticuloModel.dart';
import 'package:tfg/widgets/detalleArticulo.dart';
import 'package:tfg/constants.dart';

class Articulo extends StatelessWidget {
  final ArticuloModel articulo;
  final bool miniatura;
  const Articulo({required this.articulo, required this.miniatura});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetalleArticulo(
                    idArticulo: articulo.idArticulo!,
                  )),
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
                    style: (!miniatura)
                        ? Theme.of(context).textTheme.bodyMedium
                        : Theme.of(context).textTheme.bodySmall,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
