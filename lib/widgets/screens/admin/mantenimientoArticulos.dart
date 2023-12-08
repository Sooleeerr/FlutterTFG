import 'package:flutter/material.dart';
import 'package:tfg/constants.dart';
import 'package:tfg/models/ArticuloModel.dart';
import 'package:tfg/services/ApiService.dart';
import 'package:tfg/widgets/components/appBarAtras.dart';
import 'package:tfg/widgets/screens/admin/modificaArticulo.dart';

class MantenimientoArticulos extends StatefulWidget {
  const MantenimientoArticulos({Key? key}) : super(key: key);

  @override
  State<MantenimientoArticulos> createState() => _MantenimientoArticulosState();
}

class _MantenimientoArticulosState extends State<MantenimientoArticulos> {
  final TextEditingController _controllerIdArticulo = TextEditingController();
  String _idArticulo = "";
  late ArticuloModel? articulo;

  void _getDetalleArticulo() async {
    articulo = (await ApiService().detalleArticulo(_idArticulo));

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              ModificaArticulo(articulo: articulo, idArticulo: _idArticulo)),
    );

    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  void _limpiarDatos() {
    _idArticulo = "";
    articulo = null;
    _controllerIdArticulo.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: AppBarAtras(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Introduce el id del Artículo",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                    "La APP identifica de forma automática si el id_articulo que introduces existe o no. En caso de que exista te llevará a una pantalla para que puedas actualizar su información. Si no existe te permitirá dar de alta ese nuevo Artículo"),
                const SizedBox(height: 40.0),
                TextField(
                  decoration: const InputDecoration(labelText: "Id_Artículo"),
                  controller: _controllerIdArticulo,
                  onChanged: (texto) {
                    _idArticulo = texto;
                  },
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    _getDetalleArticulo();
                  },
                  child: const Text(
                    'Buscar',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    _limpiarDatos();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kSecondaryColor,
                  ),
                  child: const Text(
                    'Limpiar',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
