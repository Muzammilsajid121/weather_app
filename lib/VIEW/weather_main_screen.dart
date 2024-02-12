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
  TextEditingController searchController = TextEditingController();
  //
String searchLocation = "karachi";
void searchFilter(){
 
  searchLocation=searchController.text.trim();
}
  //
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;

    return Scaffold(
      // resizeToAvoidBottomInset: true,
      body: Container(
        height: height*1, //singlechilscroll problem resolve
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bgnew.jpg',),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

           SizedBox(height: height*0.05,),
            //SearchField
            
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: SizedBox(height: 35,
                child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor:const  Color(0x80ECF3FE).withOpacity(0.3),
            
                    suffixIcon:  IconButton(
            onPressed: (){
              setState(() {
                searchFilter();
              });
              
            },
             icon:const  Icon(Icons.search, color: Colors.white,),),
            
                    border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            
                    ),
                    
                    hintText: "Search by Country or Region", hintStyle: Theme.of(context).textTheme.bodyMedium,
                    
                  ),
                
                ),
              ),
            ),
            
            const SizedBox(height: 12,),
            
            // Future Builder
                FutureBuilder(
            
                  //
                  future: weatherApiServices.fetchWorldWeatherApi(searchLocation),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
             return const Center(
              child: SizedBox(height: 18,width: 18,
                child: CircularProgressIndicator(color: Colors.green,strokeWidth: 3,))
  );}
//    else if (!snapshot.hasData) {
//   return Center(
//     child: Text(
//       'No data available',
//       style: Theme.of(context).textTheme.bodyMedium,
//     ),
//   );
// }
                    else {
                      return Column(
                        children: [
            
                //TOP CONTAINER
                 Container(
                  // width: width*0.6,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color:const  Color(0x80ECF3FE).withOpacity(0.5),),
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
            //TODAY
            
            Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Text( "TODAY",
                      style: Theme.of(context).textTheme.bodyMedium,),
                      //
               const  Icon(Icons.today_outlined,size: 18,),
               ],  ),
            
                   //Big Temperature
             Text( "${weatherApiServices.current['temp_c']}°", 
                   style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 110, color: Colors.white, height: 0.8),),
            
            //condition&Icons
             Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Text( weatherApiServices.current['condition']['text'].toString(),
                      style: Theme.of(context).textTheme.bodyMedium,),
                      //
                Image.network(
                  // ignore: prefer_interpolation_to_compose_strings
                  'https:' + weatherApiServices.current['condition']['icon'], height: 45, width:60, ),
               ],  ),
            
            //MAX TEMP
            Text( "Max Temperature: ${weatherApiServices.forecast['forecastday'][0]['day']['maxtemp_c']}",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(height: 1.4) , ),
            
            //MAX TEMP
            Text( "Min Temperature: ${weatherApiServices.forecast['forecastday'][0]['day']['mintemp_c']}",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(height: 1) , ),
            
            
            
                 // Date Time
                    Text(
            function.formatApiDate( weatherApiServices.location['localtime'].toString()),
             style: Theme.of(context).textTheme.bodyLarge,),
            //
            //LOCATION
             Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                //  const  Icon(Icons.pin_drop),
               Image.asset("assets/pin.png", height: 18,),
            
                   Flexible(
                     child: Text(
                               ( "${weatherApiServices.location['name']},"),
                                style: Theme.of(context).textTheme.bodyLarge,
                                overflow:TextOverflow.ellipsis, maxLines: 1 ,
                                      ),
                   ),
                 Flexible(
                   child: Text(
                             ( weatherApiServices.location['country'].toString()),
                              style: Theme.of(context).textTheme.bodyLarge ,
                              overflow:TextOverflow.ellipsis, maxLines: 1 ,
                                      ),
                 ),
                   ], ),
            //
              ],
                 ),
                 ),
                  const SizedBox(height: 28,) ,  
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
                 const  SizedBox(width: 22,),
              
                  //Feels Like
                    Column(
                    children: [
                     const  Icon(Icons.person),
                     Text( weatherApiServices.current['feelslike_c'].toString(),
                       style: Theme.of(context).textTheme.bodyLarge,),
                 Text("Feels Like", style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                     const  SizedBox(width: 22,),
            
              //SunRise
                    Column(
                    children: [
                     Image.asset('assets/sunrise.png', height: 28, width: 30,),
                     Text( 
                     weatherApiServices.forecast['forecastday'][0]['astro']['sunrise'].toString(),
                    style: Theme.of(context).textTheme.bodyLarge,),
                 Text("Sun Rise", style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  const  SizedBox(width: 22,),
             
                    //SunSet
                    Column(
                    children: [
                       Image.asset('assets/sunset.png', height: 28, width: 30,),
                     Text(  weatherApiServices.forecast['forecastday'][0]['astro']['sunrise'].toString(),
                       style: Theme.of(context).textTheme.bodyLarge,),
                 Text("Sun Set", style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
             const  SizedBox(width: 22,),
               //Clouds
                    Column(
                    children: [
                     const  Icon(Icons.cloud),
                     Text( weatherApiServices.current['cloud'].toString(),
                       style: Theme.of(context).textTheme.bodyLarge,),
                 Text("Clouds", style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
             const  SizedBox(width: 22,),
                   //Feels Like
                    Column(
                    children: [
                     const  Icon(Icons.wind_power),
                     Text( weatherApiServices.current['feelslike_c'].toString(),
                       style: Theme.of(context).textTheme.bodyLarge,),
                 Text("Wind Kph", style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                    // const  SizedBox(width: 22,),
                     
                  
                    //  const  SizedBox(width: 20,),
            
                  
                     
                ],
              ),
            ),
             
            const SizedBox(height: 14,),
            
            Row(mainAxisAlignment: MainAxisAlignment.center,
            
              children: [
               const Expanded(child:   Divider(color: Colors.black,thickness: 1, height: 1,)),
                Text("24 Hours", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 25)),
               const Expanded(child:   Divider(color: Colors.black,thickness: 1, height: 1)),
            
              ],
            ),
            
            const SizedBox(height: 10,),
            
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
                          decoration:  BoxDecoration(
                            color: const  Color(0x80ECF3FE).withOpacity(0.6), //transparent
                            borderRadius: const  BorderRadius.all(Radius.circular(38)),
                            
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
            
            //Hourly Image
             Image.network(
            // ignore: prefer_interpolation_to_compose_strings
            'https:' + weatherApiServices.forecast['forecastday'][0]['hour'][index]['condition']['icon'],
             height: 50, width:50, ),
            
             //Hourly Temperature          
            Text(
              weatherApiServices.forecast['forecastday'].isNotEmpty
                  ? "${weatherApiServices.forecast['forecastday'][0]['hour'][index]['temp_c']}°"
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
      ),
    );
  }
}