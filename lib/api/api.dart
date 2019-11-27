import 'dart:convert';

import 'package:congressman_app/models/congressman.dart';
import 'package:http/http.dart' as http;

class Api {

  Future<List<Congressman>> search(String search) async{

    http.Response response = await http.get(
      "https://dadosabertos.camara.leg.br/api/v2/deputados?nome=$search&ordem=ASC&ordenarPor=nome"
    );
    return decode(response);

  }


  List<Congressman> decode(http.Response response) {
    if(response.statusCode == 200){

      var decoded = json.decode(response.body);

      List<Congressman> congressmen = decoded["dados"].map<Congressman>(
          (map){
            return Congressman.fromJson(map);
          }
      ).toList();
      return congressmen;
    } else {
      throw Exception("Valha ao carregar Dados");
    }
  }

}