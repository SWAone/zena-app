import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputBox extends StatelessWidget {
  String hint;
  void Function(String?)? onSaved;
  InputBox({super.key, this.hint = '', required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 25.h),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.sp),
            color: HexColor('#FAFAFA'),
            boxShadow: [
              BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 4),
            ]),
        child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) return "لا يمكن ترك الحقل فارغ";

              return null;
            },
            onSaved: onSaved,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: hint,
                border: OutlineInputBorder(borderSide: BorderSide.none))),
      ),
    );
  }
}
