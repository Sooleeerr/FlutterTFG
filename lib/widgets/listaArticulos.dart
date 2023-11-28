import 'package:flutter/material.dart';
import 'package:tfg/widgets/articulo.dart';
import '../models/ArticuloModel.dart';
import '../services/ApiService.dart';
//TODO [A] Meter fitrado
//TODO: OPCIONAL Diseño Articulos Visitados, promos

class ListaArticulos extends StatefulWidget {
  const ListaArticulos({Key? key}) : super(key: key);

  @override
  State<ListaArticulos> createState() => _ListaArticulosState();
}

class _ListaArticulosState extends State<ListaArticulos> {
  late List<ArticuloModel>? _listaArticulosModel = [];
  @override
  void initState() {
    super.initState();
    _getDataListaArticulos();
  }

  void _getDataListaArticulos() async {
    _listaArticulosModel = (await ApiService().getListaArticulos())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return _listaArticulosModel == null || _listaArticulosModel!.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : GridView.count(
            crossAxisCount: 2,
            children: List.generate(_listaArticulosModel!.length, (index) {
              return Articulo(
                articulo: _listaArticulosModel![index],
                miniatura: false,
              );
            }),
          );
  }
}
