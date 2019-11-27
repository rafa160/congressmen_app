
class User {

  final int id;
  final String email;

  User({this.email, this.id});

  User.fromJson(Map<String, dynamic> json)
     :id = json["id"],
      email = json["email"];

}