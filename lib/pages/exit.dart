import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Exit extends StatefulWidget {
  @override
  _ExitState createState() => _ExitState();
}

class _ExitState extends State<Exit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[300],
      body: Center(
        child: Container(
          width: 300.0,
          height: 150,
          child: Card(
            color: Colors.blueGrey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(
                color: Colors.blueGrey,
                width: 2.0,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const ListTile(
                  title: Center(child: Text(
                      'Are you sure?',
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.w600,
                      ),
                  )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      width: 125,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancel',style: TextStyle(fontSize: 20),),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(Colors.blueGrey[800]),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 125,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          SystemNavigator.pop();
                        },
                        child: Text('Exit', style: TextStyle(fontSize: 20),),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(Colors.blueGrey[800]),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        ),
    );
  }
}
