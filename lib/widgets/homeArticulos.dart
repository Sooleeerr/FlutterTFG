import 'package:flutter/material.dart';

class HomeArticulos extends StatelessWidget {
  const HomeArticulos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              /*Marcas(),
              OfertasEspeciales(),
              SizedBox(height: 20),
              ListaProductos(),
              SizedBox(height: 20),
              ProductosVisitados(),
              SizedBox(height: 20),*/
            ],
          ),
        ),
      ),
    );
  }
}
