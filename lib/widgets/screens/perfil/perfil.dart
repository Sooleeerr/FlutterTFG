// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tfg/widgets/screens/listaPedidos/listaPedidos.dart';
import 'package:tfg/widgets/screens/perfil/components/menuPerfil.dart';
import 'package:tfg/widgets/screens/modificacionDatos/modificacionDatos.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  String _nombre = "";

  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    obtenerValor();
  }

  Future<void> obtenerValor() async {
    _prefs = await SharedPreferences.getInstance();
    _nombre = _prefs.getString('nombre_usuario') ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Text("Hola $_nombre",
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 40),
            MenuPerfil(
              text: "Mi cuenta",
              icon: Icons.person,
              press: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ModificacionDatos()),
                ).then((value) => obtenerValor())
              },
            ),
            MenuPerfil(
              text: "Mis pedidos",
              icon: Icons.list_alt,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListaPedidos()),
                );
              },
            ),
            MenuPerfil(
              text: "Cerrar sesión",
              icon: Icons.logout,
              press: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
