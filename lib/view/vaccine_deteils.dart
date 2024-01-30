import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zena/widget/botom.dart';
import 'package:zena/widget/row.dart';

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
                      '''يساعد لقاح التهاب الكبد B في الوقاية من التهاب الكبد B ومضاعفاته (التهاب الكبد المزمن، و تليّف الكبد، و سرطان الكبد).وبشكل عام، التهاب الكبد B أكثر خطورةً من التهاب الكبد A ويكون مميتًا في بعض الأحيان.والأعراض يمكن أن تكون خفيفة إلى شديدة.وتشمل قلة الشهية والغثيان والإرهاق.في 5% إلى 10% من الأشخاص، يُصبح التهاب الكبد B مزمنًا وقد يفضي إلى تليف الكبد وسرطان الكبد.
        ''',
                      style: TextStyle(
                        fontSize: 17.sp,
                      ),
                    ),
                    Text(
                      'الاثار الجانبية',
                      style: TextStyle(
                          fontSize: 17.sp, fontWeight: FontWeight.w800),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 10.h)),
                    Text(
                      '''في بعض الأحيان، يحدث ألم بموضع الحقن، ويتبعها حُمّى خفيفة.لا يجب إعطاء اللقاح للأشخاص الذين لديهم تاريخ سابق للتعرض لرد فعل تحسسي شديد لخميرة الخبّاز، المستخدمة في إنتاج لقاح التهاب الكبد B. في بعض الأحيان، يحدث ألم بموضع الحقن، ويتبعها حُمّى خفيفة. لا يجب إعطاء اللقاح للأشخاص الذين لديهم تاريخ سابق للتعرض لرد فعل تحسسي شديد لخميرة الخبّاز، المستخدمة في إنتاج لقاح التهاب الكبد B''',
                      style: TextStyle(
                        fontSize: 17.sp,
                      ),
                    )
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
