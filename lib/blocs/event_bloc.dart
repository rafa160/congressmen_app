import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:congressman_app/api/api.dart';
import 'package:congressman_app/models/events.dart';

class EventBloc implements BlocBase{

 Api api;

 final StreamController<List<Event>> _eventController = StreamController.broadcast();
 Stream get outEvent => _eventController.stream.asBroadcastStream();

 final StreamController<String> _returnEventController = StreamController<String>();
 Sink get showEvents => _returnEventController.sink;


 EventBloc(){
   api = Api();

   _returnEventController.stream.toList();
 }

  @override
  void dispose() {
    _eventController.close();
    _returnEventController.close();
  }



}