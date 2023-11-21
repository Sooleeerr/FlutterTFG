import 'package:flutter/material.dart';
import 'package:tfg/widgets/articulo.dart';
import '../models/ArticuloModel.dart';
import '../services/ApiService.dart';

//TODO: Diseño
//TODO: [A] Filtrado articulos
class ListaArticulosPromocion extends StatefulWidget {
  const ListaArticulosPromocion({Key? key}) : super(key: key);

  @override
  State<ListaArticulosPromocion> createState() =>
      _ListaArticulosPromocionState();
}

class _ListaArticulosPromocionState extends State<ListaArticulosPromocion> {
  late List<ArticuloModel>? _listaArticulosModel = [];
  @override
  void initState() {
    super.initState();
    _getDataListaArticulosPromocion();
  }

  void _getDataListaArticulosPromocion() async {
    _listaArticulosModel = (await ApiService().getListaArticulosPromocion())!;
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
              return Articulo(articulo: _listaArticulosModel![index]);
            }),
          );
  }
}
