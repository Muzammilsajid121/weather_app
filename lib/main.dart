import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/VIEW/OnBoarding%20Screens/onboarding_main.dart';
import 'package:weather_app/VIEW/splash_screen.dart';
import 'package:weather_app/VIEW/weather_main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
     
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        //
          scaffoldBackgroundColor:const Color(0xffC9DDFC),
       //
        //TEXT THEMES
        textTheme: TextTheme(

              //display
                displaySmall:
                 GoogleFonts.montserrat(fontSize: 11,fontWeight: FontWeight.w500, color: Colors.black),

            //Body Small
            bodySmall:
                GoogleFonts.montserrat(fontSize: 13,fontWeight: FontWeight.w600, color: Colors.black),
                
            //Body Medium
            bodyMedium: GoogleFonts.montserrat(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
            //
            //Body Large; choosen by theme
            bodyLarge: GoogleFonts.aBeeZee(fontSize: 19,  fontWeight: FontWeight.w800, color: Colors.black),
            // //
            titleMedium: GoogleFonts.montserrat(fontSize: 25, color: Colors.black , fontWeight: FontWeight.bold),

        ),
          appBarTheme: const  AppBarTheme(
            backgroundColor: Color.fromARGB(255, 44, 62, 92), foregroundColor: Colors.white),
      

        //
      ),
      home:  (OnBoardingScreen()),
    );
  }
}
