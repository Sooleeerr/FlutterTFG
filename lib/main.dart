import 'package:flutter/material.dart';
import 'package:tfg/widgets/articulo.dart';
import 'package:tfg/widgets/articuloDetallePedido.dart';
import 'package:tfg/widgets/articulosPromocion.dart';
import 'package:tfg/widgets/detalleArticulo.dart';
import 'package:tfg/widgets/detallePedido.dart';
import 'package:tfg/widgets/login.dart';
import 'package:tfg/widgets/perfil.dart';
import 'package:tfg/widgets/registro.dart';

import 'models/ArticuloModel.dart';
import 'services/ApiService.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late List<ArticuloModel>? _listaArticulosModel = [];
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    Icon(
      Icons.call,
      size: 150,
    ),
    Icon(
      Icons.camera,
      size: 150,
    ),
    Icon(
      Icons.chat,
      size: 150,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _listaArticulosModel = (await ApiService().getListaArticulos())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Mundo Móvil"),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text('Messages'),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: _listaArticulosModel == null || _listaArticulosModel!.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : GridView.count(
                  crossAxisCount: 2,
                  children:
                      List.generate(_listaArticulosModel!.length, (index) {
                    return Articulo(articulo: _listaArticulosModel![index]);
                  }),
                ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                (Icons.home),
              ),
              label: "Principal",
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                (Icons.discount),
              ),
              label: "Promociones",
              backgroundColor: Colors.amber,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                (Icons.shopping_cart),
              ),
              label: "Carrito",
              backgroundColor: Colors.amber,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                (Icons.person),
              ),
              label: "Perfil",
              backgroundColor: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }
}
