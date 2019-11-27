import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:congressman_app/models/congressman.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteBloc implements BlocBase{

  Map<int,Congressman> _favorites = {};

  final StreamController<Map<int, Congressman>> _favoriteController = StreamController<Map<int, Congressman>>.broadcast();
  Stream<Map<int,Congressman>> get outFavorite => _favoriteController.stream;


//  FavoriteBloc(){
//    SharedPreferences.getInstance().then((prefs){
//      /// if some day I have saved a favorite it will return it
//    });
//  }

  void toggleFavorite(Congressman congressman){
    //check if the congressman id its already on fav list
    if(_favorites.containsKey(congressman.id)) _favorites.remove(congressman.id);
    else _favorites[congressman.id] = congressman;

    /// implements automaticaly all the favs congressmen in the view
    _favoriteController.sink.add(_favorites);
  }


  @override
  void dispose() {
    _favoriteController.close();
  }


}