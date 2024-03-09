import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zena/controller/acount.dart';
import 'package:zena/view/home_screen.dart';
import 'package:zena/view/login_screen.dart';
import 'package:zena/widget/botom.dart';
import 'package:zena/widget/input_box.dart';

class LoginExsect extends StatelessWidget {
  const LoginExsect({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<AcountController>(
          init: AcountController(),
          builder: (controller) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: Padding(
                padding: EdgeInsets.only(top: 0.h, left: 40.w, right: 40.w),
                child: Form(
                  key: controller.login,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                          child: SizedBox(
                        width: 300.w,
                        child: Text(
                          'تسجيل الدخول بحساب موجود',
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
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 9),
                            ]),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 30.h),
                          child: Column(
                            children: [
                              InputBox(
                                onSaved: (p0) {
                                  controller.phoneL = p0;
                                },
                                hint: 'رقم هاتف رب الاسرة',
                              ),
                              InputBox(
                                onSaved: (p0) {
                                  controller.pasL = p0;
                                },
                                hint: 'كلمة السر',
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 30.h)),
                      AppBoton(
                        titel: 'تسجيل الدخول',
                        onTap: () {
                          controller.loginExsett();
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => LoginScrren());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('ليس لديك حساب'),
                            Text(
                              ' انشاء حساب ',
                              style: TextStyle(color: Colors.blue),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
