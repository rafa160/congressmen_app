import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataSearch extends SearchDelegate<String> {

  /// Os builds nunca podem retornar null, sempre retornar algum widget
  ///

  @override
  List<Widget> buildActions(BuildContext context) {

    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation

      ),
      onPressed: (){
        close(context, null);
      },
    );
  }



  @override
  Widget buildResults(BuildContext context) {
    Future.delayed(Duration.zero).then((_)=>close(context, query));

    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty){
      return Container();
    } else {
      ///chama o futerebuild com a query que basicamente e o que chamamos na tela
      return FutureBuilder<List>(
        future: suggestions(query),
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            /// retorna cada dado da sugestao
            return ListView.builder(
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(snapshot.data[index]),
                    leading: Icon(Icons.play_arrow),
                    onTap: (){
                      close(context,snapshot.data[index]);
                    },
                  );
                },
              itemCount: snapshot.data.length,
            );
          }
        },
      );
    }
  }

  Future<List> suggestions(String search) async {

    http.Response response = await http.get("https://dadosabertos.camara.leg.br/api/v2/deputados?itens=20&nome=$search&ordem=ASC&ordenarPor=nome");

    if(response.statusCode == 200){
      return json.decode(response.body)["dados"].map((v){
        return v["nome"];

      }).toList();

    } else {
      throw Exception("Fail to load");
    }

  }



}