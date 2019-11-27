part of 'congressman.dart';

Congressman _$CongressmanFromJson(Map<String, dynamic> json){
  return Congressman(
      id: json["id"],
      name: json["nome"],
      party: json["siglaPartido"],
      state: json["siglaUf"],
      photo: json["urlFoto"],
      email: json["email"]
  );
}


Map<String,dynamic> _$CongressmanToJson(Congressman instance) => <String, dynamic>{
  'id': instance.id,
  'nome': instance.name,
  'sligaPartido': instance.party,
  'siglaUrf': instance.state,
  'urlPhoto': instance.photo,
  'email': instance.email
};

List<Congressman> _$CongressmanFromJsonArray(List<dynamic> jsonArray){
  List<Congressman> congressman = new List<Congressman>();

  for (var i = 0; i < jsonArray.length; i++){
    congressman.add(_$CongressmanFromJson(jsonArray[i]));
  }

  return congressman;
}

