// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tfg/models/Respuesta.dart';
import 'package:tfg/services/ApiService.dart';
import 'package:tfg/widgets/pedido.dart';
import 'package:shared_preferences/shared_preferences.dart';

//TODO Diseño
//TODO Owerflow Render Error
//TODO Integrar API Listado Pedidos
//TODO navegar a pantalla Detalle Pedidos con parámetros

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  String _nombre = "";
  String _email = "";
  String _password = "";

  final TextEditingController _controllerNombre = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  late SharedPreferences _prefs;
  Respuesta registroOK = Respuesta();

  @override
  void initState() {
    super.initState();
    obtenerValor();
  }

  Future<void> obtenerValor() async {
    _prefs = await SharedPreferences.getInstance();
    String valorNombre = _prefs.getString('nombre_usuario') ?? '';
    String valorEmail = _prefs.getString('correo_usuario') ?? '';
    String valorPassword = _prefs.getString('password_usuario') ?? '';

    setState(() {
      _controllerNombre.text = valorNombre;
      _nombre = valorNombre;
      _controllerEmail.text = valorEmail;
      _email = valorEmail;
      _controllerPassword.text = valorPassword;
      _password = valorPassword;
    });
  }

  Future<bool> _modificarUsuario(nombre, email, password) async {
    registroOK = (await ApiService().modificarUsuario(nombre, email, password));

    return Future.value(registroOK.getRespuestaCorrecta);
  }

  _modificar() async {
    String textoSnackBar;
    Future<bool> res = _modificarUsuario(_nombre, _email, _password);

    if (await res) {
      textoSnackBar = "Cambios realizados";
    } else {
      textoSnackBar = registroOK.mensajeRespuesta;
    }
    final snackBar = SnackBar(
      content: Text(textoSnackBar),
    );

    // Find the ScaffoldMessenger in the widget tree
    // and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    Future<SharedPreferences> prefs = SharedPreferences.getInstance();

    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Tus datos",
                style: TextStyle(
                  fontSize: 20,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(labelText: "Nombre"),
              controller: _controllerNombre,
              onChanged: (texto) {
                _nombre = texto;
              },
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(labelText: "Correo"),
              enabled: false,
              controller: _controllerEmail,
              onChanged: (texto) {
                _email = texto;
              },
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(labelText: "Contraseña"),
              controller: _controllerPassword,
              obscureText: true,
              onChanged: (texto) {
                _password = texto;
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _modificar();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: Text(
                'Modificar',
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Acción a realizar cuando se presiona el botón
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text(
                'Cerrar sesión',
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 20.0),
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
}
