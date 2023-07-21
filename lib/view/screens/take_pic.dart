import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'Identify_and_Detect.dart';
import '../../utils/theme.dart';
import '../widgets/bottomNavBar.dart';
import '../../controllers/capture_image_controller.dart';
import '../../controllers/identification_controller.dart';
import '../../models/plant.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'no_plant_found.dart';
import 'package:gallery_saver/gallery_saver.dart';

class TakePic extends StatefulWidget {
  @override
  _TakePicState createState() => _TakePicState();
}

class _TakePicState extends State<TakePic> {
  Uint8List? imageFile;
  final ImagePicker imgP = ImagePicker();
  late CaptureImageController _captureImageController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _captureImageController =
        CaptureImageController(IdentificationController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                          child: SizedBox.shrink(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImageIcon(
                              AssetImage("assets/images/choose.png"),
                              size: 50,
                              color: primaryColor,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Choose an option'.tr,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontFamily: fontName,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 400,
                          padding: EdgeInsets.all(20),
                          child: Image.asset(
                            "assets/images/taking_pic.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 60,
                          width: 300,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              minimumSize: const Size(100, 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onPressed: () {
                              _getFromCamera();
                            },
                            child: Text(
                              'Camera'.tr,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          height: 60,
                          width: 300,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              minimumSize: const Size.fromHeight(50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onPressed: () {
                              _getFromGallery();
                            },
                            child: Text(
                              'Gallery'.tr,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              BottomNavBar(1),
            ],
          ),
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: SpinKitCircle(
                  color: secondaryColor,
                  size: 50.0,
                ),
              ),
            ),
        ],
      ),
    );
  }

  /// Get from gallery
  _getFromGallery() async {
    setState(() {
      _isLoading = true;
    });
    var pickedFile = await imgP.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      File image = File(pickedFile.path);
      await _processPickedImage(image);
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    setState(() {
      _isLoading = true;
    });

    var pickedFile = await imgP.pickImage(
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      File image = File(pickedFile.path);
      await _saveImageToGallery(image);
      await _processPickedImage(image);
    }

    // Show a dialog to the user indicating that camera permissions are not granted
    //_showPermissionDeniedDialog();
  }

  // Function to process the picked image and navigate to appropriate screens
  Future<void> _processPickedImage(File image) async {
    setState(() {
      _isLoading = true;
    });

    imageFile = await image.readAsBytes();
    Map<String, dynamic> processingResult = await _processImage(image);
    Plant? resultPlant = processingResult['resultPlant'];
    String diseaseStatus = processingResult['diseaseStatus'];

    if (resultPlant?.commonName == 'No Plant detected') {
      if (resultPlant?.description != '') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => NoPlantFound(
              imageFile: imageFile!,
              errorMsg: resultPlant?.description,
            ),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => NoPlantFound(
              imageFile: imageFile!,
            ),
          ),
        );
      }
    } else if (resultPlant != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Identify_and_Detect(
            imageFile: imageFile!,
            resultPlant: resultPlant,
            diseaseStatus: diseaseStatus,
          ),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NoPlantFound(
            imageFile: imageFile!,
          ),
        ),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  // Function to save the image to the gallery
  Future<void> _saveImageToGallery(File image) async {
    try {
      await GallerySaver.saveImage(image.path);
    } catch (e) {
      print("Error saving image to gallery: $e");
    }
  }

  Future<Map<String, dynamic>> _processImage(File image) async {
    Plant? resultPlant = await _captureImageController.processImage(image);
    String diseaseStatus = _captureImageController.getDiseaseStatus();

    return {
      'resultPlant': resultPlant,
      'diseaseStatus': diseaseStatus,
    };
  }
}
