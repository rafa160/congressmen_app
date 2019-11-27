part 'events.g.dart';

class Event {

  final int id;
  final String dayStart;
  final String dayEnd;
  final String situation;
  final String description;
  final String local;
  final int partId;
  final String initials;
  final String partName;
  final String partType;
  final String partNickname;

  Event({this.id, this.dayStart, this.dayEnd, this.situation, this.description, this.local, this.partId, this.initials, this.partName, this.partType, this.partNickname});


  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);

  static fromJsonArray(List<dynamic> jsonArray) => _$EventFromJsonArray(jsonArray);






}