import 'package:flutter/material.dart';
import 'package:tfg/models/articulos_visitados_model.dart';
import 'package:tfg/widgets/articulo.dart';

class ArticulosVisitados extends StatelessWidget {
  final List<ArticulosVisitadosModel> articulosVisitados;
  const ArticulosVisitados({Key? key, required this.articulosVisitados})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...List.generate(
              articulosVisitados.length,
              (index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 2),
                  child: Articulo(
                    articulo: articulosVisitados[index].detalleArticulo!.first,
                    miniatura: true,
                  ),
                );
              },
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
