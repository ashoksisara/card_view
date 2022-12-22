import 'dart:convert';

import 'package:card_view_demo/model/property_model.dart';
import 'package:flutter/services.dart';

class AppHelper {
  static Future<PropertyModel?> readJson() async {
    try {
      final String response =
          await rootBundle.loadString('assets/property_json_response.txt');
      final data = await json.decode(response);
      PropertyModel propertyModel = PropertyModel.fromJson(data);
      return propertyModel;
    } catch (e) {
      return null;
    }
  }
}
