import 'package:congressman_app/models/events.dart';
import 'package:flutter/material.dart';

class CongressmanEventsTile extends StatelessWidget {
  final Event event;

  CongressmanEventsTile(this.event);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: <Widget>[
          Text(
              event.getDescription()
          ),
        ],
      ),
    );
  }
}
