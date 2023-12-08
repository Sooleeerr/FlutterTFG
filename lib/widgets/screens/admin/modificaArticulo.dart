import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tfg/constants.dart';
import 'package:tfg/models/ArticuloModel.dart';
import 'package:tfg/models/respuesta.dart';
import 'package:tfg/services/ApiService.dart';
import 'package:tfg/widgets/components/appBarAtras.dart';

//TODO Meter borrado de articulo
class ModificaArticulo extends StatefulWidget {
  final ArticuloModel? articulo;
  final String? idArticulo;
  ModificaArticulo({Key? key, this.articulo, this.idArticulo})
      : super(key: key);

  @override
  State<ModificaArticulo> createState() => _ModificaArticuloState();
}

class _ModificaArticuloState extends State<ModificaArticulo> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerIdArticulo = TextEditingController();
  final TextEditingController _controllerNombreArticulo =
      TextEditingController();
  final TextEditingController _controllerMarcaArticulo =
      TextEditingController();
  final TextEditingController _controllerModeloArticulo =
      TextEditingController();
  final TextEditingController _controllerPrecioArticulo =
      TextEditingController();
  final TextEditingController _controllerColorArticulo =
      TextEditingController();
  final TextEditingController _controllerAlmacenamientoArticulo =
      TextEditingController();
  final TextEditingController _controllerFotoArticulo = TextEditingController();
  final TextEditingController _controllerArticuloPromocion =
      TextEditingController();
  final TextEditingController _controllerDescripcionArticulo =
      TextEditingController();
  final TextEditingController _controllerPrecioArticuloAnterior =
      TextEditingController();
  final TextEditingController _controllerStockArticulo =
      TextEditingController();

  String _idArticulo = "";
  String _nombreArticulo = "";
  String _marcaArticulo = "";
  String _modeloArticulo = "";
  String _precioArticulo = "";
  String _colorArticulo = "";
  String _almacenamientoArticulo = "";
  String _fotoArticulo = "";
  String _articuloPromocion = "";
  String _descripcionArticulo = "";
  String _precioArticuloAnterior = "";
  String _stockArticulo = "";

  late ArticuloModel? nuevoArticulo;
  bool modoNuevo = true;

  @override
  void initState() {
    super.initState();
    modoNuevo = (widget.articulo == null);
    _controllerIdArticulo.text = widget.idArticulo!;
    if (!modoNuevo) {
      _controllerMarcaArticulo.text = widget.articulo!.marcaArticulo!;
      _controllerNombreArticulo.text = widget.articulo!.nombreArticulo!;
      _controllerModeloArticulo.text = widget.articulo!.modeloArticulo!;
      _controllerPrecioArticulo.text =
          widget.articulo!.precioArticulo!.toString();
      _controllerColorArticulo.text = widget.articulo!.colorArticulo!;
      _controllerAlmacenamientoArticulo.text =
          widget.articulo!.almacenamientoArticulo!;
      _controllerFotoArticulo.text = widget.articulo!.fotoArticulo!;
      _controllerArticuloPromocion.text = widget.articulo!.articuloPromocion!;
      _controllerDescripcionArticulo.text =
          widget.articulo!.descripcionArticulo!;
      _controllerPrecioArticuloAnterior.text =
          widget.articulo!.precioArticuloAnterior!.toString();
      _controllerStockArticulo.text = widget.articulo!.stock.toString();
      nuevoArticulo = widget.articulo;
    } else {
      nuevoArticulo = ArticuloModel(
          almacenamientoArticulo: "",
          articuloPromocion: "no",
          colorArticulo: "",
          descripcionArticulo: "",
          fotoArticulo: "",
          marcaArticulo: "",
          modeloArticulo: "",
          nombreArticulo: "",
          precioArticulo: 0,
          precioArticuloAnterior: 0,
          stock: 0);
      nuevoArticulo?.idArticulo = widget.idArticulo!;
    }
  }

  Future<bool> _actualizaDetalleArticulo() async {
    Respuesta res = (await ApiService().nuevoArticulo(nuevoArticulo!))!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    return res.respuestaCorrecta;
  }

  _modificar() async {
    String textoSnackBar;
    Future<bool> respuesta = _actualizaDetalleArticulo();

    if (await respuesta) {
      textoSnackBar = "Cambios realizados";
      Navigator.pop(context);
    } else {
      textoSnackBar = "No se ha podido insertar/modificar el artículo";
    }
    final snackBar = SnackBar(
      content: Text(textoSnackBar),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _borraArticulo() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: AppBarAtras(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      child: (modoNuevo)
                          ? Text(
                              "Nuevo Artículo",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          : Text(
                              "Mantenimiento Artículo",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                  const SizedBox(height: 40.0),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Id_Artículo"),
                    enabled: false,
                    controller: _controllerIdArticulo,
                    onChanged: (texto) {
                      _idArticulo = texto;
                      nuevoArticulo!.idArticulo = texto;
                    },
                  ),
                  const SizedBox(height: 40.0),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: "Nombre Artículo"),
                    controller: _controllerNombreArticulo,
                    onChanged: (texto) {
                      _nombreArticulo = texto;
                      nuevoArticulo!.nombreArticulo = texto;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo es obligatorio';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 40.0),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Marca"),
                    controller: _controllerMarcaArticulo,
                    onChanged: (texto) {
                      _marcaArticulo = texto;
                      nuevoArticulo!.marcaArticulo = texto;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo es obligatorio';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 40.0),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Modelo"),
                    controller: _controllerModeloArticulo,
                    onChanged: (texto) {
                      _modeloArticulo = texto;
                      nuevoArticulo!.modeloArticulo = texto;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo es obligatorio';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 40.0),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Precio"),
                    controller: _controllerPrecioArticulo,
                    onChanged: (texto) {
                      _precioArticulo = texto;
                      nuevoArticulo!.precioArticulo = int.parse(texto);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo es obligatorio';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                  ),
                  const SizedBox(height: 40.0),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Color"),
                    controller: _controllerColorArticulo,
                    onChanged: (texto) {
                      _colorArticulo = texto;
                      nuevoArticulo!.colorArticulo = texto;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo es obligatorio';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 40.0),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: "Almacenamiento"),
                    controller: _controllerAlmacenamientoArticulo,
                    onChanged: (texto) {
                      _almacenamientoArticulo = texto;
                      nuevoArticulo!.almacenamientoArticulo = texto;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo es obligatorio';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 40.0),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: "URL de la fotografía"),
                    controller: _controllerFotoArticulo,
                    onChanged: (texto) {
                      _fotoArticulo = texto;
                      nuevoArticulo!.fotoArticulo = texto;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo es obligatorio';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 40.0),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: "¿Artículo en Promoción?"),
                    controller: _controllerArticuloPromocion,
                    onChanged: (texto) {
                      _articuloPromocion = texto;
                      nuevoArticulo!.articuloPromocion = texto;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo es obligatorio';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 40.0),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Descripción"),
                    controller: _controllerDescripcionArticulo,
                    onChanged: (texto) {
                      _descripcionArticulo = texto;
                      nuevoArticulo!.descripcionArticulo = texto;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo es obligatorio';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 40.0),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: "Precio Anterior"),
                    controller: _controllerPrecioArticuloAnterior,
                    onChanged: (texto) {
                      _precioArticuloAnterior = texto;
                      nuevoArticulo!.precioArticuloAnterior = int.parse(texto);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo es obligatorio';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                  ),
                  const SizedBox(height: 40.0),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Stock"),
                    controller: _controllerStockArticulo,
                    onChanged: (texto) {
                      _stockArticulo = texto;
                      nuevoArticulo!.stock = int.parse(texto);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo es obligatorio';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _modificar();
                      }
                    },
                    child: (modoNuevo)
                        ? Text(
                            'Añadir',
                            style: TextStyle(color: Colors.black),
                          )
                        : Text(
                            'Modificar',
                            style: TextStyle(color: Colors.black),
                          ),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kSecondaryColor,
                    ),
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
