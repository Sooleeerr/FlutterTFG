// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tfg/models/respuesta.dart';
import 'package:tfg/services/ApiService.dart';
import 'package:tfg/widgets/listaPedidos.dart';
import 'package:tfg/widgets/components/menuPerfil.dart';
import 'package:tfg/widgets/modificacionDatos.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  String _nombre = "";

  final TextEditingController _controllerNombre = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
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
            Text("Hola ${_nombre}",
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 40),
            MenuPerfil(
              text: "Mi cuenta",
              icon: Icons.person,
              press: () => {
                //ModficicaionDAtos;
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
      
            /*SizedBox(height: 20.0),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Tus pedidos",
                style: TextStyle(
                  fontSize: 20,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Flexible(
              //flex: 9,
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: GridView.count(
                  crossAxisCount: 1,
                  padding: EdgeInsets.all(20),
                  mainAxisSpacing: 10,
                  childAspectRatio: 20,
                  children: <Widget>[
                    Pedido(),
                    Pedido(),
                    Pedido(),
                    Pedido(),
                    Pedido(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ); //TOCAR A PARTIR DE AQUI
  }
}*/
