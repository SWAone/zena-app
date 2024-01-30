import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class AppBoton extends StatelessWidget {
  String titel;
  void Function()? onTap;
  AppBoton({super.key, this.titel = 'المزيد حول هذا اللقاح', this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: 0.h),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: HexColor('#343434'),
                borderRadius: BorderRadius.circular(24.sp)),
            width: 315.w,
            height: 48.h,
            child: Center(
                child: Text(
              titel,
              style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w800),
            )),
          ),
        ),
      ),
    );
  }
}
