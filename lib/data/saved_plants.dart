import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../models/plant.dart';
import '../models/saved_plant_model.dart';

class SavedPlants {
  List<SavedPlantModel> plantList = [];

  Future<void> add(
      String imagePath, Plant plantDetail, int diseaseIndex) async {
    final savedPlant = SavedPlantModel(
      imagePath: imagePath,
      diseaseIndex: diseaseIndex,
      plant_detail: plantDetail,
    );
    plantList.add(savedPlant);
    await savePlantList();
  }

  Future<void> delete(int index) {
    if (index >= 0 && index < plantList.length) {
      plantList.removeAt(index);
      savePlantList();
    }
    // Return a completed Future
    return Future.value();
  }

  List<SavedPlantModel> getPlantList() {
    return plantList;
  }

  Future<void> savePlantList() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/saved_plants.json');

    final plantListData = plantList.map((plant) => plant.toJson()).toList();
    final jsonData = json.encode(plantListData);

    await file.writeAsString(jsonData);
  }

  Future<void> loadPlantList() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/saved_plants.json');

      if (await file.exists()) {
        final jsonData = await file.readAsString();
        final plantListData = json.decode(jsonData) as List<dynamic>;

        plantList = plantListData
            .map((data) => SavedPlantModel.fromJson(data))
            .toList();
      }
    } catch (e) {
      // Error occurred while loading plant list
      // Handle the error accordingly
    }
  }
}
