import 'package:flutter/material.dart';
import 'package:tfg/constants.dart';
import 'package:tfg/models/pedido_model.dart';
import 'package:tfg/widgets/detalleArticulo.dart';

class ArticuloDetallePedido extends StatelessWidget {
  final ListaArticulosPedido articuloPedido;

  const ArticuloDetallePedido({Key? key, required this.articuloPedido})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetalleArticulo(
                    idArticulo: articuloPedido.idArticulo!,
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
                  image: NetworkImage(articuloPedido.fotoArticulo!),
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                articuloPedido.nombreArticulo!,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
              ),
              const SizedBox(height: 8),
              Text.rich(
                TextSpan(
                  text: "${articuloPedido.precioArticulo!} €",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor),
                  children: [
                    TextSpan(
                        text:
                            " x${articuloPedido.cantidadArticulo!.toString()}",
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
