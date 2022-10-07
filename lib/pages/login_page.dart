// ignore_for_file: prefer_const_constructors

import 'package:chat/services/auth_service.dart';
import 'package:chat/widgets/custom_input.dart';
import 'package:chat/widgets/labels.dart';
import 'package:chat/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_button.dart';
import '../widgets/mostrar_alerta.dart';

class LoginPage extends StatelessWidget {
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
                  Logo(
                    titulo: 'Messenger',
                  ),
                  _Form(),
                  Labels(
                    ruta: 'register',
                    titulo: '¿No tienes una cuenta?',
                    subtitulo: 'Crea una ahora',
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
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      // ignore: prefer_const_literals_to_create_immutables
      child: Column(children: <Widget>[
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
          onPressed: authService.autenticando
              ? () => {}
              : () async {
                  FocusScope.of(context).unfocus();

                  final loginOk = await authService.login(
                      emailCtrl.text.trim(), passCtrl.text.trim());

                  if (loginOk) {
                    // TODO: Conectar a nuestro socket server
                    Navigator.pushReplacementNamed(context, 'usuarios');
                  } else {
                    // Mostara alerta
                    mostrarAlerta(context, 'Login incorrecto',
                        'Revise sus credenciales nuevamente');
                  }
                },
        )
      ]),
    );
  }
}
