import 'package:congressman_app/models/congressman.dart';
import 'package:flutter/material.dart';

class CongressmanTile extends StatelessWidget {
  final Congressman congressman;

  CongressmanTile(this.congressman);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(congressman.photo),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        "INFORMAÇÕES",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.account_circle),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              "Nome: " + congressman.getName(),
                            ),
                            SizedBox(
                              width: 70,
                            ),
                            Flexible(
                              child: Column(
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(
                                        Icons.star_border,
                                        color: Colors.teal,
                                      ),
                                      onPressed: () {}),
                                ],
                              ),
                            ),
                          ],
                        )),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.location_on),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            "Estado: " + congressman.getState(),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.flag),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            "Partido: " + congressman.getParty(),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.email),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            "Contato: " + congressman.getEmail(),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 50,
                      color: Colors.teal,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
