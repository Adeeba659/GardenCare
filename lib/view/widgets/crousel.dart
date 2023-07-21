import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '../../models/plant.dart';
import '../widgets/plant_detail_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:io';

class Crousel extends StatelessWidget {
  final Plant plant_detail;
  final crousel_height;
  String displayOption;
  final String image_path;
  final bool? isHistory;
  final int? diseaseStatus;

  Crousel(this.plant_detail, this.crousel_height, this.displayOption,
      {this.image_path = '', this.isHistory, this.diseaseStatus});

  @override
  Widget build(BuildContext context) {
    final PlantDetailWidget detail_widget = PlantDetailWidget(plant_detail);
    detail_widget.initializeWidgetList();
    List<Widget> finalWidgetList = detail_widget.widget_list;

    //final file = File(image_path);

    Widget slider(int iterationNum) {
      //print(diseaseStatus);
      if (isHistory == true && (diseaseStatus == null || diseaseStatus == -1)) {
        //print(diseaseStatus);
        // Skip the last 3 carousel sliders
        iterationNum -= 4;
        iterationNum = iterationNum.clamp(
            1, iterationNum); // Ensure it's within valid range
      }

      return Column(
        children: [
          SizedBox(
            height: 20,
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: crousel_height,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
            ),
            items: [
              // Conditionally display the first slider based on isHistory flag
              if (isHistory == true && image_path != '')
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 0.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                  ),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Container(
                      width: 110, // Set the desired width
                      height: 190, // Set the desired height
                      child: Image.file(
                        File(image_path!),
                      ),
                    ),
                  ),
                ),
              // Add remaining widgets from finalWidgetList starting from index 0 if not in history mode
              ...finalWidgetList
                  .skip(isHistory == true && image_path != ''
                      ? 0
                      : 0) // Skip the first widget if isHistory is true
                  .map(
                    (widget) => Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 0.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 5.0,
                                spreadRadius: 2.0,
                              ),
                            ],
                          ),
                          child: Card(
                            elevation: 0.0,
                            margin: EdgeInsets.all(0.0),
                            color: Colors.transparent,
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: SingleChildScrollView(
                                child: widget,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                  .take(iterationNum)
                  .toList(),
            ],
          ),
        ],
      );
    }

    if (displayOption == 'default') {
      return Column(
        children: [
          detail_widget.plant_name(),
          slider(finalWidgetList.length),
        ],
      );
    } else if (displayOption == 'identified') {
      // Return identified widget
      return slider(2);
    } else if (displayOption == 'detected') {
      // Return detected widget
      return slider(finalWidgetList.length);
    }
    return SizedBox();
  }
}
