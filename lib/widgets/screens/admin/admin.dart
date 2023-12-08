import 'package:flutter/material.dart';
import 'package:tfg/widgets/screens/admin/mantenimientoArticulos.dart';
import 'package:tfg/widgets/screens/perfil/components/menuPerfil.dart';

class Administrador extends StatelessWidget {
  const Administrador({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Text("Menú de administración",
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 40),
            MenuPerfil(
              text: "Mantenimiento artículos",
              icon: Icons.person,
              press: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MantenimientoArticulos()),
                )
              },
            ),
          ],
        ),
      ),
    ); //TOCAR A PARTIR DE AQUI
  }
}
