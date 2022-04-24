import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather__model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/provider/weather_provider.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);

   WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {


    weatherData = Provider.of<WeatherProvider>(context).weatherData;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){

            Navigator.push(context,MaterialPageRoute(builder: (context){
              return SearchPage();
            }));

          }, icon:(Icon(Icons.search)),
          )],
        title: Text('Weather App'),
      ),
      body: Center(

        child:Provider.of<WeatherProvider>(context).weatherData == null ? Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'there is no weather 😔 start',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(height: 15,),
            Text(
              'searching now 🔍',
              style: TextStyle(
                fontSize:25,
              ),
            )
          ],
        ) : Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                weatherData!.getThemeColor(),
                weatherData!.getThemeColor()[300]!,
                weatherData!.getThemeColor()[100]!,
              ]
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text( Provider.of<WeatherProvider>(context).cityName! , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold ,),),
              Text('updated at : ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}' , style: TextStyle(fontSize: 15 ,),),
              SizedBox(height: 30,),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Image.asset(weatherData!.getImage(), height: 200, width:200, fit: BoxFit.cover,),
                    SizedBox(width:20 ,),

                    Column(
                      children: [
                        Text( weatherData!.temp.toInt().toString(),  style: TextStyle(fontSize:20 ,),),
                        SizedBox(height: 10,),

                        Text(weatherData!.WeatherStateName , style: TextStyle(fontSize:20 ,),),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 25,),

              Text('Min Temp : ${weatherData!.minTemp.toInt()} ' , style: TextStyle(fontSize:20 , fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Text('Max Temp : ${weatherData!.maxTemp.toInt()} ' , style: TextStyle(fontSize:20 , fontWeight: FontWeight.bold),),


            ],
          ),
        ),
      ),
    );
  }
}
