import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:congressman_app/api/api.dart';
import 'package:congressman_app/models/congressman.dart';
import 'dart:async';

class CongressmenBloc implements BlocBase {

  /// Here we will have two Streams controllers - congressmen and the other is the search
  /// in the first one we will have access out side the bloc and the seconed one we get in entrance
  /// outside the bloc. The searchController it has a listener that get something call the search, then
  /// the search call the Api get the dados and return a list

  Api api;

  List<Congressman> congressmen;

  ///***To prevent  error, expose a broadcast Stream. You can convert your stream to a broadcast using ***///

  final StreamController<List<Congressman>> _congressmenController = StreamController.broadcast();
  // listening the controller to get everything on it
  Stream get outCongressmen => _congressmenController.stream.asBroadcastStream();

  //recive dados from outside
  final StreamController<String> _searchController = StreamController<String>();
  Sink get inSearch => _searchController.sink;

  // acesso a api dento do bloc
  CongressmenBloc(){
     api = Api();

     _searchController.stream.listen(_search);

  }


  //this will get the search from Api and send it to the _searchController
  void _search(String search) async{

    congressmen = await api.search(search);
    // by doing that, now u can have access to your api results using our ***outCongressmen
    _congressmenController.sink.add(congressmen);


  }


  /// always stream opened must be closed after.
  @override
  void dispose() {
    _congressmenController.close();
    _searchController.close();

  }

}