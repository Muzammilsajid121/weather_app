import 'package:flutter/material.dart';

class IntroScreen2 extends StatelessWidget {
  const IntroScreen2({super.key});

  @override
  Widget build(BuildContext context) {
  final height = MediaQuery.sizeOf(context).height *1;
    return  Scaffold(
      backgroundColor: Colors.blue,
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset("assets/storm.png",height: height*0.3,width: height*0.3, ))

        ],
      ),
    );
  }
}