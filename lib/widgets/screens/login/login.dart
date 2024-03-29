import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfg/constants.dart';
import 'package:tfg/models/usuario_model.dart';
import 'package:tfg/providers/CarritoProvider.dart';

import 'package:tfg/services/ApiService.dart';
import 'package:tfg/theme.dart';
import 'package:tfg/widgets/components/emailTextFormField.dart';
import 'package:tfg/widgets/components/passwordlTextFormField.dart';
import 'package:tfg/widgets/screens/registro/registro.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home/home.dart';
//TODO OPCIONAL: Olvidarse contraseña

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: AppTheme.lightTheme(context),
      home: const Scaffold(
        body: LoginPage(),
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
  final _formKey = GlobalKey<FormState>();

  String usuarioTextField = "";
  String passwordTextField = "";

  late UsuarioModel? _usuarioModel;
  @override
  void initState() {
    super.initState();
  }

  Future<bool> _getUsuario(usuario, password) async {
    _usuarioModel = (await ApiService().login(usuario, password));

    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    if (_usuarioModel != null) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  _inicializaProviders() {
    Provider.of<CarritoProvider>(context, listen: false).inicializarCarrito();
  }

  _acceder() async {
    String textoSnackBar;
    Future<bool> res = _getUsuario(usuarioTextField, passwordTextField);
    if (await res) {
      textoSnackBar = "Login correcto";
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('nombre_usuario', _usuarioModel!.nombreUsuario);
      prefs.setString('correo_usuario', _usuarioModel!.emailUsuario);
      prefs.setString('password_usuario', _usuarioModel!.contraseaUsuario);
      prefs.setBool('admin_usuario', _usuarioModel!.admin);
      prefs.setString('token_usuario', _usuarioModel!.token);
      _inicializaProviders();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    } else {
      textoSnackBar = "Usuario y/o contraseña no válido";
    }
    final snackBar = SnackBar(
      content: Text(textoSnackBar),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 60),
                const Text(
                  "Bienvenido a Mundo Móvil",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Introduce tu correo y tu contraseña",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                EmailTextFormField(
                  myOnchanged: (texto) {
                    usuarioTextField = texto;
                  },
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Contraseña",
                    //hintText: "Introduce tu contraseña",
                    hintStyle: TextStyle(color: Colors.grey),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    suffixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                  onChanged: (texto) {
                    passwordTextField = texto;
                  },
                ),
                /*PasswordTextFormField(
                  myOnchanged: (texto) {
                    passwordTextField = texto;
                  },
                ),*/
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _acceder();
                    }
                  },
                  child: const Text('Acceder'),
                ),
                const SizedBox(height: 10.0),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "¿Aún no tienes cuenta?   ",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Registro()),
                      ),
                      child: const FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Registrate",
                          style: TextStyle(fontSize: 16, color: kPrimaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
