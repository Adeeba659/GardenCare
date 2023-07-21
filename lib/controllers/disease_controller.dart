import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../models/plant.dart';
import '../../view/screens/no_disease.dart';
import '../../view/screens/no_plant_found.dart';
import '../../view/screens/disease_detected.dart';

class DiseaseController {
  static void handleNavigation(
    BuildContext context,
    Uint8List imageFile,
    Plant? plant,
    String diseaseStatus,
  ) {
    if (diseaseStatus == 'healthy') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NoDisease(
            imageFile: imageFile,
            plantName: plant!.commonName,

            // plantDetail: plantDetail,
          ),
        ),
      );
    } else if (plant == null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NoPlantFound(
            imageFile: imageFile,
          ),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DiseaseDetected(
            imageFile: imageFile,
            plant: plant,
            disease: diseaseStatus,

            //plantDetail: plantDetail,
            //disease: disease,
          ),
        ),
      );
    }
  }
}
