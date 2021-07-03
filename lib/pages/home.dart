import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final st =  ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      backgroundColor: MaterialStateProperty.all(Colors.brown[900]),
    );
    return Scaffold(
      backgroundColor: Colors.brown[500],
      appBar: AppBar(
        title: Text('COWS & BULLS',
        style: TextStyle(
          fontSize: 30,
          letterSpacing: 2,
        ),),
        centerTitle: true,
        backgroundColor: Colors.brown[800],
        elevation: 10.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 250.0,
              height: 50,
              child:ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/game');
                },
                child: Text('Start new Game',
                style: TextStyle(
                  fontSize: 20,
                ),),
                style: st,
            ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              width:250.0,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/htp');
                },
                child: Text('How to Play',
                style: TextStyle(
                  fontSize: 20,
                ),),
                style: st,
            ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              width:250.0,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/exit');
                },
                child: Text('Exit',
                style: TextStyle(
                  fontSize: 20,
                ),),
                style: st,
            ),
            ),
          ],
        ),
      ),
    );
  }
}
