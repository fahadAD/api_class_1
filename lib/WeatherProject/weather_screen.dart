import 'package:api_calsses1/WeatherProject/WeatherModel.dart';
import 'package:api_calsses1/WeatherProject/weather_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  TextEditingController citiesController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    GetWeatherRepo _watherRepo=GetWeatherRepo();

    void citiesClicFun({required String city}){
       _watherRepo.getWeather(citie_s: city);

    }
     return   Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child:   SingleChildScrollView(
          child:   Column(
            children: [
              Container(
                width: double.infinity,
                height: 60,
                color: Colors.deepPurpleAccent,
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width*0.8,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(13))
                        ),
                        child: Center(
                          child: TextFormField(
                            controller: citiesController,
                            decoration: InputDecoration(
                                hintText: "Enter your correct city name",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(13))
                                )
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          EasyLoading.show(status: "Loding...");
                           citiesClicFun(city: citiesController.text);
                           EasyLoading.dismiss();
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Center(child: Icon(Icons.search_outlined,color: Colors.deepPurpleAccent,size: 30,)),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
             FutureBuilder<WeatherModel>(
               future: _watherRepo.getWeather(citie_s: citiesController.text),
               builder: (context, snapshot) {
            if(snapshot.hasData){
              return   Column(
                children: [

                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(

                        width: double.infinity,

                        height: 170,

                        decoration: BoxDecoration(

                            color: Colors.deepPurpleAccent,

                            borderRadius: BorderRadius.only(



                              bottomLeft: Radius.circular(50),

                              bottomRight: Radius.circular(50),



                            )

                        ),

                      ),
                      Positioned(
                        bottom: -70,
                        left: 17,
                        child:  Container(

                          width: MediaQuery.of(context).size.width*0.9,

                          height: 170,

                          decoration: BoxDecoration(

                              color: Colors.blue.shade50,
                              border: Border.all(color: Colors.deepPurpleAccent,width: 2),
                              borderRadius: BorderRadius.all(Radius.circular(15))

                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Image.asset("images/sunset1.png",width: 70,height: 70,fit: BoxFit.fill),
                                    Image.asset("images/sunsne3.png",width: 70,height: 70,fit: BoxFit.fill),
                                  ],),
                                Column(
                                  children: [
                                    SizedBox(height: 15,),
                                    Image.asset("images/susine2.png",width: 70,height: 70,fit: BoxFit.fill),
                                    SizedBox(height: 10,),
                                    Text(" Now : ${snapshot.data!.weather?[0].main}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurpleAccent,fontSize: 17)),

                                  ],
                                ),
                                Column(
                                  children: [
                                    Text("Temperature",style: TextStyle(color: Colors.black)),
                                    RichText(
                                      text: TextSpan(
                                        text: '',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                        children:   <TextSpan>[
                                          TextSpan(text: "${snapshot.data?.main?.temp}", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.deepPurple)),
                                          TextSpan(text: " C", style: TextStyle(fontSize: 29,color: Colors.blue)),

                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        Icon(Icons.visibility,color: Colors.blue,),
                                        SizedBox(width: 10,),
                                        Text("${snapshot.data?.visibility}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)
                                      ],),
                                    SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        SizedBox(width: 5,),
                                        Icon(Icons.wind_power,color: Colors.blue,),
                                        SizedBox(width: 5,),
                                        Text("Speed : ${snapshot.data?.wind?.speed}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)
                                      ],),

                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        top: 7,
                        left: 40,
                        child: Row(
                          children: [
                            Image.asset("images/locat.png",height: 60,width: 60,fit: BoxFit.fill),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text("  ${snapshot.data?.name},",style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.w600),),
                                    Text(" ${snapshot.data?.sys?.country}",style: TextStyle(fontSize: 27,color: Colors.white,fontWeight: FontWeight.w600),),

                                  ],
                                ),
                                Text("  ${snapshot.data!.weather?[0].description}",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w600),),

                              ],
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 90,),
                  Container(

                    width: MediaQuery.of(context).size.width*0.9,

                    height: 110,

                    decoration: BoxDecoration(

                        color: Colors.blue.shade50,
                        border: Border.all(color: Colors.deepPurpleAccent,width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(15))

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Column(

                          children: [
                            SizedBox(height: 2,),
                            Image.asset("images/humidity.png" ,width: 50,height: 50,),
                            SizedBox(height: 5,),
                            Text("Humidity",style: TextStyle(color: Colors.black),),
                            SizedBox(height: 5,),
                            Text("${snapshot.data?.main?.humidity}%",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(height: 2,),
                            Image.asset("images/temperaturelow.png" ,width: 50,height: 50,),
                            SizedBox(height: 5,),
                            Text("Temperature Min",style: TextStyle(color: Colors.black),),
                            SizedBox(height: 5,),
                            Text("${snapshot.data?.main?.tempMin} C",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(height: 2,),
                            Image.asset("images/temperaturehigh.png" ,width: 50,height: 50,),
                            SizedBox(height: 5,),
                            Text("Temperature Max",style: TextStyle(color: Colors.black),),
                            SizedBox(height: 5,),
                            Text("${snapshot.data?.main?.tempMax} C",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                          ],
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(

                    width: MediaQuery.of(context).size.width*0.9,

                    height: 110,

                    decoration: BoxDecoration(

                        color: Colors.blue.shade50,
                        border: Border.all(color: Colors.deepPurpleAccent,width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(15))

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Column(

                          children: [
                            SizedBox(height: 2,),
                            Image.asset("images/feellikes.png" ,width: 50,height: 50,),
                            SizedBox(height: 5,),
                            Text("Feel Likes",style: TextStyle(color: Colors.black),),
                            SizedBox(height: 5,),
                            Text("${snapshot.data?.main?.feelsLike} C",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(height: 2,),
                            Image.asset("images/longitude.png" ,width: 50,height: 50,),
                            SizedBox(height: 5,),
                            Text("Longitude",style: TextStyle(color: Colors.black),),
                            SizedBox(height: 5,),
                            Text("${snapshot.data?.coord?.lon} o",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(height: 2,),
                            Image.asset("images/latitude.png" ,width: 50,height: 50,),
                            SizedBox(height: 5,),
                            Text("Latitude",style: TextStyle(color: Colors.black),),
                            SizedBox(height: 5,),
                            Text("${snapshot.data?.coord?.lat} o",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                          ],
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(

                    width: MediaQuery.of(context).size.width*0.9,

                    height: 110,

                    decoration: BoxDecoration(

                        color: Colors.blue.shade50,
                        border: Border.all(color: Colors.deepPurpleAccent,width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(15))

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Column(

                          children: [
                            SizedBox(height: 2,),
                            Image.asset("images/pressure.png" ,width: 50,height: 50,),
                            SizedBox(height: 5,),
                            Text("Pressure",style: TextStyle(color: Colors.black),),
                            SizedBox(height: 5,),
                            Text("${snapshot.data?.main?.pressure} hpa",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(height: 2,),
                            Image.asset("images/grandlevel.png" ,width: 50,height: 50,),
                            SizedBox(height: 5,),
                            Text("Grand Level",style: TextStyle(color: Colors.black),),
                            SizedBox(height: 5,),
                            Text("1011",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(height: 2,),
                            Image.asset("images/sealevel.png" ,width: 50,height: 50,),
                            SizedBox(height: 5,),
                            Text("Sea Level",style: TextStyle(color: Colors.black),),
                            SizedBox(height: 5,),
                            Text("1015",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                          ],
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(

                    width: MediaQuery.of(context).size.width*0.9,

                    height: 110,

                    decoration: BoxDecoration(

                        color: Colors.blue.shade50,
                        border: Border.all(color: Colors.deepPurpleAccent,width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(15))

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Column(

                          children: [
                            SizedBox(height: 2,),
                            Image.asset("images/deg.png" ,width: 50,height: 50,),
                            SizedBox(height: 5,),
                            Text("Deg of wind",style: TextStyle(color: Colors.black),),
                            SizedBox(height: 5,),
                            Text("${snapshot.data?.wind?.deg}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(height: 2,),
                            Image.asset("images/base.png" ,width: 50,height: 50,),
                            SizedBox(height: 5,),
                            Text("Weather Base",style: TextStyle(color: Colors.black),),
                            SizedBox(height: 5,),
                            Text("${snapshot.data?.base} ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(height: 2,),
                            Image.asset("images/airspeed.png" ,width: 50,height: 50,),
                            SizedBox(height: 5,),
                            Text("Wind",style: TextStyle(color: Colors.black),),
                            SizedBox(height: 5,),
                            Text("${snapshot.data?.main?.tempMax}  km/h",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                          ],
                        ),

                      ],
                    ),
                  ),

                ],

              );
            }else{
              return Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Align(
                    alignment: Alignment.bottomCenter,

                    child: CircularProgressIndicator()),
              );
            }
             },)
            ],
          ),
        ),
      ),
    );
  }
}

