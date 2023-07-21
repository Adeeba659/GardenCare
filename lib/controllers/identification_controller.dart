import 'dart:io';
import 'package:flutter/material.dart';
import '../models/plant.dart';
import '../controllers/plant_controller.dart';
import 'history_controller.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class IdentificationController {
  String diseaseStatus = '';
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Future<Plant?> identifyPlant(File file) async {
    file;
    Plant? identifiedPlant;
    //print(file);

    // Replace the apiUrl with your Heroku API endpoint
    final apiUrl = 'https://gardencare-d7f06d060548.herokuapp.com/gardencare';
    //print(apiUrl);

    // Read the image data from the file as bytes
    List<int> imageBytes = await file.readAsBytes();
    //print(imageBytes);

    // Create a new multipart request
    var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
    //print(request);

    // Add the image file to the request as a part named 'image'
    var imagePart = http.MultipartFile.fromBytes(
      'file', // The name of the field in the API to receive the image
      imageBytes, // The image data as bytes
      filename:
          'image.jpg', // The filename to send to the API (can be anything)
    );

    request.files.add(imagePart);

    try {
      // Send the multipart request and wait for the response
      var response = await http.Response.fromStream(await request.send());
      print(response);

      if (response.statusCode == 200) {
        // Handle the successful response
        print('Image sent successfully.');
        print(response.body); // You can process the API response here if needed

        String jsonData = response.body;
        Map<String, dynamic> dataMap = jsonDecode(jsonData);

        String plantName = dataMap['data']['disease_name'];
        //String message = dataMap['message'];

        //print(plantName);
        //print(message);

        List<String> plantSplit = plantName.split('___');
        String plantCName = plantSplit[0];
        diseaseStatus = plantSplit[1].replaceAll('_', ' ');

        // Get the list of plants
        List<Plant> plants = await PlantController.fetchPlants();

        //print('CName : ' + plantCName);
        //print('Disease Status: ' + diseaseStatus);

        // Find the matching plant based on commonName
        identifiedPlant = plants.firstWhere(
          (plant) => plant.commonName == plantCName.tr,

          orElse: () => Plant(
              commonName: 'No Plant detected',
              description: '',
              diseases: [''],
              scientificName: '',
              diseases_desc: [''],
              treatements: [''],
              plantImage: '',
              diseaseImage: ['']), // Return null if no element is found
        );

        print('Identified Plant: ' + identifiedPlant.commonName);

        HistoryController.addHistory(file, identifiedPlant, getDiseaseStatus());

        return identifiedPlant;
      } else {
        // Handle the API error
        print('Failed to send image. Status code: ${response.statusCode}');
        String errorMsg =
            'Failed to send image. Status code: ${response.statusCode}';
        print(response
            .body); // You can check the error response from the API here

        identifiedPlant = Plant(
            commonName: 'No Plant detected',
            description: errorMsg,
            diseases: [''],
            scientificName: '',
            diseases_desc: [''],
            treatements: [''],
            plantImage: '',
            diseaseImage: ['']);

        return identifiedPlant;
      }
    } catch (e) {
      // Handle any network or other errors that occurred during the request
      print('Error sending image: $e');
      String errorMsg = 'Network Error : Connect to Internet';

      identifiedPlant = Plant(
          commonName: 'No Plant detected',
          description: errorMsg,
          diseases: [''],
          scientificName: '',
          diseases_desc: [''],
          treatements: [''],
          plantImage: '',
          diseaseImage: ['']);

      return identifiedPlant;
    }
  }

  String getDiseaseStatus() {
    return diseaseStatus;
  }
}
