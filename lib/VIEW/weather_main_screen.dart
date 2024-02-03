import 'package:flutter/material.dart';
import 'package:weather_app/Functions/date_time_func.dart';
import 'package:weather_app/Services/weather_api_services.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  //Objects
  WeatherApiServices weatherApiServices = WeatherApiServices();
  final Functions function = Functions();

  //
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        // Future Builder
            FutureBuilder(
              future: weatherApiServices.fetchWorldWeatherApi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Loading");
                } else {
                  
                  return Column(
                    children: [
          //Upper Date Time
   Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white,),
     child: Text(
        function.formatApiDate( weatherApiServices.location['localtime'].toString()),
         style: Theme.of(context).textTheme.bodyLarge,
                                ),
   ),
  SizedBox(height: height*0.01,),
  //Location
    Container(
      width: width*0.5,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white,),
     child:Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(
        ( weatherApiServices.location['name'].toString() + ","),
         style: Theme.of(context).textTheme.bodyLarge,
                                ),
          Text(
        ( weatherApiServices.location['country'].toString()),
         style: Theme.of(context).textTheme.bodyLarge,
                                ),
      ],
     )
   ),


                      // Round Container
                      Container(
                        height: height * 0.3,
                        width: width * 0.3,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 114, 114, 114),
                              // Light color
                              offset: Offset(-6.0, -6.0),
                              blurRadius: 8.0,
                            ),
                          ],
                          shape: BoxShape.circle,
                          color: Color(0xffECF3FE),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
     Image.network(
      'https:' + weatherApiServices.current['condition']['icon'], height: 40, width: 50, ),

   Text( weatherApiServices.current['temp_c'].toString() +" c°",
                                style: Theme.of(context).textTheme.titleMedium,),
    Text(
    weatherApiServices.current['condition']['text'].toString(),
                  style: Theme.of(context).textTheme.bodyMedium,),
                            ],
                          ),
                        ),
                      ),
            //ROUND CONTAINER END


     //EXTRA INFO CONTAINER
    Container(
      height: height*0.1, width: width*0.7,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.white),
      child: Column(
        children: [

    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       Text("Humidity", style: Theme.of(context).textTheme.bodyMedium),
          Text( weatherApiServices.current['humidity'].toString(),
                 style: Theme.of(context).textTheme.bodyLarge,),
      ],
    ),
    //
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       Text("Feels Like", style: Theme.of(context).textTheme.bodyMedium),
          Text( weatherApiServices.current['feelslike_c'].toString(),
                 style: Theme.of(context).textTheme.bodyLarge,),
      ],
    ),

           ],
      ),
    ),


                    ],
                  );
                }
              },
            ),

   


            SizedBox(height: height * 0.1),

            // ListViewbuilder Containers
            SizedBox(
              height: height * 0.20,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Container(
                      width: width * 0.20,
                      decoration: const BoxDecoration(
                        color: Color(0xffECF3FE),
                        borderRadius: BorderRadius.all(Radius.circular(38)),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 114, 114, 114),
                            // Light color
                            offset: Offset(-1.5, 0),
                            blurRadius: 8.0,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.air),
                          SizedBox(height: height * 0.01),
                          Text("25* C",
                              style:
                                  Theme.of(context).textTheme.bodyMedium),
                          SizedBox(height: height * 0.01),
                          Text("Monday",
                              style:
                                  Theme.of(context).textTheme.bodySmall),
                          Text("8 am",
                              style:
                                  Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
