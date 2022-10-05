// ignore_for_file: prefer_const_constructors

import 'package:chat/widgets/custom_input.dart';
import 'package:chat/widgets/labels.dart';
import 'package:chat/widgets/logo.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Logo(titulo: 'Registro'),
                  _Form(),
                  Labels(
                    ruta: 'login',
                    titulo: '¿Ya tienes una cuenta?',
                    subtitulo: 'Ingresa ahora',
                  ),
                  Text(
                    'Terminos y condiciones de uso',
                    style: TextStyle(fontWeight: FontWeight.w200),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      // ignore: prefer_const_literals_to_create_immutables
      child: Column(children: <Widget>[
        CustomInput(
          icon: Icons.perm_identity,
          placeHolder: 'Nombre',
          keyboardType: TextInputType.text,
          textController: nameCtrl,
        ),
        CustomInput(
          icon: Icons.email_outlined,
          placeHolder: 'Correo',
          keyboardType: TextInputType.emailAddress,
          textController: emailCtrl,
        ),
        CustomInput(
          icon: Icons.lock_outline,
          placeHolder: 'Contraseña',
          isPassword: true,
          textController: passCtrl,
        ),
        CustomButton(
          text: 'Ingresar',
          onPressed: () {
            print(emailCtrl.text);
          },
        )
      ]),
    );
  }
}
