part 'congressman.g.dart';

class Congressman {

  final String zero = "Sem Informacoes de contato";

  final int id;
  final String name;
  final String party;
  final String state;
  final String photo;
  final String email;

  Congressman({this.id, this.name, this.party, this.state, this.photo,this.email});


  factory Congressman.fromJson(Map<String, dynamic>json) => _$CongressmanFromJson(json);

  Map<String, dynamic> toJson() => _$CongressmanToJson(this);

  static fromJsonArray(List<dynamic> jsonArray) => _$CongressmanFromJsonArray(jsonArray);


  int getId(){
    if(id == null){
      return id;
    }
    return null;
  }

  String getName(){
    if(name == null){
      return "Dado não Informado";
    }

    return name;
  }

  String getParty(){
    if(party == null){
      return "Dado não Informado";
    }
    return party;
  }

  String getState(){
    if(state == null){
      return "Dado não Informado";
    }
    return state;
  }

  String getPhoto(){
    if(photo == null){
      return "Dado não Informado";
    }
    return photo;
  }

  String getEmail(){
    if(email == null){
      return "Dado não Informado";
    } else {
      return email;
    }
  }


//  factory Congressman.fromJson(Map<String, dynamic> json) {
//
//    return Congressman(
//      id: json["deputado_"]["id"],
//      name: json["deputado_"]["nome"],
//      party: json["deputado_"]["siglaPartido"],
//      state: json["deputado_"]["siglaUf"],
//      photo: json["deputado_"]["urlFoto"]
//    );
//
//  }


//  static fromJsonArray(List<dynamic> jsonArray) =>
//      _$BasketProductFromJsonArray(jsonArray);
//


}