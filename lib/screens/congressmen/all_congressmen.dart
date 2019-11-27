import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:congressman_app/blocs/congressmen_bloc.dart';
import 'package:congressman_app/blocs/favorite_bloc.dart';
import 'package:congressman_app/delegates/data_search.dart';
import 'package:congressman_app/models/congressman.dart';
import 'package:congressman_app/screens/congressmen/widgets/congressman_tile.dart';
import 'package:flutter/material.dart';


class AllCongressmenSearch extends StatelessWidget {

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
          Align(
            alignment: Alignment.center,
            child: StreamBuilder<Map<int,Congressman>>(
              stream: BlocProvider.of<FavoriteBloc>(context).outFavorite,
                initialData: {},
                builder: (context, snapshot){
                 if(snapshot.hasData){
                   return Text("${snapshot.data.length}",);
                 } else {
                   return Container();
                 }
                },
            ),
          ),
          IconButton(
            icon: Icon(Icons.star),
            onPressed: (){

            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String result = await showSearch(context: context, delegate: DataSearch());
              //access your bloc
              if(result != null) BlocProvider.of<CongressmenBloc>(context).inSearch.add(result);
              print(result);
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: StreamBuilder(
          stream:BlocProvider.of<CongressmenBloc>(context).outCongressmen,
          builder: (context, snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                itemBuilder:(context, index) {
                  return CongressmanTile(snapshot.data[index]);
                },
                itemCount: snapshot.data.length,
              );
            } else {
              return Container();
            }
          }),
    );
  }
}
