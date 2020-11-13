import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
      MaterialApp(
        home: HomePage(),
      ),
    );

enum Choice { stone, paper, scissor }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Choice selectedChoice;
  @override
  int imageNumber = 1;
  String playerChoice ;
  String result = 'Play';
  String computerChoice = 'Choose';

  void update() {
    setState(() {
      imageNumber = Random().nextInt(3) + 1;
    });
  }

  String Result(int imageNumber) {
    if (imageNumber == 1 && (selectedChoice == Choice.paper)) {
      result = 'you won';
      return result;
    } else if (imageNumber == 2 && (selectedChoice == Choice.scissor)) {
      result = 'you won';
      return result;
    } else if (imageNumber == 3 && (selectedChoice == Choice.stone)) {
      result = 'You won';
      return result;
    } else {
      result = 'You LOST!!!';
      return result;
    }
  }

  String compChoice(int imageNumber) {
    if (imageNumber == 1) {
      computerChoice = 'Stone';
      return computerChoice;
    } else if (imageNumber == 2) {
      computerChoice = 'Paper';
      return computerChoice;
    } else {
      computerChoice = 'Scissor';
      return computerChoice;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Stone-Paper-Scissor"),
          backgroundColor: Colors.amber,
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text(
                'Computer : $computerChoice',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              child: Image.asset(
                'assets/$imageNumber.png',
                width: 200,
                height: 200,
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Text(
                'Result : $result',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              child: Text(
                'Player : $selectedChoice',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 25,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedChoice = Choice.stone;
                      });
                    },
                    child: Container(
                      child: Image.asset('assets/1.png'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedChoice = Choice.paper;
                      });
                    },
                    child: Container(
                      child: Image.asset('assets/2.png'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedChoice = Choice.scissor;
                      });
                    },
                    child: Container(
                      child: Image.asset('assets/3.png'),
                    ),
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                update();
                compChoice(imageNumber);
                Result(imageNumber);

              },
              child: Container(
                child: Center(
                  child: Text(
                    'Play',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                ),
                width: double.infinity,
                height: 40,
                color: Color(0xFFEB1555),
              ),
            )
          ],
        ));
  }
}
