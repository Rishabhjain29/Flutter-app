import 'package:cows_and_bulls/pages/completed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  static int secret=0;
  List<int> num =[1,2,3,4,5,6,7,8,9,0];
  List<int> sk=[];
  List<int> guess=[];
  List<String> display=['','','',''];
  List<int> res=[];
  List<String> cc=[];
  List<String> bc=[];
  int p=0;
  final ScrollController _scrollController =ScrollController();

  void initState(){
    num.shuffle();
    secret=0;
    for( int i=0;i<4;i++)
      {
        sk.add(num[i]);
        secret=(secret*10)+num[i];
      }
  }

  Function checkbutton(int n){
    if (guess.contains(n) || guess.length == 4)
      {
        return null;
      }
    else
      return(){
      setState(() {
        guess.add(n);
        display[p]=n.toString();
        p+=1;
      });
      };
  }

  Function check(){
    if (guess.length<4){
      return null;
    }
    int f=1;
    for(int i=0;i<4;i++)
      {
        if(guess[i]!=sk[i])
          {
            f=0;
            break;
          }
      }
    return() {
      setState(() {
        if(f==1){
          Navigator.push(context, MaterialPageRoute(builder: (context) => completed(secret )));
        }
        int n = 0;

          for (int i = 0; i < 4; i++) {
            n = (n * 10) + guess[i];
          }

        if (!(res.contains(n))) {
          res.add(n);
          int c = 0;
          int b = 0;
          for (int i = 0; i < 4; i++) {
            if (sk.contains(guess[i]) && guess[i] == sk[i]) {
              b += 1;
            }
            else if (sk.contains(guess[i])) {
              c += 1;
            }
          }
          cc.add(c.toString());
          bc.add(b.toString());
        }
        print(sk);
        guess.clear();
        p=0;
        display=['','','',''];
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);

      });
    };

  }





  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blueGrey[300],
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40.0,
              child: Center(
                child: Text(
                    'Guess the Secret Key',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),
                ),
              ),
            ),
            Expanded(
              flex: 60,
              child: Container(
                  child:
                  ListView.builder(
                    itemCount: res.length,
                    controller: _scrollController,
                    itemBuilder: (context, index){
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('${index+1})',
                            style: TextStyle(
                              fontSize: 25.0
                            ),
                          ),
                          SizedBox(width: 20.0,),
                          Text('${res[index]}',
                            style: TextStyle(
                              fontSize: 25.0
                            ),),
                          SizedBox(width: 20,),
                          Icon(const IconData(0xe901, fontFamily: 'Costumcons'),
                          size: 40,),
                          SizedBox(width: 15,),
                          Text('${bc[index]}',
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.redAccent[400],
                            ),),
                          SizedBox(width: 20,),
                          Icon(const IconData(0xe900, fontFamily: 'Costumcons'),
                            size: 50,),
                          Text('${cc[index]}',
                          style: TextStyle(
                            fontSize: 25,
                          ),),

                        ],
                      );

                    }
                  ),
                ),
              ),
            Expanded(
              flex: 40,
              child: Container(
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          width: 70,
                          height: 40,
                          decoration: new BoxDecoration(
                            color: Colors.grey[300],
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(child: Text(display[0],
                          style: TextStyle(
                            fontSize: 20,
                          ),)),
                        ),
                        Container(
                          width: 70,
                          height: 40,
                          decoration: new BoxDecoration(
                            color: Colors.grey[300],
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(child: Text(display[1],
                          style: TextStyle(fontSize: 20),)),
                        ),
                        Container(
                          width: 70,
                          height: 40,
                          decoration: new BoxDecoration(
                            color: Colors.grey[300],
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(child: Text(display[2],style: TextStyle(fontSize: 20),)),

                        ),
                        Container(
                          width: 70,
                          height: 40,
                          decoration: new BoxDecoration(
                            color: Colors.grey[300],
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(child: Text(display[3],style: TextStyle(fontSize: 20),)),
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                            width: 100.0,
                            child: ElevatedButton(
                              onPressed: checkbutton(1),
                              child: Text('1',style: TextStyle(fontSize: 20),),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(Colors.brown[200]),
                              ),
                            ),
                        ),
                        SizedBox(width: 10.0,),
                        SizedBox(
                            width: 100.0,
                            child: ElevatedButton(
                              onPressed: checkbutton(2),
                              child: Text('2',style: TextStyle(fontSize: 20),),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(Colors.brown[200]),
                              ),

                            ),
                        ),
                        SizedBox(width: 10.0),
                        SizedBox(
                            width: 100.0,
                            child: ElevatedButton(
                              onPressed: checkbutton(3),
                              child: Text('3',style: TextStyle(fontSize: 20),),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(Colors.brown[200]),
                              ),
                            ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 100.0,
                          child: ElevatedButton(
                            onPressed: checkbutton(4),
                            child: Text('4',style: TextStyle(fontSize: 20),),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(Colors.brown[200]),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0,),
                        SizedBox(
                          width: 100.0,
                          child: ElevatedButton(
                            onPressed: checkbutton(5),
                            child: Text('5',style: TextStyle(fontSize: 20),),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(Colors.brown[200]),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        SizedBox(
                          width: 100.0,
                          child: ElevatedButton(
                            onPressed: checkbutton(6),
                            child: Text('6',style: TextStyle(fontSize: 20),),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(Colors.brown[200]),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 100.0,
                          child: ElevatedButton(
                            onPressed: checkbutton(7),
                            child: Text('7',style: TextStyle(fontSize: 20),),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(Colors.brown[200]),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0,),
                        SizedBox(
                          width: 100.0,
                          child: ElevatedButton(
                            onPressed: checkbutton(8),
                            child: Text('8',style: TextStyle(fontSize: 20),),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(Colors.brown[200]),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        SizedBox(
                          width: 100.0,
                          child: ElevatedButton(
                            onPressed: checkbutton(9),
                            child: Text('9',style: TextStyle(fontSize: 20),),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(Colors.brown[200]),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 100.0,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                guess.clear();
                                p=0;
                                display=['','','',''];
                              });
                            },
                            child: Text('Clear',style: TextStyle(fontSize: 20),),
                            style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                            ),
                           ),
                          backgroundColor: MaterialStateProperty.all(Colors.red[600]),
                      ),
                    )
                    ),
                        SizedBox(width: 10.0,),
                        SizedBox(
                          width: 100.0,
                          child: ElevatedButton(
                            onPressed: checkbutton(0),
                            child: Text('0',style: TextStyle(fontSize: 20),),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(Colors.brown[200]),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        SizedBox(
                          width: 100.0,
                          child: ElevatedButton(
                            onPressed: check(),
                            child: Text('Check',style: TextStyle(fontSize: 20),),
                            style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(Colors.green[600]),
                        ),
                    ),
                    ),
                    ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
