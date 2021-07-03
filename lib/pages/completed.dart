import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cows_and_bulls/pages/game.dart';
class completed extends StatefulWidget {
  int sec;
  completed(int s){
    this.sec = s;
  }
  @override
  _completedState createState() => _completedState(sec);
}

class _completedState extends State<completed> {
   int sec;
  _completedState(int s){
    this.sec=s;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[900],
      body: Center(
        child: Container(
          width: 350.0,
          height: 225,
          child: Card(
            color: Colors.brown[600],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(
                color: Colors.brown[700],
                width: 2.0,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const ListTile(
                  title: Center(child: Text('Congratulations!!',
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
                Text('The secret key is $sec',
                style: TextStyle(fontSize: 25),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                    width: 125,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/game');
                      },
                      child: Text('New Game',style: TextStyle(fontSize: 18),),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(Colors.brown[900]),
                      ),
                    ),
                  ),
        SizedBox(
          width: 125,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/home', (r) => false);
            },
            child: Text('Home',style: TextStyle(fontSize: 18),),
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(Colors.brown[900]),
            ),
          ),
        ),]
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
