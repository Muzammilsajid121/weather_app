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

              Text("Weather Forecast",style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 50),),

              Text("Get upto 7 days weather forecast",style: Theme.of(context).textTheme.bodyLarge,)
          ],
        ),
      ),
      
    );
  }
}
























// import 'package:flutter/material.dart';

// class IntroScreen2 extends StatelessWidget {
//   const IntroScreen2({super.key});

//   @override
//   Widget build(BuildContext context) {
//   final height = MediaQuery.sizeOf(context).height *1;
//     return  Scaffold(
//       backgroundColor: Color(0xfff3d3e0),
//       body:Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(child: Image.asset("assets/storm.png",height: height*0.3,width: height*0.3, ))

//         ],
//       ),
//     );
//   }
// }