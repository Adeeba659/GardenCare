import 'dart:io';
import 'package:get/get.dart';
import '../models/plant.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import '../models/saved_plant_model.dart';
import '../data/saved_plants.dart';
import 'dart:convert';

class HistoryController {
  static void addHistory(File image, Plant plantDetail, String disease) async {
    // Create a new history entry with the provided image and plant detail
    // history(image: image, plantDetail: plantDetail);

    final Directory appDirectory = await getApplicationDocumentsDirectory();
    final String imagesDirectoryPath = path.join(appDirectory.path, 'images');
    await Directory(imagesDirectoryPath).create(recursive: true);

    final String imageName = DateTime.now().millisecondsSinceEpoch.toString();
    final String imagePath = path.join(imagesDirectoryPath, '$imageName.jpg');

    await image.copy(imagePath);
    //DUMMY DISEASE
    //String targetDisease = 'Late Blight';
    String targetDisease = disease;
    int? disease_index = plantDetail.diseases
        .indexWhere((disease) => disease == targetDisease.tr);

    SavedPlantModel(
      imagePath: imagePath,
      diseaseIndex: disease_index,
      plant_detail: plantDetail,
    );

    SavedPlants savedPlants = SavedPlants();
    await savedPlants.loadPlantList(); // Load existing saved plants

    await savedPlants.add(
        imagePath, plantDetail, disease_index); // Add the new saved plant

    await savedPlants.savePlantList(); // Save the updated plant list

    List<SavedPlantModel> savedPlantList = savedPlants.getPlantList();

    // Convert the list of saved plants to JSON
    List<Map<String, dynamic>> savedPlantJsonList =
        savedPlantList.map((savedPlant) => savedPlant.toJson()).toList();

    // Convert the list to JSON string
    String json = jsonEncode(savedPlantJsonList);

    // Define the file path for the JSON file
    final String jsonFilePath = path.join(appDirectory.path, 'history.json');

    // Write the JSON data to the file
    await File(jsonFilePath).writeAsString(json);
  }
}
