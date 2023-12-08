// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tfg/models/respuesta.dart';
import 'package:tfg/services/ApiService.dart';
import 'package:tfg/widgets/components/appBarAtras.dart';
import 'package:tfg/widgets/components/emailTextFormField.dart';
import 'package:tfg/widgets/components/passwordlTextFormField.dart';

class Registro extends StatefulWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  final _formKey = GlobalKey<FormState>();
  String _nombre = "";
  String _email = "";
  String _password = "";
  Respuesta registroOK = Respuesta();
  Future<bool> _registroUsuario(nombre, email, password) async {
    registroOK = (await ApiService().registro(nombre, email, password));

    //Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: false,
        extendBodyBehindAppBar: false,
        backgroundColor: const Color(0xFFF5F6F9),
        appBar: AppBarAtras(),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(40),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                    ),
                    SizedBox(height: 40.0),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        labelText: "Nombre",
                        //hintText: "Introduce tu nombre",
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
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
                    SizedBox(height: 20.0),
                    EmailTextFormField(
                      myOnchanged: (texto) {
                        _email = texto;
                      },
                    ),
                    SizedBox(height: 20.0),
                    PasswordTextFormField(
                      myOnchanged: (texto) {
                        _password = texto;
                      },
                    ),
                    SizedBox(height: 40.0),
                    ElevatedButton(
                      onPressed: () {
                        // Acción a realizar cuando se presiona el botón
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          _registro();
                        }
                      },
                      child: Text('Regístrate'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
