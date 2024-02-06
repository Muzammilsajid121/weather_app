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
            image: AssetImage('assets/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
            Row(
              children: [
               const  Icon(Icons.pin_drop),
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
                ],
               )
             ),
          
          //Big Temperature
           Text( weatherApiServices.current['temp_c'].toString() +"°",
       style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 85, color: Colors.white),),

         Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Text( weatherApiServices.current['condition']['text'].toString(),
                    style: Theme.of(context).textTheme.bodyMedium,),
                    //
              Image.network(
                'https:' + weatherApiServices.current['condition']['icon'], height: 60, width:60, ),
              
              ],
             ),
      
          // Divider( height: 2, endIndent: 12, color: Colors.black,),
          //Extras
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //WIND
                Column(
                  children: [
                   const  Icon(Icons.water_drop_rounded),
              Text( weatherApiServices.current['humidity'].toString(),
                     style: Theme.of(context).textTheme.bodyLarge,),
               Text("Humidity", style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
               const  SizedBox(width: 20,),
            
                //Feels Like
                  Column(
                  children: [
                   const  Icon(Icons.person),
                   Text( weatherApiServices.current['feelslike_c'].toString(),
                     style: Theme.of(context).textTheme.bodyLarge,),
               Text("Feels Like", style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
         const  SizedBox(width: 20,),

                 //Feels Like
                  Column(
                  children: [
                   const  Icon(Icons.wind_power),
                   Text( weatherApiServices.current['feelslike_c'].toString(),
                     style: Theme.of(context).textTheme.bodyLarge,),
               Text("Wind KPH", style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                  const  SizedBox(width: 20,),
         
                //Clouds
                  Column(
                  children: [
                   const  Icon(Icons.cloud),
                   Text( weatherApiServices.current['cloud'].toString(),
                     style: Theme.of(context).textTheme.bodyLarge,),
               Text("Cloud", style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
         const  SizedBox(width: 20,),

                  //SunRise
                  Column(
                  children: [
                   Image.asset('assets/sunrise.png', height: 35, width: 30,),
                   Text( 
                   weatherApiServices.forecast['forecastday'][0]['astro']['sunrise'].toString(),
                  style: Theme.of(context).textTheme.bodyLarge,),
               Text("Sun Rise", style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const  SizedBox(width: 20,),
           
                  //SunSet
                  Column(
                  children: [
                     Image.asset('assets/sunset.png', height: 35, width: 30,),
                   Text(  weatherApiServices.forecast['forecastday'][0]['astro']['sunrise'].toString(),
                     style: Theme.of(context).textTheme.bodyLarge,),
               Text("Sun Set", style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                // const  SizedBox(width: 12,),
                   
              ],
            ),
          ),
 
const SizedBox(height: 20,),

Row(mainAxisAlignment: MainAxisAlignment.center,

  children: [
   const Expanded(child:   Divider(color: Colors.black,thickness: 1, height: 1,)),
    Text("24 Hours", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 25)),
   const Expanded(child:   Divider(color: Colors.black,thickness: 1, height: 1)),

  ],
),

const SizedBox(height: 4,),

       SizedBox(
               
                height: height * 0.22,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: weatherApiServices.forecast['forecastday'][0]['hour'].length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Container(
                        width: width * 0.30,
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

//Hourly Image
 Image.network(
'https:' + weatherApiServices.forecast['forecastday'][0]['hour'][index]['condition']['icon'],
 height: 50, width:50, ),

 //Hourly Temperature          
Text(
  weatherApiServices.forecast['forecastday'].isNotEmpty
      ? weatherApiServices.forecast['forecastday'][0]['hour'][index]['temp_c'].toString() +"°"
      : 'N/A',
 style: Theme.of(context).textTheme.bodyLarge,),
                   
  //Hourly Condition Text                       
     Text(weatherApiServices.forecast['forecastday'][0]['hour'][index]['condition']['text'],
     overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodySmall),

   //Hourly Date with AM PM                        
  Text(function.formatApiDateWithAmPm(
  weatherApiServices.forecast['forecastday'][0]['hour'][index]['time'],),
     style: Theme.of(context).textTheme.bodySmall),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              
            ),
           ],
           
                    );
                  }
                 
                },
              ),


            ],
          ),
        ),
      ),
    );
  }
}