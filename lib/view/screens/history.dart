import 'package:flutter/material.dart';
import 'plant_datail.dart';
import '../../utils/theme.dart';
import '../widgets/bottomNavBar.dart';
import '../../models/plant.dart';
import '../../data/saved_plants.dart';
import '../../models/saved_plant_model.dart';
import 'package:get/get.dart';

class history extends StatefulWidget {
  const history({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<history> {
  SavedPlants savedPlants = SavedPlants();
  List<SavedPlantModel> plantList = [];

  @override
  void initState() {
    super.initState();
    loadPlantList();
  }

  Future<void> loadPlantList() async {
    await savedPlants.loadPlantList();
    setState(() {
      plantList = savedPlants.getPlantList();
    });
  }

  Future<void> deletePlant(int index) async {
    if (index >= 0 && index < plantList.length) {
      await savedPlants.delete(index);
      setState(() {
        plantList = savedPlants.getPlantList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                width: deviceWidth,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      'History of Plants'.tr,
                      style: TextStyle(
                        fontSize: 30,
                        color: primaryColor,
                        fontFamily: fontName,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Image(
                      image: AssetImage('assets/images/history.jpg'),
                      height: 300,
                    ),
                    plantList.isEmpty
                        ? Text(
                            'No saved plants'.tr,
                            style: TextStyle(
                              fontSize: 18,
                              color: primaryColor,
                              fontFamily: fontName,
                            ),
                          )
                        : Expanded(
                            child: SizedBox(
                              child: ListView.builder(
                                itemBuilder: (ctx, index) {
                                  SavedPlantModel savedPlant = plantList[index];

                                  return Dismissible(
                                    key: Key(savedPlant.imagePath),
                                    direction: DismissDirection.endToStart,
                                    onDismissed: (direction) {
                                      deletePlant(index);
                                    },
                                    background: Container(
                                      alignment: Alignment.centerRight,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      color: Colors.red,
                                      child: Icon(Icons.delete,
                                          color: Colors.white),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        Plant clickedPlant =
                                            savedPlant.plant_detail;
                                        String imgPath = savedPlant.imagePath;
                                        if (imgPath == null) {
                                          imgPath == '';
                                        }
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => plantDetail(
                                                clickedPlant,
                                                imagePath: imgPath,
                                                isHistory: true,
                                                diseaseStatus:
                                                    savedPlant.diseaseIndex),
                                          ),
                                        );
                                      },
                                      child: Center(
                                        child: Card(
                                          elevation: 0,
                                          margin: EdgeInsets.all(20),
                                          child: Text(
                                            savedPlant
                                                .plant_detail.commonName.tr,
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: primaryColor,
                                              fontFamily: fontName,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: plantList.length,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
          BottomNavBar(3),
        ],
      ),
    );
  }
}
