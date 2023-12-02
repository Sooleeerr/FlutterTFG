// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:tfg/widgets/components/search_field.dart';
import 'package:tfg/widgets/filtrado.dart';
import 'package:tfg/widgets/ordenacion.dart';

class CabeceraProductos extends StatefulWidget {
  const CabeceraProductos({
    Key? key,
  }) : super(key: key);

  @override
  State<CabeceraProductos> createState() => _CabeceraProductosState();
}

class _CabeceraProductosState extends State<CabeceraProductos> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: SearchField()),
          SizedBox(width: 16),
          IconButton(
            iconSize: 22,
            icon: Icon(Icons.swap_vert),
            color: Colors.black,
            onPressed: () {
              /* Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Ordenacion()),
              );*/
            },
          ),
          const SizedBox(width: 8),
          IconButton(
            iconSize: 22,
            icon: const Icon(Icons.tune),
            color: Colors.black,
            onPressed: () {
              /*Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Filtrado()),
              );*/
            },
          ),
        ],
      ),
    );
  }
}
