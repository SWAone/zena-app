import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zena/http_method/http_method.dart';
import 'package:zena/main.dart';
import 'package:zena/model/child_info.dart';
import 'package:zena/notfaction_cintroler.dart';
import 'package:zena/view/home_screen.dart';
import 'package:zena/view/login_screen.dart';

class AcountController extends GetxController {
  GlobalKey<FormState> acountKey = GlobalKey();
  String? name, birthday, phone;
  ChildInfo? childInfo;
  bool isEnableNotfction = false;
  @override
  void onInit() {
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotfactionController.onActionReceivedMethod,
      onNotificationCreatedMethod:
          NotfactionController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod:
          NotfactionController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod:
          NotfactionController.onDismissActionReceivedMethod,
    );
    getData();
    isEnableNotfction = box.read('notfction') ?? false;
    super.onInit();
  }

  void addChild() async {
    final Dio dio = new Dio();
    if (acountKey.currentState!.validate()) {
      acountKey.currentState!.save();
      var xd = await HttpMethod.post(path: '/addchild', body: {
        "name": name,
        "bd": birthday,
        "phone_number": phone,
      });
      if (xd['id'] != null) {
        box.write('id', xd['id']);
        update();
        Get.to(() => HomeScreen());
        update();
      }
    }
  }

  void getData() async {
    var result =
        await HttpMethod.getDataFromApi(path: '/child?id=${login}&token=1');
    childInfo = ChildInfo.fromJson(result);
    print(childInfo!.name);
    update();
  }

  void sginOut() async {
    box.remove('id');

    update();
    Get.offAll(LoginScrren());
  }

  sendNotfaction({String title = 'title', String body = 'body'}) {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 1, channelKey: "basic_channel", title: title, body: body));
  }
}
