import 'package:flutter/material.dart';
import 'package:kilol/screens/LoadingPage.dart';

void main() {
  runApp(MyApp());
}

/// LANGUAGE CONTROLLER
class AppLanguage {
  static ValueNotifier<String> lang = ValueNotifier("gu"); // default = Gujarati
}

/// TRANSLATIONS
Map<String, Map<String, String>> words = {
  "gu": {
    "app_title": "કિલોલ - રમત અને શિક્ષણ",
    "letters": "અક્ષરો",
    "math": "ગણિત",
    "animals": "પ્રાણીઓ",
    "shapes": "આકૃતિઓ",
    "vegetables": "શાકભાજી",
    "fruits": "ફળો",
    "emotions": "ભાવનાઓ",
    "culture": "સંસ્કાર",
  },
  "hi": {
    "app_title": "किलोल - खेल और शिक्षा",
    "letters": "अक्षर",
    "math": "गणित",
    "animals": "जानवर",
    "shapes": "आकृतियाँ",
    "vegetables": "सब्ज़ियाँ",
    "fruits": "फल",
    "emotions": "भावनाएँ",
    "culture": "संस्कार",
  },
  "en": {
    "app_title": "Kilol - Fun & Learning",
    "letters": "Letters",
    "math": "Math",
    "animals": "Animals",
    "shapes": "Shapes",
    "vegetables": "Vegetables",
    "fruits": "Fruits",
    "emotions": "Emotions",
    "culture": "Culture",
  }
};

/// FUNCTION TO GET TEXT ANYWHERE
String t(BuildContext context, String key) {
  return words[AppLanguage.lang.value]?[key] ?? key;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AppLanguage.lang,
      builder: (context, langValue, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Kilol",
          home: LoadingPage(),
        );
      },
    );
  }
}
