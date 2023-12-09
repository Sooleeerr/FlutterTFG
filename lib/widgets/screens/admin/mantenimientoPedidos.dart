import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tfg/models/lista_pedidos_model.dart';
import 'package:tfg/services/ApiService.dart';
import 'package:tfg/widgets/components/appBarAtras.dart';
import 'package:tfg/widgets/screens/admin/components/detalleMantenimientoPedidos.dart';
import 'package:tfg/widgets/screens/listaPedidos/components/detalleListaPedidos.dart';

//TODO Meter filtros por Usuario y estado
class MantenimientoPedidos extends StatefulWidget {
  const MantenimientoPedidos({Key? key}) : super(key: key);

  @override
  State<MantenimientoPedidos> createState() => _MantenimientoPedidosState();
}

class _MantenimientoPedidosState extends State<MantenimientoPedidos> {
  List<ListaPedidosModel>? listaPedidos;

  @override
  void initState() {
    super.initState();
    obtenerValor();
  }

  Future<void> obtenerValor() async {
    listaPedidos = (await ApiService().getMantenimientoPedidos())!;

    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return (listaPedidos == null)
        ? const Scaffold(
            backgroundColor: Color(0xFFF5F6F9),
            body: Center(
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
                  "Mantenimiento de pedidos",
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
                              "Vaya, todavía no hay pedidos",
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
                            child: DetalleMantenimientoPedidos(
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
