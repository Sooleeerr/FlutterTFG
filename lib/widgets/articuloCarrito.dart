import 'package:flutter/material.dart';
import 'package:tfg/constants.dart';
import 'package:tfg/models/CarritoModel.dart';
import 'package:tfg/widgets/detalleArticulo.dart';

class ArticuloCarrito extends StatelessWidget {
  final ListaArticulosCarrito articuloCarrito;
  const ArticuloCarrito({Key? key, required this.articuloCarrito})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetalleArticulo(
                    idArticulo: articuloCarrito.idArticulo!,
                  )),
        );
      },
      child: Row(
        children: [
          SizedBox(
            width: 88,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image(
                  image: NetworkImage(articuloCarrito.fotoArticulo!),
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                articuloCarrito.nombreArticulo!,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
              ),
              const SizedBox(height: 8),
              Text.rich(
                TextSpan(
                  text: "${articuloCarrito.precioArticulo!} €",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor),
                  children: [
                    TextSpan(
                        text:
                            " x${articuloCarrito.cantidadArticulo!.toString()}",
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              )
            ],
          )
          /*Flexible(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

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

                  ],
                ),
              ],
            ),
          ),*/
        ],
      ),
    );
  }
}
