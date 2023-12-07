// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tfg/constants.dart';
import 'package:tfg/models/articulos_relacionados_model.dart';
import 'package:tfg/models/respuesta.dart';
import 'package:tfg/providers/CarritoProvider.dart';
import 'package:tfg/services/ApiService.dart';
import 'package:tfg/widgets/components/appBarAtras.dart';
import 'package:tfg/widgets/screens/listaArticulos/components/articulo.dart';
import 'package:tfg/widgets/components/RoundedContainer.dart';
import 'package:tfg/widgets/components/TopRoundedContainer.dart';

import 'package:tfg/models/ArticuloModel.dart';
//TODO: OPCIONAL Color

class DetalleArticulo extends StatefulWidget {
  final String idArticulo;

  const DetalleArticulo({Key? key, required this.idArticulo}) : super(key: key);

  @override
  State<DetalleArticulo> createState() => _DetalleArticuloState();
}

class _DetalleArticuloState extends State<DetalleArticulo> {
  late ArticuloModel articulo = ArticuloModel();
  late List<ArticulosRelacionadosModel> articulosRelacionados = [];
  late SharedPreferences _prefs;
  late String idUsuario;
  late CarritoProvider carrito;
  @override
  void initState() {
    super.initState();

    _getDetalleArticulo();
  }

  void _getDetalleArticulo() async {
    _prefs = await SharedPreferences.getInstance();

    idUsuario = _prefs.getString('correo_usuario') ?? '';
    articulo = (await ApiService().detalleArticulo(widget.idArticulo))!;
    ApiService().visitaArticulo(idUsuario, widget.idArticulo);
    articulosRelacionados =
        (await ApiService().getListaArticulosRelacionados(widget.idArticulo))!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  Respuesta registroOK = Respuesta();
  Future<bool> _actualizaCarrito(
      idUsuario, idArticulo, cantidadArticulo, precioArticulo) async {
    registroOK = (await ApiService().modificarCarrito(
        idUsuario, idArticulo, cantidadArticulo, precioArticulo));

    return Future.value(registroOK.getRespuestaCorrecta);
  }

  _anadeCarrito() async {
    String textoSnackBar;
    Future<bool> res = _actualizaCarrito(
        idUsuario, widget.idArticulo, 1, articulo.precioArticulo);

    if (await res) {
      textoSnackBar = "Articulo añadido a tu carrito";
      carrito.actualizarCarrito(await ApiService().getCarrito(idUsuario));
      Navigator.pop(context);
    } else {
      textoSnackBar = registroOK.mensajeRespuesta;
    }
    final snackBar = SnackBar(
      content: Text(textoSnackBar),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    carrito = Provider.of<CarritoProvider>(context);
    return articulo.sId == null
        ? Scaffold(
            backgroundColor: const Color(0xFFF5F6F9),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            extendBody: false,
            extendBodyBehindAppBar: false,
            backgroundColor: const Color(0xFFF5F6F9),
            appBar: AppBarAtras(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 200,
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            child: Image(
                              image: NetworkImage(articulo.fotoArticulo!),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Container(
                              alignment: Alignment.center,
                              child: Column(children: [
                                Text(
                                  articulo.nombreArticulo!,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: kTextColor,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    if (articulo.articuloPromocion == "yes")
                                      Column(
                                        children: [
                                          Text(
                                            articulo.precioArticuloAnterior
                                                    .toString() +
                                                " €",
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              color: kSecondaryColor,
                                            ),
                                          ),
                                          Text(
                                            "Precio anterior",
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: kTextColor,
                                            ),
                                          )
                                        ],
                                      ),
                                    Column(
                                      children: [
                                        Text(
                                          articulo.precioArticulo.toString() +
                                              " €",
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: kPrimaryColor,
                                          ),
                                        ),
                                        if (articulo.articuloPromocion == "yes")
                                          Text(
                                            "Promoción",
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: kTextColor,
                                            ),
                                          )
                                        else
                                          Text(
                                            "Precio",
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: kTextColor,
                                            ),
                                          )
                                      ],
                                    ),
                                  ],
                                ),
                                if (articulo.stock! < 10 && articulo.stock! > 0)
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Últimas unidades. Sólo quedan " +
                                            articulo.stock.toString(),
                                        style: TextStyle(
                                          color: Colors.red[600],
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                if (articulo.stock! == 0)
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "No hay stock",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ],
                                  ),
                              ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  RoundedContainer(
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: DataTable(
                      columnSpacing: 10,
                      columns: const [
                        DataColumn(label: Expanded(child: Text("Marca"))),
                        DataColumn(label: Expanded(child: Text("Modelo"))),
                        DataColumn(label: Expanded(child: Text("Color"))),
                        DataColumn(
                            label: Expanded(child: Text("Almacenamiento"))),
                      ],
                      rows: [
                        DataRow(
                          cells: [
                            DataCell(Text(articulo.marcaArticulo!)),
                            DataCell(Text(articulo.modeloArticulo!)),
                            DataCell(Text(articulo.colorArticulo!)),
                            DataCell(Text(articulo.almacenamientoArticulo!)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Descripción",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  if (articulo.descripcionArticulo != null)
                    Html(
                      data: articulo.descripcionArticulo,
                    ),
                  articulosRelacionados.isEmpty
                      ? Text(
                          "Sin articulos relacionados",
                        )
                      : TopRoundedContainer(
                          color: kPrimaryLightColor,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Text(
                                    "Articulos relacionados",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                GridView.count(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  crossAxisCount: 3,
                                  children: List.generate(
                                      articulosRelacionados.length, (index) {
                                    return Articulo(
                                      articulo: articulosRelacionados[index]
                                          .detalleArticulo!
                                          .first,
                                      miniatura: true,
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),
                        ),
                ],
              ),
            ),
            bottomNavigationBar: TopRoundedContainer(
              color: Color.fromARGB(255, 255, 255, 255),
              child: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: (articulo.stock! > 0)
                      ? ElevatedButton(
                          onPressed: () {
                            _anadeCarrito();
                          },
                          child: const Text("Añade al carrito"),
                        )
                      : ElevatedButton(
                          onPressed: null,
                          child: const Text("No hay stock"),
                        ),
                ),
              ),
            ),
          );
  }
}
