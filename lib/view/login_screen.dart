import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zena/view/home_screen.dart';
import 'package:zena/widget/botom.dart';
import 'package:zena/widget/input_box.dart';

class LoginScrren extends StatelessWidget {
  const LoginScrren({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(top: 0.h, left: 40.w, right: 40.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: SizedBox(
                width: 300.w,
                child: Text(
                  'مرحبا بك يسعدنا الاهتمام بطفلك وتنظيم اوقات اللقاحات',
                  style: TextStyle(fontSize: 20.sp),
                  textAlign: TextAlign.center,
                ),
              )),
              Padding(padding: EdgeInsets.only(top: 30.h)),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5), blurRadius: 9),
                    ]),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 30.h),
                  child: Column(
                    children: [
                      InputBox(
                        hint: 'ادخل اسم طفلك',
                      ),
                      InputBox(
                        hint: 'ماهو تاريخ ميلاده',
                      ),
                      InputBox(
                        hint: 'رقم هاتف رب الاسرة',
                      ),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 30.h)),
              AppBoton(
                titel: 'انشاء حساب الطفل',
                onTap: () {
                  Get.offAll(HomeScreen());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}