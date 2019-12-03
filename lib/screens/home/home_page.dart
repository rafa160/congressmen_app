import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:congressman_app/blocs/event_bloc.dart';
import 'package:congressman_app/delegates/data_search.dart';
import 'package:congressman_app/screens/congressmen/all_congressmen.dart';
import 'package:congressman_app/screens/congressmen/congressmen_events.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Container(
          alignment: Alignment.topLeft,
          height: 40,
          child: Image.asset("assets/camara.png"),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: _listOfItens(),
    );
  }

  Widget _listOfItens() {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 8,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AllCongressmenSearch()));
          },
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 100,
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSt9ZPWVuXj5Bq5hcehx58fsYqPI2o3fWwIv1eIP9Ne0i2gmLYy",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Listagem e busca de deputados, segundo critérios.",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        InkWell(
          onTap: () async {
            String showData;
            if(showData == null) BlocProvider.of<EventBloc>(context).showEvents.add(showData);
            print(showData);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CongressmanEvents()));
          },
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 100,
                  child: Image.network(
                    "https://www.al.ro.leg.br/institucional/noticias/assembleia-legislativa-de-rondonia-da-posse-ao-governador-reeleito-confucio-moura-1/@@images/bc7b3afb-d03e-404d-acfb-67589b881fde.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Eventos dos Parlamentares",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AllCongressmenSearch()));
          },
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 100,
                  child: Image.network(
                    "https://g37.com.br/imagens/88672/governo-de-minas-investiga-prejuizo-aos-cofres-publicos-de-mais-de-r-74-milhoes_20112019204610.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "As despesas com exercício parlamentar do deputado.",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        InkWell(
          onTap: () {},
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 100,
                  child: Image.network(
                    "http://www.camara.gov.br/internet/bancoimagem/banco/img201605111140234202316.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Informações detalhadas sobre um deputado específico.",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
