import 'package:flutter/material.dart';
import 'package:GardenCare/utils/storage.dart';
import 'package:get/get.dart';
import 'home_page.dart';
import '../../utils/theme.dart';

class LanguageSelection extends StatefulWidget {
  @override
  _LanguageSelectionState createState() => _LanguageSelectionState();
}

class _LanguageSelectionState extends State<LanguageSelection> {
  List<bool> _selections = [
    true,
    false
  ]; // Assuming English is selected by default

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Language Selection'),
      // ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                // <-- SEE HERE
                child: SizedBox.shrink(),
                flex: 2,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
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
                      'Language'.tr,
                      style: TextStyle(
                        fontSize: 36,
                        color: primaryColor,
                        fontWeight: FontWeight.normal,
                        fontFamily: fontName,
                      ),
                    )
                  ]),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 350,
                  padding: EdgeInsets.all(20),
                  child:
                      Image(image: AssetImage("assets/images/language.jpg"))),
              Expanded(
                // <-- SEE HERE
                child: SizedBox.shrink(),
                flex: 1,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: _selections[0] ? primaryColor : secondaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        minimumSize: Size(300, 60),
                      ),
                      onPressed: () {
                        setState(() {
                          _selections =
                              List.generate(_selections.length, (_) => false);
                          _selections[0] = true;
                          // Save selected language to storage
                          myController.changeLanguage('en', 'US');
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => home_page()),
                          );
                        });
                      },
                      child: Text(
                        'English',
                        style: TextStyle(
                          color: _selections[1] ? primaryColor : Colors.white,
                          fontSize: 18,
                          //color: Colors.white,
                          fontFamily: fontName,
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: _selections[1] ? primaryColor : secondaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        minimumSize: Size(300, 60),
                      ),
                      onPressed: () {
                        setState(() {
                          _selections =
                              List.generate(_selections.length, (_) => false);
                          _selections[1] = true;
                          // Save selected language to storage
                          myController.changeLanguage('ur', 'PK');
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => home_page()),
                          );
                        });
                      },
                      child: Text(
                        'اردو',
                        style: TextStyle(
                          color: _selections[0] ? primaryColor : Colors.white,
                          fontSize: 18,
                          //color: Colors.white,
                          fontFamily: fontName,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(
                flex: 2, // <-- SEE HERE
              ),
            ],
          ),
        ),
      ),
    );
  }
}
