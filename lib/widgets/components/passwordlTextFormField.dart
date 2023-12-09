import 'package:flutter/material.dart';

class PasswordTextFormField extends StatelessWidget {
  final ValueChanged<String>? myOnchanged;
  const PasswordTextFormField({Key? key, this.myOnchanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: const InputDecoration(
        labelText: "Contraseña",
        //hintText: "Introduce tu contraseña",
        hintStyle: TextStyle(color: Colors.grey),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        suffixIcon: Icon(Icons.lock),
      ),
      obscureText: true,
      onChanged: myOnchanged,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Este campo es obligatorio';
        } else if (value.length < 8) {
          return 'Longitud mínima de contraseña: 8';
        }
        return null;
      },
    );
  }
}
