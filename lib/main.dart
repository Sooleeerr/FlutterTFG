import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tfg/providers/CarritoProvider.dart';

import 'package:tfg/widgets/screens/login/login.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CarritoProvider()),
      ],
      child: const Login(),
    ),
  );
}
