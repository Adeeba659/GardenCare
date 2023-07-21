import 'dart:typed_data';
import 'package:GardenCare/controllers/disease_controller.dart';
import 'package:flutter/material.dart';
import '../widgets/bottomNavBar.dart';
import '../../utils/theme.dart';
import '../screens/identified.dart';
import '../../models/plant.dart';
import 'package:get/get.dart';

class Identify_and_Detect extends StatelessWidget {
  final Uint8List? imageFile;
  final Plant resultPlant;
  final String diseaseStatus;

  Identify_and_Detect(
      {required this.imageFile,
      required this.resultPlant,
      required this.diseaseStatus});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Image Display'),
      //   backgroundColor: primaryColor,
      // ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 80),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          AssetImage("assets/images/choose.png"),
                          size: 50,
                          color: primaryColor,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Choose an option'.tr,
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: fontName,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(10),
                      height: 400,
                      width: 300,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.memory(
                          imageFile!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    //Identify Plant Button
                    SizedBox(
                      height: 60, //height of button
                      width: 300,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Identified(
                                imageFile: imageFile!,
                                resultPlant: resultPlant,
                                diseaseStatus: diseaseStatus,
                              ),
                            ),
                          );
                        },
                        //color: Colors.blue,
                        child: Text(
                          'Identify Plant'.tr,
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: fontName,
                              color: Colors.white),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 30,
                    ),

                    //Detect Plant Disease Button

                    SizedBox(
                      height: 60, //height of button
                      width: 300,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {
                          DiseaseController.handleNavigation(
                              context, imageFile!, resultPlant, diseaseStatus);
                        },
                        //color: Colors.blue,
                        child: Text(
                          'Detect Disease'.tr,
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: fontName,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          BottomNavBar(0),
        ],
      ),
    );
  }
}
