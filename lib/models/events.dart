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



  int getId(){
    if(id == null){
      return id;
    }
    return null;
  }

  String getDayStart(){
    if(dayStart == null){
      return dayStart;
    }
    return null;
  }


  String getDayEnd(){
    if(dayEnd == null){
      return dayEnd;
    }
    return null;
  }

  String getSituation(){
    if(situation == null){
      return situation;
    }
    return null;
  }

  String getDescription(){
    if(description == null){
      return description;
    }
    return null;
  }

  String getLocal(){
    if(local == null){
      return local;
    }
    return null;
  }

  int getPartyId(){
    if(partId == null){
      return partId;
    }
    return null;
  }


  String getInitials(){
    if(initials == null){
      return initials;
    }
    return null;
  }


  String getPartyName(){
    if(partName == null){
      return partName;
    }
    return null;
  }


  String getPartyNickName(){
    if(partNickname == null){
      return partNickname;
    }
    return null;
  }

  String getPartyType(){
    if(partType == null){
      return partType;
    }
    return null;
  }



}