import 'package:flutter/material.dart';

import 'package:tfg/widgets/articulosPromocion.dart';
import 'package:tfg/widgets/carrito.dart';
import 'package:tfg/widgets/listaArticulos.dart';
import 'package:tfg/widgets/perfil.dart';

//TODO: [A] Meter opción de Administracion Barra abajo
//TODO: Logica aparezca opcion de Admn segun usuario conectado
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

    return Scaffold(
      appBar: AppBar(
        title: Text("Mundo Móvil"),
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
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              (Icons.shopping_cart),
            ),
            label: "Carrito",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              (Icons.person),
            ),
            label: "Perfil",
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
