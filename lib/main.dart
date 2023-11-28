import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfg/models/CarritoModel.dart';
import 'package:tfg/providers/CarritoProvider.dart';
import 'package:tfg/widgets/carrito.dart';

import 'package:tfg/widgets/detallePedido.dart';
import 'package:tfg/widgets/filtrado.dart';

import 'package:tfg/widgets/login.dart';

void main() {
  //runApp(const detallePedido());

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CarritoProvider())],
      child: const Login(),
    ),
    //Login(),
  );
}
