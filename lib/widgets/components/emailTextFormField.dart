import 'package:flutter/material.dart';
import 'package:tfg/constants.dart';

class EmailTextFormField extends StatelessWidget {
  final ValueChanged<String>? myOnchanged;
  const EmailTextFormField({Key? key, this.myOnchanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: const InputDecoration(
        labelText: "Correo",
        //hintText: "Introduce tu correo",
        hintStyle: TextStyle(color: Colors.grey),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        suffixIcon: Icon(Icons.mail),
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: myOnchanged,
      validator: (value) {
        if (value!.isEmpty) {
          return "Este campo es obligatorio";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          return "Correo no válido";
        }
        return null;
      },
    );
  }
}
