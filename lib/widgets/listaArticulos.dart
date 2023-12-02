import 'package:flutter/material.dart';

import 'package:tfg/constants.dart';
import 'package:tfg/models/filtro_model.dart';

import 'package:tfg/widgets/articulo.dart';

import 'package:tfg/widgets/filtrado.dart';

import 'package:tfg/widgets/ordenacion.dart';
import '../models/ArticuloModel.dart';
import '../services/ApiService.dart';

//TODO: OPCIONAL Diseño Articulos Visitados, promos

class ListaArticulos extends StatefulWidget {
  const ListaArticulos({Key? key}) : super(key: key);

  @override
  State<ListaArticulos> createState() => _ListaArticulosState();
}

class _ListaArticulosState extends State<ListaArticulos> {
  FiltroModel _filtroModel = FiltroModel();
  late List<ArticuloModel>? _listaArticulosModel = [];
  int ordenacionAplicada = 0;
  bool filtradoAplicado = false;
  @override
  void initState() {
    super.initState();
    _getDataListaArticulos(_filtroModel);
    filtradoAplicado = _filtroModel.getFiltroAplicado();
  }

  void _getDataListaArticulos(FiltroModel filtroModel) async {
    _listaArticulosModel = (await ApiService().getListaArticulos(filtroModel));
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  void _ordenar(FiltroModel filtroModel) async {
    _filtroModel = filtroModel;
    _getDataListaArticulos(_filtroModel);
    ordenacionAplicada = _filtroModel.ordenacion;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  void _filtrar(FiltroModel filtroModel) async {
    _filtroModel = filtroModel;
    _getDataListaArticulos(_filtroModel);
    filtradoAplicado = _filtroModel.getFiltroAplicado();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Expanded(child: SearchField()),
              //SizedBox(width: 100),
              Padding(
                padding: const EdgeInsets.only(
                  top: 4,
                ),
                child: Image.asset(
                  "assets/images/mundomovil_round.png",
                  scale: 1.75,
                ),
              ),
              Text("Mundo Móvil"),
              SizedBox(width: 120),
              IconButton(
                iconSize: 22,
                icon: Icon(Icons.swap_vert),
                color: ordenacionAplicada != 0 ? kPrimaryColor : Colors.black,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Ordenacion(
                              callback: _ordenar,
                              filtroModel: _filtroModel,
                            )),
                  );
                },
              ),
              const SizedBox(width: 8),
              IconButton(
                iconSize: 22,
                icon: const Icon(Icons.tune),
                color: filtradoAplicado ? kPrimaryColor : Colors.black,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Filtrado(
                              callback: _filtrar,
                              filtroModel: _filtroModel,
                            )),
                  );
                },
              ),
            ],
          ),
        ),
        _listaArticulosModel == null || _listaArticulosModel!.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children:
                      List.generate(_listaArticulosModel!.length, (index) {
                    return Articulo(
                      articulo: _listaArticulosModel![index],
                      miniatura: false,
                    );
                  }),
                ),
              ),
      ],
    );
  }
}
