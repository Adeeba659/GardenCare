import 'dart:ui';
import 'package:get/get.dart';

class MyController extends GetxController {
  Rx<Locale> selectedLocale = Rx<Locale>(const Locale('en', 'US'));

  void changeLanguage(String languageCode, String countryCode) {
    selectedLocale.value = Locale(languageCode, countryCode);
    Get.updateLocale(selectedLocale.value);
  }
}
