import 'package:cloud_firestore/cloud_firestore.dart';

class CongressmenData {

  String category;
  String id;
  String title;
  String image;

  CongressmenData.fromDoc(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    title = snapshot.data["title"];
    image = snapshot.data["image"];
  }
}