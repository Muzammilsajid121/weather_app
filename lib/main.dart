import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/VIEW/OnBoarding%20Screens/onboarding_main.dart';


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
     
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
        //
          scaffoldBackgroundColor:const Color.fromARGB(255, 253, 254, 255),
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
            //Body Large
            bodyLarge: GoogleFonts.aBeeZee(fontSize: 19,  fontWeight: FontWeight.w800, color: Colors.black),
            // //
            titleMedium: GoogleFonts.montserrat(fontSize: 25, color: Colors.black , fontWeight: FontWeight.bold),
            titleLarge: GoogleFonts.montserrat(fontSize: 38, color: Colors.black , fontWeight: FontWeight.bold),


        ),
          appBarTheme: const  AppBarTheme(
            backgroundColor: Color.fromARGB(255, 44, 62, 92), foregroundColor: Colors.white),
      

        //
      ),
      home:  (const OnBoardingScreen()),
    );
  }
}
