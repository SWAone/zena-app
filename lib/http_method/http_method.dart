import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:zena/view/home_screen.dart';

String myUrl = "http://10.0.2.2:8000";

class HttpMethod {
  static Future post(
      {required String path, required Map<String, dynamic> body}) async {
    String apiUrl = '$myUrl$path';

    Map<String, dynamic> data = body;

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          // يمكنك إضافة المزيد من الهيدرز حسب الحاجة
        },
        body: utf8.encode(jsonEncode(data)),
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
        // Get.to(() => HomeScreen());
        return jsonData;
      } else {
        Get.defaultDialog(title: 'خطا', content: Text(response.body));
        print('خطأ في الطلب، الحالة: ${response.statusCode}');
        print('الرد: ${response.body}');
      }
    } catch (e) {
      print('حدث خطأ أثناء إجراء الطلب: $e');
    }
  }

  static getDataFromApi({required String path}) async {
    try {
      var response = await http.get(Uri.parse('$myUrl $path'));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
        return jsonData;
      } else {
        print('========ايرور========= ${response.statusCode}');
        return {};
      }
    } catch (e) {
      print('ايرور ===== $e');
      return {};
    }
  }
}
