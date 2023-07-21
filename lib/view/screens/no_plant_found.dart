import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../widgets/bottomNavBar.dart';
import '../../utils/theme.dart';
import 'package:get/get.dart';

class NoPlantFound extends StatelessWidget {
  final Uint8List imageFile;
  String? errorMsg;

  NoPlantFound({required this.imageFile, this.errorMsg});

  @override
  Widget build(BuildContext context) {
    // Plant plant_detail = plantDataList[0];

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
                      'Plant Not Found!'.tr,
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
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      height: 300,
                      width: 300,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.memory(
                          imageFile,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    if (errorMsg != null && errorMsg!.isNotEmpty)
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          errorMsg!,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    SizedBox(
                      height: 20,
                    ),
                    Image(
                      image: AssetImage('assets/images/noPlant.png'),
                      height: 210,
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
