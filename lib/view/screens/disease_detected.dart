import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../widgets/bottomNavBar.dart';
import '../../utils/theme.dart';
import '../widgets/crousel.dart';
import '../../models/plant.dart';
import 'package:get/get.dart';

class DiseaseDetected extends StatelessWidget {
  final Uint8List imageFile;
  final String disease;
  Plant plant;

  DiseaseDetected(
      {required this.imageFile, required this.plant, required this.disease});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    SizedBox(height: 50),

                    Text(
                      'Plant Identified & \nDisease Detected!'.tr,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: fontName,
                        fontWeight: FontWeight.normal,
                        color: primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Text(
                      plant.commonName.tr,
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: fontName,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),

                    Text(
                      disease.tr,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: fontName,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Crousel(plant, 500.0, 'detected'),

                    //Detect Plant Disease Button
                    SizedBox(
                      height: 10,
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
