import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zena/view/vaccine_deteils.dart';
import 'package:zena/widget/botom.dart';
import 'package:zena/widget/row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 40.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30.w, right: 30.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'الطفل ادم يوسف',
                            style: TextStyle(fontSize: 20.sp),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '3 اشهر',
                            style:
                                TextStyle(fontSize: 15.sp, color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/home_icon/Bell.png',
                        width: 40.w,
                        height: 40.h,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: 400.w,
                    child: ListView.builder(
                      itemCount: 5,
                      padding: EdgeInsets.only(top: 30.h),
                      itemBuilder: (context, index) {
                        return vaccineCard(
                            date: '2024 / 5 / 1',
                            date2: '2024 / 8 / 1',
                            title: '  الكبد الفايروسي نمط B صغار',
                            status: index == 1 ? 1 : 3,
                            time: 'خلال اول 3 اشهر');
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget vaccineCard({
    required String title,
    required String time,
    required String date,
    required String date2,
    required int status,
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
              RowText(title: 'الجرعة الثانية', value: date2),
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
                      status == 1
                          ? 'ملقح'
                          : status == 2
                              ? ''
                              : 'لم يلقح',
                      style: TextStyle(
                          fontSize: 17.sp,
                          color: status == 3 ? Colors.red : Colors.green,
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
                        body: date,
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
