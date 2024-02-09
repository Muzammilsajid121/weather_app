import 'package:flutter/material.dart';

class IntroScreen1 extends StatelessWidget {
  const IntroScreen1({super.key});

  @override
  Widget build(BuildContext context) {
  final height = MediaQuery.sizeOf(context).height *1;
   return  Scaffold(
      // backgroundColor: Color(0xff93D9D9),
      
      body:Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bgbg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Center(child: Image.asset("assets/weather1.png",height: height*0.3,width: height*0.4, )),
          const SizedBox(height: 90,),

      Text("Realtime Weather",style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 38,height: 0.9),),
    const SizedBox(height: 16,),
     Text("Latest weather updates right ",style: Theme.of(context).textTheme.bodyLarge,),
         Text(" into your hands",style: Theme.of(context).textTheme.bodyLarge,)

              ],
            ),
          ),
        ),
      ),
      
    );
  }
}

