// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'plant_datail.dart';
import '../../utils/theme.dart';
import '../../models/plant.dart';
import '../widgets/bottomNavBar.dart';
import '../../controllers/plant_controller.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class encyclo extends StatelessWidget {
  const encyclo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),

          // ignore: prefer_const_literals_to_create_immutables
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(
                  height: 100,
                ),
                // ignore: prefer_const_constructors
                Text(
                  'Plant Encyclopedia'.tr,
                  style: TextStyle(
                    fontSize: 30,
                    color: primaryColor,
                    fontFamily: fontName,
                  ),
                ),
                Image(
                  image: AssetImage('assets/images/encycloMain.png'),
                  height: 250,
                ),
                Expanded(
                  child: FutureBuilder<List<Plant>>(
                    future: PlantController
                        .fetchPlants(), // Fetch plants using the plantController
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator(); // Show a loading indicator while fetching data
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        List<Plant>? plants = snapshot.data;
                        if (plants == null || plants.isEmpty) {
                          return Text('No plants found.'.tr);
                        } else {
                          return ListView.builder(
                            itemCount: plants.length,
                            itemBuilder: (context, index) {
                              Plant plant = plants[index];
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => plantDetail(plant),
                                    ),
                                  );
                                },
                                child: Center(
                                  child: Card(
                                    elevation: 0,
                                    margin: EdgeInsets.all(20),
                                    child: Text(
                                      plant.commonName.tr,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: primaryColor,
                                        fontFamily: fontName,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      }
                    },
                  ),
                ),
                BottomNavBar(2),
              ])),
    ));
  }
}
