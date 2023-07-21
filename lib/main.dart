// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:GardenCare/view/screens/language_selection.dart';
import 'package:flutter/material.dart';
import 'utils/theme.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'utils/app_translation.dart';

void main() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: AppTranslation(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('ur', 'PK'),
      theme: ThemeData(fontFamily: 'Poppins'),
      home: Scaffold(
        body: Container(
          width: double.infinity,
          //constraints: const BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/home3.png"),
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            // ignore: prefer_const_literals_to_create_immutables
            // ignore: prefer_const_literals_to_create_immutables, duplicate_ignore
            children: [
              SizedBox(
                height: 60,
              ),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ImageIcon(
                    AssetImage("assets/images/leaf.png"),
                    //color: Colors.red,
                    size: 29,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Garden For Life',
                    style: TextStyle(
                      fontSize: 24,
                      color: purpleColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 60,
              ),

              Text(
                "Let's Make Your \n Dream Garden",
                style: TextStyle(
                  fontSize: 18,
                  color: purpleColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              // ignore: prefer_const_constructors
              Image(
                image: AssetImage("assets/images/home2.png"),
              ),

              SizedBox(
                height: 50,
              ),

              SizedBox(
                height: 50, //height of button
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    'Get Started',
                    style: TextStyle(color: purpleColor),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LanguageSelection()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
