import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currentImagePath = 'lib/images/1.png';

  void rollDice() {
    int min = 1;
    int max = 7;

    Random random = Random();

    int randomNumber = min + random.nextInt(max - min);

    String newString = 'lib/images/' + randomNumber.toString() + '.png';

    setState(() {
      currentImagePath = newString;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Dice roller'),
      ),
      body: Column(children: [
        SizedBox(
          height: 50,
        ),
        Image.asset(currentImagePath),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: GestureDetector(
            onTap: ()=>rollDice(),
            child: Container(
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.green),
              child: Center(
                child: Text(
                  'Roll Dice',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
