import 'package:flutter/material.dart';

class IntroScreen3 extends StatelessWidget {
  const IntroScreen3({super.key});

  @override
  Widget build(BuildContext context) {
  final height = MediaQuery.sizeOf(context).height *1;
    return  Scaffold(
   backgroundColor: Colors.green,

      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset("assets/temperature.png",height: height*0.3, width: height*0.3, ))

        ],
      ),
    );
  }
}