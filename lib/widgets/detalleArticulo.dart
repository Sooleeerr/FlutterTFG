import 'package:flutter/material.dart';
import 'package:tfg/widgets/pedido.dart';

import 'package:tfg/models/ArticuloModel.dart';

class DetalleArticulo extends StatelessWidget {
  final ArticuloModel articulo;
  const DetalleArticulo({required this.articulo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Mundo Móvil"),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
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
                          Text(articulo.nombreArticulo!),
                          Text(articulo.precioArticulo.toString() + "€"),
                        ]),
                      ),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Acción a realizar cuando se presiona el botón
                  print('Botón presionado');
                },
                child: Text('Añadir al carrito'),
              ),
              SizedBox(height: 20),
              Text(articulo.marcaArticulo!),
              Text(articulo.modeloArticulo!),
              Text(articulo.colorArticulo!),
              Text(articulo.almacenamientoArticulo!),
              SizedBox(height: 40),
              Text("Articulos relacionados"),
              Container(
                child: Row(
                  children: [
                    Text("Hola"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
