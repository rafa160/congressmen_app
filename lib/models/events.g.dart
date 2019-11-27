part of 'events.dart';

Event _$EventFromJson(Map<String, dynamic> json){
  return Event(
    id: json["id"],
    dayStart: json["dataHoraInicio"],
    dayEnd: json["dataHoraFim"],
    situation: json["situacao"],
    description: json["descricao"],
    local: json["localExterno"],
    partId: json["id"],
    partName: json["nome"],
    partType: json["tipoOrgao"],
    initials: json["sigla"],

  );
}

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
  'id': instance.id,
  'dataHoraInicio' : instance.dayStart,
  'dataHoraFim': instance.dayEnd,
  'situacao': instance.situation,
  'descricao': instance.description,
  'localExterno': instance.local,
  'nome' : instance.partName,
  'tipoOrgao' : instance.partType,
  'sigla': instance.initials

};

List<Event> _$EventFromJsonArray(List<dynamic> jsonArray){
  List<Event> event = new List<Event>();

  for(var i = 0; i < jsonArray.length; i++ ){
    event.add(_$EventFromJson(jsonArray[i]));
  }

  return event;
}