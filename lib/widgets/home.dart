// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:tfg/constants.dart';
import 'package:tfg/models/carrito_model.dart';
import 'package:tfg/providers/CarritoProvider.dart';

import 'package:tfg/widgets/admin.dart';

import 'package:tfg/widgets/articulosPromocion.dart';
import 'package:tfg/widgets/carrito.dart';
import 'package:tfg/widgets/components/IconWithCounter.dart';
import 'package:tfg/widgets/filtrado.dart';
import 'package:tfg/widgets/listaArticulos.dart';
import 'package:tfg/widgets/perfil.dart';

//TODO: Logica aparezca opcion de Admn segun usuario conectado
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  int numItems = 0;

  @override
  void initState() {
    super.initState();
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
      ListaArticulos(),
      ListaArticulosPromocion(),
      Carrito(
          carrito: (Provider.of<CarritoProvider>(context)),
          callback: updateCurrentIndex),
      Perfil(),
      //Administrador()
      //Filtrado(),
    ];

    return Scaffold(
      /*appBar: AppBar(
        title: Text("Mundo Móvil"),
      ),*/
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
            /*icon: Icon(
                (Icons.shopping_cart),
              ),*/
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
            //label: "Perfil",
            //backgroundColor: Colors.blue,
          ),
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
