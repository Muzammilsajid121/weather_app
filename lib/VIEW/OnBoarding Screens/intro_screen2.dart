import 'package:flutter/material.dart';

class IntroScreen2 extends StatelessWidget {
  const IntroScreen2({super.key});

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
              Center(child: Image.asset("assets/storm.png",height: height*0.3,width: height*0.4, )),

       const SizedBox(height: 90,),

      Text("Weather Forecast",style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 38,height: 0.9),),
    const SizedBox(height: 8,),
     Text("Get upto 7 days weather forecast ",style: Theme.of(context).textTheme.bodyLarge,),
         Text(" into your hands",style: Theme.of(context).textTheme.bodyLarge,),

          ],
        ),
      ),
      
    );
  }
}
