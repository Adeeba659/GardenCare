// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:GardenCare/view/screens/history.dart';
import 'package:get/get.dart';
import 'take_pic.dart';
import 'encyclo.dart';
import '../../utils/theme.dart';
import '../widgets/bottomNavBar.dart';

// ignore: camel_case_types
class home_page extends StatelessWidget {
  //List<bool> _selections = List.generate(2, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        //constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),

        // ignore: prefer_const_literals_to_create_immutables
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          // ignore: prefer_const_literals_to_create_immutables

          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Expanded(
              // <-- SEE HERE
              child: SizedBox.shrink(),
              flex: 2,
            ),
            // ignore: prefer_const_constructors
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  ImageIcon(
                    AssetImage("assets/images/hand_plant.png"),
                    size: 50,
                    color: primaryColor,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Welcome'.tr,
                    style: TextStyle(
                      fontSize: 36,
                      color: primaryColor,
                      fontWeight: FontWeight.normal,
                      fontFamily: fontName,
                    ),
                  )
                ]),
            // Spacer(
            //   flex: 2, // <-- SEE HERE
            // ),
            // Expanded(
            //   // <-- SEE HERE
            //   flex: 3,
            //   // <-- SEE HERE
            //   child: SizedBox.shrink(),
            // ),

            Container(
                height: 300,
                padding: EdgeInsets.all(20),
                child: Image(image: AssetImage("assets/images/welcome.png"))),
            //Button1

            SizedBox(
              height: 60, //height of button
              width: 300,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  // ignore: prefer_const_constructors
                  backgroundColor: primaryColor,
                  minimumSize: const Size(100, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TakePic()));
                },
                //color: Colors.blue,

                icon: ImageIcon(
                  AssetImage("assets/images/scanIcon.png"),
                  size: 50,
                ),

                label: Text(
                  'Take Picture'.tr,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontFamily: fontName,
                  ),
                ),
              ),
            ),
            // ignore: prefer_const_constructors
            Spacer(
              flex: 1, // <-- SEE HERE
            ),

            //button 2
            SizedBox(
              height: 60, //height of button
              width: 300,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const encyclo()));
                },
                //color: Colors.blue,
                icon: ImageIcon(
                  AssetImage("assets/images/encyIcon.png"),
                  size: 40,
                ),
                label: Text(
                  'Plant Encyclopedia'.tr,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontFamily: fontName,
                  ),
                ),
              ),
            ),

            Spacer(
              flex: 1, // <-- SEE HERE
            ),
            // const Expanded(
            //   // <-- SEE HERE
            //   child: SizedBox.shrink(),
            // ),

            //Button3
            SizedBox(
              height: 60, //height of button
              width: 300,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => history()));
                },
                //color: Colors.blue,
                icon: ImageIcon(
                  AssetImage("assets/images/historyIcon.png"),
                  size: 50,
                ),
                label: Text(
                  'History'.tr,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontFamily: fontName,
                  ),
                ),
              ),
            ),
            Spacer(
              flex: 1, // <-- SEE HERE
            ),
            // Container(
            //   child: ToggleButtons(
            //       isSelected: _selections,
            //       color: primaryColor,
            //       onPressed: (int index) {},
            //       children: [
            //         TextButton(
            //             onPressed: () {
            //               myController.changeLanguage('en', 'US');
            //             },
            //             child: Text('English')),
            //         TextButton(
            //             onPressed: () {
            //               myController.changeLanguage('ur', 'PK');
            //             },
            //             child: Text('Urdu'))
            //       ]),
            // ),
            // const Expanded(
            //   // <-- SEE HERE
            //   child: SizedBox.shrink(),
            // ),
            // BottomNavBar(
            //   key: UniqueKey(),
            // ),
            BottomNavBar(0),
          ],
        ),
      ),
    ));
  }
}
