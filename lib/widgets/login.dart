import 'package:flutter/material.dart';
import 'package:tfg/main.dart';
import 'package:tfg/models/UsuarioModel.dart';
import 'package:tfg/services/ApiService.dart';
import 'package:tfg/widgets/registro.dart';

import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(body: LoginPage() //TOCAR A PARTIR DE AQUI,
          ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String usuarioTextField = "";
  String passwordTextField = "";

  late UsuarioModel? _usuarioModel;

  Future<bool> _getUsuario(usuario, password) async {
    _usuarioModel = (await ApiService().login(usuario, password));

    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    if (_usuarioModel != null) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  _acceder() async {
    String textoSnackBar;
    Future<bool> res = _getUsuario(usuarioTextField, passwordTextField);
    if (await res) {
      textoSnackBar = "Login correcto";
      //SharedAppData.setValue(context, UsuarioModel, _usuarioModel);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } else {
      textoSnackBar = "Usuario y/o contraseña no válido";
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
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
            ),
            SizedBox(height: 100.0),
            TextField(
              decoration: InputDecoration(labelText: "Correo"),
              onChanged: (texto) {
                usuarioTextField = texto;
              },
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(labelText: "Contraseña"),
              onChanged: (texto) {
                passwordTextField = texto;
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _acceder();
              },
              child: Text('Acceder'),
            ),
            SizedBox(height: 10.0),
            Text(
              "¿Aún no tienes cuenta?",
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                // Acción a realizar cuando se presiona el botón
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Registro()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text('Regístrate'),
            ),
          ],
        ),
      ),
    );
  }
}
