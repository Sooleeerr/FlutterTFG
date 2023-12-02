// ignore_for_file: file_names, unnecessary_this

import 'dart:convert';

UsuarioModel usuarioModelFromJson(String str) =>
    UsuarioModel.fromJson(json.decode(str));

String usuarioModelToJson(UsuarioModel data) => json.encode(data.toJson());

class UsuarioModel {
  String id;
  String contraseaUsuario;
  String emailUsuario;
  String idUsuario;
  String nombreUsuario;

  UsuarioModel({
    required this.id,
    required this.contraseaUsuario,
    required this.emailUsuario,
    required this.idUsuario,
    required this.nombreUsuario,
  });

  factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
        id: json["_id"],
        contraseaUsuario: json["contraseña_usuario"],
        emailUsuario: json["email_usuario"],
        idUsuario: json["id_usuario"],
        nombreUsuario: json["nombre_usuario"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "contraseña_usuario": contraseaUsuario,
        "email_usuario": emailUsuario,
        "id_usuario": idUsuario,
        "nombre_usuario": nombreUsuario,
      };
}
