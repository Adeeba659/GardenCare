import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '../../utils/theme.dart';
import '../../models/plant.dart';
import '../widgets/information.dart';
import 'package:get/get.dart';

class PlantDetailWidget {
  final Plant plant_detail;
  PlantDetailWidget(this.plant_detail);

  late Widget scientificName = scientific_name();
  late Widget plantDescription = plant_description();
  late Widget diseaseHeading = diseases_heading();
  late List Diseases = diseases();

  List<Widget> widget_list = [];

  void initializeWidgetList() {
    widget_list = [
      scientificName,
      plantDescription,
      diseaseHeading,
      ...diseases(),
    ];
  }

  plant_name() {
    return Text(
      plant_detail.commonName.tr,
      style: TextStyle(
          fontSize: 20,
          color: primaryColor,
          fontFamily: fontName,
          fontWeight: FontWeight.bold),
    );
  }

  scientific_name() {
    return Column(
      children: [
        Information('Scientific Name'.tr, plant_detail.scientificName.tr),
        SizedBox(height: 50),
        Image(
          image: AssetImage(plant_detail.plantImage),
          height: 290,
        ),
      ],
    );
  }

  plant_description() {
    //Description
    return Information('Description'.tr, plant_detail.description.tr);
  }

  diseases_heading() {
    //Diseases

    return Column(
      children: [
        Center(child: Information('Diseases'.tr, '')),
        SizedBox(height: 30),
        Image(
          image: AssetImage('assets/images/plants/disease.png'),
          height: 290,
        ),
      ],
    );
  }

  List<Widget> diseases() {
    List<Widget> diseaseWidgets = [];

    for (int index = 0; index < plant_detail.diseases.length; index++) {
      diseaseWidgets.add(
        Column(
          children: [
            Information(plant_detail.diseases[index].tr, ''),
            SizedBox(height: 30),
            Image(
              image: AssetImage(plant_detail.diseaseImage[index]),
              height: 350,
            ),
          ],
        ),
      );

      diseaseWidgets.add(
        Information(
            'Disease Description'.tr, plant_detail.diseases_desc[index].tr),
      );

      diseaseWidgets.add(
        Information('Treatments'.tr, plant_detail.treatements[index].tr),
      );
    }

    return diseaseWidgets;
  }
}
