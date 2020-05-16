import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:frogbitflutter/constants/ui_constants.dart';

class ListCard extends StatelessWidget {
  ListCard({this.name, this.tagLine, this.imageUrl, this.id});

  final String name;
  final String imageUrl;
  final String tagLine;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.grey[400],
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Image.network(imageUrl),
              ),
              SizedBox(
                width: 15.0,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: <Widget>[
                    Text(
                      '${name.toUpperCase()}...$id',
                      textAlign: TextAlign.center,
                      style: kTextFieldStyle,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      //TODO: 2 Edit style as constant
                      //TODO: 3 Text widgets are repeated
                      '"$tagLine"',
                      textAlign: TextAlign.center,
                      style: kTextFieldStyle.copyWith(
                          fontSize: 15.0, color: Colors.blueGrey),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.star_border,
                    color: Color(0xFFfab000),
                    size: 30.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
