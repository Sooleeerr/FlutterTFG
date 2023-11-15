import 'package:flutter/material.dart';
import 'package:tfg/widgets/pedido.dart';

class detalleArticulo extends StatelessWidget {
  const detalleArticulo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Mundo Móvil"),
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
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 4,
                        child: Container(
                          child: Image(
                            image: NetworkImage(
                                "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg"),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 6,
                        child: Container(
                          alignment: Alignment.center,
                          child: Column(children: [
                            Text("nombre_articulo"),
                            Text("precio_articulo"),
                          ]),
                        ),
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Acción a realizar cuando se presiona el botón
                    print('Botón presionado');
                  },
                  child: Text('Añadir al carrito'),
                ),
                SizedBox(height: 20),
                Text("marca_articulo"),
                Text("modelo_articulo"),
                Text("color_articulo"),
                Text("almacenamiento_articulo"),
                SizedBox(height: 40),
                Text("Articulos relacionados"),
                Container(
                  child: Row(
                    children: [
                      Text("Hola"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ), //TOCAR A PARTIR DE AQUI
      ),
    );
  }
}
