import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tfg/models/lista_pedidos_model.dart';
import 'package:tfg/services/ApiService.dart';
import 'package:tfg/widgets/components/appBarAtras.dart';
import 'package:tfg/widgets/screens/listaPedidos/components/detalleListaPedidos.dart';

class ListaPedidos extends StatefulWidget {
  const ListaPedidos({Key? key}) : super(key: key);

  @override
  State<ListaPedidos> createState() => _ListaPedidosState();
}

class _ListaPedidosState extends State<ListaPedidos> {
  String _nombre = "";
  List<ListaPedidosModel>? listaPedidos;

  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    obtenerValor();
  }

  Future<void> obtenerValor() async {
    _prefs = await SharedPreferences.getInstance();
    _nombre = _prefs.getString('correo_usuario') ?? '';
    listaPedidos = (await ApiService().getListaPedidos(_nombre))!;

    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return (listaPedidos == null)
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
            appBar: const AppBarAtras(),
            body: Column(
              children: [
                const Text(
                  "A continuación puedes ver tus pedidos",
                  style: TextStyle(color: Colors.black),
                ),
                (listaPedidos!.isEmpty)
                    ? Column(
                        children: [
                          const SizedBox(
                            height: 80,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Vaya, todavía no has hecho ningún pedido con nosotros...",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          Image.asset(
                            'assets/images/empty_order_list.png',
                            scale: 4,
                          ),
                        ],
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: listaPedidos?.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: DetalleListaPedidos(
                              listaPedidosModel: listaPedidos![index],
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          );
  }
}
