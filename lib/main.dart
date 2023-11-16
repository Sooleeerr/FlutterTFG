import 'package:flutter/material.dart';
import 'package:tfg/widgets/articulo.dart';
import 'package:tfg/widgets/articuloDetallePedido.dart';
import 'package:tfg/widgets/articulosPromocion.dart';
import 'package:tfg/widgets/carrito.dart';
import 'package:tfg/widgets/detalleArticulo.dart';
import 'package:tfg/widgets/detallePedido.dart';
import 'package:tfg/widgets/listaArticulos.dart';
import 'package:tfg/widgets/login.dart';
import 'package:tfg/widgets/perfil.dart';
import 'package:tfg/widgets/registro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = <Widget>[
      ListaArticulos(),
      ListaArticulosPromocion(),
      Carrito(),
      Perfil(),
    ];

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
          child: IndexedStack(
            index: _selectedIndex,
            children: _pages,
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
