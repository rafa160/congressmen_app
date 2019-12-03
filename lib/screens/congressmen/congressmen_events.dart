import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:congressman_app/blocs/event_bloc.dart';
import 'package:congressman_app/models/events.dart';
import 'package:congressman_app/screens/congressmen/widgets/congressman_events.dart';
import 'package:flutter/material.dart';

class CongressmanEvents extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
         initialData: {},
        stream: BlocProvider.of<EventBloc>(context).outEvent,
          builder: (context, snapshot){
           if(snapshot.hasData){
             return ListView.builder(
                 itemBuilder: (context, index){
                   return CongressmanEventsTile(snapshot.data[index]);
                 },
                 itemCount: snapshot.data.length,
             );
           } else {
             return Container();
           }
          }
      ),
    );
  }
}
