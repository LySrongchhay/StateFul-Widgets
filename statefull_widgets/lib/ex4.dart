import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Container(
        color: Colors.lightGreenAccent,

        padding: EdgeInsets.all(10),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(color: Colors.white),
            ),
          ],
        ),
      ),
    ),
  ),
);
