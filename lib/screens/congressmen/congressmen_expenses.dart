import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:congressman_app/blocs/congressmen_bloc.dart';
import 'package:congressman_app/screens/congressmen/widgets/congressman_tile.dart';
import 'package:flutter/material.dart';

class CongressmenExpenses extends StatelessWidget {


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
            child: Text("0",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
          ),
          IconButton(
            icon: Icon(Icons.star),
            onPressed: (){

            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {

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
