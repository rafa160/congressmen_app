import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:congressman_app/validators/login_validators.dart';
import 'package:rxdart/rxdart.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum LoginState {IDLE, LOADING, SUCCESS,FAIL}

class LoginBloc extends BlocBase  with LoginValidators{

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _stateController = BehaviorSubject<LoginState>();

  Stream<String> get outEmail => _emailController.stream.transform(validateEmail);
  Stream<String> get outPassword => _passwordController.stream.transform(validatePass);

  Stream<LoginState> get outState => _stateController.stream;

  Stream<bool> get outSubmitValid => Observable.combineLatest2(
      outEmail, outPassword, (a,b)=> true
  );

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePass => _passwordController.sink.add;

  StreamSubscription _streamSubscription;

  LoginBloc () {
    _streamSubscription = FirebaseAuth.instance.onAuthStateChanged.listen((user) async{
      if(user != null){
        if( await verifyUser(user)){
          _stateController.add(LoginState.SUCCESS);
      } else {
          FirebaseAuth.instance.signOut();
          _stateController.add(LoginState.FAIL);
        }
      } else {
        _stateController.add(LoginState.IDLE);
      }
    });
  }

  void submit() {
    final email = _emailController.value;
    final password = _passwordController.value;

    //mostar pra tela que esta processando algo
    _stateController.add(LoginState.LOADING);

    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    ).catchError((e){
      _stateController.add(LoginState.FAIL);
    });

  }

  Future<bool> verifyUser(FirebaseUser user) async {
    return await Firestore.instance.collection("users").document(user.uid).get().then((doc){
      if(doc.data != null){
        return true;
      } else {
        return false;
      }
    }).catchError((e){
      return false;
    });
  }


  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
    _stateController.close();
//fexa o bloc login
    _streamSubscription.cancel();
  }


}