import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'Authentication/signin.dart';
import 'Authentication/signup.dart';
import 'WeatherProject/weather_screen.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

 class MyApp extends StatelessWidget {
   const MyApp({super.key});

   @override
   Widget build(BuildContext context) {
     return   MaterialApp(
       debugShowCheckedModeBanner: false,
       home: const SignIn(),
       builder: EasyLoading.init(),
     );
   }
 }
