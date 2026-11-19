import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Container(
        color: Colors.lightGreenAccent,

        padding: EdgeInsets.all(25),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 40,
          children: [
            ScoreCard(title: "System Design"),
            ScoreCard(title: "LLM"),
            ScoreCard(title: "Communication"),
          ],
        ),
      ),
    ),
  ),
);

class ScoreCard extends StatelessWidget {
  const ScoreCard({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            spacing: 10,
            children: [
              Text(
                "My Knowledge on $title",
                style: TextStyle(color: Colors.blue, fontSize: 25,),
              ),
              BarController(),
            ],
          ),
        ),
      ),
    );
  }
}

class BarController extends StatefulWidget {
  const new({super.key});

  @override
  State<BarController> createState() => _BarControllerState();
}

class _BarControllerState extends State<BarController> {
  int score = 5;
  final int maxScore = 10; 

  void addScore() {
    setState(() {
      if(score != maxScore ) {
        score++;
      }
    });
  }

  void decreaseScore() {
    setState(() {
      if(score != 0) {
        score--;
      }
    });
  }

  Color scoreColor() {
    if (score >= 0 && score <= 3) {
      return Colors.lightGreenAccent;
    } else if (score > 3 && score <= 6) {
      return Colors.lightGreen;
    } else if (score >6 && score <= 9) {
      return const Color.fromARGB(255, 52, 233, 39);
    } 

    return Colors.green;
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: decreaseScore,
              icon: const Icon(Icons.remove, size: 30),
            ),
             IconButton(onPressed: addScore, icon: Icon(Icons.add, size: 30)),
          ],
        ),
        Container(
          height: 50,
          margin: EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(border: Border.all(width: 0.5,),borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Expanded(flex: score, child: Container(
                
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: scoreColor()),
              )),
              Expanded(flex: maxScore - score, child:Container()),
            ],
          ),
        )
      ],
      
    );
  }
}
