import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Inicia sesión"),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                (Icons.home),
              ),
              label: "Principal",
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                (Icons.discount),
              ),
              label: "Promociones",
              backgroundColor: Colors.amber,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                (Icons.shopping_cart),
              ),
              label: "Carrito",
              backgroundColor: Colors.amber,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                (Icons.person),
              ),
              label: "Perfil",
              backgroundColor: Colors.amber,
            ),
          ],
        ),
        body: SafeArea(
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
              ),
              SizedBox(height: 20.0),
              TextField(
                decoration: InputDecoration(labelText: "Contraseña"),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Acción a realizar cuando se presiona el botón
                  print('Botón presionado');
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
                  print('Botón presionado');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                child: Text('Regístrate'),
              ),
            ],
          ),
        )), //TOCAR A PARTIR DE AQUI
      ),
    );
  }
}
