import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VaccineDeteils extends StatelessWidget {
  String title;
  String body;
  VaccineDeteils({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 30.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 17.sp, fontWeight: FontWeight.w800),
                    ),
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.arrow_forward_ios))
                  ],
                ),
              )),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'حول هذا اللقاح',
                      style: TextStyle(
                          fontSize: 17.sp, fontWeight: FontWeight.w800),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 10.h)),
                    Text(
                      body,
                      style: TextStyle(
                        fontSize: 17.sp,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
