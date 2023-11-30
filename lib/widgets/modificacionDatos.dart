// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tfg/constants.dart';
import 'package:tfg/models/Respuesta.dart';
import 'package:tfg/services/ApiService.dart';

import 'package:shared_preferences/shared_preferences.dart';

//TODO Diseño
//TODO Integrar API Listado Pedidos
//TODO navegar a pantalla Detalle Pedidos con parámetros

class ModificacionDatos extends StatefulWidget {
  const ModificacionDatos({Key? key}) : super(key: key);

  @override
  State<ModificacionDatos> createState() => _ModificacionDatosState();
}

class _ModificacionDatosState extends State<ModificacionDatos> {
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
      _prefs.setString("nombre_usuario", _nombre);
      _prefs.setString("password_usuario", _password);
      Navigator.pop(context);
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
    return Scaffold(
      body: SafeArea(
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
                child: Text(
                  'Modificar',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kSecondaryColor,
                ),
                child: Text(
                  'Cancelar',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
