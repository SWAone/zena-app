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
  GlobalKey<FormState> login = GlobalKey();

  String? name, birthday, phone, pas, phoneL, pasL;
  ChildInfo? childInfo;
  bool isEnableNotfction = false;
  @override
  void onInit() async {
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotfactionController.onActionReceivedMethod,
      onNotificationCreatedMethod:
          NotfactionController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod:
          NotfactionController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod:
          NotfactionController.onDismissActionReceivedMethod,
    );
    var childid = await box.read('id');
    if (childid != null) getData(id: childid);
    isEnableNotfction = await box.read('notfction') ?? false;
    super.onInit();
  }

  void addChild() async {
    if (acountKey.currentState!.validate()) {
      acountKey.currentState!.save();
      var xd = await HttpMethod.post(path: '/addchild', body: {
        "name": name,
        "bd": birthday,
        "phone_number": phone,
        "phone_number": phone,
        "password": pas
      });
      if (xd['id'] != null) {
        print(xd['id']);
        await box.write('id', xd['id']);
        var iddd = await box.read('id');
        print('id $iddd}');
        print('logoin : $login');
        update();
        getData(id: iddd);

        Get.to(() => HomeScreen());
        update();
      }
    }
  }

  void loginExsett() async {
    if (login.currentState!.validate()) {
      login.currentState!.save();
      print('infooooooo');
      print(pasL);
      print(phoneL);
      try {
        var xd = await HttpMethod.getDataFromApi(
            path: '/login?phone_number=$phoneL&password=$pasL');
        if (xd['child_id'] != null) {
          await box.write('id', xd['child_id']);
          var idd = await box.read('id');
          print('iddd : $idd');
          getData(id: idd);
          update();
          Get.to(() => HomeScreen());
        } else {
          Get.defaultDialog(title: 'حدث خطا', content: Text(xd['info']));
        }
      } catch (e) {
        Get.defaultDialog(
            title: 'حدث خطا',
            content: Text('رقم الهاتف ام كلمة السر غير صحيحة'));
      }
    }
  }

  void getData({required var id}) async {
    print('get data id : $id');
    var result = await HttpMethod.getDataFromApi(path: '/child?id=$id&token=1');
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
