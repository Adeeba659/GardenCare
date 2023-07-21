import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../widgets/bottomNavBar.dart';
import '../../utils/theme.dart';
import 'package:get/get.dart';

class NoDisease extends StatelessWidget {
  final Uint8List imageFile;
  String plantName;

  NoDisease({required this.imageFile, required this.plantName});

  @override
  Widget build(BuildContext context) {
    print(plantName);
    //Plant plant_detail = plantDataList[0];
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
                    SizedBox(height: 50),
                    Text(
                      'No Disease Present!'.tr,
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
                      plantName.tr,
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: fontName,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    Container(
                      // decoration: BoxDecoration(
                      //     border: Border.all(
                      //       color: primaryColor,
                      //     ),
                      //     borderRadius: BorderRadius.all(Radius.circular(20))),
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      height: 250,
                      width: 300,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.memory(
                          imageFile,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Image(
                      image: AssetImage('assets/images/noDisease.png'),
                      height: 310,
                    )
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
