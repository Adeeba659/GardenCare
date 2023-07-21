// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../../utils/theme.dart';
import '../../models/plant.dart';
import '../widgets/bottomNavBar.dart';
import '../widgets/crousel.dart';
import 'package:get/get.dart';

class plantDetail extends StatelessWidget {
  //final String plantName;
  final Plant plant_detail;
  // String image = '';
  final String imagePath;
  final bool? isHistory;
  final int? diseaseStatus;

  plantDetail(this.plant_detail,
      {this.imagePath = '', this.isHistory, this.diseaseStatus});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  //width: deviceWidth,
                  //constraints: const BoxConstraints.expand(),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),

                  // ignore: prefer_const_literals_to_create_immutables
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    // ignore: prefer_const_literals_to_create_immutables

                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // ignore: prefer_const_constructors
                      SizedBox(
                        height: 50,
                      ),

                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            ImageIcon(
                              AssetImage("assets/images/detail_icon.png"),
                              size: 50,
                              color: primaryColor,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Plant Details'.tr,
                              style: TextStyle(
                                  fontSize: 30,
                                  color: primaryColor,
                                  fontFamily: fontName,
                                  fontWeight: FontWeight.bold),
                            )
                          ]),

                      SizedBox(
                        height: 50,
                      ),

                      Crousel(plant_detail, 500.0, 'default',
                          image_path: imagePath,
                          isHistory: isHistory,
                          diseaseStatus: diseaseStatus),
                    ],
                  ),
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
