import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:know_our_school/Model/model.dart';

class SchoolViewModel extends ChangeNotifier {
  SchoolModel? _schoolData;
  bool _isLoading = false;

  SchoolModel? get schoolData => _schoolData;
  bool get isLoading => _isLoading;

  Future<void> fetchSchoolData() async {
    _isLoading = true;
    notifyListeners();

    try {
      String jsonString =
          await rootBundle.loadString('assets/json/SchoolData.json');
      final jsonResponse = json.decode(jsonString);
      _schoolData = SchoolModel.fromJson(jsonResponse[0]);
      if (kDebugMode) {
        print("jsonResponse ---");
      }
      if (kDebugMode) {
        print(jsonResponse);
      }
      if (kDebugMode) {
        print("_schoolData ...");
      }
      if (kDebugMode) {
        print(_schoolData?.numOfStudents);
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error during JSON parsing: $e");
      }
    }

    _isLoading = false;
    notifyListeners();
  }
}
