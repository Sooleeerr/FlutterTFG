import 'package:flutter/material.dart';
import 'package:tfg/constants.dart';
import 'package:tfg/models/respuesta.dart';
import 'package:tfg/services/ApiService.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tfg/widgets/components/appBarAtras.dart';
import 'package:tfg/widgets/components/passwordlTextFormField.dart';

class ModificacionDatos extends StatefulWidget {
  const ModificacionDatos({Key? key}) : super(key: key);

  @override
  State<ModificacionDatos> createState() => _ModificacionDatosState();
}

class _ModificacionDatosState extends State<ModificacionDatos> {
  String _nombre = "";
  String _email = "";
  String _password = "";
  String _token = "";
  final _formKey = GlobalKey<FormState>();

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
    String valorToken = _prefs.getString('token_usuario') ?? '';

    setState(() {
      _controllerNombre.text = valorNombre;
      _nombre = valorNombre;
      _controllerEmail.text = valorEmail;
      _email = valorEmail;
      _controllerPassword.text = valorPassword;
      _password = valorPassword;
      _token = valorToken;
    });
  }

  Future<bool> _modificarUsuario(nombre, email, password) async {
    registroOK =
        (await ApiService().modificarUsuario(nombre, email, password, _token));

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

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: AppBarAtras(),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Tus datos",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Nombre"),
                    controller: _controllerNombre,
                    onChanged: (texto) {
                      _nombre = texto;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Este campo es obligatorio';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Correo"),
                    enabled: false,
                    controller: _controllerEmail,
                    onChanged: (texto) {
                      _email = texto;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: _controllerPassword,
                    obscureText: true,
                    onChanged: (texto) {
                      _password = texto;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      labelText: "Contraseña",
                      hintStyle: TextStyle(color: Colors.grey),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      suffixIcon: Icon(Icons.lock),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Este campo es obligatorio';
                      } else if (value.length < 8) {
                        return 'Longitud mínima de contraseña: 8';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      _modificar();
                    },
                    child: const Text(
                      'Modificar',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kSecondaryColor,
                    ),
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
