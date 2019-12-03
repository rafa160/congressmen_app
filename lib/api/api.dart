import 'dart:convert';

import 'package:congressman_app/models/congressman.dart';
import 'package:congressman_app/models/events.dart';
import 'package:http/http.dart' as http;

class Api {

  Future<List<Congressman>> search(String search) async{

    http.Response response = await http.get(
      "https://dadosabertos.camara.leg.br/api/v2/deputados?nome=$search&ordem=ASC&ordenarPor=nome"
    );
    return decode(response);

  }


  
  Future<List<Event>> searchEvent() async {
    http.Response responseEvent = await http.get("https://dadosabertos.camara.leg.br/api/v2/eventos?ordem=ASC&ordenarPor=dataHoraInicio");
    return decodeEvent(responseEvent);
  }

  List<Event> decodeEvent(http.Response response){
    if(response.statusCode == 200){
      var decoded =json.decode(response.body);

      List<Event> event = decoded["dados"].map<Event>(
          (map){
            return Event.fromJson(map);
          }
      ).toList();
      print(event);
      return event;
    } else {
      throw Exception("Falha ao carregar Dados");
    }
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
      throw Exception("Falha ao carregar Dados");
    }
  }

}