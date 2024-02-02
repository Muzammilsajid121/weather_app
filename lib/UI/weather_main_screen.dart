import 'package:flutter/material.dart';
import 'package:weather_app/Functions/date_time_func.dart';
import 'package:weather_app/Services/weather_api_services.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  //
  WeatherApiServices weatherApiServices = WeatherApiServices();
  final Functions function = Functions();

  //
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height*1;
    final width = MediaQuery.sizeOf(context).width*1;

    return  Scaffold(
      
      body: Container(
        decoration:const  BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/bg1.jpg'), fit: BoxFit.cover
          ,)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

              //  SizedBox(height: height*0.002,),
             Text('Today',style: Theme.of(context).textTheme.bodyLarge,),
                          Text('Date',style: Theme.of(context).textTheme.bodyLarge,),

             
             SizedBox(height: height*0.02,),
        
              //Future Builder

              
            FutureBuilder(
              future: weatherApiServices.fetchWorldWeatherApi(), 
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const  Text("Loading");
                }
                else{


                  //Round Container
                  return Container(
            height: height*0.3,
            width: width*0.3,
            decoration: const  BoxDecoration(
          boxShadow: [
          BoxShadow(
          color: Color.fromARGB(255, 114, 114, 114), // Light color
          offset: Offset(-6.0, -6.0),
          blurRadius: 8.0,
        ),
            ],
        shape: BoxShape.circle,
        color:  Color(0xffECF3FE),
            ),
            child:  Padding(
        padding: const EdgeInsets.only(top:5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const  Icon(Icons.sunny),
  Text(weatherApiServices.current['temp_c'].toString() + " c°" ,style: Theme.of(context).textTheme.titleMedium),
  Text(weatherApiServices.current['condition']['text'].toString(),style: Theme.of(context).textTheme.bodyMedium),
Text(function.formatApiDate(weatherApiServices.location['localtime'].toString()),style: Theme.of(context).textTheme.bodySmall,),

  
          ],
        ),
            ),
          
           );
                }
              }),





        
         
         SizedBox(height: height*0.1,),
         //

        //  FutureBuilder<WeatherModal>(
        //   future: weatherApiServices.fetchWorldWeatherApi(),
        //    builder: (context, AsyncSnapshot<WeatherModal>snapshot){
            
        //     if(!snapshot.hasData){
        //       return Text('loading');
        //     }
        //     else{
        //             List<Location>? locations = snapshot.data?.location;

        //       return Expanded(
        //         child: ListView.builder(
        //           itemCount: locations!.length,
        //           itemBuilder: (context, index){
        //             return Card(
        //               child: Column(
        //                 children: [
        //                   Text(snapshot.data!.location!.name.toString())
        //                 ],
        //               ),
        //             );
        //           },
        //           ),
        //       );
        //     }

        //  }),

           //
        
            //ListViewbuilder Containers
            SizedBox(
        height: height*0.20,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 8,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal:6.0),
              child: Container(
                // height: height*0.01, //this height not working
                width: width*0.20,
              
                decoration:const  BoxDecoration(
                  color: Color(0xffECF3FE),
                  borderRadius: BorderRadius.all(Radius.circular(38)),
                  //shadow
                    boxShadow: [
                      BoxShadow(
                      color: Color.fromARGB(255, 114, 114, 114), // Light color
                      offset: Offset(-1.5, 0),
                      blurRadius: 8.0,
                         ), ],
                ),
                child:   Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const  Icon(Icons.air),
                     SizedBox(height: height*0.01,),
                    Text("25* C",style: Theme.of(context).textTheme.bodyMedium),
                    SizedBox(height: height*0.01,),
                    Text("Monday", style: Theme.of(context).textTheme.bodySmall),
                    Text("8 am", style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
                    
              ),
            );
        
          }),
            ),
        
          ],
        ),
      ),
      
    );
  }
}
