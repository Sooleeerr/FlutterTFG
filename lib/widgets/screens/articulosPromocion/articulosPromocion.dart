import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tfg/models/articulos_visitados_model.dart';
import 'package:tfg/widgets/screens/listaArticulos/components/articulo.dart';
import 'package:tfg/widgets/screens/articulosPromocion/components/articulos_visitados.dart';
import 'package:tfg/widgets/components/image_tag.dart';
import '../../../models/articulo_model.dart';
import '../../../services/ApiService.dart';

class ListaArticulosPromocion extends StatefulWidget {
  const ListaArticulosPromocion({Key? key}) : super(key: key);

  @override
  State<ListaArticulosPromocion> createState() =>
      _ListaArticulosPromocionState();
}

class _ListaArticulosPromocionState extends State<ListaArticulosPromocion> {
  late SharedPreferences _prefs;
  String _idUsuario = "";
  late List<ArticuloModel>? _listaArticulosModel = [];
  late List<ArticulosVisitadosModel>? _listaArticulosVisitadosModel = [];
  @override
  void initState() {
    super.initState();
    _getDataListaArticulosPromocion();
    _getArticulosVisitados();
  }

  void _getDataListaArticulosPromocion() async {
    _listaArticulosModel = (await ApiService().getListaArticulosPromocion())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  void _getArticulosVisitados() async {
    _prefs = await SharedPreferences.getInstance();
    _idUsuario = _prefs.getString('correo_usuario') ?? '';
    _listaArticulosVisitadosModel =
        (await ApiService().getListaArticulosVisitados(_idUsuario))!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return _listaArticulosModel == null || _listaArticulosModel!.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Artículos recién visitados",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: ArticulosVisitados(
                  articulosVisitados: _listaArticulosVisitadosModel!,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Nuestras Marcas",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              Row(children: [
                ImageTag(
                  image: "assets/images/apple-logo.png",
                  text: "Apple",
                  press: () {},
                ),
                ImageTag(
                  image: "assets/images/samsung-logo.png",
                  text: "Samsung",
                  press: () {},
                ),
                ImageTag(
                  image: "assets/images/xiaomi-logo.png",
                  text: "Xiaomi",
                  press: () {},
                ),
              ]),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Artículos en oferta",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 100.0, right: 100),
                  child: GridView.count(
                    crossAxisCount: 1,
                    children:
                        List.generate(_listaArticulosModel!.length, (index) {
                      return Articulo(
                        articulo: _listaArticulosModel![index],
                        miniatura: false,
                      );
                    }),
                  ),
                ),
              ),
            ],
          );
  }
}
