// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:tfg/constants.dart';

import 'package:tfg/providers/CarritoProvider.dart';
import 'package:tfg/widgets/screens/admin/admin.dart';

import 'package:tfg/widgets/screens/articulosPromocion/articulosPromocion.dart';
import 'package:tfg/widgets/screens/carrito/carrito.dart';
import 'package:tfg/widgets/components/IconWithCounter.dart';

import 'package:tfg/widgets/screens/listaArticulos/listaArticulos.dart';
import 'package:tfg/widgets/screens/perfil/perfil.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  int numItems = 0;
  late SharedPreferences _prefs;
  bool _adminUsuario = false;

  @override
  void initState() {
    super.initState();
    _recuperaDatosUsuario();
  }

  void _recuperaDatosUsuario() async {
    _prefs = await SharedPreferences.getInstance();
    _adminUsuario = _prefs.getBool('admin_usuario') ?? false;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void updateCurrentIndex(int newIndex) {
    setState(() {
      _selectedIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = <Widget>[
      ListaArticulos(key: UniqueKey()),
      ListaArticulosPromocion(key: UniqueKey()),
      Carrito(
          carrito: (Provider.of<CarritoProvider>(context)),
          callback: updateCurrentIndex),
      Perfil(),
      Administrador(),
    ];

    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        fixedColor: kPrimaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon((Icons.home)),
            label: "Principal",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              (Icons.discount),
            ),
            label: "Promociones",
          ),
          BottomNavigationBarItem(
            icon: IconWithCounter(
              icon: Icons.shopping_cart,
              numOfItem: (Provider.of<CarritoProvider>(context)
                          .carritoModel
                          .numeroArticulos) !=
                      null
                  ? Provider.of<CarritoProvider>(context)
                      .carritoModel
                      .numeroArticulos!
                  : 0,
            ),
            label: "Carrito",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              (Icons.person),
            ),
            label: "Perfil",
          ),
          if (_adminUsuario)
            BottomNavigationBarItem(
              icon: Icon(
                (Icons.admin_panel_settings),
              ),
              label: "Administrador",
            ),
        ],
      ),
    );
  }
}
