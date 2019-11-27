import 'package:congressman_app/blocs/login_bloc.dart';
import 'package:congressman_app/screens/login/login_page.dart';
import 'package:congressman_app/screens/login/widgets/input_field.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(alignment: Alignment.center, children: <Widget>[
        Container(),
        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset('assets/logo.png'),
                SizedBox(
                  height: 20,
                ),
                InputField(
                  keybord: TextInputType.text,
                  hint: "Nome",
                  obscure: false,
//                      stream: _loginBloc.outEmail,
//                      onChanged: _loginBloc.changeEmail,
                ),
                SizedBox(
                  height: 10,
                ),
                InputField(
                  keybord: TextInputType.emailAddress,
                  hint: "E-mail",
                  obscure: false,
//                      stream: _loginBloc.outEmail,
//                      onChanged: _loginBloc.changeEmail,
                ),
                SizedBox(
                  height: 10,
                ),
                InputField(
                  keybord: TextInputType.number,
                  hint: "Senha",
                  obscure: true,
//                      stream: _loginBloc.outPassword,
//                      onChanged: _loginBloc.changePass,
                ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  color: Colors.teal,
                  child: Text("Cadastrar"),
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> LoginPage()));
                  },
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
