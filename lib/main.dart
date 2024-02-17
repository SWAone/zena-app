import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zena/view/home_screen.dart';
import 'package:zena/view/login_screen.dart';

final box = GetStorage();
var login;
void main() async {
  await GetStorage.init();
  login = await box.read('id') ?? 'null';
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return GetMaterialApp(
            textDirection: TextDirection.rtl,
            debugShowCheckedModeBanner: false,
            builder: (context, child) {
              return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 0.9),
                  child: child!);
            },
            // box.read('userinfo') != null ?

            home: login == null ? LoginScrren() : HomeScreen(),
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
                useMaterial3: true,
                fontFamily: 'LamaSans'));
      },
      designSize: const Size(375, 812),
    );
  }
}
