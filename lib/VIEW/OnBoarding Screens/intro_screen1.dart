import 'package:flutter/material.dart';

class IntroScreen1 extends StatelessWidget {
  const IntroScreen1({super.key});

  @override
  Widget build(BuildContext context) {
  final height = MediaQuery.sizeOf(context).height *1;
   return  Scaffold(
      backgroundColor: Colors.yellow,
      
      body:Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
              Center(child: Image.asset("assets/weather1.png",height: height*0.3,width: height*0.3, ))
          ],
        ),
      ),
      
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Center(child: Image.asset("assets/weather1.png",height: height*0.3,width: height*0.3, ))

      //   ],
      // ),
    );
  }
}