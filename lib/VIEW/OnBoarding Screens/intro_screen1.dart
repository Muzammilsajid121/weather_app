import 'package:flutter/material.dart';

class IntroScreen1 extends StatelessWidget {
  const IntroScreen1({super.key});

  @override
  Widget build(BuildContext context) {
  final height = MediaQuery.sizeOf(context).height *1;
   return  Scaffold(
      backgroundColor: Color(0xff93D9D9),
      
      body:Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bgbg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Center(child: Image.asset("assets/weather1.png",height: height*0.3,width: height*0.4, )),

              Text("Realtime Weather",style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 50),),

              Text("Latest weather updates right into your hands",style: Theme.of(context).textTheme.bodyLarge,)
          ],
        ),
      ),
      
    );
  }
}

