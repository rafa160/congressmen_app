import 'dart:async';

class LoginValidators {

  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){
      if(email.contains("@")){
        sink.add(email);
      } else {
        sink.addError("Insira um e-mail valido");
      }
    }
  );

  final validatePass = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink){
      if(password.isEmpty){
        sink.addError("A senha precisar ser preenchida com no minimo 4 numeros");
      } else if (password.length < 4) {
        sink.addError("A senha precisar ter no minimo 4 digitos");
      } else if (password.contains(",")) {
        sink.addError("Apenas numeros sao permitidos");
      } else {
        sink.add(password);
      }
    }
  );


}