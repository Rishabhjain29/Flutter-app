import 'package:flutter/material.dart';
class Htp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[500],
      appBar: AppBar(
        title: Text('How to Play?'),
        centerTitle: true,
        backgroundColor: Colors.brown[800],
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0),
              child: Text('Cows and Bulls is an old code-braking mind game similar to the board game Mastermind.\n'
                    'The game is played using four digit number. Your goal is to guess a random secret number that does not contain any duplicates.'
                  'For each guess you can receive a hint like "Cow" or "Bull".',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey[200],
                  letterSpacing: 1.0,
                  wordSpacing: 1.0,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 15.0, 10.0, 0),
              child: Text('Example',
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0),
              child: Text('Secret number: 4271\n'
                          'Your guess: 1234',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey[200],
                  letterSpacing: 1.0,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text('Answer',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
                letterSpacing: 1.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0),
              child: Text('1 Bull and 2 Cows.\n'
                  'The bull is "2", as its position in secret code and your guess is same.\n'
                  'The cows are "4" and "1", as they are present in your guess but not at right position\n'
                  '\nTry to guess the secret number using as little turns as possible.\n'
                  '\nGood Luck! ',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey[200],
                  letterSpacing: 1.0,
                ),
              ),
            ),
            ],
        ),
      )
    );
  }
}
