import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  // const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  var lastposition = 0.0;
  var random = new Random();

  AnimationController animationController;

  double generateRandom() {
    lastposition = random.nextDouble();
    return lastposition;
  }

  spin() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    animationController.forward();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Image.asset(
              'assets/floor.jpg',
              fit: BoxFit.fill,
            ),
            height: MediaQuery.of(context).size.height,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                if (animationController.isCompleted) spin();
              });
            },
            child: Center(
              child: Container(
                child: RotationTransition(
                    turns: Tween(begin: lastposition, end: generateRandom())
                        .animate(new CurvedAnimation(
                            parent: animationController, curve: Curves.linear)),
                    child: Image.asset('assets/bottle.png')),
                height: 250,
                width: 250,
              ),
            ),
          )
        ],
      ),
    );
  }
}
