// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tfg/models/Respuesta.dart';
import 'package:tfg/services/ApiService.dart';

class Registro extends StatefulWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  String _nombre = "";
  String _email = "";
  String _password = "";
  Respuesta registroOK = Respuesta();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Regístrate"),
          ),
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(40),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                ),
                SizedBox(height: 40.0),
                TextField(
                  decoration: InputDecoration(labelText: "Introduce tu nombre"),
                  onChanged: (texto) {
                    _nombre = texto;
                  },
                ),
                SizedBox(height: 20.0),
                TextField(
                  decoration: InputDecoration(labelText: "Introduce tu correo"),
                  onChanged: (texto) {
                    _email = texto;
                  },
                ),
                SizedBox(height: 20.0),
                TextField(
                  decoration:
                      InputDecoration(labelText: "Introduce tu contraseña"),
                  onChanged: (texto) {
                    _password = texto;
                  },
                ),
                SizedBox(height: 40.0),
                ElevatedButton(
                  onPressed: () {
                    // Acción a realizar cuando se presiona el botón
                    _registro();
                  },
                  child: Text('Regístrate'),
                ),
              ],
            ),
          ),
        ));
  }

  Future<bool> _registroUsuario(nombre, email, password) async {
    registroOK = (await ApiService().registro(nombre, email, password));

    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));

    return Future.value(registroOK.getRespuestaCorrecta);
  }

  _registro() async {
    String textoSnackBar;
    Future<bool> res = _registroUsuario(_nombre, _email, _password);

    if (await res) {
      textoSnackBar = "Registro correcto";
      //SharedAppData.setValue(context, UsuarioModel, _usuarioModel);
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
}
