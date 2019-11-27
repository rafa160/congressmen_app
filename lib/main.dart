
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:congressman_app/blocs/congressmen_bloc.dart';
import 'package:congressman_app/screens/home/home_page.dart';
import 'package:congressman_app/screens/login/login_page.dart';
import 'package:flutter/material.dart';

import 'api/api.dart';

void main() {
Api api = Api();

api.search("marcos");
runApp(MyApp());}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  ///Using the bloc Provider u can call your blocs anywhere in ur code
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: CongressmenBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: LoginPage(),
      ),
    );
  }
}
