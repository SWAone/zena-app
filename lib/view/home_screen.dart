import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zena/controller/acount.dart';
import 'package:zena/main.dart';
import 'package:zena/view/vaccine_deteils.dart';
import 'package:zena/widget/botom.dart';
import 'package:zena/widget/row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AcountController>(
        init: AcountController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              body: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 40.h),
                  child: controller.childInfo != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 30.w, right: 30.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.childInfo!.name.toString(),
                                        style: TextStyle(fontSize: 20.sp),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        controller.childInfo!.bd.toString(),
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            color: Colors.grey),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          controller.sginOut();
                                        },
                                        icon: Icon(
                                          Icons.logout,
                                          size: 26.sp,
                                          color: Colors.black.withOpacity(0.8),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          // controller.sendNotfaction();
                                          controller.isEnableNotfction =
                                              !controller.isEnableNotfction;
                                          controller.update();
                                          Get.snackbar(
                                              'الاشعارات',
                                              controller.isEnableNotfction
                                                  ? 'تم تفعيل ارسال الاشعارات'
                                                  : 'تم ايقاف ارسال الاشعارات');
                                          box.write('notfction',
                                              controller.isEnableNotfction);
                                        },
                                        child: Image.asset(
                                          'assets/home_icon/Bell.png',
                                          width: 40.w,
                                          height: 40.h,
                                          color: controller.isEnableNotfction
                                              ? Colors.green
                                              : Colors.grey,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: 400.w,
                                child: ListView.builder(
                                  itemCount: controller.childInfo!.vcs != null
                                      ? controller.childInfo!.vcs!.length
                                      : 0,
                                  padding: EdgeInsets.only(top: 30.h),
                                  itemBuilder: (context, index) {
                                    return vaccineCard(
                                        body: controller.childInfo!.vcs![index]
                                            ['desc'],
                                        date: controller.childInfo!.vcs![index]
                                            ['date'],
                                        title: controller.childInfo!.vcs![index]
                                            ['name'],
                                        status: controller
                                            .childInfo!.vcs![index]['is_done'],
                                        time: controller.childInfo!.vcs![index]
                                            ['after']);
                                  },
                                ),
                              ),
                            )
                          ],
                        )
                      : Text('جار التحميل ..'),
                ),
              ),
            ),
          );
        });
  }

  Widget vaccineCard({
    required String title,
    required String body,
    required String time,
    required String date,
    required bool status,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 25.h),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.sp),
            color: Colors.white,
            boxShadow: [
              BoxShadow(blurRadius: 9, color: Colors.grey.withOpacity(0.5))
            ]),
        child: Padding(
          padding:
              EdgeInsets.only(top: 20.h, left: 10.w, right: 10.w, bottom: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RowText(title: 'اسم اللقاح', value: title),
              Padding(padding: EdgeInsets.only(bottom: 10.h)),
              RowText(title: 'وقت التلقيح', value: time),
              Padding(padding: EdgeInsets.only(bottom: 10.h)),
              RowText(title: 'تاريخ التلقيح', value: date),
              Padding(padding: EdgeInsets.only(top: 10.w)),
              Divider(
                color: Colors.grey.withOpacity(0.2),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      'حالة التلقيح',
                      style: TextStyle(fontSize: 16.sp),
                      maxLines: 2,
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      status ? 'ملقح' : 'لم يلقح',
                      style: TextStyle(
                          fontSize: 17.sp,
                          color: !status ? Colors.red : Colors.green,
                          fontWeight: FontWeight.w800),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20.h)),
              AppBoton(
                onTap: () {
                  Get.to(() => VaccineDeteils(
                        title: title,
                        body: body,
                      ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
