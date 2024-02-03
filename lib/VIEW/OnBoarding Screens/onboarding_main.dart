import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weather_app/VIEW/OnBoarding%20Screens/intro_screen1.dart';
import 'package:weather_app/VIEW/OnBoarding%20Screens/intro_screen2.dart';
import 'package:weather_app/VIEW/OnBoarding%20Screens/intro_screen3.dart';
import 'package:weather_app/VIEW/splash_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  PageController Controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [

          PageView(
            controller: Controller,
            //This tells us on which page we are
            onPageChanged: (index) => setState(() {
              onLastPage = (index==2);
            }),


        children: const [
         //ScreensContainers
         IntroScreen1(),
         IntroScreen2(),
         IntroScreen3()

        ],
      ),
      Container(
        alignment: const  Alignment(0, 0.7),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            //Skip
            TextButton(
              onPressed: (){
                Controller.jumpToPage(2);}, 
                child: const Text("Skip")),


            //Indicators
            SmoothPageIndicator(
              effect: JumpingDotEffect(
                verticalOffset: 5, dotColor: Colors.grey.shade400, activeDotColor: Colors.white),
              controller: Controller, 
              count: 3),

              //Next Or Finish
              onLastPage?
               TextButton(
              onPressed: (){
                Navigator.push(context, (MaterialPageRoute(builder: (context){return const SplashScreen();})));
                }, 
                child: const Text("Finish")) :

                TextButton(
              onPressed: (){
                Controller.nextPage(duration:  Duration(milliseconds: 500), curve: Curves.linear);}, 
                child: const Text("Next"))




          ],
        ),
      )
        ],
        
      )
    );
  }
}