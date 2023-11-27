// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:tfg/constants.dart';
import 'package:tfg/widgets/components/RoundedContainer.dart';
import 'package:tfg/widgets/components/TopRoundedContainer.dart';
import 'package:tfg/widgets/pedido.dart';

import 'package:tfg/models/ArticuloModel.dart';
//TODO: llamar API articuloVisitado
//TODO: Diseño
//TODO: Meter articulos relacionados
//TODO: Meter articulos visitados
//TODO: Añadir al carrito

class DetalleArticulo extends StatelessWidget {
  final ArticuloModel articulo;
  const DetalleArticulo({required this.articulo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: AppBar(
        title: Text("Mundo Móvil"),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Flexible(
                  flex: 4,
                  child: Container(
                    child: Image(
                      image: NetworkImage(articulo.fotoArticulo!),
                    ),
                  ),
                ),
                Flexible(
                  flex: 6,
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(children: [
                      Text(
                        articulo.nombreArticulo!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: kTextColor,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          if (articulo.articuloPromocion == "yes")
                            Column(
                              children: [
                                Text(
                                  articulo.precioArticuloAnterior.toString() +
                                      " €",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.lineThrough,
                                    color: kSecondaryColor,
                                  ),
                                ),
                                Text(
                                  "Precio anterior",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: kTextColor,
                                  ),
                                )
                              ],
                            ),
                          Column(
                            children: [
                              Text(
                                articulo.precioArticulo.toString() + " €",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: kPrimaryColor,
                                ),
                              ),
                              if (articulo.articuloPromocion == "yes")
                                Text(
                                  "Promoción",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    //decoration: TextDecoration.lineThrough,
                                    color: kTextColor,
                                  ),
                                )
                              else
                                Text(
                                  "Precio",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    //decoration: TextDecoration.lineThrough,
                                    color: kTextColor,
                                  ),
                                )
                            ],
                          ),
                        ],
                      ),
                    ]),
                  ),
                )
              ],
            ),
          ),
          RoundedContainer(
            color: Color.fromARGB(255, 255, 255, 255),
            child: DataTable(
              columnSpacing: 10,
              columns: [
                DataColumn(label: Expanded(child: Text("Marca"))),
                DataColumn(label: Expanded(child: Text("Modelo"))),
                DataColumn(label: Expanded(child: Text("Color"))),
                DataColumn(label: Expanded(child: Text("Almacenamiento"))),
              ],
              rows: [
                DataRow(
                  cells: [
                    DataCell(Text(articulo.marcaArticulo!)),
                    DataCell(Text(articulo.modeloArticulo!)),
                    DataCell(Text(articulo.colorArticulo!)),
                    DataCell(Text(articulo.almacenamientoArticulo!)),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "Descripción",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          if (articulo.descripcionArticulo != null)
            Html(
              data: articulo.descripcionArticulo,
            ),
        ],
      ),
      bottomNavigationBar: TopRoundedContainer(
        color: Color.fromARGB(255, 255, 255, 255),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Añade al carrito"),
            ),
          ),
        ),
      ),
    );
  }
}
