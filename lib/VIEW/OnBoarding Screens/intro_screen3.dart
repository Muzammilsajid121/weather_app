import 'package:flutter/material.dart';

class IntroScreen3 extends StatelessWidget {
  const IntroScreen3({super.key});

  @override
  Widget build(BuildContext context) {
  final height = MediaQuery.sizeOf(context).height *1;
   return  Scaffold(
      backgroundColor: Color(0xfff3d3df),
      
      body:Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bgbg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Center(child: Image.asset("assets/cloud.png",height: height*0.3,width: height*0.4, )),

  const SizedBox(height: 90,),

      Text("Weather Forecast ",style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 38,height: 0.9),),
     

    const SizedBox(height: 16,),
     Text(" View 24 hours forecast with",style: Theme.of(context).textTheme.bodyLarge,),
         Text("condition, and icons",style: Theme.of(context).textTheme.bodyLarge,),

          ],
        ),
      ),
      
    );
  }
}

