import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:congressman_app/models/congressmen_data.dart';
import 'package:congressman_app/screens/home/home_page.dart';

import 'package:congressman_app/screens/loading/loading_page.dart';
import 'package:congressman_app/screens/login/widgets/animation_button.dart';
import 'package:congressman_app/screens/login/widgets/input_field.dart';
import 'package:congressman_app/blocs/login_bloc.dart';
import 'package:congressman_app/screens/signup/signup_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<LoginState>(
          stream: _loginBloc.outState,
          initialData: LoginState.LOADING,
          builder: (context, snapshot) {
            print(snapshot.data);
            switch (snapshot.data) {
              case LoginState.LOADING:
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.teal),
                  ),
                );
              case LoginState.IDLE:
              case LoginState.SUCCESS:
              case LoginState.FAIL:
                return Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(),
                    SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Image.asset('assets/camara.png'),
                            SizedBox(
                              height:100,
                            ),
                            InputField(
                              keybord: TextInputType.emailAddress,
                              hint: "E-mail",
                              obscure: false,
                              stream: _loginBloc.outEmail,
                              onChanged: _loginBloc.changeEmail,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            InputField(
                              keybord: TextInputType.number,
                              hint: "Senha",
                              obscure: true,
                              stream: _loginBloc.outPassword,
                              onChanged: _loginBloc.changePass,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            StreamBuilder<bool>(
                                stream: _loginBloc.outSubmitValid,
                                builder: (context, snapshot) {
                                  return RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    color: Colors.teal,
                                    child: Text("Entrar"),
                                    textColor: Colors.white,
                                    onPressed: () {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomePage()));
                                    },
//                                  onPressed: snapshot.hasData ? _loginBloc.submit : null,
//                                  disabledColor: Colors.blueAccent.withAlpha(140),
                                  );
                                }),
                            SizedBox(
                              height: 70,
                            ),
                            FlatButton(
                              child: Text(
                                "Nao Possui Cadastro?",
                                style: TextStyle(color: Colors.red),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => SignUpPage()));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
            }
          }),
    );
  }
}
